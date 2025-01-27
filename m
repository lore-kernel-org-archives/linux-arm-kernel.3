Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A7DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=; b=PHhWNDZcuydp1J+eZP8z4wMWOQ
	7lwuk/CxjDgcr5QXM6StE6Wa4/+S1D0b64wPOndLcAbkborb8/Bz7W2qZPTC9Y33dMQu6SlDCje7F
	r9s4a0bHhzx6mIYENrgGOnSvEeaClrzn2M0aUYvirvueCldWQWrCNRovheTe+gdu5SruM7UDYsA9E
	whgvmbR/pHlw38mojyIF6A87GumrAQEuf5OTFJD2yhGTeTereNjiL6MV96QxXiyIaeRPoTMdY3m6w
	GVI5WQMtmdTU3e0CzNZQjWI9Q8H8Yx87LUVjd+3PH9eezEqYEQE4WStWf6y1+zL/DOao+Wf5lqQPr
	ZUawNWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOZf-00000002JHs-20D7;
	Mon, 27 Jan 2025 12:50:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVl-00000002IGE-3SQ9;
	Mon, 27 Jan 2025 12:46:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43626213fffso33873935e9.1;
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982000; x=1738586800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=;
        b=R2p5fUUHhWuKjf3pbJOYzvjqofNpdqZzBFSVB5Tpp9ATZVwC3iuoJ/YwrV1itg4M8T
         5yBzKojIq9CFKIPezW2wkhiCVpmNJDiBc/wyiL5lTQFqY+n8kfx9jm27Ji5SuB+BHRGR
         J43zZnaHpJ83i/79jRN77h/gF4y1GciJI8Ni9Jnhi2ds7/gpDEtAk4+cCqLTxsxvWYf/
         VuPiubHjzFpB7SqJCqZ8Cxky7YOvYlDL5+8YKoScnF/K1gah0AOXje9egFQJgYczGVnu
         WIQfQE4e0Pkw4F7GtYJ4EJ7DA8r+vbvuJQLhMET6RqGloxihlhtVCB4jSrGP0O5kvXai
         L7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982000; x=1738586800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=;
        b=QKWinjRY+CVnnzrgZapAiRoNH/fNbt7TqW69vJ1nlIWkrZMLOnExzACpc/PEMm7MKj
         2kg4oT+smXAvnt+1+K+9/30VahlSKR1h5O8vpd/0nW/lmdFTRwB6jyJyqWkX/vjyLPYD
         XUdb6ShrN0tjiTzHzv5m884CrOW75XyU1cEjIFDkiY6UEMcCGCr4hasB11sTgM995R+f
         /xAzg9AlJlimxZr1wxVDcy55NspPO1xGDkieWFKD+W0Uw2y1Dr1xbIbXqUtvsncU2j1X
         cjJtRYzPt66P7TXTSFmT7/NTzIlxuJFuTSlu/Mh8nOor8TxHid2DlTqWbXXmwC904gRP
         r2Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ymmHIByV29OJ8ntJWdJtqfe1EL5Q1fBPKDleuQ01TByH/DC2/vCVHSMYltZlWSc9hiMbpp4gQdGqsNncazA=@lists.infradead.org, AJvYcCWZHnH0gdtQQP4d8GEijIDyQ+RMYs2RLP5KxSb354lFFypCtif34YpGd4KPe/T33JBfNASjX9mItxOE60Odikp6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr0RiK2InntAAi/WaEhifivVUwWNc6UuSjR5SdDhImdOulWOvm
	hpGN7wTBlw0Mq5AUyTdHr9qekMdfoLDGUmWF1jeQJLLxfi4vTlW+
X-Gm-Gg: ASbGnctOXBg8XHiPVzW3Q6zuW2NW0FETKY2Pxj9YUyr1Pc8+zQSGn0MUEFADhQ+wnJR
	8LdHRJAt6ZoIzGgoDJyT/LBaSNFEqN48seKYUns5Dx2K/JezvtrW3F+q0P68DiwdQBMpfAf2KYe
	2SDih4aIFKfLMxuBHkHoW8413cL8ulcg12KkAyJAvu8gpelerg+Cj41WndVBhqHIrIBpgFdmifZ
	CHJdsHolfHdUTZIIeHujstM0nPFdNh1tx+FRZKZqN7EsfqcOZGiFwnkBQfYh0WOJ1A+fN8FJF0b
	+hbb
X-Google-Smtp-Source: AGHT+IE4B3ZWBvjonvFeGkuLk5blZCAjtvZWvPZJwKJKIySnT1AS6AlcYkd8YzGAqRr1xASJxsefPQ==
X-Received: by 2002:a05:600c:1c14:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-438b8841d5amr149069615e9.1.1737981999987;
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c38sm128625445e9.11.2025.01.27.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:57 +0100
Subject: [PATCH RFC 02/14] ahci: ceva: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-2-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=LQrJh1cj1U0MJFZHGoCZeLdGKBz6XSkjoRXJQp9xyoI=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArRFwGWZoghduZ5MsMtU5JP/K/knP54RrlJ
 u3CYrMYTkSJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tY/5D/4h8WBFOd6bLxfcgBA6HQZSQVHtRe/MmxwQhqArKIu3NAzo6IvI5unGAIVRFfP8J/6taIZ
 coTadHR6BS25WGCU/geH+pL7tlRftPl7w2KPA53Ty2vLyAcXhjTak2OjFJbepzYKyLGfcFm8Enk
 mvYUOXom9+osUVVZGr2Umi9NzesNQHW4+NmAk0BxAXY/v8/ABC1Pkv8T6gcvM2vbB5Tt4CqugXU
 LnC6yqpRf4bZH34M69d+iT+0cZayAlqbS5E8AMrICLI3tvOT69hALbx8n2VSfVFcho3CbJsZ2/m
 WFrLEpDUSjJMZ+PUCkuo2m6pUQHo/2qFKhd2RD6Jp2g6QGthqal4+J5pkGeN8ctZMPEydKW5Vj2
 qhHjVovjhbYqaJUQZRw1hDF3lWToR4EFOQfsYk1CizgHiUnYxjOscVH59b7EpvgbRh0oihBWtN4
 deMGS+5dEVI3fcGE15tDralQuwpz9z4nE57mq7OCGIPgMyTEh6rf5PCRQuF5tnM0P5k1oyeovBO
 hLm7yrCPsLqTSZej/Ngu6KMJBv/kP9z8TFv0kDKTp4Y4kqzsUNb5kK/qxEliK3qAEW5AaS3Q5jh
 7JaDUx+YgJ2Veym0I/RZ9xlsUejgS8M/P3b8++OXTFiu6Ou1Gh/QDgZusSKawfMHCMOReT43FBy
 Rz4SB+DJyzfb7og==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044641_865968_0A463883 
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
 drivers/ata/ahci_ceva.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
index 2d6a08c23d6ad5d1d11a7de7fbe2968201d6095a..76e55f1f7db1f8349d696e92d8964af609532186 100644
--- a/drivers/ata/ahci_ceva.c
+++ b/drivers/ata/ahci_ceva.c
@@ -363,12 +363,12 @@ static int ceva_ahci_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int __maybe_unused ceva_ahci_suspend(struct device *dev)
+static int ceva_ahci_suspend(struct device *dev)
 {
 	return ahci_platform_suspend(dev);
 }
 
-static int __maybe_unused ceva_ahci_resume(struct device *dev)
+static int ceva_ahci_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -398,7 +398,7 @@ static int __maybe_unused ceva_ahci_resume(struct device *dev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
 
 static const struct of_device_id ceva_ahci_of_match[] = {
 	{ .compatible = "ceva,ahci-1v84" },
@@ -412,7 +412,7 @@ static struct platform_driver ceva_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ceva_ahci_of_match,
-		.pm = &ahci_ceva_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_ceva_pm_ops),
 	},
 };
 module_platform_driver(ceva_ahci_driver);

-- 
2.48.0


