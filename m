Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48072606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nmIDKgnY;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YVpI4JjT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=; b=nmIDKgnYtpbbmUSlz3i1payNLu
	u7LKViolsTE/BRbOAUFBlY/tDzYMQ964mHheyLrI+LepqMWY0GczQeDiFrIZN/3teu/L6WPuZPH4g
	SNk+XbgjHrqOMylFBDXAk9zGlQKaO3KIQ4kkeMiuTcuy2vy+g7TF7qUsOXVPMmaIAlQZgC5JDCvgL
	uOB/7EEkIqSgp6te9i4uwy3Flrdjc4vb1mYKV9jlIaIli0GKS59Ga5TBLgSW5JBu58e6ZmFZ2hnAU
	TVxz9XbaYpsbc/XexqbRAmCeb7j1UQlEHnBA6+onRqmQYhAVr9l1h7W305MYCsKKZyfmD4KJzfWrJ
	mI0U5nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYXy-000000053Ah-22k5;
	Wed, 04 Nov 2026 10:48:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYXv-0000000539K-2zmj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:48:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so4683745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793789326; x=1794394126; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=YVpI4JjTu7bOgK2qtWLYu1PyavvGgh05FGWG4Z3fbPzBDPXmWsYYY1wBQAL5n66sGZ
         n/bQkWOEKKQNd9yQ8iLeDqDba6vPyTBKvUJZ0Rj817M67gLAaKHxK7g4w48okhmORSh6
         096Afq6/ggoBJqjCXas8savchSTqPF7Sl4//UTeU7L5jj8MHvu4iZ2eIr3nV4m9Vv1JV
         SFyft/qlaCzyrCajYJw/yf+zNAB2rTvGuWWL7GCubxy6+zQTXGBm35p83Zq97X5IoMOm
         +nRvdT18YIbYS9cH9qiRnJK+Gs7ArXc1CdK7rZOl+R+nkjO8DI/gmjAuqIql2WvNhZs9
         h5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789326; x=1794394126;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=LvgPiTMXpMQeEGi9/U7h0T81dUKye60Mqf3BvmOHV7klI5KAPuokJuNhuH92ifYgv4
         F0crqJbPPsvShTMtikyrcq2hyyj+fX/bfISIrlFi+ip2KcywVH5DPgEnQkJSwRf6lZ49
         vpg2wMxUZn+VixCUTLvg/WGIgY7HPKORyEj1O5hVJFIQ8Yv7BBGeHza4S6NX2F8cMu3u
         Ifo7PCagRKBbPAHNDjgyvuYAahf/9YYhnYyrfnfhHgaNT8yCJ5v2a3/kFsiA5CMlouCm
         piUUs/Otsvy/yjR7XsWKy2nx0cMsEPgTHoxHKZSMALVwJebzvz4WvxWoP8oFUs35XL+1
         GYDA==
X-Forwarded-Encrypted: i=1; AKwUvBzjCakNCwjkM83vt1MCJ7fZkhEZah68zNHVWHVA019cYhhZYPjQOju+rbrZ44Davo5Ew45TQEEYz0x1qDNy7DKg@lists.infradead.org
X-Gm-Message-State: APuU4Z/vq6LOtS2WCC3d8/p/50TPPcgj94J7GAdfYf8sE30KhGWaF7Bl
	6YitN7HXfJnZZfLO/z93Ihsybzqkj80W3zBqUBUXFIeqy6jke+45KQ4WqxSsgQhuF3U=
X-Gm-Gg: AYBFou3DpMdtkrhtXsClB5fJ1mmRTHyYUcWzIApFStITyXbxXUEhGqIpY8ZU7LYN969
	Pdfpj7Nkx6Adwvbso3dlwMAstarTQd/jWyVvQq8p7Sljsa2k4vVgBovw3qcXLP/bfdPJdQ9uh2X
	t8IB7gDhwnJwkY2xwRON+rVHunDDS6M/2vMNeCYFappvSfhXBTsi7udSdc6MxIRNoaIxl/084o6
	NYokGDRIzL43YuO/hrPQqli+11wenAJfFPtOSDY/Rl2agGdDrGtYINqX6VmZ1yks6dRhRtmnXSf
	VMiuorteBOSJZjudTrY5eidJCLNmvjjkDiGieQ28+0/tjl3oy9BgSna3XxY72B81AiiudxUSbBN
	GFqlck5zZsYvGGqySuTeA6c4IV0Jf/TrfdbeESf1w5v6siYsNLR988SARgQNgI3clZtO497uHSD
	F2CKihGB/hfC9zp67l6NJfLOH5xfTQxoIb8QrnXphCQBIJr6PiaqNZtm0qK1lw0iZF2WL6VAH9s
	CPmFRpnaVFjGqOqFTsk94CdHaZpNao0eJqKKSL78GL3kzHGT1eD/abeIgnpgGLBDGeElALNr4a3
	5yp7Q+gdmLI6hgrIjR1y9l7OsYwT8JTcs7MIM4b5NH7kfa3n
X-Received: by 2002:a05:600c:1c23:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ac180f2addmr415568325e9.32.1793789325659;
        Wed, 04 Nov 2026 02:48:45 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm136455625e9.2.2026.11.04.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:48:43 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 04 Nov 2026 11:48:35 +0100
Subject: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAIIN62oC/yXMSwqDQBBF0a1IjS2oNn7ArQQHpn0xFbQjXRoEc
 e/pJMMzuPcgQ1QYtdlBEW81fYUEl2fkH30YwTokUyFF7ZyUrPPONq5TJSLsJ/RhW/jSODRSohp
 QU0qXiLvuv+21+9u22xN+/b7oPD8+32steAAAAA==
X-Change-ID: 20261104-imx-sgtl5000-cleanup-371e704e5de6
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=ioLvTLPQ9whgkMJcbvVWkeDAXZlfFZobCdzIe0dI7xo=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvedtyLG/E7rQ9UKBp77CEsZNvw7oJec4JDyW+H73J6
 9v/OHBPRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZyXoLhD7fllU59pXtZbBOD
 lT4ud685XSI5347ReNq5A1fjTNf+usfwT2NDfkjp8+tNc9Z93pHCG8nwgMk66xf/V4fK3NnJUcw
 P+AE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024847_996143_30AE9E74 
X-CRM114-Status: GOOD (  19.09  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 'codec_clk' is only used in 'probe' to read its rate, which is then
cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding the
clk until 'remove()' serves no purpose.

Release the clock right after reading its rate. This allows turning
'codec_clk' into a local variable, simplifying the probe error path and
dropping the 'remove()' callback, which has nothing left to do.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
While reviewing [1] I realized that the driver could be simplified a bit.
'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
so it can be a local variable there. Also it must be put when no more
used, still in the 'probe()' function.
This allows to remove 'imx_sgtl5000_remove()'.

This patch does not depend on [1] and they are addressing different things.
The two should apply cleanly on 7.4-rc1.

[1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.cn/
---
 sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 8bcf54ef709e..032ea3e066bd 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
 	struct snd_soc_card card;
 	char codec_dai_name[DAI_NAME_SIZE];
 	char platform_name[DAI_NAME_SIZE];
-	struct clk *codec_clk;
 	unsigned int clk_frequency;
 };
 
@@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	struct device_node *ssi_np, *codec_np;
 	struct platform_device *ssi_pdev;
 	struct i2c_client *codec_dev;
-	struct imx_sgtl5000_data *data = NULL;
+	struct imx_sgtl5000_data *data;
 	struct snd_soc_dai_link_component *comp;
+	struct clk *codec_clk;
 	int int_port, ext_port;
 	int ret;
 
@@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 		goto put_device;
 	}
 
-	data->codec_clk = clk_get(&codec_dev->dev, NULL);
-	if (IS_ERR(data->codec_clk)) {
-		ret = PTR_ERR(data->codec_clk);
+	codec_clk = clk_get(&codec_dev->dev, NULL);
+	if (IS_ERR(codec_clk)) {
+		ret = PTR_ERR(codec_clk);
 		goto put_device;
 	}
 
-	data->clk_frequency = clk_get_rate(data->codec_clk);
+	data->clk_frequency = clk_get_rate(codec_clk);
+	clk_put(codec_clk);
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
@@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 put_device:
 	put_device(&codec_dev->dev);
 fail:
-	if (data && !IS_ERR(data->codec_clk))
-		clk_put(data->codec_clk);
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
 
 	return ret;
 }
 
-static void imx_sgtl5000_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct imx_sgtl5000_data *data = snd_soc_card_get_drvdata(card);
-
-	clk_put(data->codec_clk);
-}
-
 static const struct of_device_id imx_sgtl5000_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ /* sentinel */ }
@@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver = {
 		.of_match_table = imx_sgtl5000_dt_ids,
 	},
 	.probe = imx_sgtl5000_probe,
-	.remove = imx_sgtl5000_remove,
 };
 module_platform_driver(imx_sgtl5000_driver);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


