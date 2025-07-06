Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CABFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swOgqNchoKoKbvtt/1M0CeLEVRw2Niempvg5FVKkFhI=; b=XnynKP5brSdKGkUzHky3McU/lu
	KIzkHYOhyyxsCNfQqbmnGcyuYtqQWNALBOheBa6IemUHCqSGIUxrqAjylWlDLSHLCdMYnFF/bJZRw
	/KLqjJga2gL63xyi/C2DCGpW+HinIdHX7ioSyuSl4TWHQTIbay4gYmvh42lMk1FKlTcKFgYcZYq7U
	EQw9dWfWeqi4syDN4Y7nk71HMRKgnRnTrsKpneM/Ult1jGcmiBxpRiH7K/kHoNXMPSquEEENrziSX
	LsEhPNEHbMaBzS0NuOSFgiJe4Fu/2Urdo7Jj5j26lPj8LdlMdbPTPrM1WdNsiJ6uCVSEosoFe/yt/
	EsY3Skaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXG2-00000000rfW-1r31;
	Sun, 06 Jul 2025 21:50:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6s-00000000qmY-0RYD;
	Sun, 06 Jul 2025 21:41:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1434555b3a.2;
        Sun, 06 Jul 2025 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838077; x=1752442877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swOgqNchoKoKbvtt/1M0CeLEVRw2Niempvg5FVKkFhI=;
        b=YySpH6RQlidWRScCxNGoYRrq04NVWAGWrX1Jpdh1JAyxMH8f5yr/pkQ133Y7YOVEln
         +1TLop1IbtuDXuaxxm8DrOwd2Z/1oMdJCnKU9If8oJLG9w9Iz/tBTQGxeu1RIBBICc6F
         UaTSgkrH7umMYVMkADCdjBN4q1Fjr0nLpSAJvk4w+cxrq60TA3HElGRk8uO8p91dJMVF
         pARX3JdwrVlb1d7/HHehVnX8fZ82eqvgICq452UxCPbxyGdB+Coby00yj/M0JqNxrzLp
         l/w5bLgAcy5+EnLUPyY871foK7Nq4ik6aZvJ82OCeuuPSSL30iznOiWlVmHOvP1BL6We
         6RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838077; x=1752442877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swOgqNchoKoKbvtt/1M0CeLEVRw2Niempvg5FVKkFhI=;
        b=HuTt+/PPe+N9F8rhffuXR2+zunazY0E7bTD1JGAYgEw6Dh3uZa1ue2IKwyKoHCQpdr
         sZ5fhmdhNXhoOEMFcQncL64BTcvDBx2WyONozCGOBhO7LilX2v2p9ktSUywi3y01CASs
         +62O4AcQtFj622RxZTYWNw5J7YvUnD2UVFbG+JiyNPofhh8zgjQ2Z9C61esZBSl9zFeG
         tNWqt7NHEJn8gPwH3cHuSp6yYw5ff+OqypvuKMJ3OlJ7UzUtXfElfc69XC16A0/yYyE0
         2nYAMc4mmjBVA5+K35pBjvVNA4xpE8wEIfyxO1pAhecyegTOCbSwMeUIgD/q8DDaBGrj
         em5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHyyIVYBqsimw23afmIdFeB7oK/0csgtuWYDSPZHeGgE24ZKwicjXIWcpv4heibBOq2B29czQ1ADZxPZw2d2M7@lists.infradead.org, AJvYcCW47V+i8ASVYm3QFtebvzJPqlqEkaDZakfaMU79XdZlqm1hrAu96TsdaXDwo/WpF32xeSyhilvfNm5cp+SQO6w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7DCs0m2USc+7a5a+Juavhmctz/47LJvV1lnjY4MIJWkQ5sfBy
	sB/KyztcvEXyFAhnMM+7r1qLVWkhutv3gmtAWqm70FNm3Gy+oBddK2+b
X-Gm-Gg: ASbGnctyKXljYGoTVSeeL6l/VaZ1U8FWgdtkpMfmP69FORbtrH6lRiDFL4yCGHzkJsT
	J6NyFfuSaEc33U3VK37NC72XZ0PP5rrwDc8VPmBI/e+AyZMUlVh8K6OJmE5nBXCj2svLeinjigi
	3SFbN0KYY2p3Sp4valpuyg26dm5zWDSAUmn6criymbrQjUsOVSQ6Qs7Fi4dSgNaw64j0cvVTJFM
	zW0MSU8Xqpxponjy6FcayoyGR+WYJFqWGUHtsBnpvfqvqlehYqM9v0oV8p26qShicHyDJ/v1l31
	B0L9YgqUKfdcGIgpawrenxH1GcpJ1niLAQ89ZChDRjo=
X-Google-Smtp-Source: AGHT+IHSFD8W/9aMoucidCPvq+qMXi+IdM35I/qq7pBEKJHsLmkxu5ounpaoHPbBTKQ79HMYjGlkSw==
X-Received: by 2002:a05:6a00:3a1b:b0:748:e38d:fecc with SMTP id d2e1a72fcca58-74cf700d34bmr8770853b3a.22.1751838077394;
        Sun, 06 Jul 2025 14:41:17 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
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
Subject: [PATCH 3/6] wifi: rt2800soc: allow loading from OF
Date: Sun,  6 Jul 2025 14:41:08 -0700
Message-ID: <20250706214111.45687-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144118_144580_D93C6324 
X-CRM114-Status: GOOD (  12.86  )
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

Add a single bindng to help the already present dts files load the
driver. More are possible but there doesn't seem to be a significant
difference between them to justify this.

Use wifi name per dtschema requirements.

The data field will be used to remove the custom non static probe
function and use of_device_get_match_data.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index e73394cf6ea6..db8d01f0cdc3 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static const struct of_device_id rt2880_wmac_match[] = {
+	{ .compatible = "ralink,rt2880-wifi", .data = &rt2800soc_ops },
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
2.50.0


