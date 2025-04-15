Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CC2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uQ/sNjG6+jopWKiMcxNEdpFMYBYSU6NzwaXfhYsGhCM=; b=xuMTLzptLeE1zj593KGCsltMQ/
	HueLhVpTa8Bxb5gC+fJKbLJcL9BOoCCxrW0su/5SPNtTSlgy2STCXsmg7IzXX4Rb7v9UcH/9knITz
	lEWwRLRiDCMDF8VYXzKFe6VHe/WzZxNyPlYgFaoflO/aoMDFp2UwNB3tNv4ShRfrTGnaePMIJ+Fm0
	xYSyUhFd3FAEsVQi/TijtfP1oTWJIhfoMhFyVixIG3K7YNVWnXRiAgoqGEcZOF2PZmYFBfWIKA1tz
	cgcHcsHXWiVRL3BYsNhrq3fg/jHQQv0bRlVRZgi9IwBTwjudxrZXtXBoqHk5kzp/3nyVoQVdD7pct
	t2VauBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4edO-00000005aD9-0AGL;
	Tue, 15 Apr 2025 11:39:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dvI-00000005QJb-0BVi;
	Tue, 15 Apr 2025 10:53:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4630950f8f.1;
        Tue, 15 Apr 2025 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744714426; x=1745319226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ/sNjG6+jopWKiMcxNEdpFMYBYSU6NzwaXfhYsGhCM=;
        b=PO5ctOh6UotiVOxxXwqDiOH18gd2BSRBSXVlOW2jksa0k+YreSyB5L/wiHTSW3OKhA
         wStPB+GdRvCiMlN50Ulg5kFUEr9lEMtDipKn16mKuq41cy+NlCOPbIizuE/Z6HpH9mVm
         wc3uqOE2t2s1OfdyWEQtuumIYWdu7Fl72vv8zoCsVHF8FOI8Zs6wVxsaAuKxoruwDHR2
         bqvDAascklCXUcpyNtkk27k4TGYvj88cJbEB/VPCL9rrd/hlufTqtI2LY1FV10UNJPIp
         DrAccymtC8nIJnnzGuCHg72YO/6xXHX1TJMua533Y6fhdjfZzced+7TtllkalIY7fAgm
         b74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714426; x=1745319226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQ/sNjG6+jopWKiMcxNEdpFMYBYSU6NzwaXfhYsGhCM=;
        b=FDy5c183Q5IePVGKEK1UemcY92PD3nmQ7I3lPkHzHcg/HXeNH+97Ksbt4tcQWkFwZH
         Y7tuMQA4PP2LavolMq05AImuIqxELRl+oaQGasF7tg0IRNqhE/k+T3jnKA4wczZ4cLAv
         wB7iVJfIsCU4yaqo7hqEBDPuNXYZwIKMyn09JgIg6l9TNAuG8/HbXs4Uecavd1gTVD9h
         HBGf07zTs9FTpa8SMaqL2SFy431/XdSawFwzk3br1ez2jx3qNHv7Xop+Q60KHNWlmMsM
         vPD0GWp+iX3sgrU7sDMYLbyDouuoP4YQYcsQi2itlR/4WcldVBnmdrTW6p4A5an6JVCJ
         TyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGKoWFLJFKkeLcb2U9q3FWLL0QqYSjq+58Su5VeTyY+sAI6+ep+NArYbUK/UvM5zQdC/YQzlKS1JoE1dQfRvU=@lists.infradead.org, AJvYcCXEqyBv+v++01O4Rzq+km7dt1t9FctqSCwstxHWHKZDgGIZpKa9l0+4y5HrPvcIv4gYnhB300hVaUUNjf6dVmKz@lists.infradead.org
X-Gm-Message-State: AOJu0YwcrogG4H9hKwrYo8NmCm1payxIPRxuHlD7cGvQ/91c7C04aT5C
	IdptjC9/ylnnl3gK6EDNJig6JLAB7l7qHfgsVS8dVaCP9QFSYrnX
X-Gm-Gg: ASbGncvdQJ96gWYBPEwuSzpdF1aPBYLIncU8G/KPrwZqrbGfPDPFXEbilzPXTOBxwyD
	tIiGo5OwdVoUDPsXOjzLilxpkft+clZXMb8JGQDJShb4fwT5NAaFlC0ngVrU0LpqSd/VNAGBUXd
	Fuw+umLw1NV36oRLLX9kY5DM4gjpIWIpnXB6a5v+cfuUUoqzpAbg0fx/XqK4SvFeDGrMG2ShdXX
	Zs8RerDTcDIdQ5mGWUxzLH+B81/t/+L4KtbqBROE3fR4LK08eXuo1MGkT+bpFP0lua0kux7XHF+
	mJB6TChsQR0pyosHuYu6yDoWAvEJa4H+XRRL+XZmynrMWBVOUXryrwasONqsghm8Z0ze+05RN2z
	Q2Mm9Yovmrn0+v3Zjs3OkaVy2YA==
X-Google-Smtp-Source: AGHT+IHAKzbyn3QbO27Y4E/NIYe0sT0rh6l92PwWJFTu6yx26yYGsnbr5xQHCgxMSU5AqBF3VEZhFw==
X-Received: by 2002:a05:6000:2504:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39eaaec7564mr12366347f8f.37.1744714425663;
        Tue, 15 Apr 2025 03:53:45 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-95-100.retail.telecomitalia.it. [95.249.95.100])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eae963c15sm14199021f8f.13.2025.04.15.03.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:53:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Simon Horman <horms@kernel.org>
Subject: [net-next PATCH] net: phy: mediatek: init val in .phy_led_polarity_set for AN7581
Date: Tue, 15 Apr 2025 12:53:05 +0200
Message-ID: <20250415105313.3409-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_035348_080076_7649DEAB 
X-CRM114-Status: GOOD (  12.32  )
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

Fix smatch warning for uninitialised val in .phy_led_polarity_set for
AN7581 driver.

Correctly init to 0 to set polarity high by default.

Reported-by: Simon Horman <horms@kernel.org>
Fixes: 6a325aed130b ("net: phy: mediatek: add Airoha PHY ID to SoC driver")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index fd0e447ffce7..cd09684780a4 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1432,8 +1432,8 @@ static int an7581_phy_probe(struct phy_device *phydev)
 static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
 				       unsigned long modes)
 {
+	u16 val = 0;
 	u32 mode;
-	u16 val;
 
 	if (index >= MTK_PHY_MAX_LEDS)
 		return -EINVAL;
@@ -1444,7 +1444,6 @@ static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
 			val = MTK_PHY_LED_ON_POLARITY;
 			break;
 		case PHY_LED_ACTIVE_HIGH:
-			val = 0;
 			break;
 		default:
 			return -EINVAL;
-- 
2.48.1


