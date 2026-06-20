Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E995CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej4UjS6cRx6UNjVFXf0AfbuCsehLDg9rIoULOGIKgXs=; b=wCj8WbRYVvBHix6cd4y8AoA0pF
	0hilOqWlvCLbxGfgIEphi35RSpyH/87WiMp52MJce3QkSRE78aQNVUN8oAKYW9/0UVKcf1aueTrGS
	hniUege/UAmvl9Jl63iMTEBRnGUoK1ILBUwFR6Iw8VKSPKJYiQIL8J0RSRHlmbFwd75bzwRzDpo/G
	P6Jt9aqv1MO1Y89rhgD0Ap/rk6tZnGrEEyhrFrJMmyxN4yN5lyLdALDoNLnjTNphSYoNSzk6y4EW3
	HCeNG+COMMA3qVGY68QGHBhOat5vHb8OEHcg2OrTH2RWFHZ7D2UkVPRuUHxGSGQhqhSEaJJW0Iu/7
	fAat5SOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFZ-00000003GQR-0up4;
	Sat, 20 Jun 2026 08:40:25 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFW-00000003GPR-28ft
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 08:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781944820; bh=ej4UjS6cRx6UNjVFXf0AfbuCsehLDg9rIoULOGIKgXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bkFpPBCYkv66emcnAK98H1eqJX/ahyj8nzvhwDX6TDkp8nssLS5XScWdgmVfHHsGT
	 DYetbLU5S/5E7jSfOvQg6XYBIGHnOMlC2gYSqQF3XcbWvuCZMXAU760vKUoExZe9Ea
	 P62u7EFSDMjK7C0OKDm82BTDeoAUZfCezMVmoDnw=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 9E3A1AF0; Sat, 20 Jun 2026 16:39:35 +0800
X-QQ-mid: xmsmtpt1781944810txpi8snea
Message-ID: <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GEPgrppcuA74EQV5tNi72w4WCuYLJdMHtBzDMEU4f+pQi8TaG5D
	 2OsdYy/9YdrPW88cQe0butmn6IpVfHpOO5TIQEXyh/VVf/eEJ7Bk7WWxqp7AW/eHFeIXh9St7ZcV
	 kCz8gOJPlcx1MogunHLVaW6UggwbnZ0YkUyV/Plozrw4UqKPufLrd6aAXnjy6nlKvbIN8oKelxOM
	 XFFmnlAM/F8r/Tdd4ndizwV0lyjArKADgf/wywAyHwIQKPlG2LhN/+o5s2yqPpLvr86r/4Ykh6Ya
	 BIwiWmmR9KY7VTAikN1L/ZqqdW57t5LOsrGCvu3FYpVPtZkAkU2cBWE8TRuWGtonAGqakyqIgrxi
	 SWS7T/oFmdBp589QCQD0QRsnVBTajFxjLEeLtBVyNobsTPwNP8Pg5bj2R8cm1xgYhNSZuXdoveOP
	 WZV63XdNbargCAX8DTX0xwj6QKghIvzafFfwAptuwsNaawwXyEm8nzoJUR+rHdYF/UPjdYpMmf+i
	 ZATREv5ZW1aoILKqsWjiH7L5HOdP1/Nxq7plSYKbWHmjX3+MWx7vK+ARM3LgWUbfcMTKZj/CJqGY
	 euZI3PrjKTwHWDMnUO3o76zxpLvCCtdAe7FC5DP3QYK4b2hyXqt7EfLlMDcqPe4Rt7iwvnd0wjQe
	 kKvK1D1CVwoESOftNkmoeOfQ/DeartFBGfY3aemy2xD1MiqRSRl0+UjsyeK3bpebdHba+TqrcddU
	 b+2hHkreAOu9I5T0hGqSbdRh0ZM8evKh5okpku+FuCiazMM4LWa/K5OUnpeVnXgsElVYDtqH7Zzh
	 EbpYAE2aBs2mXKVuLgBWjWc5pKYZBX7R47sPnj09bxNjgFB2LWKFV42jwfCpKUkgc/BHK7hwnS5I
	 fLtQTy7LFvSzWvcKDPwgUi/wOSIEm2jpLoOeq4ENWO0XaVg45YJuW6VqcJZeipB1Xu5oDYEGZgNP
	 Wk8GPQbPwP7DDP4ENAUqGfpvLMKAGYk2KMN2u2dLJnVxKq+ju8GCLER7iGlq/cUJtQ9DSmbdsZsK
	 ATvqmrukawrPsMChdPWzIG2chFfKa437T88YBTq9Ll7KNmftrrwYzd5OmVsXw=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Subject: [PATCH 4/4] spi: nxp-fspi: disable runtime PM on probe failures
Date: Sat, 20 Jun 2026 12:39:31 +0400
X-OQ-MSGID: <20260620083931.1120616-5-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260620083931.1120616-1-1298662399@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_014023_114656_7C8F5BEE 
X-CRM114-Status: GOOD (  10.66  )
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

nxp_fspi_probe() enables runtime PM and autosuspend before
several operations that can fail.

Some failure paths returned directly before the devm cleanup
action was installed, leaving runtime PM enabled.

Route those failures through a common runtime PM cleanup path.
Use pm_runtime_resume_and_get() for the initial clock enable.

Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
 drivers/spi/spi-nxp-fspi.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 1e36ae084dd8..d94a2a7b98d4 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -1350,9 +1350,11 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 
 	/* enable clock */
-	ret = pm_runtime_get_sync(f->dev);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to enable clock");
+	ret = pm_runtime_resume_and_get(f->dev);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "Failed to enable clock");
+		goto err_disable_pm;
+	}
 
 	/* Clear potential interrupts */
 	reg = fspi_readl(f, f->iobase + FSPI_INTR);
@@ -1362,18 +1364,24 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	nxp_fspi_default_setup(f);
 
 	ret = pm_runtime_put_sync(dev);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to disable clock");
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "Failed to disable clock");
+		goto err_disable_pm;
+	}
 
 	init_completion(&f->c);
 	ret = devm_request_irq(dev, irq,
 			nxp_fspi_irq_handler, 0, pdev->name, f);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request irq\n");
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to request irq\n");
+		goto err_disable_pm;
+	}
 
 	ret = devm_mutex_init(dev, &f->lock);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to initialize lock\n");
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to initialize lock\n");
+		goto err_disable_pm;
+	}
 
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = NXP_FSPI_MAX_CHIPSELECT;
@@ -1389,6 +1397,11 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 		return ret;
 
 	return devm_spi_register_controller(&pdev->dev, ctlr);
+
+err_disable_pm:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	return ret;
 }
 
 static int nxp_fspi_runtime_suspend(struct device *dev)
-- 
2.34.1


