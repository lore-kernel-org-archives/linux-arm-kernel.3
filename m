Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B77DCA1011
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDpnGt0f6FuF11OLl5yhNzKPiEUlBZBsDH3iT8IR2iQ=; b=RuYwIl+/WtbMsGw9dzFlKovukl
	rbGqkpQ+BnIvfy6BQJYz7MWBCUd0cHkAT6cABtgr2hl3YvSDsnYlySumzbsunf40aQao5zwuFN17l
	I8AitmKephqcXhRGhl8bcIMSTGmnCvMPowDlFBcoHZ1yNWdGBQKFSmjyhjgdHTyNQJe8lVMfGaGK/
	n4EKUjB8Rz0jQMODcwKM6LHFqmsC2rOdC5SEh3jUzRx0XpEyxcOV67fkIKfArlw5keHdvQPrBHK9E
	LITRRS6f4ACohuIjUonIOhRkK/GpIigOBS2ecS/2mUXm9N67XOSqjArcYR8StyHj2R6VBzw2VrSu1
	LBhQuaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqWG-000000075Fh-3jdA;
	Wed, 03 Sep 2025 16:39:36 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnNR-00000006Yi4-3bpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:18:19 +0000
X-UUID: 6fdb27e088c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:12ed8bd1-e772-4e2f-b7a0-b366cc106c8e,IP:0,U
	RL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:38
X-CID-META: VersionHash:6493067,CLOUDID:c7bcb509d5c742570f4125e3bd0d306b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6fdb27e088c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1513682554; Wed, 03 Sep 2025 21:18:09 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id A2980E008FA2;
	Wed,  3 Sep 2025 21:18:09 +0800 (CST)
X-ns-mid: postfix-68B84011-4806846
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E3EF1E008FA4;
	Wed,  3 Sep 2025 21:18:05 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>
Cc: Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v4 04/10] cpufreq: powernv: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:27 +0800
Message-Id: <20250903131733.57637-5-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_061818_201141_41FAA621 
X-CRM114-Status: GOOD (  12.40  )
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

Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
annotation for policy references. This reduces the risk of reference
counting mistakes and aligns the code with the latest kernel style.

No functional change intended.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 drivers/cpufreq/powernv-cpufreq.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-=
cpufreq.c
index 7d9a5f656de8..811fdbf398fa 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -892,15 +892,15 @@ static int powernv_cpufreq_reboot_notifier(struct n=
otifier_block *nb,
 				unsigned long action, void *unused)
 {
 	int cpu;
-	struct cpufreq_policy *cpu_policy;
=20
 	rebooting =3D true;
 	for_each_online_cpu(cpu) {
-		cpu_policy =3D cpufreq_cpu_get(cpu);
+		struct cpufreq_policy *cpu_policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
+
 		if (!cpu_policy)
 			continue;
 		powernv_cpufreq_target_index(cpu_policy, get_nominal_index());
-		cpufreq_cpu_put(cpu_policy);
 	}
=20
 	return NOTIFY_DONE;
@@ -913,7 +913,6 @@ static struct notifier_block powernv_cpufreq_reboot_n=
b =3D {
 static void powernv_cpufreq_work_fn(struct work_struct *work)
 {
 	struct chip *chip =3D container_of(work, struct chip, throttle);
-	struct cpufreq_policy *policy;
 	unsigned int cpu;
 	cpumask_t mask;
=20
@@ -928,14 +927,14 @@ static void powernv_cpufreq_work_fn(struct work_str=
uct *work)
 	chip->restore =3D false;
 	for_each_cpu(cpu, &mask) {
 		int index;
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
=20
-		policy =3D cpufreq_cpu_get(cpu);
 		if (!policy)
 			continue;
 		index =3D cpufreq_table_find_index_c(policy, policy->cur, false);
 		powernv_cpufreq_target_index(policy, index);
 		cpumask_andnot(&mask, &mask, policy->cpus);
-		cpufreq_cpu_put(policy);
 	}
 out:
 	cpus_read_unlock();
--=20
2.25.1


