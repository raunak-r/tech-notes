import java.util.*;

public class Assignment01Driver
{
    Scanner input = new Scanner(System.in);

    public static void main(String[] args)
    {
        new Assignment01Driver();
    }

    public Assignment01Driver()
    {

        String[] cargohold = new String[10];

        System.out.println("Welcome to the BlackStar Cargo Hold interface.");
        System.out.println("Please select a number from the options below");
        System.out.println();

        while (true)
        {

            System.out.println("1: Add an item to the cargo hold.");
            System.out.println("2: Remove an item from the cargo hold.");
            System.out.println("3: Sort the contents of the cargo hold.");
            System.out.println("4: Search for an item.");
            System.out.println("5: Display the items in the cargo hold.");
            System.out.println("0: Exit the BlackStar Cargo Hold interface.");
            System.out.println("");

            int userChoice = input.nextInt();
            input.nextLine();

            switch (userChoice)
            {
                case 1:
                    addItem(cargohold);
                    break;
                case 2:
                    removeItem(cargohold);
                    break;
                case 3:
                    sortItems(cargohold);
                    break;
                case 4:
                    searchItems(cargohold);
                    break;
                case 5:
                    displayItems(cargohold);
                    break;
                case 0:
                    System.out.println("Thank you for using the BlackStar Cargo Hold interface. See you again soon!");
                    System.exit(0);
            }
        }

    }

    private void addItem(String cargohold[])
    {

        System.out.print("Please enter the name of your item: ");
        String ItemName = input.nextLine();
        ItemName = ItemName.substring(0, 1).toUpperCase() + ItemName.substring(1);
        for (int x = 0; x < cargohold.length; x++)
        {
            if (cargohold[x] == null)
            {
                cargohold[x] = ItemName;
                System.out.println();
                System.out.println("1 " + ItemName + " has been added.");
                System.out.println();
                break;
            } else if ((x == cargohold.length - 1) && cargohold[x] != null)
            {
                System.out.println();
                System.out.println();
                System.out.println("Sorry, the cargo hold is full. Please remove an item before adding another.");
                System.out.println();
                System.out.println();
            }
        }

    }

    private void removeItem(String cargohold[])
    {

        System.out.print("Please enter the name of the item you would like to remove: ");
        String delete = input.nextLine();
        delete = delete.substring(0, 1).toUpperCase() + delete.substring(1);
        System.out.println();

        boolean found = false;
        for (int x = 0; x < cargohold.length; x++)
        {

            if (delete.equalsIgnoreCase(cargohold[x]))
            {
                cargohold[x] = null;
                found = true;
                break;
            }
        }
        if (found)
        {
            System.out.println("1 " + delete + " has been removed.");
            System.out.println();
            System.out.println();
        } else
        {
            System.out.println("Your item has not been found, please try again.");
            System.out.println();
            System.out.println();
        }
    }

    private void sortItems(String cargohold[])
    {

        for (int i = 0; i < cargohold.length; i++)
        {
            if (cargohold[i] == null)
                break;
            for (int j = i + 1; j < cargohold.length; j++)
            {
                if (cargohold[j] != null && cargohold[i] != null)
                {
                    if (cargohold[j].compareToIgnoreCase(cargohold[i]) < 0)
                    {
                        String temp = cargohold[i];
                        cargohold[i] = cargohold[j];
                        cargohold[j] = temp;
                    }
                }
            }
        }
        System.out.println("Your items have been sorted.");
        System.out.println();
        System.out.println();

    }

    private void searchItems(String cargohold[])
    {

        System.out.print("Please enter the item you would like to find: ");
        String userItem = input.nextLine();
        userItem = userItem.substring(0, 1).toUpperCase() + userItem.substring(1);
        System.out.println();

        boolean found = false;
        int count = 0;
        for (int index = 0; index < cargohold.length; index++)
        {
            if (userItem.equalsIgnoreCase(cargohold[index]))
            {
                found = true;
                count += 1;
            }
        }
        if (found)
        {
            System.out.println("We have found " + userItem + ", with a quantity of " + count + ".");
        } else
        {
            System.out.println("I'm sorry, we could not find: " + userItem);
        }
        System.out.println();
    }

    private void displayItems(String cargohold[])
    {

        System.out.println();
        System.out.println("Items currently in cargo hold:");
        boolean[] checked = new boolean[cargohold.length];
        for (int x = 0; x < 10; x++)
        {
            int count = 0;
            if (cargohold[x] != null)
            {
                for (int j = x; j < 10; j++)
                    if (cargohold[j] != null)
                        if (cargohold[j].equalsIgnoreCase(cargohold[x]))
                        {
                            count++;
                            if (j != x)
                                checked[j] = true;
                        }

                if (!checked[x])
                    System.out.println(cargohold[x] + " - " + count);
            }

        }
        System.out.println();
    }
}
