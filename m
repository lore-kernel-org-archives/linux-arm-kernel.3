Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5EDC83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df4UGlSJHH3MRIWMNdqjwJSZcGeME7Nid8QsZBlv91Q=; b=1btNXBZIuAaVjL8TkQA+ph7NYW
	e7Z8Poc9f61J86yfJAhooCfjZyg5rBBf0HXLoXyIfdOMTCn1OL6d2LaBzItMfQLr6IAeFSv2L/5dc
	BnHJ+QF/7p3WZVDXd8yVdrKd9e0izV3aGIEYAuiYlNkxSwCUgJTaAvAV0ESArpxV/sowc+GgG4OLr
	Pkh+ikHhGAxGVo38T0fVvY6Njs/8aM45GFs2A5aRF5Y+ZsG3SY87h/Lmd0wrPbimkD1OxlX0eM7zW
	oFkS1N7Wao/W3eVE3W790Hxc11YpELQK/KVJU9uxksPUsXWX8l+vAcOZeWYVPtzPokKpEO8Y0457h
	gRjhSo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAeH-0000000H3AC-2MXO;
	Sat, 05 Jul 2025 21:42:17 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAbx-0000000H2ig-0O3Q;
	Sat, 05 Jul 2025 21:39:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=df4UGlSJHH3MRIWMNdqjwJSZcGeME7Nid8QsZBlv91Q=;
	b=1kDYTZCn5TE087KJuPw584m33VL7NvMbJoPB8aGtSWPMuxgXp7wt5EYGFugkQpICt7TN8hkBBl/zoCU9D+jfZ/J1Jq4RjTfVt+k9vGuEy1zwDYqJeRCB35HRuCutScBvBYu/UQPUGcTKm+sqyynkd4cHB5+KWVBljs3Y1K8HtBE=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:48 +0200
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
Subject: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad Carrier Board
Date: Sat,  5 Jul 2025 23:38:54 +0200
Message-Id: <20250705213900.3614963-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705213900.3614963-1-lukas.schmid@netcube.li>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_143953_428109_7183A89F 
X-CRM114-Status: UNSURE (   7.19  )
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

The NetCube Systems Nagami Keypad Carrier is a custom board intended to
fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
and Status-LED all controllable over Ethernet with PoE support.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7919b5bf5..a2f16d064 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -610,6 +610,12 @@ properties:
           - const: netcube,nagami
           - const: allwinner,sun8i-t113s
 
+      - description: NetCube Systems Nagami Keypad Carrier Board
+        items:
+          - const: netcube,nagami-keypad-carrier
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5



