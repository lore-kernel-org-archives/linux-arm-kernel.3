Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A4D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=td46xjH24ofaxzKhEKh0P67Vek1B5awPPGZeaiyfTU4=; b=n4ONvMIs+WcQxNwRXWFXlOptns
	GOAf2ua6TC+7V3HG1Mc7q4wXiHyAA4OWVo+1qmhxtSbDt5bEn0RbHNvP7RPorkv3vQAMq5hFij3D7
	TmbMSVhIiNdFJxc3Dc53s23mXj5aarPxWsTUd+vBsOQoA8BKsqYdGkN5NYNRJNr1iQTQX5KROEs/E
	vBVdVCaPGRFt4sf0RIKzjwqU6CWDK+gG4/hLSj+1n1DcjVRrQypwBOS9do5iQi2LYO/ala2wHFAR9
	j52Feeq7Qt6jKHnRWvpfj9p+HuKvYmnT+7zxjWxSg3cX1zLHgx3rEuNmZ2drqDivynr0Yga/OLcL1
	toxgx6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG8J-00000004IIw-3qu9;
	Mon, 15 Dec 2025 21:29:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG8H-00000004IIS-19jz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F0D4326F;
	Mon, 15 Dec 2025 21:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AC3C4CEF5;
	Mon, 15 Dec 2025 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834168;
	bh=HlJaDgmgggM9C2+Omdle529eY/0vP7j79g++4G803eo=;
	h=From:To:Cc:Subject:Date:From;
	b=IaxHSqtEAEaDbVFX1GzfynMD7hppI+wgYKwTgLy8deVGFR1Y1UWg36lp+kIppsrZM
	 WeRpShAhd07hvc9dJHA5e54BYeHpt4NesAOr33+SboG9v3GExJnmEmc7cE1rWhiykj
	 1aC6iE1fnNBp0e6prJluLOACvyQtwZxMmk+VxJc6FS/odfDaWkvjU1WjMyPeWLi1gi
	 rxvVTXdE49d8Qw78ah/x8JdqoXsOSwR7uYKC2QPOju5Zf+PZkxPOlB66OiUF6pQfOC
	 SLsvfzy35JA5bqnyxPv1+ujZ5GpVqrd/BulYnzvcERSHWrQgiqi5tRkkj9nEGsxCr0
	 tx4nvo68wzahg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: vexpress-config: Update clock and regulator node names
Date: Mon, 15 Dec 2025 15:29:14 -0600
Message-ID: <20251215212914.3323741-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132929_337704_ECB879EB 
X-CRM114-Status: UNSURE (   9.05  )
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

The clock and regulator node names were updated to use standard node names,
but the binding wasn't updated.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/vexpress-config.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
index b74380da3198..41c53e3acc12 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
@@ -103,7 +103,7 @@ required:
   - arm,vexpress,config-bridge
 
 patternProperties:
-  'clk[0-9]*$':
+  '^clock-controller.*$':
     type: object
     description:
       clocks
@@ -137,7 +137,7 @@ patternProperties:
       - arm,vexpress-sysreg,func
       - "#clock-cells"
 
-  "^volt-.+$":
+  "^regulator-.+$":
     $ref: /schemas/regulator/regulator.yaml#
     properties:
       compatible:
@@ -272,7 +272,7 @@ examples:
         compatible = "arm,vexpress,config-bus";
         arm,vexpress,config-bridge = <&v2m_sysreg>;
 
-        clk0 {
+        clock-controller {
             compatible = "arm,vexpress-osc";
             arm,vexpress-sysreg,func = <1 0>;
             #clock-cells = <0>;
-- 
2.51.0


