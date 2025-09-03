Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2FFCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MvsGH8QX5LLonBYdvEBwUryvZzqtafTW9SaKiYRc2s=; b=yrE8zqd0w7BGj7QKqhofW2Sd9T
	gHA+9aBrQtgoc0Nti3kGkeHDqU5KuvCdOU+h6HdJxW3aiivMVl63COXIYs2/jmTiTvov1YmO89NwM
	NI0t+xF08E1fRT6vz61nQsO8q/snkTMxjcexnW7J/rgButwdKziAMfMJb9cAiOpf8YIvWcvpJhiP4
	yxUL7eduGBoA8RFPnORJKJ1iKRF21Y11Fqc8njESeNiYfaRpx/ZYwdEzqYuOqwPc0VqSo6NlXuhql
	bG2uqjFnho3VpZCm1DtYxIRiZBhbs6RS7E+SCrdjyEsdV/TOfx3cKz5HTAcT0UMmF3LAZPhFSRB5Z
	d7MCy1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqjg-000000076ku-48Ls;
	Wed, 03 Sep 2025 16:53:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnNi-00000006YnL-0qgJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Sep 2025 13:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3MvsGH8QX5LLonBYdvEBwUryvZzqtafTW9SaKiYRc2s=; b=hlanp2vYEF7Qgira3i9Du/H6rF
	MnuMOZUXET+DA43TOxyJCIYjJy5PzTMP0tMGiSdKMHDz31ZZUMhAaZqPc9+8WA9Y+Uo61kFp+ruZt
	bO0otWaO2jGr8arjX97O79Y/LwhL/jytdGWToAnRqq1EMVFbKmqerIAI43L7q57pCnLreYl3KFoDG
	Z4xES0lFWcK0aUI2y59EtyfcB5TxK/+hUmyKW+78rRkFDjboFnTarxkta/wBeeJz0riFLebWFsumL
	LU/K/L+WC3k1u6uWe7BsRthZCuHwDL8xivzSran/1UIpP7E/k+sinD8Ik/h81DtucgoJyFfMqtjoG
	Q+Fu8a8w==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnNe-00000004ATB-3TBK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:18:33 +0000
X-UUID: 770bae1888c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0168c3e0-98fe-406d-85b1-48da848a7ccc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:2c9e1e9e5c5ada8eb7e570a730afb71d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 770bae1888c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1452110782; Wed, 03 Sep 2025 21:18:22 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 65C56E008FA2;
	Wed,  3 Sep 2025 21:18:21 +0800 (CST)
X-ns-mid: postfix-68B8401D-2351769
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id A519FE008FA4;
	Wed,  3 Sep 2025 21:18:17 +0800 (CST)
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
Subject: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:30 +0800
Message-Id: <20250903131733.57637-8-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_141831_581908_867C4EE0 
X-CRM114-Status: GOOD (  14.24  )
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
 drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index 99390ec1481f..f76594185fa2 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
 static void pd_release(struct dtpm *dtpm)
 {
 	struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
-	struct cpufreq_policy *policy;
=20
 	if (freq_qos_request_active(&dtpm_cpu->qos_req))
 		freq_qos_remove_request(&dtpm_cpu->qos_req);
=20
-	policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
-	if (policy) {
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+		cpufreq_cpu_get(dtpm_cpu->cpu);
+
+	if (policy)
 		for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
 			per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
=20
-		cpufreq_cpu_put(policy);
-	}
-
 	kfree(dtpm_cpu);
 }
=20
@@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
 static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 {
 	struct dtpm_cpu *dtpm_cpu;
-	struct cpufreq_policy *policy;
 	struct em_perf_state *table;
 	struct em_perf_domain *pd;
 	char name[CPUFREQ_NAME_LEN];
@@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
 	if (dtpm_cpu)
 		return 0;
=20
-	policy =3D cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+		cpufreq_cpu_get(cpu);
+
 	if (!policy)
 		return 0;
=20
 	pd =3D em_cpu_get(cpu);
-	if (!pd || em_is_artificial(pd)) {
-		ret =3D -EINVAL;
-		goto release_policy;
-	}
+	if (!pd || em_is_artificial(pd))
+		return -EINVAL;
=20
 	dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
-	if (!dtpm_cpu) {
-		ret =3D -ENOMEM;
-		goto release_policy;
-	}
+	if (!dtpm_cpu)
+		return -ENOMEM;
=20
 	dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
 	dtpm_cpu->cpu =3D cpu;
@@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
 	if (ret < 0)
 		goto out_dtpm_unregister;
=20
-	cpufreq_cpu_put(policy);
 	return 0;
=20
 out_dtpm_unregister:
@@ -251,8 +245,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
 		per_cpu(dtpm_per_cpu, cpu) =3D NULL;
 	kfree(dtpm_cpu);
=20
-release_policy:
-	cpufreq_cpu_put(policy);
 	return ret;
 }
=20
--=20
2.25.1


