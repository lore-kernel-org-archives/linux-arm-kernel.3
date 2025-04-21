Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20FCC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1DBceB7cADPNeytdpq0dOOcYHGOsSM7KrMBPQpbfv4=; b=vLD4R8bnx3ekL8LugUUgM8ZWbL
	+6nFZ6XFJFtZxE6HU6P/nOcI4EP87dq4tLdBxVSfHnTJwPkxkWq32V9v00t7isSyVSc8jyx83yKNf
	CdvzlHa+Mxs9atcSt7rf9WdciFBn2OLeikTsjBuNliCaxvjgswawPj0lWBE5LHjv3VqU6xACigcOW
	cpkAK8lS0S732JgW+QrpRXJshq+DAPbwiMkbSLtxG2X3dAo4sJounlY3kUJHb7YrrSHSNkVCmkbjs
	NwlMjOVRHrzsuRtdRiRkgSvJobZqtGDEh5yNS4q3QoSE2fvF4L+fdNuLeNpdLfN0y9mgUV7jnSANI
	vZTCNT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vlq-00000004u4O-3Hrz;
	Mon, 21 Apr 2025 18:21:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6veU-00000004tH7-19cM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F101FA4BDB5;
	Mon, 21 Apr 2025 18:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 878E8C4CEF5;
	Mon, 21 Apr 2025 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745259232;
	bh=V/kjbIpsR7o8/54il8ImspS8yqRyVOqGksL/52gZejM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lOmO3C2Yt9AKELsFG2PNh2SJmQsyOfel0ZvBWC1rr295EEevtr47I0/JDNADsAZjS
	 uaRMC2POFuL4SXbACLqgPZLd6vKHLYxZMHaODysCR2tW3JwRAALCJJXNmTih+t4uh/
	 +qKtAn5ix+HUxs20/OXeSimacWV/cMXdbALGI2POQxBQIoTbmTJZTA5KmJT31dps/q
	 9zZcMf6w8v/1v7KZcTEeVe2PmWOOw3iYEmkVlR6ZAfUX/TM/CuvhO5OM2LM6puDF9X
	 tnyy7khtwxTSHxE+ary0+v2gWSjjCCc2m2bAJ6ajmUVisIxc3WqGPBecElTFrLUtf8
	 QYqVFOhCiOAlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C185C369AB;
	Mon, 21 Apr 2025 18:13:52 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 21 Apr 2025 20:13:34 +0200
Subject: [PATCH v3 3/5] dt-bindings: power: supply: add max77759-fg flavor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-b4-gs101_max77759_fg-v3-3-50cd8caf9017@uclouvain.be>
References: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
To: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745259219; l=2149;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=3csHwNLf51MgGPB35l/jqx2BDbuC5NezSGJ/M4ttHB0=;
 b=hdZ5Rso1TYtabh6eg8jkEmrW24+n8D/oOip4OJEpl0tOPzFFs4tV0EiJ5qsDr9uqLuRHV1LkY
 qVAnT3vizopCgmKHmOf+5qkukpUjrQt83QCOiMFRCY6pmqavfYCltWB
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_111354_468404_F209A2D3 
X-CRM114-Status: GOOD (  11.29  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

The Maxim MAX77759 is an IC used to manage the power supply of the battery
and the USB-C. Based on drivers from google, it contains at least a PMIC,
a fuel gauge, a TCPCI and a charger.

Use max77759-fg compatible to avoid conflict with drivers for other
functions.

The Maxim MAX77759 has no non-volatile memory so it doesn't require an
address and instead requires a value for the current sensing resistor.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 .../bindings/power/supply/maxim,max17201.yaml      | 34 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
index fe3dd9bd5585618e45220c51023391a5b21acfd2..4823021ff16b170db83abd0b974986a307c05089 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
@@ -9,13 +9,11 @@ title: Maxim MAX17201 fuel gauge
 maintainers:
   - Dimitri Fedrau <dima.fedrau@gmail.com>
 
-allOf:
-  - $ref: power-supply.yaml#
-
 properties:
   compatible:
     oneOf:
       - const: maxim,max17201
+      - const: maxim,max77759-fg
       - items:
           - enum:
               - maxim,max17205
@@ -39,6 +37,36 @@ required:
   - reg
   - reg-names
 
+allOf:
+  - $ref: power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max17201
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max77759-fg
+    then:
+      properties:
+        reg:
+          items:
+            minItems: 1
+            maxItems: 1
+        shunt-resistor-micro-ohms:
+          description: The value of current sense resistor in microohms.
+      required:
+        - shunt-resistor-micro-ohms
+
 unevaluatedProperties: false
 
 examples:

-- 
2.49.0



