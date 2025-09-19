Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940D6CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh8JZpgb+L2aPjOjZwbXB9WfK8/YFHERX8y+yM7yqt4=; b=Aor3kGvnjmSFi7gDPtWqYgADkA
	GMw82JchqEpqFZMh0BNxj76fI6pPUbAVJW+s+wGBaqYnMoJ4nQbFDCgPClfGfitgd6a2IelQpRwnG
	jc6Gc/P1i/u6PBqse4hWDVcZ6kI4vxPuzBVOpjVNmeh0YnrycYS9ToThg1JDPIC+PIRV4pXbbFYpy
	ZmN1vg6d2GH0BwFmxHOOUJCESEr8E5gT17ULqAnTPS+1XSlhR1jKyrsf+MGUy7Pq2pIPh86Y//qVz
	RWHr2YPOqks+RMZRVq62es2q6x0i45f2ox/fGNyoebeJrDhTBFtLegFFvLKyiuG0zqPl4dCuLTh0z
	Vwh29FfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOZ5-00000001Tuw-2WSI;
	Fri, 19 Sep 2025 00:01:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOYy-00000001TsY-2PAf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:01:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF0FD1764;
	Thu, 18 Sep 2025 17:01:11 -0700 (PDT)
Received: from minigeek.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2AD83F673;
	Thu, 18 Sep 2025 17:01:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [RFC PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Add polyphased property
Date: Fri, 19 Sep 2025 01:00:16 +0100
Message-ID: <20250919000020.16969-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20250919000020.16969-1-andre.przywara@arm.com>
References: <20250919000020.16969-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_170120_654368_073D1984 
X-CRM114-Status: GOOD (  13.27  )
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

Some X-Powers AXP PMICs can combine some of their DC/DC buck converter
outputs in a multi-phase fashion, to achieve higher currents and
decrease the output ripple. The datasheets call this poly-phase. This is
programmable in the PMIC, although often set up as the PMIC's reset
default.

Add the "x-powers,polyphased" property to the binding, to describe those
pairs or tuples of regulators that should work together. In the lead
regulator node, the property lists the phandles of the connected
regulators. Just an empty property means no poly-phasing.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df16..260c4c0afc475 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -304,6 +304,15 @@ properties:
               noise. This probably makes sense for HiFi audio related
               applications that aren't battery constrained.
 
+          x-powers,polyphased:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description:
+              A list of phandles pointing to other regulators that should be
+              polyphased with this regulator. The linked regulators will be
+              synchronised with this regulator, within the PMIC, but only if
+              supported by the PMIC. An empty list means this regulator
+              should be configured in a single-phase setup.
+
     additionalProperties: false
 
 required:
@@ -377,6 +386,7 @@ examples:
                     regulator-min-microvolt = <1000000>;
                     regulator-max-microvolt = <1450000>;
                     regulator-name = "vdd-cpu";
+                    x-powers,polyphased = <&reg_dcdc4>;
                 };
 
                 reg_dcdc3: dcdc3 {
@@ -386,6 +396,10 @@ examples:
                     regulator-name = "vdd-int-dll";
                 };
 
+                reg_dcdc4: dcdc4 {
+                    /* dual-phased with DCDC2 */
+                };
+
                 reg_ldo1: ldo1 {
                     /* LDO1 is a fixed output regulator */
                     regulator-always-on;
-- 
2.46.4


