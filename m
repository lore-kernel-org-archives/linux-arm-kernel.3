Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1714CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUMGiaG2cgQAUUruM/sGzEqwr2gbkfoPchwvllQJ3Y8=; b=AtV0AxX0xp/8fmGQGSDC7hm5ym
	3ZFf9I17XlVb8sM18tc96oGyqW+98Wym/ZYk/Ha86ukIMXK+38lsWIRogvKgO7QSq2/vnDLbwyGIr
	oZAcW2miWrP3I1+27AZSWkaFwMlO1p2N3wvQ1pfK3V0k80+e8t1k5TwrZGXb7ev2qw39kD96ZFuKT
	W3zRLO8lkMDAQbZWppTMaTzTWeBFi0WvVTk56Tq74UstvlQNcyjL69CoebYGAK4BzEbWlGati1GqC
	Rz7UtBNWDA0P6gDyYtnQSa1VoHUiCx+LUNGAGamTjjkSmjzcIsoY+AlC901ihFc0v9yOlvqaTtSvm
	0jrE/hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqbe-0000000761h-2GBh;
	Wed, 03 Sep 2025 16:45:10 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnNW-00000006YkM-48Wk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:18:24 +0000
X-UUID: 749e0a6888c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:592335fb-43af-471c-81cf-7d21aa6b3165,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:4fe2850b774750f8430f4353e4afc535,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 749e0a6888c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1123542880; Wed, 03 Sep 2025 21:18:17 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 990A1E008FA2;
	Wed,  3 Sep 2025 21:18:17 +0800 (CST)
X-ns-mid: postfix-68B84019-866748
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 854FDE008FA3;
	Wed,  3 Sep 2025 21:18:13 +0800 (CST)
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
Subject: [PATCH v4 06/10] drm/i915: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:29 +0800
Message-Id: <20250903131733.57637-7-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_061823_318369_705AC30F 
X-CRM114-Status: GOOD (  12.53  )
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
 drivers/gpu/drm/i915/gt/intel_llc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_llc.c b/drivers/gpu/drm/i915/g=
t/intel_llc.c
index 1d19c073ba2e..f15e4c0fa54b 100644
--- a/drivers/gpu/drm/i915/gt/intel_llc.c
+++ b/drivers/gpu/drm/i915/gt/intel_llc.c
@@ -29,13 +29,11 @@ static struct intel_gt *llc_to_gt(struct intel_llc *l=
lc)
=20
 static unsigned int cpu_max_MHz(void)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(0);
 	unsigned int max_khz;
=20
-	policy =3D cpufreq_cpu_get(0);
 	if (policy) {
 		max_khz =3D policy->cpuinfo.max_freq;
-		cpufreq_cpu_put(policy);
 	} else {
 		/*
 		 * Default to measured freq if none found, PCU will ensure we
--=20
2.25.1


