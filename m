Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAD4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cNPhfn56hhnyntPjEfHke2lx/LZF8+QUZgYQm+CWUo=; b=TGAfEhyhsCiKw7mPQpDPipS2Kl
	ew6y9tdF9VgCbgwU4yEmyrLQ0eXpesWeEEJeVGo4u3yweku+feuAfWh6LzOejDMNUGbq1ns0ZjQ2I
	jvK7XWpkcG1oVY2AOWQ3Ghr+MUxpvtwGXj3giXW3wQfHu0HE81i1yYD96cnv//FD0filMv49ttqfB
	KXanZP2/5KYpFnKwLE1zVW4mVTC0f89VxQ8fuMAzsGMwBJhxp5dXs79ITPLh+hkTPX5fqMK8a3v+t
	0Txokqh4jRlylc0FjVg524DITY8emuo9GaXZGVzGGmYAl/q6IjIr75dct93JgJFiLbOFA9Uw5eqWO
	Nq4W6bvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CwC-0000000Ddu2-1QXn;
	Fri, 11 Apr 2025 11:52:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CiD-0000000DbFl-1IEj;
	Fri, 11 Apr 2025 11:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3DE9A4AAC1;
	Fri, 11 Apr 2025 11:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DA64C4CEE8;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371500;
	bh=rcZ4hUqkPHAzf/+Hghm6DmFVxWHcdR3LRlMwrsk358A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KAu2Zp8IpSVm7oGFMTnjiqtKOCAd2TQMswJvUI2l8LCuMlWm/2CRtCOA/a6lUJmLI
	 0N2x3MWRY4oOx+YkxLJ316CcM4kdSue8Uk3IE7/QifXMAepZ+W8hmrqXzeT/ep6HFq
	 El55EsAq4kQfqXExJgIrh3nHLn3zkZp1PuTvIINWSjUt6jW87b+Wicvee0cw8Z/DaN
	 fqEN8QewKc6JV4T/HPrkTGKEwMFKAeYg00hqDOoYyC80FpDu/k+9Ss+Ea/ZqVj5jTt
	 cDAF8yjyT9bRNqwczRmVCRo1VMv9f3EUqA06gWURVCpGVKwxku1gVamOh1X4VOXaca
	 bisDRtroJ56dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19058C369A8;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 19:38:15 +0800
Subject: [PATCH v6 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
In-Reply-To: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744371498; l=2254;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=RBPG6lp45fxsEDVQ6Y1mIySEYTUUWfsM6OujOhVw3vA=;
 b=RzJQ4KLDu1/uYzvPUgLAK47lwY8WHwnKpeAC3wbWB/M5syynOzodZMBDPY8mZKQ2W42Ssx6zC
 aZ56m5MqTlgBXcNUF8TuewWWQBOSgrFuXd+lAeqJbEQ8sUQyNosoXUm
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_043821_470355_11F9FD0E 
X-CRM114-Status: UNSURE (   7.66  )
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
Reply-To: kelvin.zhang@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

Add compatibles for Amlogic A4 and A5 reset controllers,
which fall back to 'amlogic,meson-s4-reset'.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -12,14 +12,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
-      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
-      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
-      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
-      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
-      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
-      - amlogic,t7-reset
+    oneOf:
+      - enum:
+          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
+          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
+          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
+          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
+          - amlogic,t7-reset
+      - items:
+          - enum:
+              - amlogic,a4-reset
+              - amlogic,a5-reset
+          - const: amlogic,meson-s4-reset
 
   reg:
     maxItems: 1

-- 
2.37.1



