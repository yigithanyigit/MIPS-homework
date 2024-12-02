##############################################################
#Array
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Size of array
#   4 Bytes - Size of elements
##############################################################

##############################################################
#Linked List
##############################################################
#   4 Bytes - Address of the First Node
#   4 Bytes - Size of linked list
##############################################################

##############################################################
#Linked List Node
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Address of the Next Node
##############################################################

##############################################################
#Recipe
##############################################################
#   4 Bytes - Name (address of the name)
#	4 Bytes - Ingredients (address of the ingredients array)
#   4 Bytes - Cooking Time
#	4 Bytes - Difficulty
#	4 Bytes - Rating
##############################################################


.data
space: .asciiz " "
newLine: .asciiz "\n"
tab: .asciiz "\t"
lines: .asciiz "------------------------------------------------------------------\n"

listStr: .asciiz "List: \n"
recipeName: .asciiz "Recipe name: "
ingredients: .asciiz "Ingredients: "
cookingTime: .asciiz "Cooking time: "
difficulty: .asciiz "Difficulty: "
rating: .asciiz "Rating: "
listSize: .asciiz "List Size: "
emptyListWarning: .asciiz "List is empty!\n"
indexBoundWarning: .asciiz "Index out of bounds!\n"
recipeNotMatch: .asciiz "Recipe not matched!\n"
recipeMatch: .asciiz "Recipe matched!\n"
recipeAdded: .asciiz "Recipe added.\n"
recipeRemoved: .asciiz "Recipe removed.\n"
noRecipeWarning: .asciiz "No recipe to print!\n"

addressOfRecipeList: .word 0 #the address of the array of recipe list stored here!


# Recipe 1: Pancakes
r1: .asciiz "Pancakes"
r1i1: .asciiz "Flour"
r1i2: .asciiz "Milk"
r1i3: .asciiz "Eggs"
r1i4: .asciiz "Sugar"
r1i5: .asciiz "Baking powder"
r1c: .word 15							# Cooking time in minutes
r1d: .word 2							# Difficulty (scale 1-5)
r1r: .word 4							# Rating (scale 1-5)

# Recipe 2: Spaghetti Bolognese
r2: .asciiz "Spaghetti Bolognese"
r2i1: .asciiz "Spaghetti"
r2i2: .asciiz "Ground beef"
r2i3: .asciiz "Tomato sauce"
r2i4: .asciiz "Garlic"
r2i5: .asciiz "Onion"
r2c: .word 30
r2d: .word 3
r2r: .word 5

# Recipe 3: Chicken Stir-Fry
r3: .asciiz "Chicken Stir-Fry"
r3i1: .asciiz "Chicken breast"
r3i2: .asciiz "Soy sauce"
r3i3: .asciiz "Bell peppers"
r3i4: .asciiz "Broccoli"
r3i5: .asciiz "Garlic"
r3c: .word 20
r3d: .word 3
r3r: .word 4

# Recipe 4: Caesar Salad
r4: .asciiz "Caesar Salad"
r4i1: .asciiz "Romaine lettuce"
r4i2: .asciiz "Caesar dressing"
r4i3: .asciiz "Parmesan cheese"
r4i4: .asciiz "Croutons"
r4i5: .asciiz "Chicken breast (optional)"
r4c: .word 10
r4d: .word 1
r4r: .word 4

# Recipe 5: Chocolate Chip Cookies
r5: .asciiz "Chocolate Chip Cookies"
r5i1: .asciiz "Butter"
r5i2: .asciiz "Sugar"
r5i3: .asciiz "Flour"
r5i4: .asciiz "Eggs"
r5i5: .asciiz "Chocolate chips"
r5c: .word 25
r5d: .word 2
r5r: .word 5


search1: .asciiz "Caesar Salad"
search2: .asciiz "Shepherd's Pie"

.text
main:
###############################################

	# Create LinkedList
	jal createLinkedList
	move $s0, $v0      # save list address

	# Create array for 5 recipes
	li $a0, 5          # size
	li $a1, 4          # element size (word)
	mul $a0, $a0, $a1  # Calculate the size of the array
	jal createArray
	move $s1, $v0      # save list address

	#la $t0, addressOfRecipeList
	#sw $v0, 0($t0)     # Save the address of the array

	# Add recipes to array
	move $a0, $s1      # Load the address of the array
	la $a1, r1i1         # recipe 1
	li $a2, 0          # index 0
	jal putElementToArray

	la $a1, r1i2         # recipe 2
	li $a2, 1          # index 1
	jal putElementToArray

	la $a1, r1i3         # recipe 3
	li $a2, 2          # index 2
	jal putElementToArray

	la $a1, r1i4         # recipe 4
	li $a2, 3          # index 3
	jal putElementToArray

	la $a1, r1i5         # recipe 5
	li $a2, 4          	 # index 4
	jal putElementToArray

	# Create Recipe 1
	la $a0, r1
	move $a1, $s1
	la $a2, r1c
	la $a3, r1d
	add $sp, $sp, -4
	la $t0, r1r
	sw $t0, 0($sp)
	jal createRecipe
	add $sp, $sp, 4

	# Enqueue Recipe 1
	move $a0, $s0
	move $a1, $v0
	jal enqueue

	# Create array for 5 recipes
	li $a0, 5          # size
	li $a1, 4          # element size (word)
	mul $a0, $a0, $a1  # Calculate the size of the array
	jal createArray
	move $s1, $v0      # save list address

	#la $t0, addressOfRecipeList
	#sw $v0, 0($t0)     # Save the address of the array

	# Add recipes to array
	move $a0, $s1      # Load the address of the array
	la $a1, r2i1         # recipe 1
	li $a2, 0          # index 0
	jal putElementToArray

	la $a1, r2i2         # recipe 2
	li $a2, 1          # index 1
	jal putElementToArray

	la $a1, r2i3         # recipe 3
	li $a2, 2          # index 2
	jal putElementToArray

	la $a1, r2i4         # recipe 4
	li $a2, 3          # index 3
	jal putElementToArray

	la $a1, r2i5         # recipe 5
	li $a2, 4          	 # index 4
	jal putElementToArray

	# Create Recipe 2
	la $a0, r2
	move $a1, $s1
	la $a2, r2c
	la $a3, r2d
	add $sp, $sp, -4
	la $t0, r2r
	sw $t0, 0($sp)
	jal createRecipe

	# Enqueue Recipe 2
	move $a0, $s0
	move $a1, $v0
	jal enqueue

	# Test queue size
	move $a0, $s0
	jal queueSize      # Expected: 2

	move $a0, $s0
	la $a1, printRecipe
	jal traverseLinkedList

	move $a0, $s0
	jal dequeue

	#print dequeued recipe
	lw $a0, 0($v0)
	jal printRecipe

	# Test queue size
	move $a0, $s0
	jal queueSize      # Expected: 1

	move $a0, $s0
	la $a1, printRecipe
	jal traverseLinkedList

	move $a0, $s0
	jal dequeue

	#print dequeued recipe
	lw $a0, 0($v0)
	jal printRecipe

	move $a0, $s0
	jal dequeue

	jal noRecipeBranch

	# Test queue size
	move $a0, $s0
	jal queueSize      # Expected: 1

	move $a0, $s0
	la $a1, printRecipe
	jal traverseLinkedList

	la $a0, lines
	li $v0, 4
	syscall

	la $a0, newLine
	syscall


	# Create array for 5 ingredients
	li $a0, 5          # size
	li $a1, 4          # element size (word)
	mul $a0, $a0, $a1  # Calculate the size of the array
	jal createArray
	move $s1, $v0      # save list address

	#la $t0, addressOfRecipeList
	#sw $v0, 0($t0)     # Save the address of the array

	# Add recipes to array
	move $a0, $s1      # Load the address of the array
	la $a1, r3i1         # ingredient 1
	li $a2, 0          # index 0
	jal putElementToArray

	la $a1, r3i2         # ingredient 2
	li $a2, 1          # index 1
	jal putElementToArray

	la $a1, r3i3         # ingredient 3
	li $a2, 2          # index 2
	jal putElementToArray

	la $a1, r3i4         # ingredient 4
	li $a2, 3          # index 3
	jal putElementToArray

	la $a1, r3i5         # ingredient 5
	li $a2, 4          	 # index 4
	jal putElementToArray

	# Create Recipe 2
	la $a0, r3
	move $a1, $s1
	la $a2, r3c
	la $a3, r3d
	add $sp, $sp, -4
	la $t0, r3r
	sw $t0, 0($sp)
	jal createRecipe

	# Enqueue Recipe 2
	move $a0, $s0
	move $a1, $v0
	jal enqueue

	# Test queue size
	move $a0, $s0
	jal queueSize      # Expected: 1

	move $a0, $s0
	la $a1, printRecipe
	jal traverseLinkedList

	# Create array for 4 ingredients
	li $a0, 4          # size
	li $a1, 4          # element size (word)
	mul $a0, $a0, $a1  # Calculate the size of the array
	jal createArray
	move $s1, $v0      # save list address

	#la $t0, addressOfRecipeList
	#sw $v0, 0($t0)     # Save the address of the array

	# Add recipes to array
	move $a0, $s1      # Load the address of the array
	la $a1, r4i1         # ingredient 1
	li $a2, 0          # index 0
	jal putElementToArray

	la $a1, r4i2         # ingredient 2
	li $a2, 1          # index 1
	jal putElementToArray

	la $a1, r4i3         # ingredient 3
	li $a2, 2          # index 2
	jal putElementToArray

	move $a0, $s1      # Load the address of the array
	la $a1, r4i4         # ingredient 4
	li $a2, 3          # index 3
	jal putElementToArray


	move $a0, $s1      # Load the address of the array
	la $a1, r4i5         # ingredient 5
	li $a2, 4          	 # index 4
	jal putElementToArray

	# Create Recipe 2
	la $a0, r4
	move $a1, $s1
	la $a2, r4c
	la $a3, r4d
	add $sp, $sp, -4
	la $t0, r4r
	sw $t0, 0($sp)
	jal createRecipe

	# Enqueue Recipe 2
	move $a0, $s0
	move $a1, $v0
	jal enqueue

	# Test queue size
	move $a0, $s0
	jal queueSize

	move $a0, $s0
	la $a1, printRecipe
	jal traverseLinkedList

	# Create array for 5 ingredients
	li $a0, 5          # size
	li $a1, 4          # element size (word)
	mul $a0, $a0, $a1  # Calculate the size of the array
	jal createArray
	move $s1, $v0      # save list address

	#la $t0, addressOfRecipeList
	#sw $v0, 0($t0)     # Save the address of the array

	# Add recipes to array
	move $a0, $s1      # Load the address of the array
	la $a1, r5i1         # ingredient 1
	li $a2, 0          # index 0
	jal putElementToArray

	la $a1, r5i2         # ingredient 2
	li $a2, 1          # index 1
	jal putElementToArray

	la $a1, r5i3         # ingredient 3
	li $a2, 2          # index 2
	jal putElementToArray

	move $a0, $s1      # Load the address of the array
	la $a1, r5i4         # ingredient 4
	li $a2, 3          # index 3
	jal putElementToArray

	move $a0, $s1      # Load the address of the array
	la $a1, r5i5         # ingredient 5
	li $a2, 4          	 # index 4
	jal putElementToArray

	# Create Recipe 2
	la $a0, r5
	move $a1, $s1
	la $a2, r5c
	la $a3, r5d
	add $sp, $sp, -4
	la $t0, r5r
	sw $t0, 0($sp)
	jal createRecipe

	# Enqueue Recipe 2
	move $a0, $s0
	move $a1, $v0
	jal enqueue

	# Test queue size
	move $a0, $s0
	jal queueSize

	move $a0, $s0
	la $a1, printRecipe
	jal traverseLinkedList

	move $a0, $s0
	la $a1, findRecipe
	la $a2, search1
	jal traverseLinkedList

	move $a0, $s0
	la $a1, findRecipe
	la $a2, search2
	jal traverseLinkedList

	j mainTerminate

mainTerminate:
	li $v0, 10
	syscall


createArray:
	# Create an array
	# Inputs: $a0 - max number of elements (size), $a1 - size of elements
	# Outputs: $v0 - address of array

	move $t0, $a0 # Copy the size to $t0
	move $t1, $a0 # Copy the size to $t1
	add $t0, $t0, 12  # Add 8 bytes for element size and address and 4 bytes for size

	li  $v0, 9
	move $a0, $t0
	syscall # v0 = address of the array

	move $a0, $t1
	sw $a0, 0($v0) # Store the size of the array
	sw $a1, 4($v0) # Store the size of the elements

	##########################
	# Array Structure
	#  4 Bytes size of elements array.
	#  4 Bytes size of a element
	#  4 Bytes Array starting adress
	#  .
	#  .
	#  .
	#  .
	#  Until the end of the array
	##########################

	jr $ra

putElementToArray:
	# Store an element (recipe) in an array.
	# Inputs: $a0 - address of array, $a1 - element address, $a2 - index

	add $sp, $sp, -4
	sw $ra, 0($sp) # Save return address

	lw $t0, 0($a0) # Load the size of the array
	lw $t1, 4($a0) # Load the size of the elements

	add $t5, $a2, 1
	mul $t6, $t5, $t1 # Calculate the offset
	bgt $t6, $t0, indexOutOfBounds # Check if index * element_size >= size

	add $t2, $a0, 8 # Move to the first element

	move $t3, $a1

	mul $t4, $a2, $t1 # Calculate the offset
	add $t5, $t2, $t4 # Calculate the address of the element

	sw $t3, 0($t5) # Store the element

	jr $ra

indexOutOfBounds:
	la $a0, indexBoundWarning
	li $v0, 4
	syscall

	lw $ra, 0($sp) # Restore return address
	add $sp, $sp, 4

	jr $ra

createLinkedList:
	# Create a linked list.
	# Outputs: $v0 - address of linked List

	# Syscall for memory allocation
	# a0 = 8 bytes
	# a0 = 4 bytes(Base Address) + 4 bytes(size)
	li $v0, 9
	li $a0, 8
	syscall

	jr $ra

createLinkedListNode:
	# Create a linked list node.
	# Inputs: $a0 - address of data, $a1 - address of next node
	# Outputs: $v0 - address of linked list node

	add $sp, $sp, -8
	sw $a0, 0($sp)
	sw $a1, 4($sp)

	# Syscall for memory allocation
	# a0 = 8 bytes
	# a0 = 4 bytes(Base Address) + 4 bytes(address of next node)
	li $v0, 9
	li $a0, 8
	syscall

	lw $t0, 0($sp)
	lw $t1, 4($sp)

	# Store data
	sw $t0, 0($v0)

	# Store next node address
	sw $t1, 4($v0)

	lw $a1, 4($sp)
	lw $a0, 0($sp)

	add $sp, $sp, 8

	jr $ra

enqueue:
	# FIXME: Reverse the order of the linked list

	# Inputs: $a0 - address of the linked list structure, $a1 - address of data to add

	add $sp, $sp, -16
	sw $ra, 0($sp)     # Save return address
	sw $a0, 4($sp)     # Save linked list structure
	sw $a1, 8($sp)     # Save data address

	#move $a0, $a1      # Data address
	#lw $t1, 4($sp)     # Get list structure
	#lw $a1, 0($t1)     # Current head as next ??
	#j continueEnqueue

	# Get the last node
	lw $a0, 4($sp)     # Load linked list
	lw $t0, 0($a0)     # Load head node
	lw $a1, 8($sp)     # Load data address
	beq $t0, $zero, firstNode # Check if head is null

	lw $a0, 4($sp)     # Load linked list structure
	lw $a0, 0($a0)     # Load head node
	jal goEnd

	addi $t1, $v0, 4 # Next node address
	sw $t1, 12($sp)     # Save next node address

	lw $a0, 8($sp)     # Load data adress
	li $a1, 0          # Next pointer = null
	jal createLinkedListNode

	lw $t1, 12($sp)     # Get next node address
	sw $v0, 0($t1)     # Set next node

	lw $t1, 4($sp)     # Get linked list structure
	lw $t2, 4($t1)     # Get size
	addi $t2, $t2, 1   # Increment size
	sw $t2, 4($t1)     # Update size

	la $a0, recipeAdded
	li $v0, 4
	syscall

	lw $a1, 8($sp)     # Restore last node
	lw $a0, 4($sp)     # Restore linked list structure
	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 16

	jr $ra

firstNode:
	# Inputs: $a0 - address of the linked list structure,
	#		  $a1 - address of data to add

	add $sp, $sp, -12
	sw $ra, 0($sp)     # Save return address
	sw $a0, 4($sp)     # Save linked list structure
	sw $a1, 8($sp)    # Save data address

	move $a0, $a1      # Data address
	li $a1, 0          # Next pointer = null
	jal createLinkedListNode
	# New node address is in $v0

	lw $t0, 4($sp)     # Get linked list structure

	sw $v0, 0($t0)     # Set new head
	lw $t1, 4($t0)     # Get size

	addi $t1, $t1, 1   # Increment size
	sw $t1, 4($t0)     # Update size

	la $a0, recipeAdded
	li $v0, 4
	syscall

	lw $a1, 8($sp)     # Restore last node
	lw $a0, 4($sp)     # Restore linked list structure
	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 12

	jr $ra

## NEWLY IMPLEMENTED FIXME!!!!
goEnd:
	# Go to the end of the linked list.
	# Inputs: $a0 - address of head node
	# Outputs: $v0 - address of the last node

	add $sp, $sp, -4
	sw $ra, 0($sp)     # Save return address

	# Check if head is null
	beq $a0, $zero, returnEnd

goEndLoop:
	lw $t2, 4($a0)     # Load next node

	beq $t2, $zero, returnEnd # Check if next node is null
	move $a0, $t2     # Move next node to $a0

	j goEndLoop

returnEnd:

	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 4    # Restore stack
	move $v0, $a0      # Return last node
	jr $ra

dequeue:
	# Inputs: $a0 - address of the linked list structure
	# Outputs: $v0 - removed head node, 0 if empty

	# Get the head node and size
	lw $t0, 0($a0)     # Get head node
	lw $t1, 4($a0)     # Get size

	# Check if empty
	beq $t1, $zero, emptyDequeue

	move $t3, $a0      # Copy the address of the linked list structure to $t3
	la $a0, recipeRemoved
	li $v0, 4
	syscall
	move $a0, $t3      # Move the address of the linked list structure to $a0

	# Save current head to return
	move $v0, $t0      # Return node address

	# Get next node address and update head
	lw $t2, 4($t0)     # Load next pointer from current head
	sw $t2, 0($a0)     # Update head to next node

	# Update size
	sub $t1, $t1, 1
	sw $t1, 4($a0)

	jr $ra

emptyDequeue:
	la $a0, emptyListWarning
	li $v0, 4
	syscall

	li $v0, 0
	jr $ra


queueSize:
	# Inputs: $a0 - address of the linked list structure

	move $t1, $a0 # Copy the address of the linked list structure to $t1

	li $v0, 4
	la $a0, listSize
	syscall

	# Get the size inside the LinkedList structure
	lw $t0, 4($t1)

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

	jr $ra

traverseArray:
	add $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)

	li $t0, 0          # Index counter
	#FIXME ARRAY LINEUP CHANGED
	lw $t1, 8($a0)     # Array base address
	lw $t2, 0($a0)     # Array size
	lw $t3, 4($a0)     # Element size

traverseArrayLoop:
	bge $t0, $t2, emptyArray    # Check if index * elemt_size >= size

	mul $t4, $t0, $t3           # offset = index * element_size
	add $t5, $t1, $t4           # element_addr = base + offset

	lw $a0, 0($t5)             # Load element
	lw $a1, 8($sp)             # Load function
	jalr $a1                    # Call function

	addi $t0, $t0, 1           # Increment index
	lw $a0, 4($sp)             # Restore array address
	j traverseArrayLoop

emptyArray:
	lw $ra, 0($sp)
	add $sp, $sp, 12

	jr $ra

traverseLinkedList:
	# Traverse linked list.
	# Inputs: $a0 - head node of linked list, $a1 - called function, $a2 - extra arguments

	move $t0, $a0      # Load head node

	la $a0, listStr
	li $v0, 4
	syscall

	la $a0, lines
	li $v0, 4
	syscall

	move $a0, $t0      # Move head node to $a0

	add $sp, $sp, -20
	sw $ra, 0($sp)     # Save return address
	sw $a0, 4($sp)     # Save head node
	sw $a1, 8($sp)     # Save called function
	sw $a2, 12($sp)    # Save extra arguments

	lw $t0, 0($a0)     # Load head of linked list
	lw $t1, 4($a0)     # Load size of linked list
	li $t2, 0          # Index counter

	beq $t0, $zero, emptyLinkedList # Checks mem address of head node
	beq $t1, $zero, emptyLinkedList # Checks size of linked list

	# FIXME?
traverseLinkedListLoop:
	#bgt $t2, $t1, emptyLinkedList # Check if index >= size
	beq $t0, $zero, finishLinkedList # Check if index >= size

	#ove $a0, $t0      # Move data address to $a0 for printing
	lw $a0, 0($t0)    # Load data address
	lw $a1, 8($sp)     # Load called function
	lw $a2, 12($sp)    # Load extra arguments extra arguments for string comparison
	sw $t0, 16($sp)    # Save
	move $t3, $a1      # Copy data address to $t3
	la $a1, 12($sp)    # Load called function
	jalr $t3           # Call function

	lw $a1, 8($sp)     # Restore called function
	lw $a2, 12($sp)    # Restore extra arguments

	addi $t2, $t2, 1   # Increment index

	lw $t0, 16($sp)    # Load
	lw $t0, 4($t0)     # Load next node
	j traverseLinkedListLoop

finishLinkedList:
	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 20   # Restore stack

	la $a0, lines
	li $v0, 4
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	jr $ra

emptyLinkedList:
	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 20   # Restore stack

	la $a0, emptyListWarning
	li $v0, 4
	syscall

	jr $ra

createRecipe:
	# Create a recipe and store in the recipe struct.
	# Inputs: $a0 - recipe name, $a1 - address of ingredients array,
	#         $a2 - cooking time, $a3 - difficulty, 0($sp) - rating
	# Outputs: $v0 - recipe address

	add $sp, $sp, -20
	sw $a0, 0($sp) 	# Save recipe name
	sw $a1, 4($sp) 	# Save ingredients array address
	sw $a2, 8($sp) 	# cookint time
	sw $a3, 12($sp) # difficulty

	li $v0, 9
	li $a0, 20  # 5 * 4 = 20 bytes
	syscall # 20 bytes allocated for recipe struct

	lw $t0, 0($sp) 	# Load recipe name address
	sw $t0, 0($v0) 	# Store recipe name
	lw $t0, 4($sp) 	# Load ingredients array address
	sw $t0, 4($v0) 	# Store ingredients array address
	lw $t0, 8($sp) 	# Load cooking time
	sw $t0, 8($v0) 	# Store cooking time
	lw $t0, 12($sp) # Load difficulty
	sw $t0, 12($v0) # Store difficulty
	lw $t0, 20($sp) # Load rating !!!!!!! from ORIGINAL STACK POS (24)
	sw $t0, 16($v0) # Store rating

	add $sp, $sp, 20

	jr $ra


compareString:
	# Compare two strings.
	# Inputs: $a0 - string 1 address, $a1 - string 2 address
	# Outputs: $v0 - 0 found, 1 not found

	#lb $t0, 0($a0)     # Load string 1 address
	#lb $t1, 0($a1)     # Load string 2 address

	move $t2, $a0
	move $t3, $a1

compareStringLoop:

	lb $t0, 0($t2)     # Load string 1 address
	lb $t1, 0($t3)     # Load string 2 address

	bne $t0, $t1, notEqual
	beq $t0, $zero, equal

	# Strings made from chars and chars -> bytes
	addi $t2, $t2, 1 # Increment string 1 address by 1 byte
	addi $t3, $t3, 1 # Increment string 2 address by 1 byte
	j compareStringLoop

notEqual:
	li $v0, 1
	jr $ra

equal:
	li $v0, 0
	jr $ra

findRecipe:
	# Compare two recipe names.
	# Inputs: $a0 - recipe struct address, $a1 - searched recipe name

	add $sp, $sp, -8
	sw $ra, 0($sp) # Save return address
	sw $a0, 4($sp) # Save recipe struct address

	lw $t0, 0($a0) # Load recipe name address
	lw $t1, 0($a1) # Load searched recipe name address

	move $a0, $t0
	move $a1, $t1
	jal compareString

	beq $v0, $zero, foundRecipe

notFoundRecipe:
	la $a0, recipeNotMatch
	li $v0, 4
	syscall

recipeEnd:

	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 8    # Restore stack

	li $v0, 0
	jr $ra

foundRecipe:
	la $a0, recipeMatch
	li $v0, 4
	syscall

	lw $a0, 4($sp) # Load recipe struct address
	jal printRecipe

	j recipeEnd

printRecipe:
	# Print recipe details.
	# Inputs: $a0 - address of recipe struct

	beq $a0, $zero, noRecipeBranch

	move $t0, $a0      # Load recipe struct address
	addi $t1, $a0, 4  # Load ingredients array address
	addi $t2, $a0, 8  # Load cooking time
	addi $t3, $a0, 12 # Load difficulty
	addi $t4, $a0, 16 # Load rating

	add $sp, $sp, -24
	sw $ra, 0($sp)     # Save return address
	sw $t0, 4($sp)     # Save recipe struct address
	sw $t1, 8($sp)     # Save ingredients array address
	sw $t2, 12($sp)    # Save cooking time
	sw $t3, 16($sp)    # Save difficulty
	sw $t4, 20($sp)    # Save rating


	la $a0, recipeName
	li $v0, 4
	syscall

	lw $a0, 4($sp)    # Load recipe name
	lw $a0, 0($a0)    # Load recipe name
	li $v0, 4
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	la $a0, ingredients
	li $v0, 4
	syscall

	lw $a0, 8($sp)    # Load ingredients array address
	lw $a0, 0($a0)    # Load ingredients array address
	jal printIngredient

	la $a0, newLine
	li $v0, 4
	syscall

	la $a0, cookingTime
	li $v0, 4
	syscall

	lw $a0, 12($sp)    # Load cooking time
	lw $a0, 0($a0)    # Load cooking time
	lw $a0, 0($a0)    # Load cooking time
	li $v0, 1
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	la $a0, difficulty
	li $v0, 4
	syscall

	lw $a0, 16($sp)    # Load difficulty
	lw $a0, 0($a0)    # Load difficulty
	lw $a0, 0($a0)    # Load difficulty
	li $v0, 1
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	la $a0, rating
	li $v0, 4
	syscall

	lw $a0, 20($sp)    # Load rating
	lw $a0, 0($a0)    # Load difficulty
	lw $a0, 0($a0)    # Load difficulty
	li $v0, 1
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	la $a0, newLine
	syscall

	lw $ra, 0($sp)     # Restore return address
	add $sp, $sp, 24   # Restore stack

	jr $ra

noRecipeBranch:
	la $a0, noRecipeWarning
	li $v0, 4
	syscall

	jr $ra

printIngredient:
	# Print ingredient.
	# Inputs: $a0 - address of ingredient (ARRAY?)

	#beq $a0, $zero, noIngredientBranch #FIXME

	lw $t0, 0($a0) # Load size of data array
	lw $t1, 4($a0) # Load size of a element
	add $t2, $a0, 8 # Load data array address
	li $t3, 0      # Index counter

	la $a0, newLine
	li $v0, 4
	syscall

printIngredientLoop:
	mul $t6, $t3, $t1
	bge $t6, $t0, emptyIngredient # Check if index >= size

	mul $t4, $t3, $t1 # Calculate the offset
	add $t5, $t2, $t4 # Calculate the address of the element

	la $a0, tab
	li $v0, 4
	syscall

	lw $a0, 0($t5) # Load element
	syscall

	la $a0, newLine
	syscall

	addi $t3, $t3, 1 # Increment index
	j printIngredientLoop

emptyIngredient:

	jr $ra
