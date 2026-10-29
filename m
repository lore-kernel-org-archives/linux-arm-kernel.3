Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE388606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxJQx03d;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfFTEmv9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=; b=MxJQx03dcWxUwi
	XTUv0xc+8Sqed1n5cRfIEEyvDeOAGjje5P0dNYwsStbydWEJiGQS44a60SCr/sGoQrAmollD7UGOQ
	J4XdoSa2I/blUCbs8mo77F/JG7gcLyYzgWpX65u0x1fw82GHnDy2B3eR9WEJOIiUA8U/QrX31FPCb
	VqJB6bM5SP1ycgi4ArCECWEp3Jr3X2Xowe7nBFdELSEISLhlliSm0citjn7hte2A9WvObCmNFxCHj
	3qRmBeVxgVhe/J7mSpvhTkbbwMBBfklQVCYjWbbD/ClMKjREgLdCyIcBeDZfmryFvWZHZtlzI7M7U
	FPVC8A+c9YghJ+7aq1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN2E-00000008vLa-1138;
	Thu, 29 Oct 2026 10:07:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN23-00000008vDY-1ibo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:06:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so21107835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268409; x=1793873209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
        b=rfFTEmv9giHcWtMG9V+ER+TW6E4YM2X6hkRmoTSQaNTUPyTF4qkH/3Q10pKOS29TbM
         erADT4MrClqhlPVNBe2vNMQUu3d3Q9FHFpJWtZoZbDlAqExYW1nhthXP56bodFtRZ1nQ
         rPqWK+ZviLnRVaVFf7QBcXzlvnVPxXnasbFWkdslkLfIVHMsguSnIENvb/4VS98YDQJ8
         1uebqik0D9Vtdxl+SXQie1m4bmFxFThow8cCHV0FTFUY+r6ybQ48MUhZK/chS0XNXcXE
         xEiiSZXBnqBXJAOloGrX3epeqWsratG8FJBh2D4UJ4dkGdyfISWR+wIXPGMgqJW0nElr
         tqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268409; x=1793873209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
        b=JZSTvU+iCT8iRW5zsd/FDmok7g0ahBilDHH7+W1iF6zHgqpy9PYpJEAtQlO3igZnZ8
         2ziLcR/oaQvrAXH4wmU4bZygfNtD1oUI9PfKAOKImT4KTVxL1I8rAW/HZUFlfULXjw2m
         sM2KxnDASMRQLixwEKh7F5lxjFgyeQEUTQzIfLjD6Ovl7EqNQqKYyon7i6t5VVynWt0c
         i/AnzaHNOMAnceUcmWQZXFxmiTxH0O1HSGffxsa5a+OXdKyJjAiqcmSQ5xvAcy2sRR81
         Ze9NOTwt3CV1B0agsWz7NVhTI6ICnFGwenaGeRIFg9ROAQBKSlzQAEnZgPkv+3Er0ZVj
         CP2Q==
X-Gm-Message-State: AFq9FYIwJq5EdvFR+ci2IFM9qAAV1gdj5heOkOdivT3rAN6c7L0LxvDI
	alQKQcrvK+SbhgjcUdfL1SUPWbwFpuO3KleI/H9vNd5V8g/z5tcDoKPw
X-Gm-Gg: AYBFou2AdPNJ9i6FUDCuCJ2kuRzFwOxqhnVKryvJw5cWgqHwIp5pbgRqHfO2PCoOBSN
	MlzutopJbFqz6rgEshTN4W4IuaLEBTh4iChNLhEPQULM+Xbpoc3nBVqt7WI2CmQe+KGHxKgeUCT
	83XnStCB6kkKTN+OAE0TZXzoYGRA/YCdgFjzGzMvBzxevMoJXVH9l8ICVFmx0fD3lCUUd08vpWG
	JzD1fMxxXVgwL2y/aNDv0u5KtbwRIDv9RRPDQtC0Y/JNJxyMQ8+EuSfaL1CkCx0y6fCtoFG1zNR
	9UIt07GmAadti5jMp8mOW1HhAbqFIttDMVn+LU/meqvFhNUydxBXPF3wC8kve7E6shssXONfxIo
	UoL9e22mKcnc9laXE3fFMzi9g5kY7lziIi+nTS8bd6PpyeZdMgon/DxoycjANrCaybV1OuPLCnk
	mx7fkZBcHhpToj1T7oYYtT4+TwU6VS98Jt7IjR9U6gw2uotOBGGfcXWlFKXGYXRHZzR+3edlXJS
	BTBswu6xakXhwnlLbYi8OSCC90aSg9HnZJw/HYCsW+rkYKL7mT2ZEtXU4MWoGU6eGx7BH8w2on0
	HCcABKUYwhmQWpOYZ1nHRiWOGw+g+5iJj0jcGi7hgACtJmSFnr9GueAWvbyDaq5cTzzUCUpdXd+
	UB622yM3s
X-Received: by 2002:a05:600c:5246:b0:4a2:14af:1ead with SMTP id 5b1f17b1804b1-4a9676d1514mr113081845e9.25.1793268408743;
        Thu, 29 Oct 2026 03:06:48 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:48 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:23 +0100
Subject: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt
 during system suspend
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=3230;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=3qBapWKlE9gnNc1OkRIJoQ7rj2z5kJO1plv4vMvRaIE=;
 b=Gax9ATA7YcEykEZRoU8HuTbsJxxf2tMvfTF8fzq4d1vXJVAPuOzgirPI7o+V26V3EhSkl5nP5
 acS+c8VRtbJBrDNorA6RDsnaahLsnJ730MdZY7glDerfZxdequzJfBG
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_030651_485017_2EB3DFEE 
X-CRM114-Status: GOOD (  22.52  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The driver marks the device as wakeup capable, but never enables the
power key interrupt as a wakeup interrupt. As a consequence, the PMIC
interrupt line is masked during system suspend and the power key cannot
wake up the system, e.g. from suspend-to-ram on RK3588 with an RK806.

Enable the interrupt as wakeup interrupt in the suspend callback if the
device may wake up the system, and disable it again on resume.

This is done in the regular suspend phase on purpose, rather than with
dev_pm_set_wake_irq(), which arms the wakeup in the noirq phase: there,
enabling it updates the PMIC's interrupt registers through regmap-irq,
which fails when the PMIC is connected via SPI:

  spi_master spi2: Failed to power device: -13
  rk8xx-spi spi2.0: Failed to sync masks in 7a

Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
---
 drivers/input/misc/rk805-pwrkey.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
index 76873aa005b41..9b64ec7463c62 100644
--- a/drivers/input/misc/rk805-pwrkey.c
+++ b/drivers/input/misc/rk805-pwrkey.c
@@ -15,6 +15,10 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+struct rk805_pwrkey {
+	int irq;
+};
+
 static irqreturn_t pwrkey_fall_irq(int irq, void *_pwr)
 {
 	struct input_dev *pwr = _pwr;
@@ -37,10 +41,15 @@ static irqreturn_t pwrkey_rise_irq(int irq, void *_pwr)
 
 static int rk805_pwrkey_probe(struct platform_device *pdev)
 {
+	struct rk805_pwrkey *priv;
 	struct input_dev *pwr;
 	int fall_irq, rise_irq;
 	int err;
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	pwr = devm_input_allocate_device(&pdev->dev);
 	if (!pwr) {
 		dev_err(&pdev->dev, "Can't allocate power button\n");
@@ -84,16 +93,47 @@ static int rk805_pwrkey_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, pwr);
+	priv->irq = fall_irq;
+	platform_set_drvdata(pdev, priv);
 	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
 
+/*
+ * Arm the wakeup in the regular suspend phase rather than with
+ * dev_pm_set_wake_irq(), which does it in the noirq phase: enabling the
+ * wakeup updates the PMIC's interrupt registers, which is no longer
+ * possible once the bus to the PMIC (e.g. SPI on RK806) is suspended.
+ */
+static int rk805_pwrkey_suspend(struct device *dev)
+{
+	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(priv->irq);
+
+	return 0;
+}
+
+static int rk805_pwrkey_resume(struct device *dev)
+{
+	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(priv->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rk805_pwrkey_pm_ops, rk805_pwrkey_suspend,
+				rk805_pwrkey_resume);
+
 static struct platform_driver rk805_pwrkey_driver = {
 	.probe	= rk805_pwrkey_probe,
 	.driver	= {
 		.name = "rk805-pwrkey",
+		.pm = pm_sleep_ptr(&rk805_pwrkey_pm_ops),
 	},
 };
 module_platform_driver(rk805_pwrkey_driver);

-- 
2.47.3


