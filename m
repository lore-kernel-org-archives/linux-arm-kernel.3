Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6954CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZhIhrzrQk3cuIdZiSPIRnT5icdPEWXf6gRX+saxJE/4=; b=xQt0bwjaOt8CcRIMDVXQFUpNm1
	5D+eFGI3C8VYh3RRLZbD5XgVWjvgGYkuBGSuR6IncJS8SLERtKbmn6lU7VziZkgAkXcjzrxt8FtPE
	JN7yIhK6AbcdJgDEVWzvkirXbDsM7CLmBMVQrFAOKZqAViYADPgEGP+FWCjBOEfd19Pj8qKLgVVvg
	pz7XSEZKHN66cGjPw/UAMMegvmNk0xUvs+wzoVaELV8K/K4s166lcKkl/NWqqce6pwOFgsBWJT4j2
	FOJIjfWTAjC8p7sLSoxhKHaxKlbAqGS9M21MykhwzeFIZOahgoGEem6YQRiFzrgOP9kjpecMOFNI/
	JLGQ9kPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgPS-00000001hLm-1THq;
	Wed, 06 May 2026 17:51:46 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgPR-00000001hLU-19mO;
	Wed, 06 May 2026 17:51:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] spi: s3c64xx: fix all kernel-doc warnings
Date: Wed,  6 May 2026 10:51:44 -0700
Message-ID: <20260506175144.449364-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add kernel-doc for one struct member and use the correct function name
to eliminate kernel-doc warnings:

Warning: include/linux/platform_data/spi-s3c64xx.h:40 struct member
 'polling' not described in 's3c64xx_spi_info'
Warning: include/linux/platform_data/spi-s3c64xx.h:51 expecting prototype
 for s3c64xx_spi_set_platdata(). Prototype was for
 s3c64xx_spi0_set_platdata() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2: add tag; rebase & resend
v3: add Tudor's Rev-by: tag; rebase; add Mark to recipients

Cc: Mark Brown <broonie@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-spi@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

 include/linux/platform_data/spi-s3c64xx.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20260506.orig/include/linux/platform_data/spi-s3c64xx.h
+++ linux-next-20260506/include/linux/platform_data/spi-s3c64xx.h
@@ -30,6 +30,7 @@ struct s3c64xx_spi_csinfo {
  * @src_clk_nr: Clock source index for the CLK_CFG[SPI_CLKSEL] field.
  * @num_cs: Number of CS this controller emulates.
  * @no_cs: Used when CS line is not connected.
+ * @polling: Using polling mode when %true (no 'dmas' property in devicetree)
  * @cfg_gpio: Configure pins for this SPI controller.
  */
 struct s3c64xx_spi_info {
@@ -41,7 +42,7 @@ struct s3c64xx_spi_info {
 };
 
 /**
- * s3c64xx_spi_set_platdata - SPI Controller configure callback by the board
+ * s3c64xx_spi0_set_platdata - SPI Controller configure callback by the board
  *				initialization code.
  * @src_clk_nr: Clock the SPI controller is to use to generate SPI clocks.
  * @num_cs: Number of elements in the 'cs' array.

