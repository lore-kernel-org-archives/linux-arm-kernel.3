Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E99C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=; b=reOWjmDr6yPk9yxeV0F8HfbiQ3
	z6HlZzGyPJkTYCMiYV1MIskkOL3idxRVtjtXY8vkAa5/WV5sL+irSUlcBnOiW+ZRqCPVyJoLMDUPE
	cFH8zFx6Dm576zUYwZP8gii+1uFQGpc1gi8tJiLQSvSedS7A6jOSvMnEux6Y1jYSbLLzlTsszO91F
	F55sQVK9fO8CTqb7hluhwVWH9BoHWbNRNRUaQgQdugkEEBZmD9t9ZYRrNKfBX+hLpeqwal5SL3DJI
	iW2cLw8ef5S9j0zh+57Nac8obkOQI4p9Zw4VH2sM9o+ttMSGvGsuVnno98mgMDOHF6J9SC2BgUpUo
	0b/jXRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKcZ-00000000rkl-3rA8;
	Sun, 09 Mar 2025 17:39:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRT-00000000prS-3cal;
	Sun, 09 Mar 2025 17:28:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39127512371so1890502f8f.0;
        Sun, 09 Mar 2025 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541278; x=1742146078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=;
        b=VyumOpfhj6PggKITb3wd5qOdgQ6Ssi+4N4Fda33NUluXhUvIU9tz4g26i4NPmYuguB
         p8a2Buzd60Ju+LfmXNRnL8jayIHpp2SFtlnGsel4fLODLtkV7ZJqUW0av68scyIPEC4+
         hQP3McoGRMaCaHVa1dH4+sNoqrJM8yb17eZTGNHA1/EcGSR/f0E1GDnUxJv2C27x0sc+
         X01w9aPcbyHi8x7stclOiDY2d5GeiHyi6qDSczeXlYjQlAHZc6APuqKtVyTtwAm+9NSb
         MPyKhhuhNGBG3dksqSoL6gc50N+GAvcGqHwEsHZC/8L5XYaFF2Gjk8e3MfTU0T7gAMYA
         xFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541278; x=1742146078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEeHqPbidnUgfl04t+LLdBVbgy41Di7XU1dGgXeGDSo=;
        b=EwAXKbqZPgOf1O/c6iBo4dFcrOKwLEjM/SxFaypuUy8J0LlTkp5VGSbEazVVVullEE
         JaUUhb09D15Mecalwye/GjHyIbZBo6pgFUOuoHQJeN0RcMF/8CtXN10G+qBllgP2VWa2
         6XA/tprNpI8y3e/X47IM4gADLtcZ7R9OLbxW8YCnIX0GrbHmG6o6BhYTJzo41kdHI5D9
         15oPTJhX9fSYJGkaoBTBGhdliPeVbkI238FLyTzKinO63/RjQ7c3ppEyfIuRv2ejzDh/
         bVpHQoizAGpPsSa8FgJzIXMywqc37TEmEO1WeaxoGHcqnycxE88XHTwNEL6aJ4I6syux
         sb1A==
X-Forwarded-Encrypted: i=1; AJvYcCVQkZDnHAzNdSD3LnCaOS9HvuLORlgIlvxi4ts26NY0yVuiiR/KHUuMVP+YLTCay4zC900k1S+sXGA4s/yLex6B@lists.infradead.org, AJvYcCXn7nTYk5Y7MUZUxy0/mGAYyWGz5qsVIe+KJFeC4FqXvHV82TEzR+vKQC6qLrFWrhWdOQ3UcZN7xuMFyzLeEn4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF7W+SZTkVETr2xh2v8EoxC6Ozxb2j5YLsc4h+17tJWV7C/Hwg
	IZ52xJToF5zkSwDnKYllprZcOfTLr114+ZTRrhXZ7nrPwVFoF5k/
X-Gm-Gg: ASbGncsaUoWy6Js+aF03B4gealposkxNk79CAVQN3DmNCL/6wjwQHuuuEHGTB2JXRGD
	wWbtZ5c7m590Qeg4QLu1BNUHhOuN0iWspHY+pxR+XuQFLyvCTH2T1U72pCYXiHMtb3xaqt2MDsM
	ZZfEPrLBGirXjkPe2MgHbTVe0UTbUtNRbDazbcV057iPU/yqMgcUtuoxJ4U0CuQ/Z4OtMaTpdnB
	qxELtCdWL/vYh8I+jQ1af0ejKT/vkamb0HrILJNLsy/JjQmIv6+HexdHrlfHTpJcCa3YgPWB1we
	CZPYaa4meatgTbqIR90AJO8IJk0p8te6gVqHUVzlNJXrbDDkhZZ2GIWGYtGTWyEbaH9g/ykdFGf
	bUL3FFSyb9BhyWw==
X-Google-Smtp-Source: AGHT+IHPyf+ITAt4IdXJ3Q7OJg+5A4g84Iy8+W1S3hiTKecvKmr5XziE6pPQBfmvhL3NRlALNMbDDg==
X-Received: by 2002:a5d:648f:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39132dd6934mr7733020f8f.43.1741541278531;
        Sun, 09 Mar 2025 10:27:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:57 -0700 (PDT)
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
Subject: [net-next PATCH v12 06/13] net: mdio: regmap: prepare support for multiple valid addr
Date: Sun,  9 Mar 2025 18:26:51 +0100
Message-ID: <20250309172717.9067-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102759_906745_ABDDE2A8 
X-CRM114-Status: GOOD (  15.88  )
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

Rework the valid_addr and convert it to a mask in preparation for mdio
regmap to support multiple valid addr in the case the regmap can support
it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index 8a742a8d6387..810ba0a736f0 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -19,7 +19,7 @@
 
 struct mdio_regmap_priv {
 	struct regmap *regmap;
-	u8 valid_addr;
+	u32 valid_addr_mask;
 };
 
 static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
@@ -28,7 +28,7 @@ static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
 	unsigned int val;
 	int ret;
 
-	if (ctx->valid_addr != addr)
+	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
 	ret = regmap_read(ctx->regmap, regnum, &val);
@@ -43,7 +43,7 @@ static int mdio_regmap_write_c22(struct mii_bus *bus, int addr, int regnum,
 {
 	struct mdio_regmap_priv *ctx = bus->priv;
 
-	if (ctx->valid_addr != addr)
+	if (!(ctx->valid_addr_mask & BIT(addr)))
 		return -ENODEV;
 
 	return regmap_write(ctx->regmap, regnum, val);
@@ -65,7 +65,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 
 	mr = mii->priv;
 	mr->regmap = config->regmap;
-	mr->valid_addr = config->valid_addr;
+	mr->valid_addr_mask = BIT(config->valid_addr);
 
 	mii->name = DRV_NAME;
 	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
@@ -74,7 +74,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	mii->write = mdio_regmap_write_c22;
 
 	if (config->autoscan)
-		mii->phy_mask = ~BIT(config->valid_addr);
+		mii->phy_mask = ~mr->valid_addr_mask;
 	else
 		mii->phy_mask = ~0;
 
-- 
2.48.1


