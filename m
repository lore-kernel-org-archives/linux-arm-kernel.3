Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002FFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9cj1rDP/cubKfbE6LHAYD/iOcx4KqaxRMhogz7zaTE=; b=ydrPlAsvuS4+ltGFwyvVYHctU8
	6gzmeNquds4GdrOAgo56N24cZ69Z2uyOOM9V6C7SMKY9b+Sq6HK99pzzbQZ5e5KYkEAsCxmpz3Olu
	igNTzlwiVbxNJU3VNiks5+LsD0pqRgvL+2DT7CkQmmyYXAzcWl3hxVt8sTm5uQIbHU3GpG/6quBEJ
	gR9azai9kaiz/C5dRc89U1/9eYmfZmrMAiBgNTEZbr//NotLwegsdhXNzHFEGyvE5bVwv7gpP3saq
	jkANL18Id0moIVLP95Hsh6A33HlB9E9CP82bQRt0LnatTQxDHfbW4B1w9Bmvez8LutXtlmn35C+hf
	NJu1Sykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25to-00000003aMe-2cLY;
	Tue, 08 Apr 2025 10:09:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d3-00000003W7d-0Km5;
	Tue, 08 Apr 2025 09:52:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so50742055e9.2;
        Tue, 08 Apr 2025 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105943; x=1744710743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9cj1rDP/cubKfbE6LHAYD/iOcx4KqaxRMhogz7zaTE=;
        b=f7fYt9V7/JFjnh1i7hwTmoVGBw8EKFnjKNH4t49rt+PrpDZhEUqhIZ1DIhVye9E35+
         5VJY1EeuzQA3IW6WLtPxpyLffrQW97yayhDhLeT9d162Q6gftKwr5o4LunPTx0XGT2M3
         k898qPI9BmcF3CJmStUOL71Z9nr6/QkyzFo3gA+mFqAQzFpkW8gdyxWDu2nuceQKZ3Qp
         BFzm4HLZBupMTa76TFBg06QnDkuwFWBbfzgJu1MI0XPcwpwgsHOIH8Gjl7w5+bUvdSQ4
         3qzpI278CVQPAUndoseNXzBPLW0DSeCBc4antkRGH91MWcVYY0+FSqcdKvNAOenFh8Lr
         ceLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105943; x=1744710743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9cj1rDP/cubKfbE6LHAYD/iOcx4KqaxRMhogz7zaTE=;
        b=NZzyttBk+ABfzpTx/3C1qOMaoPsC4bi8XhIrLLM4L4oziaMM/7/xKr2tjGgNE7bbXt
         wsGIhRj4Dcz2JxJEeaJEZ6CdD+lQPuL1KhGAY5mKjj8sIicThUe/VJVMAML7k1Q/RcHY
         PYSeEybtgQCS0W/lXrDVBbQO2CnvexNEe5SNzvjlU4ChHj1LnmZNRd5HfrLqRab4FFdu
         yh+AjgfIXKbsP0uw7Rajl900cAxs1xEG3u3nVzKm3WPLszNsf+LBG2RRvaCfdpI/eqxo
         T0Tu7f/tcBDCQq4SRR56Dpj6oEF1umgfK2TQQpidSwQdbYpBouKUlMAIbktd1kPR2c6Q
         Z3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt4D4JAmBbth4Xs4E5+JLCQsE2TWITrl0ioACfIn7xVCfSFD/e4CnVWubmvwDOHLADK7U5H/BqnGc2tPmSndom@lists.infradead.org, AJvYcCWbEZUl/v9s1fUH/uQoLptM+wv1xc1mM/22qHJnF9CwFvzmI5X6jbR3C3HyZIr424EM6dkw5v8RACwWRbIjf78=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmQvFZrrRVcB4ueD8rGYe24nQP8yAwZUiIsUdNZjetj8Jtewvi
	6xsgXx3AIUM0WpRN+ASqLVc0DTBn2mD5M/7fs5h+xwVbbY/18vLF
X-Gm-Gg: ASbGncvl0CDJGiKDLd1sE1ZJnr7Ishx9uOu7/Q+VnYzE7qs6hynxGy0ruu/KCxqaAse
	oOornXzd7jN4JbvANID2YWi6Y2HA88oIGTWjPTc3Ok1gyrK1ypmEI60K01cdt9dkTAQP5X37Yk8
	MixCGgW6AnpO5VMmD2Zoh8YDZrImWA3TFXyH81bajTEEvQiyI72zI6bEU4VlEo1TbKM/PfxlApO
	xP8pSUj29ZCayDmMsDtxmb3ZnqNGAUBmykj73/5Xna1zQFswtilq0UHFHf5MMYOl8WGQG7UEpkX
	1pfHOaGEdjSHVPbWQ0JV2ce9sLrv6a09MXMMpawiM8yrlGugCsL1aE/ryan20to2gGQZSJGQtEr
	6XWxcoKZOE6P6puhLfiVCW3y5
X-Google-Smtp-Source: AGHT+IEY/oDiPIa/nOlTAjnwslt218cYgrDecYU+5L1GpQyJtEecEknywGQ7urVCh3StZq6R+wNITA==
X-Received: by 2002:a05:600c:3d98:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43ed0bf62eemr150638415e9.8.1744105943506;
        Tue, 08 Apr 2025 02:52:23 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:23 -0700 (PDT)
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
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 08/16] net: mdio: regmap: add support for multiple valid addr
Date: Tue,  8 Apr 2025 11:51:15 +0200
Message-ID: <20250408095139.51659-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025225_118557_2FF0685D 
X-CRM114-Status: GOOD (  16.91  )
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


