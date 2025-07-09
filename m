Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EB6C83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4M7LELCI1cPFBstNSyN002g4c3zY7P9EeDdL35tmOwI=; b=BqUhcoc1dtk865IcVjK39TQnF+
	7XTDCwZOMGBCQV7GkGXTb9wrd6GpXIrz7u8AqU7l1VSAI2KS/7/CpqeoZKFY4DWcKBpIFrnJr5GNi
	x9s6m6M8yRYmsPPvHrD5aXZXGdStr4gjNaxSa0D0odrr/gM14+npogY4yJPkaXzjPsw96RJ9Xu0IS
	fiMJQXOos7wtf6G3v+/D6tLCfOoCl+aeQTdQ3V2msq1l1evu02jMzPsVz9hs09/4z3cAhlJXgFqeZ
	McfGRiGak0FfdXV4PiJqiUVWhXhIrH8+vWYkcQxpjjNPIR1zD4qcPKkF7Eg3W/PG4A7BKVvGg4E8B
	PCEhWHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZco5-00000009xKw-379x;
	Wed, 09 Jul 2025 21:58:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX1Q-00000009CtR-019M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:47:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso64383f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752076066; x=1752680866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4M7LELCI1cPFBstNSyN002g4c3zY7P9EeDdL35tmOwI=;
        b=plAAwffbYWrAhnR5caQKOtugWio5Fx9/tbi+4kr87QbTQ5RYlP1mueOSQmemDlkXJQ
         4UKo0+yqRWtGeEvPy5KhreUYl368/xB+XGWwxWAerEsz5SzFMa67YCYZJgoG6M4PzcxY
         TkvNpt5WeeksWYPAzkFG7zGin0i+pJq7GZ+bsjXOdNIE1XwQx7CgsgjJxbaMYE1bOTyQ
         eMFnNezjbNGWhftWIBBrnHT6puwi6Yt7PMpxftjxtA8sDmOxeNZxgd8hL8xmpilYqva7
         tp0tnbKCFUjevWti+IipujPSfOcUNoI6rSUjVE3a1tUwwCf/++qwWUIbHizdQGEdrPY6
         fx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752076066; x=1752680866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4M7LELCI1cPFBstNSyN002g4c3zY7P9EeDdL35tmOwI=;
        b=DGo1PkT6rSUgBcAftvGrfiXp1daYNOQ7mtcl7zhcdyNyGzjM8NXi0A2UP2PExA0Q54
         1NiGW70YITW4Nuy1UEJcw9jb1l64O4D9VpsMfSIZdsZxWfgebmq0aa0sREN4JNSQNf3G
         9El3WgmK0hNJwGQUx3jalWoYPbwzmlp/KrBcVYC9t+ko9AL7zF2ezDUFCPVMG1zfeUgD
         BDCYzmOPDkNTiBJnLXuCQpAS//IlW8fr2+/QC62+8/oxqMm+nDF+eLDB+LqOERn6jwIN
         IC4l3gDXV+Gs9XFMiakEh8bOhiwP2IAVFRDalW/auY4NdPyZyndjnYPU32Ko/W8EbUSr
         E5sg==
X-Forwarded-Encrypted: i=1; AJvYcCV5/PbNej9sqJDB3u2M8uINePFzju0WrrNymjw7s55xFYEQBNY4bgAdTRursCXm9Xhuva3UjaC+phFig9kVb37s@lists.infradead.org
X-Gm-Message-State: AOJu0YxZBqme3mEbOBvcAF3GlDgI4TqTgmVnzvm9ImtI7Vb0iEhYA3x5
	PLvl1QPBlvyCziJFyzcIsEk7OBjzkSx8pOWy9NpunHEp2Gn5zkGYSWQOPHVNK8eH8vQ=
X-Gm-Gg: ASbGnct8FupLXyQLJaePOlKWVeFTal8+a8r7PtmndTCgIfzSeR+1U9dZgGXEBjqD0zw
	yUtF6nr3uVnZk7ZmbWXHrQg/S0r+koNr78ERaqrd6NzfKPlyC95r6KRAll4Lu6oz/1kXs5rn3JE
	WPK8oZ/HBGJJ8DZLRv+sxIaHmdUwAfnGhVIcRbCwBQ9DmxV/Rv8V2g5hTxfY1l6nbHi0XEBXkEn
	mhEKNbolX7c9UeEWEkszQhmzx8Mp/mno9ESCJutDmrxhf2WpjhDSjhEcEkCLAJnt+Tx4XJ7UjZi
	dPyGptBKQpN1uqYfEe99qehn7GV+Cwp4MIoHyBNxkRBNGWuThUhKcFdKnIrnseyT1FotBKmDW8+
	NQmywu2+veb7s
X-Google-Smtp-Source: AGHT+IFtb3wKvcyNXV4wx2vLvybT75yPG2OAwmNgwliyjrb9KJP4FNMYX9tqHYbI3ZRouro6vvXlVw==
X-Received: by 2002:a05:6000:2206:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3b5e452a289mr2446888f8f.29.1752076065919;
        Wed, 09 Jul 2025 08:47:45 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97732sm16783647f8f.59.2025.07.09.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:47:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	sudeep.holla@arm.com,
	ulf.hansson@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-rt-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Raghavendra Kakarla <quic_rkakarla@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT))
Subject: [PATCH] cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y
Date: Wed,  9 Jul 2025 17:47:28 +0200
Message-ID: <20250709154728.733920-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_084748_049371_0BBEA1A1 
X-CRM114-Status: GOOD (  17.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently cpu hotplug with the PREEMPT_RT option set in the kernel is
not supported because the underlying generic power domain functions
used in the cpu hotplug callbacks are incompatible from a lock point
of view. This situation prevents the suspend to idle to reach the
deepest idle state for the "cluster" as identified in the
undermentioned commit.

Use the compatible ones when PREEMPT_RT is enabled and remove the
boolean disabling the hotplug callbacks with this option.

With this change the platform can reach the deepest idle state
allowing at suspend time to consume less power.

Tested-on Lenovo T14s with the following script:

echo 0 > /sys/devices/system/cpu/cpu3/online
BEFORE=$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/idle_states | grep S0 | awk '{ print $3 }') ;
rtcwake -s 1 -m mem;
AFTER=$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/idle_states | grep S0 | awk '{ print $3 }');
if [ $BEFORE -lt $AFTER ]; then
    echo "Test successful"
else
    echo "Test failed"
fi
echo 1 > /sys/devices/system/cpu/cpu3/online

Fixes: 1c4b2932bd62 ("cpuidle: psci: Enable the hierarchical topology for s2idle on PREEMPT_RT")
Cc: Raghavendra Kakarla <quic_rkakarla@quicinc.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 4e1ba35deda9..b19bc60cc627 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -45,7 +45,6 @@ struct psci_cpuidle_domain_state {
 static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
 static DEFINE_PER_CPU(struct psci_cpuidle_domain_state, psci_domain_state);
 static bool psci_cpuidle_use_syscore;
-static bool psci_cpuidle_use_cpuhp;
 
 void psci_set_domain_state(struct generic_pm_domain *pd, unsigned int state_idx,
 			   u32 state)
@@ -124,8 +123,12 @@ static int psci_idle_cpuhp_up(unsigned int cpu)
 {
 	struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
 
-	if (pd_dev)
-		pm_runtime_get_sync(pd_dev);
+	if (pd_dev) {
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			pm_runtime_get_sync(pd_dev);
+		else
+			dev_pm_genpd_resume(pd_dev);
+	}
 
 	return 0;
 }
@@ -135,7 +138,11 @@ static int psci_idle_cpuhp_down(unsigned int cpu)
 	struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
 
 	if (pd_dev) {
-		pm_runtime_put_sync(pd_dev);
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			pm_runtime_put_sync(pd_dev);
+		else
+			dev_pm_genpd_suspend(pd_dev);
+
 		/* Clear domain state to start fresh at next online. */
 		psci_clear_domain_state();
 	}
@@ -196,9 +203,6 @@ static void psci_idle_init_cpuhp(void)
 {
 	int err;
 
-	if (!psci_cpuidle_use_cpuhp)
-		return;
-
 	err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
 					"cpuidle/psci:online",
 					psci_idle_cpuhp_up,
@@ -259,10 +263,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	 * s2ram and s2idle.
 	 */
 	drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
-		psci_cpuidle_use_cpuhp = true;
-	}
 
 	return 0;
 }
@@ -339,7 +341,6 @@ static void psci_cpu_deinit_idle(int cpu)
 
 	dt_idle_detach_cpu(data->dev);
 	psci_cpuidle_use_syscore = false;
-	psci_cpuidle_use_cpuhp = false;
 }
 
 static int psci_idle_init_cpu(struct device *dev, int cpu)
-- 
2.43.0


