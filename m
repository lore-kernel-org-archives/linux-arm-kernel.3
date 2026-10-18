Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2EFCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9M5aa/N/MsOHLm9qG3N5Hg7W9KxSND4tfBDy6Z5iG4=; b=zFuCeRRw9Ujt31YWcTcwAw2Cxr
	0LmVfH9z7rZTBap7UpdZToR5Z58GtDWNw09weLr5K27XwY21CQ11dOiGkFyo+Zp7ztlMbLFHHDQaa
	28DWG4TVjAQQZyjDU7VakB2+Tji+xvfKiGot+Q7ZuCkWllWSrNGTP3vyXneSlX2+cA4TFM+Ya9MmL
	abv/nq1wyTrK6GEg3nnAQuAFmvo0yUJc4EfoL049lbu9yi30BWxvikqlcZv8XIgX1QWnV5zyGLb1o
	GiVhUcUlSwiswtCz0kYMnaZa7M5+iilKQ+bt4JV6PDH+8tw79w/4Oheimym1izdcORuyGqFQK0HWL
	4BxKutpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIvY-00000005XQH-2Vro;
	Sun, 18 Oct 2026 04:55:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIvR-00000005XO8-2qCl;
	Sun, 18 Oct 2026 04:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15A1A43CAF;
	Sun, 18 Oct 2026 04:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3D55C2BCC7;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792299313;
	bh=dtivKKmcg8zcbQIIlTROYPcTUxR+GP0NXH684ufM7r0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=itcj84WZh32DoUODw3yguRJecogYukRcHwHvkZMbneyOmHBg0GqkBYj20tGU/o4O6
	 t3rTjyUb5rn4wXp64T6D1qEI5zyLVND9Sz93TqXEXs0gJnyAmvnvWfk4T6pL3SXtPE
	 nBBcVmB9f0Jp/L/xvA2WMfwVDmwYNEV3m57Pyv1pwWtv3LUOfRI4kd+IX7Cxu+uLHZ
	 aouc3HhuiqERu1zUY3gceHUrub8clyoNC6hfG8EQPliAKqiA24+yAa7QmEvaxKtgO6
	 7BXymHmnX31/VYbKaLFPyS4nOKriU04EHjnFVnROQCVEduS+wzlqxG564WS/6pwDqr
	 KvzNkHfYI+amQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40CBCCF2C9;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 18 Oct 2026 07:54:59 +0300
Subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Reference the common fan
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
In-Reply-To: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=qUXxvAxXaQVads84aZrFPPsu7N7+O4+7hDtPOHnoLsA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlXAnW6rne+PmWWPE+rS8fks8WRg2tay/6tq3q6xGvf/
 SstFYtTO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBE8jcy/FM/t5ZBc7bC86/b
 vp8plRS1uBv+Zfb1cOlEhW7LmXPZ9NMZ/kesmrO6xvuzxpvQFRZFe1/53lfgZJ3xVq7dzrnScKr
 AZi4A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

pwm-fan predates fan-common.yaml and repeats several of its properties.
Reference the common schema, drop the duplicated properties and keep
only the constraints specific to PWM fans.

This also allows label, which the hwmon core exposes as the label
attribute.

Link: https://lore.kernel.org/r/20250106173805.GA501301-robh@kernel.org
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../devicetree/bindings/hwmon/pwm-fan.yaml         | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 6a24851fd80d..b5407ed52976 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -10,19 +10,18 @@ maintainers:
   - Jean Delvare <jdelvare@suse.com>
   - Guenter Roeck <linux@roeck-us.net>
 
+allOf:
+  - $ref: fan-common.yaml#
+
 properties:
   compatible:
     const: pwm-fan
 
   cooling-levels:
     description: PWM duty cycle values corresponding to thermal cooling states.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       maximum: 255
 
-  fan-supply:
-    description: Phandle to the regulator that provides power to the fan.
-
   interrupts:
     description:
       This contains an interrupt specifier for each fan tachometer output
@@ -51,26 +50,14 @@ properties:
       Time to wait in microseconds after start when stopped.
 
   pulses-per-revolution:
-    description:
-      Define the number of pulses per fan revolution for each tachometer
-      input as an integer.
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
-    maximum: 4
     default: 2
 
-  pwms:
-    description: The PWM that is used to control the fan.
-    maxItems: 1
-
-  "#cooling-cells":
-    const: 2
-
 required:
   - compatible
   - pwms
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -114,4 +101,5 @@ examples:
       interrupt-parent = <&gpio5>;
       interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
       pulses-per-revolution = <2>;
+      label = "CPU fan";
     };

-- 
2.43.0



