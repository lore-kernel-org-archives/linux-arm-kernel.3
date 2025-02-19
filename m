Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZs3YbRvN8DNt3197H8da0uczE1W96IyWr4w3SXE9jo=; b=aAQqKSoYKVps+ASTBdT7vw7+Yh
	/p73JKkZu7PXG1ujHSjtbJLLvQ7BMXZuU6gxTJTUhgQUqXS0qAt6mnQsERIOQI2L+3/SsccGMvg8v
	zh5MuIBO/D5nS8jgKtflND9OwcvmMGHR1102tbAL1/KWJZRiP0paKB2cK/VJZva5H0OvCBfI8OLwh
	y3EzyLu1f7hQGqRGAP327AmHi91QzGGv/PzlC4B/K8IpE2AWbKnLv7XrBTUnO5Y4r6PWr992aDYvx
	DYysojUXfUn/01fgNkIPIhT8H9fYCgcR6REWCpribxd34mAXtQiZ2jzeWQwkqzjYxh9dwegiLLvuQ
	Oqlu1KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrVo-0000000FAJX-2reH;
	Wed, 19 Feb 2025 21:21:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrIC-0000000F5UU-3lxx;
	Wed, 19 Feb 2025 21:07:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abbda4349e9so47191766b.0;
        Wed, 19 Feb 2025 13:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999259; x=1740604059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QZs3YbRvN8DNt3197H8da0uczE1W96IyWr4w3SXE9jo=;
        b=CA/kSqKu7o6T5HJXZDnnMz0/rL/60XOCKza/S+UlQ4XK3qgFNlagZPX599ys9o4qMQ
         ymZeoJRxfb492lXeq+qKwWGRGkXDCg164Q8b3uI0NojX4nmsogsRjKMU2Vn86VIi2seW
         zVGSBrfFm+7M1rK8QkwyH60moljVo1OFK+3qtBbyfaAjg10gYmk5O/j+Ir024wYhlTZy
         uR2CBv4vBWsi7Upxk/SUlBo3D11EYklahnfptyklUWgyF81XGFyn/Bfd1TPbxO7jQbBC
         FFsMIINYzaEvoJLDhsqWMkUhWb/cj5lukl4CJFHhEsBh0+rGw1H7HwaBmuX/OnIHgTWB
         d/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999259; x=1740604059;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZs3YbRvN8DNt3197H8da0uczE1W96IyWr4w3SXE9jo=;
        b=EjFfUwvLUCKSxMjq4UzC8VNYMdEvYt5iy+qukl9bwVlNSArkacV2216qolipA5qnZe
         ePq6WeD4pCKk05BpxjjCUeT8YaUjgK0aRSXiLDE0XOHfrgMsQXs1tQabkZYGt0c/kdUT
         3t9rSipygJlOjAdwjYfMrX8FXlv9BJKyc38uk+nrhJdVZaeg/UN6omM2kJO22oISIruR
         liTjTjtgToDqBUWyo3ypOWmB6ChCUOgyQ+fcRYWzdorVghaDVQs+RJ8SAHaPZp9wchD8
         +6nhE1bgBDQtVyKH7kAopllFfyZ9IAB5TguN/tE1Zw/erog0+eHo3KkH7zWWhDmO5s+M
         ORPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgxLkay/qWEDck5uGPDh2Ql8mAOswZlYSoV6D+ea6VVJ2druT4w5zgLrp/ZQygBqk3eimPBT+VgPOZXgucuk59@lists.infradead.org, AJvYcCXr6KebEUHq11kEPFjmbklMOVQaaALzB4hkdpD1hwDZNRuDof5nkDn7i/OLz+lMZNX36FSsH8Zi8vcG7n5I9Nw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Q2MpJzWYBLL92fRoVZerZOwR95deSRlaJdms24iE0zmc97Rs
	6S4Cqqn5xcQXs93xS6WMeaARLQqBfRhOaO8LdLi0KXwEkPjKquRe
X-Gm-Gg: ASbGncuDNlKi0a9zb2ML6P180HBrUq8W3ePPFWFg1/uVa7nYY5hQ6pblw/IjNlNf+dP
	RAfX3IxIig1HVQBhUYCbrwl5M0QuPjFFGlWAFYLFBXCqjj+8TrH901/Ql/EVgcftTNOFrFInYkw
	xIMiEoGtPSZRUVF4ix9S8+b2bhV19H1A492nASnAm0Q68A2jIN/daIkIM7E4AhbusUaqgKMKoKq
	ITXtaqpAmkS6b7sMlNOaFoahoFmWl5C0+vMiFDtkVKUKeAFvXtFpFuS0yWc8J5f8ge2FjfFGWln
	9O36fzxHQ1PVNSU/U95kWjEgpIUz4YgwDS5wWWFO1VTM01YBFTepIPW+C3/izZ8G/KrxOyv8vxR
	e6t11Q3jo0QUfQsT4d7+s0a4/z7LMC1jSzENhYCBRl1gY9u1E6QZ4Cbs4QM29eo9j0NGOGLfKRi
	BYzd1pgWM=
X-Google-Smtp-Source: AGHT+IFB8TbXEW8oyxCMw5I9hPAsJ5x8xBIRsmTCx+D4bgFcD07BpYfc68ij8nWfwZBgDBmj8kWcvA==
X-Received: by 2002:a17:906:c154:b0:ab8:95f8:b5e4 with SMTP id a640c23a62f3a-abb70d943c3mr2292970066b.41.1739999259305;
        Wed, 19 Feb 2025 13:07:39 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb8eea4d65sm762573866b.161.2025.02.19.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:07:38 -0800 (PST)
Message-ID: <ee5947e6-9bf0-4c69-a014-57fb0da015cd@gmail.com>
Date: Wed, 19 Feb 2025 22:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 8/8] net: phy: make struct phy_package_shared private
 to phylib
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130740_949155_01475EC4 
X-CRM114-Status: GOOD (  17.52  )
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

Move definition of struct phy_package_shared to phy_package.c to
make it private to phylib.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 31 +++++++++++++++++++++++++++++++
 include/linux/phy.h           | 31 -------------------------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 6955b4132..a8c3f26d2 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,37 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+/**
+ * struct phy_package_shared - Shared information in PHY packages
+ * @base_addr: Base PHY address of PHY package used to combine PHYs
+ *   in one package and for offset calculation of phy_package_read/write
+ * @np: Pointer to the Device Node if PHY package defined in DT
+ * @refcnt: Number of PHYs connected to this shared data
+ * @flags: Initialization of PHY package
+ * @priv_size: Size of the shared private data @priv
+ * @priv: Driver private data shared across a PHY package
+ *
+ * Represents a shared structure between different phydev's in the same
+ * package, for example a quad PHY. See phy_package_join() and
+ * phy_package_leave().
+ */
+struct phy_package_shared {
+	u8 base_addr;
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
+	refcount_t refcnt;
+	unsigned long flags;
+	size_t priv_size;
+
+	/* private data pointer */
+	/* note that this pointer is shared between different phydevs and
+	 * the user has to take care of appropriate locking. It is allocated
+	 * and freed automatically by phy_package_join() and
+	 * phy_package_leave().
+	 */
+	void *priv;
+};
+
 struct device_node *phy_package_shared_get_node(struct phy_device *phydev)
 {
 	return phydev->shared->np;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index ce591307a..3008f31de 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -322,37 +322,6 @@ struct mdio_bus_stats {
 	struct u64_stats_sync syncp;
 };
 
-/**
- * struct phy_package_shared - Shared information in PHY packages
- * @base_addr: Base PHY address of PHY package used to combine PHYs
- *   in one package and for offset calculation of phy_package_read/write
- * @np: Pointer to the Device Node if PHY package defined in DT
- * @refcnt: Number of PHYs connected to this shared data
- * @flags: Initialization of PHY package
- * @priv_size: Size of the shared private data @priv
- * @priv: Driver private data shared across a PHY package
- *
- * Represents a shared structure between different phydev's in the same
- * package, for example a quad PHY. See phy_package_join() and
- * phy_package_leave().
- */
-struct phy_package_shared {
-	u8 base_addr;
-	/* With PHY package defined in DT this points to the PHY package node */
-	struct device_node *np;
-	refcount_t refcnt;
-	unsigned long flags;
-	size_t priv_size;
-
-	/* private data pointer */
-	/* note that this pointer is shared between different phydevs and
-	 * the user has to take care of appropriate locking. It is allocated
-	 * and freed automatically by phy_package_join() and
-	 * phy_package_leave().
-	 */
-	void *priv;
-};
-
 /**
  * struct mii_bus - Represents an MDIO bus
  *
-- 
2.48.1



