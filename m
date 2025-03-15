Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F604C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9cj1rDP/cubKfbE6LHAYD/iOcx4KqaxRMhogz7zaTE=; b=L8cIidEc40TJCc+NTlfwxSNfuJ
	KOxZexpT96MKMWLNM9GiE9covfiye2FSYB3+mFcfDYgmK8Nluz5gof9C9lhnRs0O86k7QCHK9/nQC
	r0TmShSFnmq5fBcf1wT851ZKMiT3oyxC+MoMQCIWt4ZroQvRcHQBuN0q2tDp4wxmiJjsvS2S1lRYV
	6mX6kCRyb++FZHRi0aoIHKCf9oIDP6vSoWe/r+UrUdG1u0v/h1SejegZNG3O//BXlfNNBnz1mIgDW
	fkj4T4IaZfyw1WOMgrfuS9ZWWlFNlqqi97Y77mLuCWAd5h6WhpDiyfY/exgHXt+QtjOeNqNBErucY
	AVsRST9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTvm-0000000GZ0G-3IZI;
	Sat, 15 Mar 2025 16:00:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgy-0000000GX38-2gLB;
	Sat, 15 Mar 2025 15:44:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso4586045e9.2;
        Sat, 15 Mar 2025 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053491; x=1742658291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9cj1rDP/cubKfbE6LHAYD/iOcx4KqaxRMhogz7zaTE=;
        b=Wl6akgg3r/6p2cHyUlLsibB/QHFLv+tHm7N8r8iw1KecjARlUAVLNdyBH4CtvgqAWB
         ODOSJahc9zUtqPcXG22Zh9b7W3lQQMPKsmoaC/LXgXtZO4zXSLKhIlsHl7kg6a62i60b
         Aaum8vHEvZaiCyLaBYe2NvHT807PmhlGNeY8jtKQ+hDcjg94DSatJnpEJMQi+Z58GTzp
         ig1z6cjgvtOZyd4TdstXP6uz4IhD5bAyvxOPrF4kwV0z/YLfXiFP0QcOHTmHYmpufDEY
         P+yECFsLdqpl9pl0CKiRV/hpLkw1RZFhjONU3JwNURRVSkVuiNSR0oHlrj3JAl6DBxd/
         FVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053491; x=1742658291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9cj1rDP/cubKfbE6LHAYD/iOcx4KqaxRMhogz7zaTE=;
        b=Vk3fN3GSa+N1Fsyvm05JKndwMzWTOAQcD/QWo1eXRYs1CgMpXENGCkspFxeEtZJlyK
         n661olwxNsa3f63bqU5QVXgJ9/PoV9QNgl3RsZehwMX2Yt227SJ+IdcQJgpBX73n1EBi
         teZPL9Xa7yw0lkXDnrAH6smn2+ZVgm6hBfL2uQas/sk8FikuSUIAqZ4kzOLiwtGBeGp0
         gu7hbJZH2NBIG16LfmPGdvX52dtNuxYKDvlUF49GzxIHlxQEVR09+5a4Z5xh4EITH+Ru
         4J+XpmuiUMeco5EG/cH726hQRude/GS2o6NF2oUn65MQxyQJnO9XCmCJe98dWSsktlVm
         vB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4ixnmxYH3ChIAYTxACbBxytXbX/YACVNdVJgNJ3DR0toHKDcp3E6fmZQmdYiFW5Qao5CgsANDJVTEFtLtxZo=@lists.infradead.org, AJvYcCVp8EyPfszifpwqXHTCQpwsxWKUPJMFUuGp+2IYRnZ/syWO5h1HDVqXkrZNZNacTst3FgMz9F3AQf0VFZOn5Wep@lists.infradead.org
X-Gm-Message-State: AOJu0YyLjFaZM89BiY6ofZ3060w/RU3P2OgK1dr+sTJolx+nlTRkAaPF
	7ciNmntVf+KahC7PrN+8bBUrFGOyYEDEXrZaWSkbURs/EcI3xMWn
X-Gm-Gg: ASbGncuWvgUsbiOR+Fz2HP7bM0Edeq3NQkWnURdYFrBQSka8tW/FkCKWTOptGeDfhpA
	hIWua0hV4BBWWwFVwmGKApjW1HKxEhsNiBb6fl0iBVVLCHazv8GPVp2PuT87Rkkb2lSKTHgEKsT
	DwPnIEwV28wcKz5TiS6AJW4RkGFJEAtxtRBq7f8Ets8euPGo1ddqIz0q8tEqTGi+vLKYOs3gy4H
	IDj0GTFzXlzWnesVSchIjq4xG2c8Pi0XlnPugE39Ctr1PACjJ2j0ssRJf9LEYxEGKd296DyM90R
	a04ciz1j3wLyszUeawMNiKgRwTfbIztCi9U6MKYdqLiztCFRqP3QdB4tqObFRg4BEXPeZ4pIIzt
	5OxhodGILWcrrGg==
X-Google-Smtp-Source: AGHT+IEOhKkyCgm/ebHsk4V7WwKT8R78FhVt6pOGjtm8mBgSx5vzbp0xB3tzUWDN02MyZuAGCjf4jw==
X-Received: by 2002:a05:600c:45cb:b0:43c:fcbc:9686 with SMTP id 5b1f17b1804b1-43d1ec66d39mr56598865e9.1.1742053490677;
        Sat, 15 Mar 2025 08:44:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 08/14] net: mdio: regmap: add support for multiple valid addr
Date: Sat, 15 Mar 2025 16:43:48 +0100
Message-ID: <20250315154407.26304-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084452_675196_F90EB556 
X-CRM114-Status: GOOD (  16.14  )
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

This makes use of the new implementation used by C45 to encode
additional info in the regmap address to support multiple MDIO address.

To actually use this, support_encoded_addr MUST be enabled and
(indirectly) devm_mdio_regmap_init must be used to create the regmap.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c   | 8 +++++++-
 include/linux/mdio/mdio-regmap.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index f263e4ae2477..ed0443eb039f 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -113,13 +113,19 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	if (!config->parent)
 		return ERR_PTR(-EINVAL);
 
+	if (config->valid_addr_mask && !config->support_encoded_addr) {
+		dev_err(dev, "encoded address support is required to support multiple MDIO address\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	mii = devm_mdiobus_alloc_size(config->parent, sizeof(*mr));
 	if (!mii)
 		return ERR_PTR(-ENOMEM);
 
 	mr = mii->priv;
 	mr->regmap = config->regmap;
-	mr->valid_addr_mask = BIT(config->valid_addr);
+	mr->valid_addr_mask = config->valid_addr_mask ? config->valid_addr_mask :
+							BIT(config->valid_addr);
 	mr->encode_addr = config->support_encoded_addr;
 
 	mii->name = DRV_NAME;
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
index 504fa2046043..bb0e7dc9c0dc 100644
--- a/include/linux/mdio/mdio-regmap.h
+++ b/include/linux/mdio/mdio-regmap.h
@@ -17,6 +17,7 @@ struct mdio_regmap_config {
 	struct regmap *regmap;
 	char name[MII_BUS_ID_SIZE];
 	u8 valid_addr;
+	u32 valid_addr_mask;
 	/* devm_mdio_regmap_init is required with this enabled */
 	bool support_encoded_addr;
 	bool autoscan;
-- 
2.48.1


