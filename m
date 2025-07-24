Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6693FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNqdppqc12AolCaCIftKMEQ9tW6lvqeQBpAU07+UPTE=; b=gH5tNs7fnatomzE1nWgGd8Ne5/
	UsuQAoufwTYSYXBQWmp61KR7yw1Ow1O5ULj3Ok+piyM94kbEOdPjsfj0GN4pNGrd1tKbyOkjHM/Uk
	DHZlhFg+Jstw7al0MImvKzwMitCR01RXjTkIPhYF4++lZ2xT9Kyp7qserKkqRZV0SW9xxxvGeE4CG
	HMmx3xIKhU5CKwn24/soXUQbwqcy7pkaXAL46ae692lrrGXedv4LlcWDC2rlQNEPiFepIDx1UBh7K
	4jqF49rkffiIThLBcifgLBJhX5KPZFrMxuiEfJNj/Rn0FqJ+khvna7MoqkYV2wiqQaX8ZMULk8aWt
	nTANJbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejjP-00000006EiW-17Cw;
	Thu, 24 Jul 2025 00:22:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZe-00000006DJw-3hwn;
	Thu, 24 Jul 2025 00:12:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234b440afa7so4088165ad.0;
        Wed, 23 Jul 2025 17:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315958; x=1753920758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNqdppqc12AolCaCIftKMEQ9tW6lvqeQBpAU07+UPTE=;
        b=YdW1B/cqL1jO5m0Mhte2un2cx+Vg0wIm/lrgYQ9SAWAqKE8Nqp2Wz7aL06w7+bYTjH
         8TOtmK261pwrZhAZ8U1ucu8WjbpIgsZqasw1Ei5JdcEAVyQvFj1ni6WggxE6abK6vP7r
         5471w4F1pO//1EfxxF1M2dy0LptEUBekvEqXdgabzBNKKztLIiPKKOFt+kWFByXAlcnG
         LTNlpWRktIReMXk8EoZp0chZf6oSq+a/e+GWujkJr+zb3hj0/hHMhcIarw99CYG4psQd
         NwrB+yHOrYl8BJ9h6juucOS1bhgdIvgKtYPXA4BVHdTHib759U0KHVbZgfyn663pAmE8
         RmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315958; x=1753920758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNqdppqc12AolCaCIftKMEQ9tW6lvqeQBpAU07+UPTE=;
        b=TCev8q1HRUl5qOkYani1HqJg/kyV6YjT8f5YeykFj0Ln0DyoGGNys2bp5YuLzmbSS8
         fI3s7iuZsU2MNuCfObBe76lWloCgkH0FmYrLEZg2QN30l8eVFbVwG0htF72p6BPS0HfH
         VYi0HyvND1wF/IjtykWF06HbsnGQvWEjoUHthP5BhKxqkJCETyHHpZRDe7AP2mcw22Sf
         f28mzu5JHdfERuZzwxwG3TuFNjmolzkkkj9CQJ88K6biEyUx2VjlSIVTxKNo1P4AFhvD
         R58cftt88173S0fhf555mNLSQU/Xesx9m6PwZ8GtS8kld0AarzJ9Owu8SHVfmLRTiL7k
         sVwA==
X-Forwarded-Encrypted: i=1; AJvYcCVT14GWclIKBqYC/n4TO91SsTXXkvKT+syrnVQ/atDJH9Lyaw/UJsOzSfOFN0dBRDkByEOXJr6lpyWUGs/UJf4=@lists.infradead.org, AJvYcCWv3mBkJ6vzCk32EQ7TgwYBfMcE8k4sX0jI+ql2Zc+Lvyx0yPt5/B1nigCtrA/CSB60bRfc4G5wCN9idTY1FLZj@lists.infradead.org
X-Gm-Message-State: AOJu0YxYQkaA4EpSJTQqLMgbqgYXW0YyEHKuAORxNCkQN7hdUyst9jGS
	3mwys4O6vAjIjCafvMZ2PLiB3la5wruFkhKLxpD+vd4cudS2bxkSeBa1
X-Gm-Gg: ASbGncs9t/Sm7ug5Iyq+mycV0DYUzcZl/0LoXe2V523siZXC6/v3sC99hUahCw2lqih
	oo+twDX+3qwrHwYTMIPNqu6Ik8gWH05eg2s3vDuuRdmGbtFAPnm5LTi1uxQacxMYhNT8bgFvtGM
	gcgVjvVDMvflkp7PZ13dYPra5WErAcU6/0UtJhnnbcwd6e70pTQHfzvuUzDABppPtOsP3HoVrx6
	QKcyEidX2E/zHYWmrDbM3A92AK+uKoEOyNkKVPcLbZKKygKu5FibXUW95z4EsT8FSjSPnIKgv7d
	GQ6uAe0FmWSJ0aZXF4gHYluWS8uxe55sDm+38PUyNXf1Bb/f/94HZS8259LcRGDlf63w1rvxHi/
	wJS5Zl+iicKrAHA==
X-Google-Smtp-Source: AGHT+IGMRR2Fu0m9nCYId1OSGijOuULND7c5nOfjYDjUOnjmLQE7uUvUkOvwsaBmf941o5cvm73+Rw==
X-Received: by 2002:a17:902:e84e:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23f981b3991mr81365885ad.38.1753315958029;
        Wed, 23 Jul 2025 17:12:38 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv6 wireless-next 3/7] wifi: rt2800soc: allow loading from OF
Date: Wed, 23 Jul 2025 17:12:28 -0700
Message-ID: <20250724001232.2275-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171238_919696_722F90B3 
X-CRM114-Status: GOOD (  15.48  )
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

Add a single binding to help the already present dts files load the
driver. More are possible but there doesn't seem to be a significant
difference between them to justify this.

Use wifi name per dtschema requirements.

Added OF dependency to SOC CONFIG as adding of_match_table without OF
being present makes no sense.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index 3a32ceead54f..a0dc9a751234 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
+	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index e73394cf6ea6..8015089c4a39 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static const struct of_device_id rt2880_wmac_match[] = {
+	{ .compatible = "ralink,rt2880-wifi" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
+
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
+		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.1


