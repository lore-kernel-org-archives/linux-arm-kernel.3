Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE9DC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6o/ShoJvWLhlSyxTPkbAI0fwmABW2L1+nINfU74Drk=; b=gZK/Oo0GGIKH1fMdRUzCXdxEQu
	DQXhO6YAabRD+RSHkksC3ShbTm4CQeqVNco+PoRVqHYpnGyyPHYnoSK5yOitYdcHxRYbKDjGrvgwZ
	AoZxXH+PCqAVfNnLhMR/92SHOqz47GAXCYb8HOdGvSnwy97DWZOa5XAGsu5ydGFBMOWXIydONNCec
	ScalEYXYvwWaCWkvxKeHzMK2rTHjA9p83koxjCJ2nIwoIFw0qb3DUuXc6R3TGBkTpb7as6b5FhMyx
	jhoDNiaboScUgbYsFdhi0tnAu8Cp3rBvMsqTIiQB11JDmgVzI91gMr/OMFlJWHd1asdutq9bMokoj
	m6NxxpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzVN-000000056ZD-3NAy;
	Tue, 24 Jun 2025 08:59:49 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTz8Z-0000000530L-2Gew
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 08:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1750754168;
	bh=v6o/ShoJvWLhlSyxTPkbAI0fwmABW2L1+nINfU74Drk=;
	h=From:To:Cc:Subject:Date;
	b=ix+B26+xtieyhBV9nysOBf2D4HsThZYJpth+uTki1fczC32Hv09qVzLDSkokyyi1t
	 q1yufF/c99cSDTKI2R9NTE12KzUwEbVeceO/waOMY8nupVvNX28EwXG8L2tDItY50Y
	 3z+HaTElV46Z9QzpnyVbeUSevcQVfyv6UbjYTSPI=
Received: from KernelDevBox.byted.org ([115.190.40.13])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 8ED3EC23; Tue, 24 Jun 2025 16:35:45 +0800
X-QQ-mid: xmsmtpt1750754145t96osdqnj
Message-ID: <tencent_889D023A2A9B04DE8D592DFE961C5893C706@qq.com>
X-QQ-XMAILINFO: MKFQA+k1yb/29nquRTkIAQGt4f0wbGob7cvjvfJ8CF+sR9wKkmiBC4dNgvLeJp
	 fixeD0fmRyYLywArMVqyEdBYo7uQ8yPnXXLlbyMm4HBRjboZHX3FLGP4Bbb7VFN4RaNqY+X4GehU
	 f4QYVOorW3Bk3TABhklZlbqMXxqjYgdjIHBSF4Ze3WiBFF8Wv9Byx2YmeTcfCtdvLpQKe3UlSf2F
	 b8F/Y4uWPkjishF6MQA0NyXN9TLHNhK9Y6O4VvhufylnkiCIJLLurm4AOKaV/VM3U9HXSdZv4L4p
	 YRzqU8Okk51I6z9qMfccSJVOUHHIOh74DSiYVlqtWg/dJI/6e1LoAhejfUTvBhxk8o23H7c0Ium4
	 uqiGeop7q/29K2vxFgGHvjqwk+1mBqGS40M3erJFpy9d64szRhXiOxcMmuIfQrcjDDLqOsBllKaX
	 uG8OEpOwstYHThd+rBlObgV4oaebCyV0y9r1riLs3rMHmNghnrCbJ0duI2nm/OQZz2CSWstBA3pb
	 xTEsTFO2A5SQSi56BC8el+mhuVVlA9sNf+1d5k8SZVDqL7pp/j0z5jhxLbgl3JMOyGgPaTeNVGrB
	 xVdXzslCI7I5XDLr73rTMZnsA6beB3UkWvNGb6Y9qNCLOhblY3oplPcR5m5aAI55nmauJloK36rY
	 e55jd8RhPTGRdnbbXBkTKCGgtZCsfNJqWUzhRaa19caR5M+KRIHQwWyMWgByD11bV3cePftyoCGw
	 waNu4oaU8wfrlpic9SsIckgUYPvbGo2wyyhBA+tBpuFMX37B9qLms8GgW8faqCFHiFB9fBEZRjPz
	 0WUhwSxqMZjhBrn57Qhpko3uKfVxmeZQnQXTCqx9Kb229VWpQutaezaNyNQzZsvTvoCQJcdKMlw/
	 FT2TiyaEtrenAcNntLbl/wHU2LSPNE+rxUvbDzkJZc6ftfgeeI+C0T7NQzW2N29jPAeiG849zwcD
	 4SLSIHudFSsaNHQ43WfkJSkDgVFXddrcbmgkySGMUgX/OA/p1X6E1bivdg54fwW44odbtAetliGU
	 2NO1WuaA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: joro@8bytes.org
Cc: will@kernel.org,
	robin.murphy@arm.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] The sun50i_iommu_of_xlate() function didn't properly handle the case where of_find_device_by_node() returns NULL. This could lead to a NULL pointer dereference when accessing platform_get_drvdata(iommu_pdev) if the device node couldn't be found.
Date: Tue, 24 Jun 2025 16:35:43 +0800
X-OQ-MSGID: <20250624083543.1232205-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_013615_880632_D407491C 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Add a WARN_ON() check to detect this condition and return -ENODEV when it
occurs. This ensures proper error handling and helps diagnose incorrect
device tree configurations at runtime.

Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/iommu/sun50i-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 76c9620af4bb..0f85850269ae 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -833,6 +833,9 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 				 const struct of_phandle_args *args)
 {
 	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
+	if (WARN_ON(!iommu_pdev))
+		return -ENODEV;
+
 	unsigned id = args->args[0];
 
 	dev_iommu_priv_set(dev, platform_get_drvdata(iommu_pdev));
-- 
2.39.5


