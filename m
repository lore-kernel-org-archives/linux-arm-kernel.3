Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8C111227A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crLkIEAjfJkSPL8VSm2GFMjNHGqYKMfKcc+miOHFLAs=; b=Fk2936qjBiIiMPJ6UAe+uGe4CO
	FTPoKCB13J41q433niQVWuiuwxxoNPx8O/jT4o9kb0qLPtyYbZ9+t3SODMRXrk3ooX3wbQ5oDfuN1
	R1ZXV5kJoa3vPhbm8Ci2RWJdIzK4LQU6HQQ9J74RpOpckyWhN23lyuGinH38fhdQ0hlOEM66ysIfZ
	zwyAU2AQUGVDWv59DIsAktGZP+4u6Ldh/4Il2rFK9hqDPLBVNXmkVgGssjL2OENSqVwnGO+AhIx+r
	JfqTP5XRFy1yznvHUpgelr49hzuA6Em9O5Ex11NchfAyUugpSs2GB3U/yiYcRZVtWLbiAOovXYrMH
	m54b+w+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87z2-0000000GcQj-34Xo;
	Thu, 02 Apr 2026 02:40:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87yl-0000000GcOI-3DpW;
	Thu, 02 Apr 2026 02:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F4C86184F;
	Thu,  2 Apr 2026 02:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E37EC19423;
	Thu,  2 Apr 2026 02:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775097618;
	bh=zmdM0qo8CX3kHCzsu50etCsSTnTDcsKCliyCWlfpcmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YAY7Vf9yOJ8K6DwWOBrTe8a7fXq7YwkKKXSlYyyiJXAdH6y/m+RjjAJnOHCN79+AY
	 Wg8J02eHCFNZpcpsa3Y8DxyRttJM68aSXOV7JILTBdseKh4FtUo86vYZVqYTxj2Y2c
	 XJ8d3XKFSWwyV+wmnH1oh0X+esh387cYIFsJDOrBXBq4CWJ89JqMq4eSL/yw5sJXEn
	 D5zPdhFtj/T1hrLhhEX1Iq7wHQYEuP2ImrfgyYWO+fdjkn5tEItKrWuqn4q2cWSxgB
	 OZwz4VhvjsvSoERP339nqsxlcJgO0st7iB+35oPGHCyBxZi76a1aXGB2PZ+hu4Y4pq
	 px19SG/bekRGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5D51112259;
	Thu,  2 Apr 2026 02:40:18 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 02 Apr 2026 02:40:15 +0000
Subject: [PATCH v2 1/2] dt-bindings: pwm: amlogic: Add new bindings for S6
 S7 S7D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-s6-s7-pwm-v2-1-657dce040956@amlogic.com>
References: <20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com>
In-Reply-To: <20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775097616; l=1811;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=jS//+H3tRKyNMEGVeMFEtfJwKQUz9wNI3mixje/H5hM=;
 b=tdms4fS6vPfUsXE80dPyDtDcpNiA+GSo14eeE7/bMZQEqHP9vo135gK1STjJTLRYttbPPVLwY
 rusXNJflPoTCbeY6PHczRtZANL0ck36hcRCUHSZlpfIMthZXex+EzFw
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Junyi Zhao <junyi.zhao@amlogic.com>

Amlogic S7/S7D/S6 different from the previous SoCs, a controller
includes one pwm, at the same time, the controller has only one
input clock source.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index c337d85da40f..93fa97f4011b 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -37,6 +37,7 @@ properties:
       - enum:
           - amlogic,meson8-pwm-v2
           - amlogic,meson-s4-pwm
+          - amlogic,s7-pwm
       - items:
           - enum:
               - amlogic,a4-pwm
@@ -45,6 +46,11 @@ properties:
               - amlogic,t7-pwm
               - amlogic,meson-a1-pwm
           - const: amlogic,meson-s4-pwm
+      - items:
+          - enum:
+              - amlogic,s6-pwm
+              - amlogic,s7d-pwm
+          - const: amlogic,s7-pwm
       - items:
           - enum:
               - amlogic,meson8b-pwm-v2
@@ -146,6 +152,19 @@ allOf:
         clock-names: false
       required:
         - clocks
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s7-pwm
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
+      required:
+        - clocks
 
   - if:
       properties:

-- 
2.52.0



