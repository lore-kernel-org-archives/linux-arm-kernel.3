Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FC5C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=; b=ZUiJJ+ZjpBBY9sY1eNTHR3Qkgd
	thIcV/3mFUCEp4nL/sc1++SwJ6WpfmhDXH45bNk2MwSnmKi1MLDll/H4DwTPgu7yFaDXxnPcT43RT
	y7HewnSiEI0tNGjusWwLr7cG+VRqbtguDuqm1Ugxk68WPAjaJUma715wLHO0xgonamNl6VKL5YDOE
	1gP8iAgcGsSZFve+oKN0SK2z3pjoIiRo+HyxDs0mj9Ye32G6ZHQaZ6VctH9gbDM5hQPJ8DHc+wOxd
	irQFf0AbcgIpBTtNlLIKD2dVWqkqX4/ATGJSHW5geQdUBCjVaeRWRj693EuAbV19OIn8q/CcYxIJ4
	yiAvsM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOb2-00000002Jd7-2uvY;
	Mon, 27 Jan 2025 12:52:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVm-00000002IGO-1cRk;
	Mon, 27 Jan 2025 12:46:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436a39e4891so29045615e9.1;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982001; x=1738586801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=;
        b=JoSoy/rDqwuH6EKjD1nmfHD/FHUEn+ftTTgxWjtgXADkgBQsvz9/2easxDYV5Bp+i/
         uRhruEdCC2lbznddbhVsFRgMeZHrd5lQcgbe86yregUNTvw9KDJJvC/p8TJcvhtI7fIA
         pPpX9esTm3goqTf/vGow4G4X8xPSIJ5Lgi1RPqJt0o5JHOsvAknAawtSeaoj3FdLeKLw
         cNUREAOkn6qedOHDcOCldlFbojSFAgGvSoORCvxH90I9EgsjU4Fk0Y26m4seI+luI4v7
         VPew5OsRoTUydFNTxjNDnQN/1QlKFJTja4x/CKfg2QeLl/FqfsQOFz4fcjlXZ1//B4kv
         iTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982001; x=1738586801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=;
        b=eJPoHKoSvZ9zfiH0dcemUzU64tUYfPf4OJr1u4u+z5k+DMmDOtGuJZSrvhXrG4/47B
         l08exTS5JAbVr7SZ14H/rr//Diu9fdYK2NnFjlU1yzbjlrIQ7dN546gfAWc9vGuIUPW+
         g4ckb4Rhd6qYuQr7K7HC4FFYlRAOzZUmTppa6xqmYg4q1g0Lm0HeMuh/pPEeyTDJljG8
         BG1AGTCnMLoeX/UxFvOJc2NbOunSGUvNZudgpCL4J/HvgiTxH01xja7a/g+a/cjXQnJg
         dVvJbr0sA3jNoF/KLlDFoohcU8UgbrXYQSxhEIBuWrilHGGZ6QScHP9Ax0xOANx3lufx
         LFfw==
X-Forwarded-Encrypted: i=1; AJvYcCVNsYtakROT7rwZFiUMPejTAdOzFyQLG0cYzxwwwjTRZo83PV+40MxFkBwit3SHVyxrQ2DJNOf+wSC3JGVmlqds@lists.infradead.org, AJvYcCVfn1ubVHYhAN+svqayoHsHoKUqiBomDVOX1sueKehvxu6rOw3yyje6jZe2UwvbBLFkJVr96/OtUapMY6dFBEU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDpO1MTGLby/I4Mh8wT58xfx0WwEobI0gYfIiyZdZSPqj/fGrW
	cAE25dd0PgXdmc8pucwaG5Mk3+cMNhsIoQf2saYtN1OMHYwgtfQUns1uUw==
X-Gm-Gg: ASbGncuO/6ql4bvoNxaYv/qIHCaUaMi3TD7ZzGstr9VQYBbPZjjToko5IhSWfy+mHe+
	ecHulqFzulZq/WSrXSwQM93FqtCtkGIiN1MG1jedVdhM6vLFfxMWvY5KYcAKnpNg79VMCWVsUVB
	tKDuYI1u8mdq3hW31OEX8kDDEui3h1JJ/UBsncOn7j282UWAKyS1r72WoAkbB8Msr/Ksy9GxtYC
	EuBuMJwXJGIrm4WAK5Jsv3n6VOPsVD9ZBpp1j7X5/jsmx5rhAO1A90hqt4QDiZLol/BtlmKnb/3
	MUIy
X-Google-Smtp-Source: AGHT+IHpARUyFT0W0Y2128Q/x2wbxMx49MWeGsOuOnwEQsnLMO4O10VSBaMiBE+MwkR8ginshDZ66Q==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr362999315e9.6.1737982000814;
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48b11esm134149285e9.19.2025.01.27.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:58 +0100
Subject: [PATCH RFC 03/14] ahci: da850: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-3-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=JYTAGA6KLOpq1lfyYvO54YfNSto58DDQ8IbvFm0AQbU=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Ar7H3XRvBHkCDJtwncEn6hACRSaM/B9MM3j
 TUlZmcdsxuJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 td/kD/9fRfNqFvH78A73Xd9ZGCO8XYqGGm4sadBSeVvFoAPKLlbostOLn0qrxKrBKAASdfHqsaj
 T/2jrg0tSmdNVfMU8W/4oUg5coJHOYRBw7F2NCVWhufeBLqKUxlOIn41IvdoXEMhVGczp7x66HA
 eVtALOskcYztnLiGnh3dG4UHpgI9zcbAuZZvVqr+NeCFLzMTrINpprX+Kwplsd5vfjrcLkEkCxK
 ZXedZ9qdyxy8+UWffwJRw5YJIIKc0sB+dv6k+vY7Man1vO/kjVwnqgaa1SyziRV4+TIkNO7oUuE
 7JZgVZR/5Ziu/eHN9Tuih4WuzF7wLEC+iPdGS8n/8LFu4ox5bCJFQb5iw0RzrZ+lbcp3HWBxddH
 5Tr1VGbsnJF2G82s1MqRFeVz3D3Bi3WUU/Ms0i8NcIkjH7LpkT1lHh1Ab6R4wDkWuG9/vI4D3Xj
 QC5Omh1e+vXMm1xxQxa6hak4AiSlSrswqIikBW2TebydWVHYF9i2ql4uqij/pkDMj0cKkacwNIR
 LYhGQXC9ScWUnTz34+qUc3wODdoz3WA246fpAvohnH9YEGmac6ra73KaPeidcuF9k3vZErcQIX8
 wN8mk7rbta1YD1fblRlqH0liNKjhbZcZZdQjjwbhmQ9jSgzP0S35D2ySR5Wa4+kTKrZ4c1JHODj
 zO3u5VfhG1/FLcA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044642_431596_33052FEA 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/ata/ahci_da850.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
index ca0924dc5bd26ba424b26bd040bf83720c96b56f..698b0c30de0d65423f932ab3c3d95787b692cb37 100644
--- a/drivers/ata/ahci_da850.c
+++ b/drivers/ata/ahci_da850.c
@@ -227,8 +227,9 @@ static int ahci_da850_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_da850_of_match[] = {
 	{ .compatible = "ti,da850-ahci", },
@@ -242,7 +243,7 @@ static struct platform_driver ahci_da850_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_da850_of_match,
-		.pm = &ahci_da850_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_da850_pm_ops),
 	},
 };
 module_platform_driver(ahci_da850_driver);

-- 
2.48.0


