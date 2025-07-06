Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D32C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ7vtuj+s70PG5PkBbRCZDNfe9x5yGSFsFXGi4NYoMk=; b=WjyaMBDyMOnSAHCGNbcWzAM7Lg
	UbBdARK7LtyrAfq8BQoRYiFm2LzHN6g8NEz2497q1bCz1gIDhNBrVO3qPpXK2rK/3N5qMHAHkfEHk
	Z5f4WVO7IAMJzPrJffjoY8Hsow2hE6DLnr36l7d4VaOIUnWHxueDYPIrbxdjRRSKm7VeEZRx6n4PG
	HkHQav//bPre4EBB9bwxQAMkp3zqHq09429S29Uw50ZfBUXbDJ/MkZ/mMTSo7XzNu1kGwott2Iq/d
	WOBG2etUGEjxPTwCbVACDi3jWFgHaVRR8OSnjUonnP5qJSaeoHTw347FLJ9B4OU1rPKx/f8YZhSI3
	YxIsY58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUch-00000000gmN-2qYZ;
	Sun, 06 Jul 2025 19:01:59 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUDt-00000000eFL-3Ddm;
	Sun, 06 Jul 2025 18:36:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=xZ7vtuj+s70PG5PkBbRCZDNfe9x5yGSFsFXGi4NYoMk=;
	b=gvxHfBTxIOGSJjVT38nYhLnPEAj67cTiCebwQHAReVeMFmCqZJh5wzyk+SYUb9OPSn4Hm1EsQWT7gjz6Mvfy76AmZEruyYZ8gPiXt51b9D7HpoYJZnUXq9hSo2yVksONtqCpJBwaI5cpdIcAP6+O2W448Tnrv9LU7Tpjk+B47uc=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sun, 6 Jul 2025 20:36:18 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier board bindings
Date: Sun,  6 Jul 2025 20:35:54 +0200
Message-Id: <20250706183601.157523-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706183601.157523-1-lukas.schmid@netcube.li>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_113622_099522_55728564 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

The NetCube Systems Nagami is an System on Module base on the Allwinner
T113s SoC. It is intended to be used in low cost devices which require
simple layouts and low BOM cost.

The NetCube Systems Nagami Basic Carrier Board is a simple carrier for the
Nagami SoM. It is intended to serve as a simple reference design for a
custom implementation or just evaluating the module with other peripherals

The NetCube Systems Nagami Keypad Carrier is a custom board intended to
fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
and Status-LED all controllable over Ethernet with PoE support.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613..50f08d8d2 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -599,6 +599,14 @@ properties:
           - const: netcube,kumquat
           - const: allwinner,sun8i-v3s
 
+      - description: NetCube Systems Nagami SoM based boards
+        items:
+          - enum:
+              - netcube,nagami-basic-carrier
+              - netcube,nagami-keypad-carrier
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5



