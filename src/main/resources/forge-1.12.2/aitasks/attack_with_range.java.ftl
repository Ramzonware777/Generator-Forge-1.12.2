<#include "aiconditions.java.ftl">
this.tasks.addTask(${cbi+1}, new EntityAIAttackMelee(this, ${field$speed}, ${field$longmemory?lower_case}) {

    @Override protected double getAttackReachSqr(LivingEntity entity) {
        return ${field$range?number * field$range?number};
    }

    <@conditionCode field$condition false/>
});
