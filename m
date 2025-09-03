Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0781ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eq391jKO+ibx5qiY1WDwk2WI1cXYKR+uFHcNHxENAo=; b=ICd1eNzcyqVsCV+fiTedAuDKqF
	bn8c2p7P3l5z8Mk5//am3OdYwwEj7IvsbSCiBKn3z+Kc6ZlW2MkgIQzLZgYWZbCo/aV4unqh59su4
	usmUbOQtX+fWB4ZqdJCNx8oEjL0+ItK3PjfIZ/pCyyWRp/KEw8yWx8v4Pixeieejm/t67RMx6BAUD
	71C3YPpVgJvOWBPLEHgT7sQyqXqVzoitk4wTFRlm6dQZOPNvwUascs/FP4j8IYa11Gq4Yk0WqAOUe
	nehcwlx9ONvSSyvIRrMiXGdvaIbarlSNsZax045IHrsBiWWjHuySMsOw3E7/7v3GYpKVqBLRi6J/k
	vnpulCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utd2K-00000003DNB-1ilQ;
	Wed, 03 Sep 2025 02:15:48 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utczb-00000003CmC-1Tgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 02:13:01 +0000
X-UUID: 7e64a03c886b11f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a08d3f21-1eda-4701-933a-4d08872f3f53,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:aa48c90d2685f52c421d2b43104888ae,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850,TC:nil,Content:0|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7e64a03c886b11f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1390030646; Wed, 03 Sep 2025 10:12:51 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id A8973E008FA3;
	Wed,  3 Sep 2025 10:12:50 +0800 (CST)
X-ns-mid: postfix-68B7A422-507635249
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E1C47E008FA2;
	Wed,  3 Sep 2025 10:12:30 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: krzk@kernel.org
Cc: airlied@gmail.com,
	alim.akhtar@samsung.com,
	beata.michalska@arm.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	cw00.choi@samsung.com,
	daniel.lezcano@kernel.org,
	dave.hansen@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	edubezval@gmail.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	j-keerthy@ti.com,
	jani.nikula@linux.intel.com,
	kernel@pengutronix.de,
	kyungmin.park@samsung.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukasz.luba@arm.com,
	mpe@ellerman.id.au,
	myungjoo.ham@samsung.com,
	pavel@kernel.org,
	ptsm@linux.microsoft.com,
	rafael@kernel.org,
	rodrigo.vivi@intel.com,
	rui.zhang@intel.com,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	simona@ffwll.ch,
	srinivas.pandruvada@linux.intel.com,
	sudeep.holla@arm.com,
	sumitg@nvidia.com,
	thierry.reding@gmail.com,
	tursulin@ursulin.net,
	viresh.kumar@linaro.org,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhangzihuan@kylinos.cn,
	zhenglifeng1@huawei.com
Subject: Re: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 10:12:30 +0800
Message-Id: <20250903021230.1044454-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b38e64cc-4971-4e71-931c-820453aa91a7@kernel.org>
References: <b38e64cc-4971-4e71-931c-820453aa91a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_191259_683316_33E5771D 
X-CRM114-Status: GOOD (  10.16  )
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

> You are not improving the source code here. This is not how to use
>  __free() and you clearly do not understand the source code.

Sorry for the problem, policy should be assigned after cpumask_test_cpu()=
.

I actually realized earlier that __free() only frees at the end of the va=
riable=E2=80=99s lifetime.=20
I had suggested using a braced macro in cpufreq.h to allow immediate rele=
ase after use,=20
but I understand the maintainer=E2=80=99s advice to =E2=80=9Ckeep it simp=
le=E2=80=9D and will follow that.

> What's more, you did not use standard tools which would tell you this i=
s
> buggy and wrong.

Could you please let me know which standard tools you recommend for detec=
ting such issues?=20

I=E2=80=99d like to use them to avoid similar mistakes in the future.

> Don't introduce cleanup.h if you do not understand how it works.

Should I drop this patch?

