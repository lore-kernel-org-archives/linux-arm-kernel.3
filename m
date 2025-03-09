Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D4C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QM0UO5m9vnNon96+OZmUjWH0wQG7viZoaqOeY0dYk4k=; b=q1ih7qDT9FLPYpnZ93We3+gM92
	yRqAg/bIYGs+d/wGpf+i6wl0E17FXVEmYyA6mNrIX4/fkOvS2/DVZFFOSPbLje1gg8BC0q598awhC
	M3qiElptSSTkscn4hIJBBKjX+HrEwZo46o2+ADedY2Et512eSTYBmH6Piip2GmAP4SMejGOEpWBOR
	IH6Ve70i81aWpj5O7lQEUWZkIWrjZuTrfiFO2D5ylWFUhribvkIpsA61vgQsUYjTBoPmflmaYGXsC
	17sz4ZfJ8KxAvWHeWr2c19naNPuyebswXVEoqmwm9kG6MTlGVyZDp2ujr6zf7zLbJ5LlmXVvpRpu1
	EvFfS1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKeB-00000000ruL-12zq;
	Sun, 09 Mar 2025 17:41:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRW-00000000psG-0uTn;
	Sun, 09 Mar 2025 17:28:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3913d129c1aso664506f8f.0;
        Sun, 09 Mar 2025 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541280; x=1742146080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM0UO5m9vnNon96+OZmUjWH0wQG7viZoaqOeY0dYk4k=;
        b=KvRnK3xfG/GZMgLeb21DliCb+45uOguXjYgM35HwL9duF0E/tZP82aodIUq2r5K80b
         orDyuU0rDhXThFkr+qrd9YwXePGW7LHthWEN6oq1cH19vKDXMYAZb/jXyIznjQxnYqCc
         f5msz7Szegc9jvd0qifbLWB8X6W1GJD74Kwpu8m42/aP39WBqg4BuPDsV14wGNvDMlxy
         1WJxEyOpqiLED8TiyUPdyHDk5OQTOf1NWxnteALfDDTnWpAwykKGmQCROtoHuMq0Y6TV
         1MdTrhMANG/3FXY4m90PgecWwJfQvSOLOoRL8TPA6vUXbnP4sQ6EhZbPx26j1RxBNj8h
         eq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541280; x=1742146080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM0UO5m9vnNon96+OZmUjWH0wQG7viZoaqOeY0dYk4k=;
        b=LQwLobrI2f7dTAxzRrN4Q1a/tkXyz4KGJe5cUsLLqu4OgFyEpr9kVebqrl/vv6z67f
         U1auu5Oz34niCUOUe5mmRB5BAk7mYXxaeo2AQwZd8qpES4ZfDokZa+3nOEbM3HsiXtNK
         hKEvfLC7dhYLldcCiFMPZkeTvgtPTNfCvJK/zzB1+oyMUUu5EOI5L4ymF+UhXvpIirR/
         MZcDeLpJoXP0LlJ0IDj9jR1OYKc7E1BgX8Sh77BK8nrDZTqm6AjGFBjkN0dBU6hIt5qa
         Ncuhzp07rLwtWOCaLn+igJ1BSHkLqEm6flRcpRH2BI+tcQlRw+eZrHzribOVVlr59yRD
         LjEw==
X-Forwarded-Encrypted: i=1; AJvYcCU12R2EE6C5cKT9uqM9eKfyVEkB22gup1a/HcGQYQ9EEPnzlZrIk3CeEX1VT7OqgIb98lFzqOpfEkp1CKbtlss=@lists.infradead.org, AJvYcCXvIN0v39fxJiV6NfbzgtBicyqIp9ZwCgaz6MBjGGiEMnponAEGRxrTrBIXR9EsXvXhLira5ZgLp/svTAYTdDKf@lists.infradead.org
X-Gm-Message-State: AOJu0YxXHnIrrPoO8EwxEL0m+ygcHJWDRImx8opSgu9R47pBK1b0RMPr
	2BRXwVLZqZh25AGUyfF2vrekImQmopRgfm746VEpxqkSWi91gB7v
X-Gm-Gg: ASbGnct+o3F8hZcZC/TB+QprV1M6nvRk3WvWkiCtbxMLv7c3pQBgcLGBXTQ3KaSA2rQ
	AeqfyYUy+L4swDuWmchsLOpuIP+rD74uDlggDaqmKTCVc/pTNkWl91a0GvvjDafIImkxCSeC+of
	z/k+Yk9eApzd1wgUrTTPRfmss3FWIc11zJ58FdjVAnMxPqX7QCAQax04YbSWsUrob0kwSXSz0wo
	JKNjHdxZimYY8N3pU3LCgsvQafa9eUGhhNUY7qjEDaMxZ4O97LYZwnDyjbpVdaMKU4VlmM1wh2Q
	GkDGQkYCUzJPuDWARmrc9SoXi6NMWKMs7JKqx2wrUymFJdOSwjVlB+l3oOOg9M2ys5v3DFXebCj
	a6fS84F1Rc1xtrQ==
X-Google-Smtp-Source: AGHT+IFJc324nOp0xL0joexmATC9oINifYFsm58q392dt0UDBoQukBL2fNzDysktpqNgakVylLKNhw==
X-Received: by 2002:a5d:5f88:0:b0:391:32d5:157b with SMTP id ffacd0b85a97d-3913aeff340mr3650013f8f.12.1741541280518;
        Sun, 09 Mar 2025 10:28:00 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 07/13] net: mdio: regmap: add support for multiple valid addr
Date: Sun,  9 Mar 2025 18:26:52 +0100
Message-ID: <20250309172717.9067-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102802_253018_2EB69646 
X-CRM114-Status: GOOD (  17.91  )
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

Add support for multiple valid addr for mdio regmap. This can be done by
defining the new valid_addr_mask value in the mdio regmap config.

In such case, the PHY address is appended to the regmap regnum right
after the first 16 bit of the PHY register used for the read/write
operation.

The passed regmap will then extract the address from the passed regnum
and execute the needed operations accordingly.

Notice that if valid_addr_mask, the unique valid_addr in config is
ignored.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c   | 14 +++++++++++++-
 include/linux/mdio/mdio-regmap.h |  9 +++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index 810ba0a736f0..8bfcd9e415c8 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -20,6 +20,7 @@
 struct mdio_regmap_priv {
 	struct regmap *regmap;
 	u32 valid_addr_mask;
+	bool append_addr;
 };
 
 static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
@@ -31,6 +32,9 @@ static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
 	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
+	if (ctx->append_addr)
+		regnum |= FIELD_PREP(MDIO_REGMAP_PHY_ADDR, addr);
+
 	ret = regmap_read(ctx->regmap, regnum, &val);
 	if (ret < 0)
 		return ret;
@@ -46,6 +50,9 @@ static int mdio_regmap_write_c22(struct mii_bus *bus, int addr, int regnum,
 	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
+	if (ctx->append_addr)
+		regnum |= FIELD_PREP(MDIO_REGMAP_PHY_ADDR, addr);
+
 	return regmap_write(ctx->regmap, regnum, val);
 }
 
@@ -65,7 +72,12 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 
 	mr = mii->priv;
 	mr->regmap = config->regmap;
-	mr->valid_addr_mask = BIT(config->valid_addr);
+	if (config->valid_addr_mask) {
+		mr->valid_addr_mask = config->valid_addr_mask;
+		mr->append_addr = true;
+	} else {
+		mr->valid_addr_mask = BIT(config->valid_addr);
+	}
 
 	mii->name = DRV_NAME;
 	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
index 679d9069846b..8c7061e39ccb 100644
--- a/include/linux/mdio/mdio-regmap.h
+++ b/include/linux/mdio/mdio-regmap.h
@@ -12,11 +12,20 @@
 struct device;
 struct regmap;
 
+/* If a non empty valid_addr_mask is passed, PHY address and
+ * read/write register are encoded in the regmap register
+ * by placing the register in the first 16 bits and the PHY address
+ * right after.
+ */
+#define MDIO_REGMAP_PHY_ADDR		GENMASK(20, 16)
+#define MDIO_REGMAP_PHY_REG		GENMASK(15, 0)
+
 struct mdio_regmap_config {
 	struct device *parent;
 	struct regmap *regmap;
 	char name[MII_BUS_ID_SIZE];
 	u8 valid_addr;
+	u32 valid_addr_mask;
 	bool autoscan;
 };
 
-- 
2.48.1


