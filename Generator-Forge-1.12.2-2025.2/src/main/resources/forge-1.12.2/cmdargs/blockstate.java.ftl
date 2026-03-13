$
Block block = CommandBase.getBlockByText(sender, index);
IBlockState ${field$name};
if (args.length >= index+2) {
    ${field$name} = convertArgToBlockState(block, index+1);
} else {
 ${field$name} = block.getDefaultState();
}
${statement$args}
$

|
getListOfStringsMatchingLastWord(args, Block.REGISTRY.getKeys())
|