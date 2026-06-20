Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ED2CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D03O6ATATGrr3scsFYQ1Lrg2abyiiRBzhuWJ6hFuinM=; b=lyohguF9s0R5zr7vnzWqK5yo1c
	e90XVKDBsBMyGzeof6nI00LRMvuSliIgTfvFbSCLh06uvplRw5b1+S9A4VQhVwzGQTYhUiDC3zcKR
	EraeIoJeTtbtJKRCNdf0TZKnhLO1V2NLjSasGdjDsw8BY2lB7jFSNYjGjDd3IdPl/f5NW8EIbua2u
	aY+IKCwc8b33bXUK/Hz49e63hKg670CZ2K/eiDImTI1a9Qurzult2sVidekWyRfHc0V89TpyFaOvs
	VzA7IjDBaqdM+YlHuWPgfaTCEqHi/Msup0CaZOUN2dF/LRCrppfJ5O4WRHwFTRJw8BKk4yI+pyFGl
	/rNvfXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFE-00000003GKo-3ok1;
	Sat, 20 Jun 2026 08:40:04 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFA-00000003GJa-3asq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 08:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781944798; bh=D03O6ATATGrr3scsFYQ1Lrg2abyiiRBzhuWJ6hFuinM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=z5rJ1FuVOWi3rG8bDXvmKrMMmNqeUA4FPKXQvRwitWoYfKi+lGIA43Hwf4nnxLNDs
	 jVAamLYS6C9cxOJOf+Tsus1LuIfqPXgROzhbaRxOHQ3Dhj5lD//ChU3d7bKKAPmKRn
	 g7k1Suihzx3f3l2Paig7C3E2NZFoVZGUfUBglKYg=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 9E3A1AF0; Sat, 20 Jun 2026 16:39:35 +0800
X-QQ-mid: xmsmtpt1781944785tosn3rekl
Message-ID: <tencent_306FA547FD68D10EE4B2AE9C132060F12F06@qq.com>
X-QQ-XMAILINFO: NXDkzr13SnKZvhEbCsrtLcb2CGzyO42zywHjolfeRYCQG1N5xSOFYyKmLxXViE
	 v6GA40KEV5EIZOQiqirml0yl9V7jJok19BPNpZhsHKzUWbZtTbFe1UtFl9G1clbOJDnN+Ee1797O
	 LF4m5pjt1em/uP9PGcOiZ76YbLJfKHZLC91vIdD2pPJlNiyl+5Munih3GruclPJGAlvPldNivcE7
	 9HbjLL6D2n0sCaMgulo9JvbTdHYsTcs9uxx5ia4OHFffwlp4qOLXY4ZFrQ0eQjmviXkyouEpCF++
	 vEPtqh0H9ABlksa3SKUkCS58N5tGqeLOObJFM5cp+r/S3fKhs5m63aofa7maYmv+8V7TL0L8TO3P
	 EfU53JWDNacJqT7ib73P7zoDyig9p2/XE3ssvYYYz3uBE/FV3qDyFl2MxpOIOMBiq4I74ZkGnD4Q
	 vd2J99di6wseSiNiYdlNLPQlC8FICltWRycpeThqk6/me6dXZOho/FU2JCxt9shySpkoF+G3K8Kc
	 xwRTU6KVm98BJX6iXleassTfDM+B+rLpqIRql3d7Z3geJp7AMvB8kj72+44B4GrrA1ABAxOOuLSa
	 HVGbgLXM1xbwm/TU8eeauCvOdc+17jC3TwwZ2/N3FB2hB7ZAQXqKt3Jp48t7ESuWGmpeoqGBIYR2
	 VC9+KbKhlFQZ6sSJFjWZeCGxaCQmSyulL9DztchGIZM+cX+YYsGdcuUpHXX5I5xq5P+Bt6/+4cfM
	 GainmLbceOasnX9Zn9Zzy6x0AnGaAyZsrvOYb8f8ql5f2SeKOGvCKK9m5p4i4Km5kA55MKTAT8hn
	 x4hrVMsZgvPvRimOk6IcTenoh2rnSPKnYypPgik+VhEvjDYqqMIYtbLWQx9rtVizhgmxgMBeufpb
	 Gaz2IUd3HRkZTIkmnK0P98rcR3vIaB4K/Khbjay9Wx5cd9m7lYdCoqca//qn/cXe+/9wywtflYg9
	 CAmmX/cy/Gv/+PWuvogn+vKhlzXAmhXI14Goe8alWwJu6u/lvY0O7eu/lnl9XrsyTjC86Up5bL6O
	 w8u0j5L7Vhk6N0pfEmvFm12HHDkQcEu2e0Rltu1mzpJWaCgjTQw4iTEC2Lz9YgFv1sFzXzvd+cNR
	 hk4DnKvXW9HKtUjYvJk63b6Lc5FXSqhUB5xE1VgALYE1hGi4O/ThEfeHqH11O5vroMOT1f91HQ8k
	 lamQXI4TBaCOfKGw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Subject: [PATCH 1/4] spi: atcspi200: return error from failed controller suspend
Date: Sat, 20 Jun 2026 12:39:28 +0400
X-OQ-MSGID: <20260620083931.1120616-2-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260620083931.1120616-1-1298662399@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_014001_222107_AC86FB76 
X-CRM114-Status: GOOD (  10.72  )
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

spi_controller_suspend() can fail when the SPI core cannot stop the
controller. atcspi_suspend() ignored that error and disabled the
controller clock anyway.

Return the error before disabling the clock.

Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
 drivers/spi/spi-atcspi200.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
index 6d4b6aeb3f5b..e0fd101a62bc 100644
--- a/drivers/spi/spi-atcspi200.c
+++ b/drivers/spi/spi-atcspi200.c
@@ -599,8 +599,11 @@ static int atcspi_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct atcspi_dev *spi = spi_controller_get_devdata(host);
+	int ret;
 
-	spi_controller_suspend(host);
+	ret = spi_controller_suspend(host);
+	if (ret)
+		return ret;
 
 	clk_disable_unprepare(spi->clk);
 
-- 
2.34.1


