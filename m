Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0467C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=; b=pgLlgVu7Bdf++z2K8GuD/3GMhu
	umQineXOZRkHWhX5vnobn//PQV2asvG3jY5KvRFrg/6ZP7klMAfU7vFttaXSVqHJeEPJlPuFgsvwi
	W/aZa3mtajR04w0x1+DrB2//a+bRnnJg2X23Tqfq07aRf4lO7hk0+QaX1vsUZv1nmXWDKgiZcz3jd
	RGNoi+J7VP34Kno0p4tRHaeopjaYq92DrU0E3FSX2POeElSzdDfvdsIEVjPcH3Uf+0lvaq6xyRYhw
	IfdyYm2eCEQRgGSyQLLNAB1lAb9ZexaetZet6DZkSj74OuxRiuTwBV8qseQPRuMDnOMmOgh7Ms89P
	J9T+VGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOYN-00000002J2Z-0pno;
	Mon, 27 Jan 2025 12:49:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVk-00000002IFm-2PfQ;
	Mon, 27 Jan 2025 12:46:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso28883085e9.3;
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981999; x=1738586799; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=;
        b=jPqCJTt1+0wtTjaISUJHDr6ojd9IbJsoIMeLh5i7oEx18WwDaLDBnKmcn39pe5OoKY
         s17zwltt9PgORSJfBM3WJnVrBG6rjHF5HMzqgcOzlULFmwMCXlFEZcRQoVcw7+hZyBmb
         5xSzddyTJk7WTywkPo0101ZnX6uQjekk+V+i4NexsxSnM67qRKS6hEYhbgoY735Vnt1o
         xnzRXC8pZ4LdHuy2ADPGEB/92505T0X1BwSqkwJHzppqaZx5bg+4U+THZJZMDrE/PKcU
         NGOowoPezE3tksf1Q4PQ3EDsb0V2FWzCS//unLee87GtDOePYlcoI2aeWvCoDZ6qzBJS
         JBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981999; x=1738586799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=;
        b=TjgE8pDzz3gFAtdMT0wynuhb9rd603H7LBKIwnFW1MyTy/1d6NvnS5JCXt0SoUvTk9
         fLkBgnW13cFpAAMvltETKQZCAqrA6M/Ld7aU16i7nymvO9bHk8fnNkn7HPUvUn7u3PKM
         NKMkwFnWOkniQ84umT1Y2bzaHdHanfeLwnJze8+dsYnEk5U7Vk58VT/Z54HFe/pionjp
         /DsXaFKRCGOJw1BTsP9lVWA1NoVw5PiOSoArLEdtAets6cwlS3AmBTEpAXTZqr2T84vV
         xFo0CvJh6ltfB20PnlnYAllZDMUSqZ2j2Y5aWA8nN1oSUvnSPbQrhFJ2HzPPP9EFxe22
         7iiw==
X-Forwarded-Encrypted: i=1; AJvYcCUhikeysPwWg/aIw0CLKec0mq/Iww6wVp6HKOdt06mc31zZvGm4iNTTzlASESfVKrXKjquoZ3xpgk2jURTRqdIr@lists.infradead.org, AJvYcCVAyhDKo/zSyiluKdqmeiqGlw2l2vg9s7blCLxb09I1+KkdB7HUeDCOTGUUxUcv6wcINtpqsX0JhbIDde8tPvo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvXEsEtNtoRZP/gtwwzdx1aV2HsfJ6grZHDSfX52PuunvzvlMe
	rIM2mWfhFemCDIfJcOA12D1dyd5RbMGVg4S8vMMgStfckTtDd+s+
X-Gm-Gg: ASbGncsTj4oeJO7Dzfy1F6+9tbeA3+u8mNELvjqSIwv6i3WseKFCQ9IbSeF3Q2GlEew
	8ye2xj+wWkZX6Igujxuhc+nSd9/nxyJwZtlVwm3wweloUT9IVrPxzWjiLyKk8tq5AlvGRoonWyI
	jaU0Yj1rfwWhNBmzrBVPblnCzJ1JvRuKNF+sWwG5Muk71GYig1PKOX+eaKlZF6CLwH9xFpdhy9J
	BwMVS7mRyR8vC8dDzlCrhe3n+Htz/Gxq+u3K7ee+S7ogCVkHX/6EBnVG+hGX3W52oNHMz+19txT
	4jZZ
X-Google-Smtp-Source: AGHT+IFcpebGZaqOLXYWPaGFtndOOwU8Vjebxht6JbYpi1k2FlAk2skEDPVNNfLGXRNNRoy7L722kw==
X-Received: by 2002:a05:600c:b8a:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-438913c9f66mr357781595e9.8.1737981998728;
        Mon, 27 Jan 2025 04:46:38 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c2dsm129176715e9.13.2025.01.27.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:38 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:56 +0100
Subject: [PATCH RFC 01/14] ahci: brcm: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-1-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=4mWrBHSk0HW6moMZXG5yPVWArdrATyoEJrN0gimIFl0=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AqwZw5/RPua7LmhyMMUY1qD4nk4fuWdEjvn
 fkcBz0A+ICJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKgAKCRDnIYpo1BLC
 tZSMD/9QFx/Dg/L9PZ311iYUySiZ5aaWZQ+jU5ysXXdpxQh+9iGpTrscQRBVfUbxFgoRJOSW2Kz
 /LxP0K7C6laA7kH3NsToFv20OKKvAo8JE/WrsxBNU2jNxzXaaIq/qRjOFJFXOGqFduVyTxASc/D
 rtGK8zEksr6Ulazfl5E0iRx1TPrAR9NlKBvV0KAVSkAlDV+MZQ+S7Ym6ZmXk+6ilwUZeFANJY6V
 gEdR88tKc1CpsaswbsvubsiNYIoES3v4zcEGFWVJ87Zfe9Z9wqmEHrgB6G4DExJA1BkUzMDNKOt
 jCw1z1SJ05MeOeoDOaTWUKNBLjXsa9aqII8RXNQG+DQIlHq8ucSEbgEtYkhspqDfet8IBpPo/Gn
 lsRRuzRsrL/BthLog1m9OUJ7ex7384StiA+Xk1HgskC6pid6pOIUUEXB0irM3UvKWfAmCtvCiW9
 o2eReO7PMqmkdf98ZwYMiP51i6TTly7NcLNSJOvYsQL0RqJaXTx3DMrb76yAQMCgex5b35hVK+7
 wIY8Mvcvf+Qf+TOMoGYpx0AYeDw08fHub0truLO8SjYyrgmQh9QK+uF5pbweufGV/RxBxMjiAAs
 WoIUly+qQrUHuAK8PEwzjqcw1LDHLo4xd+sDE3Y55CJrne0v2nDd0QTopi3kcz7woJeJWjG8b0i
 wvyJKOEETeFoxvQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044640_617194_8650E619 
X-CRM114-Status: GOOD (  14.02  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_brcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf01934e436481c66cb8d329284d599..3d43ed5db6078b3f07440f21aae6edf73d1da7f2 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -362,7 +362,7 @@ static int brcm_ahci_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused brcm_ahci_resume(struct device *dev)
+static int brcm_ahci_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -570,7 +570,7 @@ static void brcm_ahci_shutdown(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to shutdown\n");
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_brcm_pm_ops, brcm_ahci_suspend, brcm_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_brcm_pm_ops, brcm_ahci_suspend, brcm_ahci_resume);
 
 static struct platform_driver brcm_ahci_driver = {
 	.probe = brcm_ahci_probe,
@@ -579,7 +579,7 @@ static struct platform_driver brcm_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_brcm_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_brcm_pm_ops),
 	},
 };
 module_platform_driver(brcm_ahci_driver);

-- 
2.48.0


