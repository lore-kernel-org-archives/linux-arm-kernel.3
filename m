Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 06:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TtVrH78x;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=DXurnG+O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=cMOyDvJ+4IZMD7M7ive4vsZM0ebqLEDD0cr3Jg1jYiA=; b=TtVrH78x8C9N0f/6bM3CYOFwnN
	x6uhIufjWRC+xJ2TPijeRcg17wZkReG1+huSSN7RGPPKZIWXDFaK9vUkwvrBypF59SDcG8ha9dLrg
	y9hLp/NZzrLpT1J9rAGmlpFS8keYLIbjZJ945txv9ipTHePIQoNaFe/uVCimPocJe8R6QnX+yYIDM
	Vq4EuKaKk7PsobFj2oFZNKRilgP6V5jZWItVR5bLWSTRhOiOFfBk1lfRuEksD8kdqzikNUdtiqc4u
	h8vCk6YW+HHmHQnbGdE1t27rbpuhCswKuvg1bT2h3kmp4f3if53kyfRTgqTSw5oYM/uV9GFTIHhyq
	NsebYpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Se-00000008vr5-3naD;
	Tue, 20 Oct 2026 06:36:36 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3SZ-00000008vpx-3XaU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:36:35 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020063620epoutp0124f7a110151d9cb4366089d7ef063363~gKWh-HjSm1215612156epoutp01e
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:36:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020063620epoutp0124f7a110151d9cb4366089d7ef063363~gKWh-HjSm1215612156epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478180;
	bh=cMOyDvJ+4IZMD7M7ive4vsZM0ebqLEDD0cr3Jg1jYiA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DXurnG+OrImuFVOWre/IHvrEtrR52MixdRlAxE2Mybikle6I4OhJ9ttoIkS0h+vP9
	 USuIKfMQIJoAvLz4KHwp6ditcFMCwWfD0XgwNgP2/3QoDjwebIggA3uQqtFobZn+pf
	 WeBDmINrF3DqXaqMNUSkKI5nSxYDh/F2j3GdQGek=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261020063619epcas5p3cbe87da155138f7d23f130a048e7700a~gKWhUrZDm0682806828epcas5p3G;
	Tue, 20 Oct 2026 06:36:19 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j82kB4tdfz6B9mB; Tue, 20 Oct
	2026 06:36:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261020063617epcas5p4ba00854fcd38bf211c573629ee062621~gKWfYcTjq3015130151epcas5p4j;
	Tue, 20 Oct 2026 06:36:17 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063614epsmtip2fdb85f2c138d315a3425597013416486~gKWcIzNpH1615316153epsmtip2_;
	Tue, 20 Oct 2026 06:36:14 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
	krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	pritam.sutar@samsung.com, andre.draszik@linaro.org, kernel@lvkasz.us,
	pengpeng@iscas.ac.cn, kishon@kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com,
	Selvarasu Ganesan <selvarasu.g@samsung.com>, stable@vger.kernel.org
Subject: [PATCH v3] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
Date: Tue, 20 Oct 2026 12:05:59 +0530
Message-Id: <20261020063559.3530901-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020063617epcas5p4ba00854fcd38bf211c573629ee062621
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063617epcas5p4ba00854fcd38bf211c573629ee062621
References: <CGME20261020063617epcas5p4ba00854fcd38bf211c573629ee062621@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_233633_351193_98D580BA 
X-CRM114-Status: GOOD (  22.83  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
creating both UTMI and PIPE3 PHY instances regardless of the SoC
capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
and ExynosAutoV920) provide phy_cfg arrays containing only a single
element.

On these SoCs, when the loop reaches index 1, the driver reads past the
end of the rodata array, populating the second PHY instance with garbage
data. Since the configuration structure contains critical function
pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.

Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
store the actual size of the phy_cfg array for each SoC. Update the
probe loop and the xlate function to bound their access against this
value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.

Fixes: 59025887fb08 ("phy: Add new Exynos5 USB 3.0 PHY driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes in v3:
- Added Fixes and Stable tag
- Link to v2:
  https://lore.kernel.org/all/20260918103147.2628614-1-selvarasu.g@samsung.com/

Changes in v2:
- Updated 'Assisted-by' tag to follow the proper kernel documentation
  format.
- Link to v1:
  https://lore.kernel.org/all/20260831070309.158069-1-selvarasu.g@samsung.com/
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..f10cf7b6e0aa 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
 
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
+	int n_phy_cfg;
 	const struct exynos5_usbdrd_phy_tuning **phy_tunes;
 	const struct phy_ops *phy_ops;
 	const char * const *clk_names;
@@ -1173,7 +1174,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
 {
 	struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
+	if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
 		return ERR_PTR(-ENODEV);
 
 	return phy_drd->phys[args->args[0]].phy;
@@ -2021,6 +2022,7 @@ static const char * const exynos5_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 	.phy_cfg		= phy_cfg_exynos2200,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos2200),
 	.phy_ops		= &exynos2200_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS2200_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2034,6 +2036,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
@@ -2047,6 +2050,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2059,6 +2063,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
@@ -2072,6 +2077,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2084,6 +2090,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos7870,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos7870),
 	.phy_tunes		= exynos7870_tunes,
 	.phy_ops		= &exynos7870_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
@@ -2097,6 +2104,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2125,6 +2133,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.phy_tunes		= exynos990_tunes,
 	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
@@ -2661,6 +2670,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
 	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usb31drd_combo_ssphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB31,
 	.clk_names		= exynos5_clk_names,
@@ -2691,6 +2701,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
 	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_combo_hsphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2719,6 +2730,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2895,6 +2907,7 @@ static const char * const gs101_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
 	.phy_cfg			= phy_cfg_gs101,
+	.n_phy_cfg			= ARRAY_SIZE(phy_cfg_gs101),
 	.phy_tunes			= gs101_tunes,
 	.phy_ops			= &gs101_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy		= GS101_PHY_CTRL_USB20,
@@ -3052,7 +3065,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
-	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
+	for (i = 0; i < drv_data->n_phy_cfg; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
 		if (IS_ERR(phy))
-- 
2.17.1


