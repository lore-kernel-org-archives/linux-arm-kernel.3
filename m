Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A50E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7TZamC5jqbPwUAUS+MKA70f2+K98eLzYXWD6fdZQDpA=; b=XWwECJeHWOt46L
	/sDUHt0erAwvPdhhInRu6E6xs52xp6XstieAyd0pPtfIzJSPfP4bVkff1oKrVntpZkJKD13GjTNJ+
	CqVRXgA3+6FqXh0pkU5RbgKeaXIkyorAQQ7kcIs7IZvmUYIde8RXJmeJFctLcWEe2DiFtE6303wNz
	QECW+LUolhaGEYusMFyUnHcV3ksVpCdD1vSMXqcel5vvmg87HA0qGuPzj5oa2kPReC6SnfNZN1Q95
	+LGxXAQZOWelEr18MGFSx+Qr8c5B5PQK5Fb2qkODmImGUeSO8pZg8e1PTyNsKqn3aYz4enH05uNWa
	c7Oh2s0xAhln/HL7HrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpB7-0000000BQDG-1FaZ;
	Thu, 09 Jan 2025 09:50:13 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVp9p-0000000BPsy-3QFT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:48:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FD2C14857F3;
	Thu,  9 Jan 2025 10:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1736416129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7TZamC5jqbPwUAUS+MKA70f2+K98eLzYXWD6fdZQDpA=;
	b=J+deoTkV8b27+mFiKj2IYxUxqcpiwT6YubqHNlIlvAVGGUMTMvmHf0PTCkYPDtHVYPCo8c
	F7nbkzJ3WXRw7/DmDgCb/Xk4rC3Clx6lgSHit+5s3sEQuj9WnqqfJXT1hETHQxqxYknGgx
	vvPly6oYrSqShL0ICqnTiF0+agnTtSGIEcKE3Ot/Tsrhgd/rDb1e/jmLLcAiWsKm4uDadA
	Z//QYc9mWFNHCgx0eg+2htU4FVYnJr5G/N5YlxozHrOW4XOzKbdMC/yHl16IrBQbh75rE/
	5wOeSbMNfE0r8VEfwggwGgjywcQ2fk57Nwo4Xc+XGq9g7D1ng3sADWvfv3sZmw==
From: Alexander Dahl <ada@thorsis.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH] spi: atmel-quadspi: Update to current device naming terminology
Date: Thu,  9 Jan 2025 10:48:43 +0100
Message-Id: <20250109094843.36014-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_014854_012209_941DA4D8 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, open list <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, "moderated list:ARM/Microchip AT91 SoC support" <linux-arm-kernel@lists.infradead.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

For v6.9 the spi subsystem changed the terminology to host and target
devices, see commit 99769a52464d ("spi: Update the "master/slave"
terminology in documentation") for reference.  Support for SAMA7G5 was
forward ported recently from an old vendor branch before that
terminology change, so naming for the new struct member is adapted to
follow the current scheme.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 drivers/spi/atmel-quadspi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 890def915286..f5ca7e34e058 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -280,7 +280,7 @@ struct atmel_qspi {
 	u32			irq_mask;
 	u32			mr;
 	u32			scr;
-	u32			slave_max_speed_hz;
+	u32			target_max_speed_hz;
 	struct completion	cmd_completion;
 	struct completion	dma_completion;
 	dma_addr_t		mmap_phys_base;
@@ -1057,7 +1057,7 @@ static int atmel_qspi_set_pad_calibration(struct atmel_qspi *aq)
 
 	/* Refresh analogic blocks every 1 ms.*/
 	atmel_qspi_write(FIELD_PREP(QSPI_REFRESH_DELAY_COUNTER,
-				    aq->slave_max_speed_hz / 1000),
+				    aq->target_max_speed_hz / 1000),
 			 aq, QSPI_REFRESH);
 
 	return ret;
@@ -1080,12 +1080,12 @@ static int atmel_qspi_set_gclk(struct atmel_qspi *aq)
 			return ret;
 	}
 
-	if (aq->slave_max_speed_hz > QSPI_DLLCFG_THRESHOLD_FREQ)
+	if (aq->target_max_speed_hz > QSPI_DLLCFG_THRESHOLD_FREQ)
 		atmel_qspi_write(QSPI_DLLCFG_RANGE, aq, QSPI_DLLCFG);
 	else
 		atmel_qspi_write(0, aq, QSPI_DLLCFG);
 
-	ret = clk_set_rate(aq->gclk, aq->slave_max_speed_hz);
+	ret = clk_set_rate(aq->gclk, aq->target_max_speed_hz);
 	if (ret) {
 		dev_err(&aq->pdev->dev, "Failed to set generic clock rate.\n");
 		return ret;
@@ -1149,8 +1149,8 @@ static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 {
 	struct atmel_qspi *aq = spi_controller_get_devdata(spi->controller);
 
-	/* The controller can communicate with a single slave. */
-	aq->slave_max_speed_hz = spi->max_speed_hz;
+	/* The controller can communicate with a single peripheral device (target). */
+	aq->target_max_speed_hz = spi->max_speed_hz;
 
 	return atmel_qspi_sama7g5_init(aq);
 }
-- 
2.39.5


