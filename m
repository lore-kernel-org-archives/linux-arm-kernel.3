Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB89CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aalBlmXxlpfF8ZNaaynm63K6Lji5zIPqViiYBR5+bL0=; b=trbYZX81NwWhEldrGCINhGBm49
	TSa85ZWUyAqRdKoXepvh7O+Cm8uS65V8sXf6g4SomUIouyZwLQOno5m9AmkXcH7OKP5zVbNb5H4kM
	fqcSkmoHxBo2HWQjbMiH2YjVat/xciOfqpJ87qAKqpEOWwMZbEGbl1t6eoq5zrH2LxIWe23tdvGk2
	k47UmSlb01S6jrLplXjr1BsmqkliV70FnwXOg+KvzIx3zQxv4jxDQWXmB3I8hLXjclAEXHhdQy7+X
	0JGDlcB7tXt+XQ2RicKwHOevuiaLXHpqJj6/v8npWpfGVY4OmYx0aY+DJGII9Zhka8DEilAnGItqP
	//Hq8CAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFl-00000003GVv-1qeM;
	Sat, 20 Jun 2026 08:40:37 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFi-00000003GUC-3MmN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 08:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781944812; bh=aalBlmXxlpfF8ZNaaynm63K6Lji5zIPqViiYBR5+bL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gGiyrxXIT+s2IMcVx86IgDAzJsXw0WnX41WI2SeGJgEQoQTb9FLx3FUKo21yrLhfp
	 hWprCg3/ZFKBvvqdhI1lkbGXN5xq1yoM6y+6gJlyAoWa9Silk7NJmHpcpcx421Xwzd
	 ZAOgoU4lCBxrR3OFfFOYW/wWGZqc6+VI6s1G0M8A=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 9E3A1AF0; Sat, 20 Jun 2026 16:39:35 +0800
X-QQ-mid: xmsmtpt1781944804tazv0x18o
Message-ID: <tencent_427FA55E3D59112524886E9C931CA0F92F06@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+vq0/mw4YvO55qP+MzgFZgfbzkqsN9MOWxgOmn/DB5XCGijUNZO
	 Ax3Ia3/x5dorb9rrfPO8zlAGUaDC/m/JncnkCJ5oSMhM6asF3tg18SgPStu4aB2BQu5+XqJah84K
	 n/bEhLeHES3z91wo6nnSUelbQgkLYoesINif34SBjzNw9k5zcxG9xiZJVIyuCTYVNd1rSk2Tw0QR
	 AZVCtOity74HoX8/R80H9y0o1t1HuAuT4RDd7lmuulU7IKoAWECloSBm8nN6NP/QGjE0HKVkYJEX
	 iewdeSxBqTF2WyhyI56VHi5aevCuXZ1du94DfdFLvXQGEpBzApDj9Dz7hkPHiSNsehu1VI+0Lmco
	 SMnz0M9Pp0XnrMHWpiAZgzKH2/80RmYRh76GKwoTLuGIyXyasCCDVm5X3nl7Pyt7h5xbBNxCoxd2
	 B++pvhLiyZyrPqmSymNWbpmnx0/V+CgJWFY8Cv2wKI75SBQrUcMur56AYV/KTBC/v/yxUlrpVgPJ
	 IPW/VybvwFzAx+RX9aQSEHGecv+VxCNChBlAk8t+3Z05uMbNiA2GPKOTwC8TsmmNsnhWtl3kTM8i
	 2wwlMoqSzDdeuj25vVbfFH7axzPXY+vVJLlkc5uxlfJ3U8OGBDwmQM0cThpeK0ZgdAp1Vo4IqwY8
	 ftFxh3HxIJ12KS4MFHWZFn9pf7dZs/HVjxKvEjpcBv5u9docFmgr/vCFCEYxKbQn22ZXgpOu0ydt
	 zBIcAMjY6/FN5ZcDxILLFLw4qeELo/tbVnWFC8KWZbIWcCanuT97lFENntUHwxTvZlUh8mBM/ujT
	 XiZnygoFllJS4ozZl2MASlstZk0V1ONGmYkTgJ/pTkZyFsg9QvTE5ZGL7CzoObstQ2qHm56nYoHm
	 zBocyTvuHoHeiGQ9Zeo6OtH31EsXD9IN1fuf9A+slFvF2N45WHc5UQN6o5z7gb1h3k2eC4MYYmsL
	 nNvY8ga3HIkhxTbQXxgTxRXrcXiJhaqEkIfa7ylsFGKi08CyMrv52OJv/jzCVFLx53OCaR/OS+Jv
	 nrVfvP8cVbC+Up1TxQk2pILggO408xhlizKlDCj1oxmruSJZvF96dbJls0ZXLzG71OCU4ICg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Jiawen Liu <1298662399@qq.com>
To: broonie@kernel.org
Cc: cl634@andestech.com,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	anand.gore@broadcom.com,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	olteanv@gmail.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	yogeshgaur.83@gmail.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Jiawen Liu <1298662399@qq.com>
Subject: [PATCH 3/4] spi: fsl-dspi: clean up after failed suspend and resume
Date: Sat, 20 Jun 2026 12:39:30 +0400
X-OQ-MSGID: <20260620083931.1120616-4-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260620083931.1120616-1-1298662399@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_014035_162756_49D102C0 
X-CRM114-Status: GOOD (  13.20  )
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

dspi_suspend() disabled the IRQ before spi_controller_suspend(),
but ignored a suspend failure and kept tearing the device down.
Restore the IRQ and return the error if suspend fails.

dspi_resume() also left the clock prepared if controller resume or
hardware init failed. Route those failures through clock cleanup.

Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
 drivers/spi/spi-fsl-dspi.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 019d05cdefe6..c2d283876ef8 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1464,10 +1464,18 @@ static int dspi_init(struct fsl_dspi *dspi)
 static int dspi_suspend(struct device *dev)
 {
 	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+	int ret;
 
 	if (dspi->irq)
 		disable_irq(dspi->irq);
-	spi_controller_suspend(dspi->ctlr);
+
+	ret = spi_controller_suspend(dspi->ctlr);
+	if (ret) {
+		if (dspi->irq)
+			enable_irq(dspi->irq);
+		return ret;
+	}
+
 	clk_disable_unprepare(dspi->clk);
 
 	pinctrl_pm_select_sleep_state(dev);
@@ -1485,12 +1493,15 @@ static int dspi_resume(struct device *dev)
 	ret = clk_prepare_enable(dspi->clk);
 	if (ret)
 		return ret;
-	spi_controller_resume(dspi->ctlr);
+
+	ret = spi_controller_resume(dspi->ctlr);
+	if (ret)
+		goto disable_clk;
 
 	ret = dspi_init(dspi);
 	if (ret) {
 		dev_err(dev, "failed to initialize dspi during resume\n");
-		return ret;
+		goto disable_clk;
 	}
 
 	dspi_set_mtf(dspi);
@@ -1499,6 +1510,10 @@ static int dspi_resume(struct device *dev)
 		enable_irq(dspi->irq);
 
 	return 0;
+
+disable_clk:
+	clk_disable_unprepare(dspi->clk);
+	return ret;
 }
 #endif /* CONFIG_PM_SLEEP */
 
-- 
2.34.1


