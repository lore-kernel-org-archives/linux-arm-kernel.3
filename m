Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B102C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOVSGlk9MbIOj4qQTH/OndQ/66dvbhCb7zwun+5/sJk=; b=GVnL5GT9pD2um5bL3rmpK8kKX5
	katSp+K6HfrPEGx7opTrmUJPTeyGvnlbRHshGudE6fdThw6mhFWs1BFcmaQDWmJFYF8mImEyz998J
	pwEbhC0gKmOi0lG23LmcOWMxOPFSSimgEKoFQpyqPU3Pvfgl1B4kpPQSPZrOX9gz/QjPW6Hgy57LW
	vXhYVWKrVeVIryljl617onLM1R4EQxVeoeiWKDI19PShlgmWeZyMOmIlsKSPtoBquFtbWRqHdp/p4
	JifRUBfz7BLXp8oKRVtp4LUy2Vc7+oN0OhgLiaEikd9xmIX0OUaLPjbH7ocY1+c3bi2WGNOHaDCPu
	m2RLfkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKfm-00000000s4w-12pJ;
	Sun, 09 Mar 2025 17:42:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRY-00000000pt1-0fF2;
	Sun, 09 Mar 2025 17:28:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43948021a45so29788015e9.1;
        Sun, 09 Mar 2025 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541282; x=1742146082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOVSGlk9MbIOj4qQTH/OndQ/66dvbhCb7zwun+5/sJk=;
        b=U8nKj+I2IzopHSLvAEQEuSTQVCghlG2xwW2vwIz6h5DMqvUztj2v2+1XdDVymlAcM5
         ew27A0ipAhU0PxmGm2ueNHYgO1Xg/FZucLQvJ04upfpML74cSC78fMI7l7VDftusozbH
         5m+pqipxoGNuLcZsWmGSMe7B7efX8btP892kM1QNPmoRGniuDzavWTE3HmWN3hTKMGyk
         x7F1acG+Fx60T2+xLHs8rKpJvmSSBQJORUSc+hLPmB00tB41PzyYPqYipiZl5HhaMm8r
         LcQKkuz730t0VRx05E8dp/Vp8Uyb6epAwnXBfH5dzX7TeD+o8sjZr41f4rO99RnmHQn0
         5PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541282; x=1742146082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOVSGlk9MbIOj4qQTH/OndQ/66dvbhCb7zwun+5/sJk=;
        b=eaAeyE1WicQaheV0j7Z+WfSJQ45d020cgkL9gtCP93mDqP7yFlnMA8P0ADBgWT6Icr
         s/apBYEbhGR85tnvWaSDn3lRLF6KJ5Dp1lXTJOnLnbm4bzt9lIX80p71ucr5GXrK3CDi
         CiWvhxNbHSO8ndqg20FJSsp27LQMal0PA8CUAeaUJ8tatuc5lOtvh2CdRILrBqwPTqNw
         h9v7Evp3tf5PsbSo5lnBFXKsIkvkCgC+J7XcU8i95rlGonuc0CZxtxUO872yZcN9vTpi
         eccxzIOEYL6PO02KIWLCbfoBI0VilZ7tiZ81P+PCzMTA0xi/eQZxzMladGxs/pMlp3rX
         Dw3A==
X-Forwarded-Encrypted: i=1; AJvYcCVLJg0X1eU3Qv0lYHt8IoQETDcHquzoSEBKxBuz5dEhXgjvP1v8YYst9ENw8gD01jGBei+bwlwpCh+MHaS09sh6@lists.infradead.org, AJvYcCXbyL4hEnuIJmweABsRHhe9Z1cVLDJ/nfkQ2evkrC8sLUTRN1FvELYjIk49WTF84vBCT8A2I8Ww6l/nXbe1zxU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwlylXMLilugyGGkuNOyO2miNEe7t8holWHNBZkr8xVMwfTQje
	Hef7j8QGg3IpeZ/Fm+lcOfNgwwEVsjgAf37dyGo4hBm8PsBWdhMs
X-Gm-Gg: ASbGnctxFyGLvxcc1zsPBvtaPxB6+Zuy6cQnngl4ZpNCbSmL1JpdCUKqdGwWt0DQvYo
	lQVBqUvWQ0ohMpFnYnhUhQrORzkcofqoxwPz0Hj78xDgdOG7rlNvqWzqeFbta+WzLcBigmcT68p
	NxPE2lIV7/XtZ5FxV7lIglkTmC+EIQpdzoD/eWGF/CpjSmvuyOpMxGc5mQiiWEsjJBhxDL0j3hN
	MgkSTIMGNE15gFTmQtpJFvvblcDdWLBsEa+CbhEWgfR78yZgHRfwVnLh0BZhTNxlzDI7MAMqxtE
	BrQSykBXGFBwVszSotJggUUX1Mbu4dYQfFSQz0kIYJX8lukURFPzSW3zgjxlfJi0tGhhjuz6Kez
	Lz9lBtohLDTLOY6paAzRG0VMr
X-Google-Smtp-Source: AGHT+IFQNqoLJM1g7t2UpEImBkVLLifEkcARk21L/1UDJINg+bdHLPSO9tjE2bg8XfIXEsBW4bqbxA==
X-Received: by 2002:a5d:6d8a:0:b0:390:eae5:5196 with SMTP id ffacd0b85a97d-39132dbb3b3mr8164112f8f.38.1741541282456;
        Sun, 09 Mar 2025 10:28:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:28:02 -0700 (PDT)
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
Subject: [net-next PATCH v12 08/13] net: mdio: regmap: add OF support
Date: Sun,  9 Mar 2025 18:26:53 +0100
Message-ID: <20250309172717.9067-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102804_197586_87D9ED42 
X-CRM114-Status: GOOD (  15.20  )
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

Permit to pass the device node pointer to mdio regmap config and permit
mdio registration with an OF node to support DT PHY probe.

With the device node pointer NULL, the normal mdio registration is used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c   | 2 +-
 include/linux/mdio/mdio-regmap.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index 8bfcd9e415c8..329839ab68e6 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -90,7 +90,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	else
 		mii->phy_mask = ~0;
 
-	rc = devm_mdiobus_register(dev, mii);
+	rc = devm_of_mdiobus_register(dev, mii, config->np);
 	if (rc) {
 		dev_err(config->parent, "Cannot register MDIO bus![%s] (%d)\n", mii->id, rc);
 		return ERR_PTR(rc);
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
index 8c7061e39ccb..23fc2dd9d752 100644
--- a/include/linux/mdio/mdio-regmap.h
+++ b/include/linux/mdio/mdio-regmap.h
@@ -22,6 +22,7 @@ struct regmap;
 
 struct mdio_regmap_config {
 	struct device *parent;
+	struct device_node *np;
 	struct regmap *regmap;
 	char name[MII_BUS_ID_SIZE];
 	u8 valid_addr;
-- 
2.48.1


