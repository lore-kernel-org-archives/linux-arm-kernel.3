Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2179C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyTcZ2hwVqzXcvZadTxLwsKyE/CzZeUWttlSS9sOM8o=; b=VUra2dFBIoEGyVGaDcRfgYXZ8W
	Ka5APnxSjiMAkorhHMMORM3pplq7JS5aLy5WUsYp1GZWVi6uNfdET/p3k1WwL3NNic3EWBy5abeQG
	EA8jkt5CP+31p2GpGqgJR8uzZeHGItDG1ucWK9ircMPTtT9ZJXRekSVu1B0rSfKvAO14Vb9CkbJN+
	yPV5fmeGMxto28SS3Mts+xIS3z23aGvGAtcH8h2Q7F8VTPh5Cn1d8ZlGVoReqMv9OlC5/bqjFJRiC
	bSX1lTG2ZTvW0F6UmnS+Er/frFk+cn+bIdjuQ5Q7fsk1SxzT2vB7x81IVzzzNRDaq/4p4Ett23UcH
	2oVWgtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOle-00000002KjX-1KtJ;
	Mon, 27 Jan 2025 13:03:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVt-00000002IL3-1oBh;
	Mon, 27 Jan 2025 12:46:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso30684235e9.1;
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982008; x=1738586808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyTcZ2hwVqzXcvZadTxLwsKyE/CzZeUWttlSS9sOM8o=;
        b=O+QCtk9ZIs/re6mTlhtElwQtxHDEawAj+o+WYyvPHQFBbAnRSIzzQ2Hu+4e4AfY1m2
         HaPgffO1sZJHfUv0IosLF+mZ61kC3qNhLTa2f4izM/N3o0PAmTptzWZsXiRPF3GFKsQ6
         WbYmvHdoHOY+FrgRuz3dSVtY2tgLzXniHLH50kVYFKT4JxNpnVmMieYFPkJRJGfUGEcY
         iMTFummwV5J/ehA3iZvPHktJpCaWOT2wdFxus6kRsMgfele4MpmgTmlj/+PvxtfEm2uJ
         JUlW+k8j9V4vPrkO95n1Pkb5RyLppD1grz5rUu6BVicugMGCEud3oyZpcL7arT84yIm1
         Uezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982008; x=1738586808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyTcZ2hwVqzXcvZadTxLwsKyE/CzZeUWttlSS9sOM8o=;
        b=LBFzYWIwxTTHAxUEYvx1Y5ZEU2p2yEd7NWtgpmU5o+gcDosZSi5PKxIBDzKjWotbO8
         k/Q67NuDehJe4hMaXOuK95No52LQoobLsjhqYzHruyXJSGoDvTHbr9xuGhwGPiaw1mk1
         ZVTxp4a6IyKOhIMhiXRu6d2UdOPBSJtY7Fidvrryno+URXbzP5XO90ADPxEDCkPYvIzz
         MFSHcmyYJ9/2sEVthvbFHXlhahC7OGrXDMbegMvluH+LPYS4z4KzTT23qSrGs4wxcVcF
         HKfqyzWDDuPa9WizKfleUNDhjpXRCJ3XVLDGNf/JHOi9aHaamvmK3lmeqLN9EmItwzoP
         W41Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp06r+Me5r/gAPhL+fTa4wsBO+zVHMO8tSF8h7p8Osgqw8qCWCBaz+Tvdszy2wkT7wgnVoR5MBHwQZ/TMYdyuE@lists.infradead.org, AJvYcCXsJrgqTMmgZcqFPAIXUslAzgVjbYaPCqBbAnGa5AlE2AR7AC6OvFBbA/iveSCMWYoPDhQtQnOyg0gI8Fp059Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwU4RZ8YPGi7c9O27JFTwpgupsYbn3hllKPS1P/SAwg7AtpG946
	QuSc/UtAGCM9Sjci6QBjpLNvhCNgwsEjGKR4vfFOUll3GUXMn+tk
X-Gm-Gg: ASbGncv4kYGtY8u7Q9DDILV/EmgGHxEp/6rZlT6hzO5Bxl1a21weCWMiUikc7Fpxs8T
	MuRQvHZVE3sfkqHoWBk/zSyWdC5SUA6AsHf8yRfQ+mpRV83905jgTP3L7Q6/l+HSWPoiyMcwanl
	YRRoQ+iD92hUeSnqOsdN/mAdTi7G5XuKDVW59jYTTWeNrZqSnR1Q3FDYuWHat1v9rgQCWN0PWwh
	XRiGiaDKENhPNZk6zHCdqz0Rp1eg3A97FZ8BTxcwMf/PJhsgFyeTl0g6fH0QcO7xgzNE743kpjr
	Q8As
X-Google-Smtp-Source: AGHT+IFg//5LwYfTEQFnuSRS+BvJlK0U1CIpZoSn+yBRmJA85z19Z9oAChFCXf49dqnRysAazQ+L1g==
X-Received: by 2002:a5d:4f8f:0:b0:386:4a24:18f2 with SMTP id ffacd0b85a97d-38bf566f3d7mr31426711f8f.25.1737982007652;
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1764d3sm11150284f8f.19.2025.01.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:06 +0100
Subject: [PATCH RFC 11/14] ahci: pata_arasan_cf: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-11-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=W9yVEdw4qSI4n7OCj5u/OGHoNGxhi+e4Ou6sa0uyD7U=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsXHhQC6f7LA3oB6K4p2SmmbhUaUWGrqpy+
 0C1WwXAqe2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tefCD/9fpGNoUqDi51K2tB2D9CFl8CeeHTF4pr8xRoOQ4wHxFq1j34zFjU0zF3FMPafOKzx2ZpU
 M0H+96OFbAZFRVUbx4TMhBAUFbWDJmYEZaD37c+ZiNhwe04QMF5xjCOdcOzfOxq20XK75ysaLym
 SaEYxQu2bvz+1luQsRFAMDy9qgE3lU/RwHZX4Fnoi+LNBgCnzFobqD6AcCGplQY5GczK23KyIy/
 Qnsf/uNpvh0qhLhkT9z8qojEvpxvy0B4Gjbrg/7C+/W16wnfh6q4tPxknNPELUPgowGCKyPBXMF
 N2H3TS21r18cdyWUIRFdZQyKfD1OV7qvTeVtnZKZKJx8S0YDBEOafcZmRlXuFLUlOOikIvDDfmy
 60XDP8DfgiBRt8SNQMvttfg5JDwQ06nB2k5WmpKgJKIaH2Isb79axwMaocq7jKHGJ5zU3EM2LKt
 P1CSwU1T2RyRAP2moyDlxIQWHKwt7l6spquHZS/azAm9qYKh7V/NjXg9ojMSyKAsxzSieNlYfi9
 RrD8Ciy49bQb8tFtcEPD+4NAYZxTqA+rQL0enjR0VFqy1U24bMwVr3zTYFYzUNtPBruiDyS6Ihl
 ZS8SJ3BU1M8Kn7kD1mDYNNod/D6qYBF9ziEv26ZHOM3Irpk2//In81xjJi8n2RRxWRWc32SzYmY
 kSDFGSf9UT/2Vqw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044649_471247_62E943F3 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/ata/pata_arasan_cf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 514d549286b56eabe07dfc2b3a961ef0f7c983f2..3ec03147a8fbe30e9f82c184d7a9c32cabcfdb92 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -926,7 +926,6 @@ static void arasan_cf_remove(struct platform_device *pdev)
 	cf_exit(acdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int arasan_cf_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -950,9 +949,8 @@ static int arasan_cf_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(arasan_cf_pm_ops, arasan_cf_suspend, arasan_cf_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(arasan_cf_pm_ops, arasan_cf_suspend, arasan_cf_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id arasan_cf_id_table[] = {
@@ -967,7 +965,7 @@ static struct platform_driver arasan_cf_driver = {
 	.remove		= arasan_cf_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.pm	= &arasan_cf_pm_ops,
+		.pm	= pm_sleep_ptr(&arasan_cf_pm_ops),
 		.of_match_table = of_match_ptr(arasan_cf_id_table),
 	},
 };

-- 
2.48.0


