Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095ABC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szGjXo1hYYSzRkz6HQhU4uZSzD6xW5bFqhnvJ2ebtpA=; b=jrNo0nOQVyehRyKeQ4j2jYNDC2
	u0qWm6YY+SoMyVskvZnFOc9juYMB1wzIdVuRmzHApcTSb+Yqki14+pI73EHsJ7H7OFOSNeYKAb/L9
	SQCdL1KZQ1pnh6MAUaVRlnGEMeWY6n+dPCssyrmzHVcv7L2gNSFUFLd/XTJYpGpeFD73+gkwCpHIO
	V+HAOAITIUUSKrOLhgs2Oc6/lqDpLzei57je4Pa0VdbqljOpk+9wsJTfdKx0E1Z5fqXPZ0esd2ZBX
	WYVGzcsIhDRHRmboH0+2hEB61IKpUdzuc5GyKu4cJSYLW2eKHdeyz7EA1je0dX7TZi0WCJ4SQgmat
	abnP5CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOkK-00000002Kcn-13ew;
	Mon, 27 Jan 2025 13:01:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVs-00000002IK9-00qw;
	Mon, 27 Jan 2025 12:46:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso28267265e9.3;
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982007; x=1738586807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szGjXo1hYYSzRkz6HQhU4uZSzD6xW5bFqhnvJ2ebtpA=;
        b=SdT+59+dvWVMko8Ljo0CN2dI4iLpgDSNGR9Pwcok05PV6khXVd4rJ3X2SXd0iLFTKS
         hhfWLUiPOBja1IOy4WpR+2dthvWwj9R46LldgurrhShWYiHjcgTj6UkiRPlBDDLsJmGU
         AFaUz/XvB5ZOv9s4xwDPMhJG+g1w7jQya47pC7WzfSNFbNit6k1amXa6CIs+2c3mvYgt
         IYRA9hesybn09iHXVCajGjkez6vLFeb2lL8s1Dtw8tAvaED++D8ID5CUXRwciwBUSsd3
         CWwXf4oW0GugO8iCrUYJB1wXMg/8YfinxZUJLwkCegQT1unP4FuM4fOwzmsq5qZmIDIn
         Doiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982007; x=1738586807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szGjXo1hYYSzRkz6HQhU4uZSzD6xW5bFqhnvJ2ebtpA=;
        b=WbMBJJeWiuleN6cTRNtwxuQpqz9vHBSjUulZnfldwOnoNGoPCapiESgkgVBjQEKGSl
         eika+D9rCLMOEnr9Z0oB9/4Asv6ifRqDinoHNkt/EEj/0zxhF64ZC4w1kHWjyS71JKqU
         9dVeGYPYccm55yOcKOC3b/FiXuwsdzsgwO4TxdF7GWN5W/p6JK5+K1jxd5pxkW08Ew1F
         yKUrvwl9uX5J+G6T2XVgp+6khtvim52aT0hQ+ZhK2xxEtOaLIGJw8xxwuIo7DptHiwl3
         hV+RkfE4eTG1YF77OOzT/yDiJ1C/ea669mO9Qts5Ec9Vsd4REUueyrlZV7kgvvPp7gnV
         1REQ==
X-Forwarded-Encrypted: i=1; AJvYcCX34WczbqnWdrPzG9LajsVg+xDYwQSGwvh66XgyTdH8k/MApftD5e05DCKf49xwXcUiBAAuKnf+FWKAduLV0k4=@lists.infradead.org, AJvYcCXmeUr1Y8iBuNybb1PsYiDM8Ue0M9BBTZqwUuUcwzonzNwS7vxQxZDewv6FbRvLm1heAX9R48CrHfFlPAFcZG2q@lists.infradead.org
X-Gm-Message-State: AOJu0YzTjrzv2WzA8XTlo2oCLFbnNaVIhyLNCBfcyku6/hgIUrevqHzD
	KAvtrpihAvjQS1bZDevxH6/abCDMMegyKN/wK3iSqwzF1P/MEhD2
X-Gm-Gg: ASbGncvoqCq2IePmF4zsgXMeIrsr9l4o6TQoEr4akUjmp6UjX8zyn5sX+IcNkQ8X6yZ
	+/bVzk+e3QJVebYHszSqgDvIa4EkZkGxvtwt6l7u6XeA3vFp7OZjOOSaXV57G4QqQKCGloHxKjz
	B6la8m8jQaKgJg4YKZ1tVRDouBu4Ofk7TlqG1qTNMpPqPhbhfP+lc7/NCQcxTrP8AmSP5r/bwWp
	thlkczkOy1fFBCAPFQUf38BOsvvAKsfFxAwQhjwTyeIYY3oEwr+izEk95DRPqeL9oc/etKbfgKW
	SuZV
X-Google-Smtp-Source: AGHT+IECyknYFtGMyIOfytVXp9Xpt7MbeLa3f0kkvjGmlt26TzZXV3Ltntm5/VpvvPJ392VzgHnZnw==
X-Received: by 2002:a05:600c:34d0:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4389142e805mr342800575e9.19.1737982006564;
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c2dsm129180725e9.13.2025.01.27.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:05 +0100
Subject: [PATCH RFC 10/14] ahci: sunxi: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=3GK2SPKfq0gy3cNILmQ5ZsytwY/PBIweFrsBnfiLWdw=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsWF329QNvB9AQN3sovNUKToG4hfpVVUhqI
 R8eXTifdn6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tSFmD/4tt85mOkwMLGX8cjbjVQfnqOnIgtb1Q2GzEesQ9yxpXI88g4suta0w+UhJqmL3ItTeU1n
 mnbBJgomCc09suTGM53hvjh3KcJfiJa67PyOst0jpmBJ5vxiFLSxQRlnoSKy/R2IwZ8/SpPOVod
 WhvficTrwmPfNlOEAMkbaa/3zdLSkZlYsMfRf2Ociw0zcIKLyvlfWWp0fmx3BjmxKmJIGKOL5lY
 bpU/tz3HDN7BFVy2KKTbpF/I8bOlnD8ZDknqqsSACntMBhStldQI7soe7PfP4dO/BvcYuy1nsXH
 VgGEHYoiZ9i7HFcP7rWJXIe4CXSjPX5Xxl1R2fvT1328vP+dXS3xfkW850n1XvZpYLdZe/43d6a
 PnrMCMRbvxYzpXmNWYsQMDT72C4URY2EBSKf+8huJrX61vLD2SlDOsPC4W8P3z75oYR+3VW6e9y
 L9OElLjmtRdv/4z6x+QN3Xo5KYnaj7NuFs7B3TWjTtrCzA7SmEEwCjlY3BtSSdsDDSGiHfNpFWB
 BqHw7DRbx+ANuEbZvr76T1jgLWfdW5054V/UfJEm12/qGHlE5Mt0FIOLGx2h+rQUktRQn7zlTIg
 im7n/LUh3BM3zBhUVD+w4dSO/PrVycnDTeHnXQfXKYImu4SMzda4AOHhw3KZGew7PY/cYjhJMFZ
 /+uizNvy2xVE0xw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044648_056893_DE532063 
X-CRM114-Status: GOOD (  13.89  )
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
 drivers/ata/ahci_sunxi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
index 5d4584570ae013a4e44ca69557cc2c5aa61d32b1..2e86d4c97b822b6a52513dbe55e21851a58385d9 100644
--- a/drivers/ata/ahci_sunxi.c
+++ b/drivers/ata/ahci_sunxi.c
@@ -253,7 +253,6 @@ static int ahci_sunxi_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_sunxi_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -278,10 +277,10 @@ static int ahci_sunxi_resume(struct device *dev)
 	ahci_platform_disable_resources(hpriv);
 	return rc;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_sunxi_pm_ops, ahci_platform_suspend,
-			 ahci_sunxi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_sunxi_pm_ops,
+				ahci_platform_suspend,
+				ahci_sunxi_resume);
 
 static const struct of_device_id ahci_sunxi_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ahci", },
@@ -296,7 +295,7 @@ static struct platform_driver ahci_sunxi_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_sunxi_of_match,
-		.pm = &ahci_sunxi_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_sunxi_pm_ops),
 	},
 };
 module_platform_driver(ahci_sunxi_driver);

-- 
2.48.0


