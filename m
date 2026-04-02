Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C131D3942F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wUyWGfKa0vr97U7Lk6gBSKnb5S9BNHI2b9hewd/Uqc=; b=tII4KQdqjBRGduK0UPmiAcuPNJ
	SoEnKAWksLvwZOMJBqunijUr6pNiLZAkBa90tPN5FgB374X+K9HH7WtnjaPJ4EwDLBA9JoeLvXN82
	iwsa7/xIEwB/JkzXxrErALLyhrGf8PgzFKMqI2Jxf02x45dVobGUCRDTDm/ea0HJ+jNEk84ItGfeh
	q4YTfbGFFmf2osYQHaOz7w/+WzpgyaLr1vxq+Pzju123qNTkj+kWTGT7LYuKHwWitNYJisbq40YDD
	mjVjtkOLjj38LuaZbFE+zCcXY8pq2B1IWLq+l6U77JOqk5nPyr3pGbtu8dnglBflpo7mx+iriMHnj
	/cRlDcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1U-00000000Kep-1fL8;
	Thu, 02 Apr 2026 14:27:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1Q-00000000KXl-0n4C;
	Thu, 02 Apr 2026 14:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9wUyWGfKa0vr97U7Lk6gBSKnb5S9BNHI2b9hewd/Uqc=; b=iLyPL1Q1rW8lrt8pCK+GLUyOp5
	owmdBDsfLwXbb+qXLPnA+PkCbfYP4njhzsPVWppAoCB8d2bkK6cHIRV9HZKsljPIASWKSaB+6abDp
	gwfu+us4+9fD8dF1t8dCLicEE9DzhuQXmU4+ABM7dqnWHVS7lZ4teIjp41MwBteiqJAqnKYR0khOf
	O9nisSOlQjkzC1KFs/cw1SwTLGnQ996wCIz3UbF712S579MwRl/1DaQHFTH1FsSodIIOvc1zR8l8E
	v4rHLSBNiq/YKa0H6X16QQdHMRAG0qQklso2JMa29s1DU7YlwZIpV6VaWS9Lb3+KGhy8PKfZTFrxx
	JlUokWBg==;
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1N-00000002gBA-11kX;
	Thu, 02 Apr 2026 14:27:47 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775140053;
	bh=Q8ByvFFPbagYCfBbxUtAun76d9Q2AZFAwBqZPLsNOk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=sBe80RIlj8hq/fmHgN9x6nKuMk04V03duI2bCAK5aoOcCR8XJHG+LVCOQsRapJLrp
	 647rtzNJpf82hPvHB9PydrRRiY5WeHUcxIXQypuwku2QqqHE/3zvIKENc+yWA7FavL
	 Dbg9ML1MJZMnfv+Se5cPoOTec4NKh1qU4Uw3ug/o=
Date: Thu, 02 Apr 2026 16:27:01 +0200
Subject: [PATCH 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-add-mcu-fan-khadas-vim4-v1-1-2b12eb4ac7b0@aliel.fr>
References: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
In-Reply-To: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775140049; l=1084;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=Q8ByvFFPbagYCfBbxUtAun76d9Q2AZFAwBqZPLsNOk4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO9kC86Uy7mx3d8oNkTfYjfhMeV7EpSJ/5fh9o0tItxJoBZWoPkEV9/c9SnRCRv/XaJgs1GNnTf
 lkcDN+/hL7wg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_152745_412841_6EA09DAE 
X-CRM114-Status: UNSURE (   7.54  )
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

The Khadas VIM4 MCU register is slightly different
from previous boards' MCU.
This board also features a switchable power source for its fan.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 084960fd5a1fd..67769ef5d58b1 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - khadas,mcu # MCU revision is discoverable
+      - khadas,vim4-mcu
 
   "#cooling-cells": # Only needed for boards having FAN control feature
     const: 2
@@ -25,6 +26,10 @@ properties:
   reg:
     maxItems: 1
 
+  fan-supply:
+    description: Phandle to the regulator that powers the fan.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
   - reg

-- 
2.49.0


