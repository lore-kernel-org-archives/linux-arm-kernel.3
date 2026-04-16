Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B630F8E489
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYzUQK3HvwVrA9+IJXuQqcU5jzSAy6sh4Hl6HOc0JvY=; b=RL3WDmESrocMGndOnf2i9EH4e5
	Qk9jjr9SCrWs//7ZgWeF8250K5BDA+bHQ5nYKOngBUWyOpB73/2yIeLoe5RMi0h9ohu3ynYl9nO7w
	AG0I5VZM/O9BPez39Eco+5SlLcsJMQnVEPULliWwd2OYM6lRyiW1dhNxwHx4cveszXckDTsZ7+rw2
	2I3VjqHzS/J5NnNnWiDcXpDjmcSghhnn9RaPvywUyG3mQVfZ2aB1wVUvsdCJYrWD+y9b4gVagfmn4
	WKSN2NcpISQt/GES+n76ozPKLNmTzmkG/d1am558vt9LHpl+VMc+U2kx0mJ4GISs0OC3gUI8ox+nJ
	6dmh99jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVON-000000039Jx-1Jll;
	Thu, 16 Apr 2026 22:40:59 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVOL-000000039Je-11nU;
	Thu, 16 Apr 2026 22:40:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] spi: s3c64xx: fix all kernel-doc warnings
Date: Thu, 16 Apr 2026 15:40:56 -0700
Message-ID: <20260416224056.985233-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
---
v2: add tag; rebase & resend

Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-spi@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

 include/linux/platform_data/spi-s3c64xx.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20260415.orig/include/linux/platform_data/spi-s3c64xx.h
+++ linux-next-20260415/include/linux/platform_data/spi-s3c64xx.h
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

