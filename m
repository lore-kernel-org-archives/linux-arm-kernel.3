Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A7A606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kj+SeWOu;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VQY/+b98
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AeArqFIHk/3fPHi/YkKVHDnKQvjnaUzDWy7sCvmnRfw=; b=kj+SeWOuoaS9yN
	WfI8wg6DZzoSY9ppttBgaIDQnKATVUAJv9EnSpu1YIjXs2Dzd/L6L1vnaRQV9vdtJ0tijtrtkzMxm
	xPY9txFVND68l4bElrd0E346+XJyVin8FaxGuI05f71/6f/VYHaU6lWbEK812mMts3bB8JaclxeXI
	LEE1zg94jy/G5tVXRYDxxWSjuYhOXADvJIpQMtcNT7FAmxMqjFTSS1akZfRkHPGo2nlBSP9xf8Lfi
	hFoTTxHI5Y8FbOO4tNLYSbQKxoJeYv25CE5gGKDIGqVN1bXpYbC2kkhS5Nvafge0nqqoX5u1mGffQ
	ysMQFHdL+M8qEdwIC9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqw-0000000BVJ8-2Fjc;
	Fri, 06 Nov 2026 07:59:14 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqs-0000000BVG1-2OP6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:59:11 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 861E0202946;
	Fri, 06 Nov 2026 08:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AeArqFIHk/3fPHi/YkKVHDnKQvjnaUzDWy7sCvmnRfw=;
	b=VQY/+b98ZYu0z0tUcpp9wjlWDAOTcClSy4Ivon898kiXaywWeCEPpKKtjs/WQ2qeVwNARA
	S4jhCWycgSBXcJMvTSkgA0YkVah0h7yn766wGQD6+WkSM2tU794q7IKBD2WmFulVYtwV2x
	rFkSfbdJXeJCEiymTzQwaJtW5tvfWMgSaNHE16FpohciRADOJ7EUe0xIIMg8pmaBv2PGe4
	8kn/iLYHiLQL1TuLe/t0Vfiy8mXtm2nSqNpxFxiyifYmUTn4NcKlUKtq8wTC2l7M3hftZu
	KedZIQJ871F63z2DjWuhF6/qUI2eYk1fw7J8vSNz6dhNfxXjK8hFqo9phbWJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AeArqFIHk/3fPHi/YkKVHDnKQvjnaUzDWy7sCvmnRfw=;
	b=NPua1Hc33tISfdLos9UVnC16wgluznPDQPsPcBC41b6BHHNUKrvBhm5bNhrxMr2+nM8T3U
	scI0MOrDIuvqx3Aaqxk1wyEzrTJKxWArXXfH7x4ylt8FYcq5CVY6J7zMJz8MLc2NLY8Vk1
	lu/3KPdZQzG72kXQ6mTT9isKrify6XEmlczyuq+8TRZfJjmMojxa0qwhORnd0ZLNcSPTtr
	aLh+JW4P+47E/k3pVyLOtlVURz9MCVmQKcA9vkj23/udT28MVeaVCulI980WWMf/oo2n0/
	6R3lxPitG45HHDz/8iiIG+bgsl9WdJdheY4PRLaJ1aCk5dotPRsBfU7DBscOqw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793951944; a=rsa-sha256;
	cv=none;
	b=E6kUKyKvrFpSRiD0rN5FLECNYMKKF8D/vh0Zsz3DwWEdmqwD5u4fKRliwEL9jyrb1WK0JK
	ONmKBYdHhRn9JNrx+H3EhlENoZC9L24m0nSRWNaoUYBKZGQhPGnNkR0P7Ip3QH53iSoH0P
	urU+O80YUJ5cUqhTwyCNXr6IzpA/z1DcYhiTFXlKTKoPnFS9K47UJmKhjQI1VJg5HKWHrF
	pgf+MhxwWQjk5KmLvm4MwbgEXeaTN+XsEoM3d/3RgaDHWiEWuX+WCAlkiTypLBqUPhv4ow
	anG+TZAEgXEl9arcH3lZvLA/TjZu3AXZ19cbAU3lkX/9NeopKthPGp8tmb1okw==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 06 Nov 2026 08:47:29 +0100
Subject: [PATCH net-next v3 5/5] net: phy: dp83867: support setting
 output-impedance
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-v7-2-topic-dp83867-v3-5-45e1d3adf1bf@pengutronix.de>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3663;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=8Jt3mHu3IEa9magDTytTV9qOVUCcJ1Sl0JabGDBitug=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bbjmO7SjR2fuj50bK40bFqyvEafcmLzTz5a6L+JP1tU
 bXkYyjqKGVhEONikBVTZFFZWMEn6vHBM3KaCBfMHFYmkCEMXJwCMJGG4wz/LD4JF8tPPfdLy5RP
 OePYLtNUu/VrdhxLD8yR7D5kHtLyhJHhpMQFVz2m032Le90fnl3mei3dYqXuS6bOLfpBOixOE9J
 5AQ==
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_235910_771742_8F157871 
X-CRM114-Status: GOOD (  19.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently the dp83867 supports setting the io impedance to minimum,
maximum, default or a value from a nvmem cell. In situations where there
is no backend for a nvmem cell, the value can not be set to anything but
minimum, maximum or default.

Add support for the ti,output-impedance-ohms binding, allowing to
specify the impedance in ohms via the devicetree. The PHY has 32
settings between 35 and 70 ohms. The datasheet does not specify the
impedance of each setting, so the value is mapped linearly to the
nearest one.

With this mapping, 50 ohms results in 0x12. For non-OF devices, the
driver sets 0x0f (IO_IMPEDANCE_MIN / 2) as the 50 ohm default "per
datasheet", which would be 53 ohms with the linear mapping. As the
datasheet only gives the range, neither value can be checked against it.

The binding does not allow combining the new property with the nvmem
cell or the boolean properties. The driver still reads the nvmem cell
first, then ti,max-output-impedance, ti,min-output-impedance and
ti,output-impedance-ohms.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/net/phy/dp83867.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index a3cd5cb11ea0..ca668e75f0c9 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -119,6 +119,9 @@
 #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK	0x1f
 #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX	0x0
 #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN	0x1f
+/* Output impedance at IO_IMPEDANCE_MIN and IO_IMPEDANCE_MAX (datasheet) */
+#define DP83867_IO_IMPEDANCE_MIN_OHMS		35
+#define DP83867_IO_IMPEDANCE_MAX_OHMS		70
 #define DP83867_IO_MUX_CFG_CLK_O_DISABLE	BIT(6)
 #define DP83867_IO_MUX_CFG_CLK_O_SEL_MASK	(0x1f << 8)
 #define DP83867_IO_MUX_CFG_CLK_O_SEL_SHIFT	8
@@ -542,7 +545,8 @@ static int dp83867_of_init_io_impedance(struct phy_device *phydev)
 	struct device *dev = &phydev->mdio.dev;
 	struct device_node *of_node = dev->of_node;
 	struct nvmem_cell *cell;
-	u8 *buf, val;
+	u8 *buf;
+	u32 val;
 	int ret;
 
 	cell = of_nvmem_cell_get(of_node, "io_impedance_ctrl");
@@ -553,12 +557,29 @@ static int dp83867_of_init_io_impedance(struct phy_device *phydev)
 						"failed to get nvmem cell io_impedance_ctrl\n");
 
 		/* If no nvmem cell, check for the boolean properties. */
-		if (of_property_read_bool(of_node, "ti,max-output-impedance"))
+		if (of_property_read_bool(of_node, "ti,max-output-impedance")) {
 			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX;
-		else if (of_property_read_bool(of_node, "ti,min-output-impedance"))
+		} else if (of_property_read_bool(of_node, "ti,min-output-impedance")) {
 			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN;
-		else
+		} else if (of_property_read_u32(of_node, "ti,output-impedance-ohms", &val) == 0) {
+			if (val < DP83867_IO_IMPEDANCE_MIN_OHMS ||
+			    val > DP83867_IO_IMPEDANCE_MAX_OHMS) {
+				phydev_err(phydev, "'ti,output-impedance-ohms' contents out of range\n");
+				return -ERANGE;
+			}
+			/*
+			 * 0x00 = 70 ohms ... 0x1f = 35 ohms. The datasheet
+			 * does not specify the settings in between, map the
+			 * range linearly to the nearest one.
+			 */
+			dp83867->io_impedance =
+				DIV_ROUND_CLOSEST((DP83867_IO_IMPEDANCE_MAX_OHMS - val) *
+						  DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
+						  DP83867_IO_IMPEDANCE_MAX_OHMS -
+						  DP83867_IO_IMPEDANCE_MIN_OHMS);
+		} else {
 			dp83867->io_impedance = -1; /* leave at default */
+		}
 
 		return 0;
 	}

-- 
2.56.0


