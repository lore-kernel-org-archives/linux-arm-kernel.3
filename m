Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B31C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B8L3gLHE0iXx8zQGDJ8LlLcTKVC/8dXUo9ajwXYWTFg=; b=CWRUlkvZdTTYTH6USGdni8Wm3x
	VBJeTsc2p3Nq9uYVW/ulAZUuiYy9QBW5iD8g2McFWnIEMknKJnVuBQA++/QNArIBdPlMBPgJwnSn8
	QQ2ZNyfd2zCKMzwHPZgymScpfsy4ve4qqUKZOnSIcTdIHRH9SFj4V/fXmQ7LLq9Vo4kU2hERQDTRP
	qM5zQbTO1ik+h8iNgg4LNK4uD55tkR5JxUgKmP0Hfm7VW8mV2oQlgpSvk1ag4adBl5omjiRO9vAPB
	KNeTTXALWf3UEGBW166TqeP78ssd7788nbk7yyX+Gbg31HyD2uvbMpapMFKtl8gii6qHiTZBTtuAn
	QYuVdpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9qY-0000000HFPy-3kYk;
	Mon, 31 Mar 2025 07:46:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9oq-0000000HF92-0vgm;
	Mon, 31 Mar 2025 07:44:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so25541705e9.0;
        Mon, 31 Mar 2025 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743407066; x=1744011866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8L3gLHE0iXx8zQGDJ8LlLcTKVC/8dXUo9ajwXYWTFg=;
        b=OxZ3CX5TswxXjBSbi9jUo+Cs/t+/43aqSFAvPTm/we8FcpkQlAt8TE0eOxqFD2Ydbr
         CR+n1M97fnUSm5M59ap5aE8CJsf94kmhbBzyP1WHEY13yi2F/gT+wb5uymGAxS4PxHJp
         zg9bbSWqLlkn5Mxt16f9mvqBvxxUaqZk9SYbvBc1frDBkZkX03LVz7CT6ppXc0d6Oa81
         rLKnWKGuKia02DZ7n9I46MM50nyZtglbabWPwm0U2yEFaNdImSfS5gjD1FWPp3pJBkqm
         wyuM5K6UpVmhwaUs44vp25QdF2rRtn/KrGeYYHBzIfrDjkrr6Tn/wlCs2zKrJlc7heEP
         4Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407066; x=1744011866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8L3gLHE0iXx8zQGDJ8LlLcTKVC/8dXUo9ajwXYWTFg=;
        b=CyJU1L8AVvr7qZ05shfXaxwDYri6HJdY7IMHrKiho7EnlmR0mjtj6inWEtW81QmkFO
         P6SX+lZDaUJXYZi8zLldPFEaNyq64qj7UV7D+JCNgDYst9Cg12G1mIgLzHz1pozl+WEm
         eetigqU54xrHjPq4Pmh6wS8gmu5zXChEf27c8VMPQfjEnbqMbO4ADu/Z6IbH5dKxCk4N
         B3x7DSm+QT5NqpUqkEHaqZELy3amdCOHA2Pe46c69L3N512R3vukTJBGD6WOjkwXSqA5
         2XDkMEMwy4LGru6LkGXE6PzqZCFlgjw34oAeIxStlIJ871tILVyNeCdWkfMDoCr/S9/A
         5gew==
X-Forwarded-Encrypted: i=1; AJvYcCVF6qjXieFJ506Dqylp3Q5aVY106Gbk489d/cAyhaxPHfR6F4Q2RE419jmACBZuTgbER5MFU25Q40d2FQa8@lists.infradead.org, AJvYcCX2b3ZCJzuc39AID938bA4KzznlimAXzPdyh5vkIdfINP5VUa+0n26IRxoTIJAp9S2jgKRMSncY+gSb6MNP0b2VcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkub36BOtEKkFsxQTeoYTIuiFNtJxrEfX19GF6nia8tm3ENgaw
	sq6rbUEut1pmcPM9eePKufp6iVRlsZG/BqjE9NpowMZgrSXtOC0x
X-Gm-Gg: ASbGnctMuisHnTF7JM8TgfAYlM5NCN0r2EUmNf8HZOnYiJo8WIjlHcgvac2OZBjyLXk
	cswqt+HzNqEl07fVlxFLYnhfhLAuKKIR5JTWW53m5X6IVzE6eJsKAd/ZbHFsW5Tc25kmP+KjPS/
	6KX3LVvBogboNg5K2t6IMIDdMRhYPnJr1sPXx3jlnPWJYk+EMC3RaEGmVmMSQ0z8tR/hhyYwlgB
	R7vlXsdxPF9hNMCSpXt3CXHI9BjdTihTqe/jaMBgKNfFGfzg9X21J795NMl9XKSqLnSDB8FRow5
	gk3EGZkfVERId1PQXxuRW+3OvnG81kIQMztYqWkbjVMO5tCMeQ==
X-Google-Smtp-Source: AGHT+IEU6fWpjT/iTPyqpawIrj8kideGZRhmNQegpvlEXo12tPGNrAQ7TR+EVkOdgUcKFpnGqAnuvw==
X-Received: by 2002:a05:600c:5119:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-43db62bb97dmr49667695e9.21.1743407066132;
        Mon, 31 Mar 2025 00:44:26 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588e9sm10812284f8f.14.2025.03.31.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:44:25 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Date: Mon, 31 Mar 2025 07:44:20 +0000
Message-Id: <20250331074420.3443748-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_004428_258880_DE323555 
X-CRM114-Status: GOOD (  12.81  )
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

From: Da Xue <da@libre.computer>

This bit is necessary to enable packets on the interface. Without this
bit set, ethernet behaves as if it is working, but no activity occurs.

The vendor SDK sets this bit along with the PHY_ID bits. U-boot also
sets this bit, but if u-boot is not compiled with networking support
the interface will not work.

Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
Signed-off-by: Da Xue <da@libre.computer>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Resending on behalf of Da Xue who has email sending issues.
Changes since v1 [0]:
- Remove blank line between Fixes and SoB tags
- Submit without mail server mangling the patch
- Minor tweaks to subject line and commit message
- CC to stable@vger.kernel.org

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com/

 drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
index 00c66240136b..fc5883387718 100644
--- a/drivers/net/mdio/mdio-mux-meson-gxl.c
+++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
@@ -17,6 +17,7 @@
 #define  REG2_LEDACT		GENMASK(23, 22)
 #define  REG2_LEDLINK		GENMASK(25, 24)
 #define  REG2_DIV4SEL		BIT(27)
+#define  REG2_RESERVED_28	BIT(28)
 #define  REG2_ADCBYPASS		BIT(30)
 #define  REG2_CLKINSEL		BIT(31)
 #define ETH_REG3		0x4
@@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
 	 * The only constraint is that it must match the one in
 	 * drivers/net/phy/meson-gxl.c to properly match the PHY.
 	 */
-	writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
+	writel(REG2_RESERVED_28 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
 	       priv->regs + ETH_REG2);
 
 	/* Enable the internal phy */
-- 
2.34.1

