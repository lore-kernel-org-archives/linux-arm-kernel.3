Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93AAD39430
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlZm1d6IIPrVLmXM0fMXF/dJtcOm3xLtMD0q1qOGIWM=; b=WUJ0t2BVEg1RWPtyyV9t3VK1iM
	dybD784mbWYj+8mbA7YlOwovPYBERl49a0WzKtXKqVTnzZaEx/J7npnGwo8KX8nJSRSIQKRcOdVfV
	X7NbZ1PB2lgkmDsiVV4nrje9/PMDxpIbDSCvEQTfYPYG1MieTqewuu9B1n6qbPG+WrgIkpuW4IPWD
	DRyMbQ/cksm2biHs0/vtXs3mPB/FxkxOK/xHoaG4oc3NFTh8v+DrABeFOkKxyNyqspV8sFCljHngN
	ym4oxE0yzXpinjNxvphqUNnW1NrRKSs24G91rFc6i2p/RV+sZo/D311B49xKdJzDw7Z6Yfp0LVSnk
	c3hxthyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1R-00000000KaH-0UrV;
	Thu, 02 Apr 2026 14:27:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1O-00000000KWi-3eb5;
	Thu, 02 Apr 2026 14:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XlZm1d6IIPrVLmXM0fMXF/dJtcOm3xLtMD0q1qOGIWM=; b=ZwhITt4h1TuyAOUr8VkZzC9n6K
	Xz+vld31gPuzW6VdjVxRYaMC+g/EAwuEm+zmAKD7d30dSpjPVCsD81ZGOzgwYNnB6K5QIt7Umc92r
	p9AFnS8qFDBaPFj6n7ew69UjN1IIM9umdEdBOXK2H08SxF6YYlb6izA8UhiuU/0A3WL7KuzG9AC4g
	h9TfBNkupVG/exdyNQkLcMaQhR2V9KhY+/b/B2h/tgjyycEgJvr5xaKJaaa/xVbpx3hVhujh+wd0b
	zKo6yiXeltxHhT0vkL+NeCebj8Bk15qyHsjpvwKj4nWBYw27qStEGA3at5yv3rHx2HbkGeBCCCRI2
	7GSh8KVw==;
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1M-00000002g94-056l;
	Thu, 02 Apr 2026 14:27:45 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775140054;
	bh=/fmGQFbRzxXF36D4HUeJ6hELpl1p69vINpfqcmw5ok0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=tLdRH7kSxa3HP44uhfEknVm15T0gIlNxjESGH0cAmTBX7EkYy0lTqZ6H/FcLHN/jC
	 B9R7SU/lHQLzY5OxENQB/SSF2yuVS2FQpPDt5H+Kjzag78GK5jj1MRjVxpyaRralp4
	 ro170MNssUfnQhOmljr9F4ty+papk70LiOP3Xghc=
Date: Thu, 02 Apr 2026 16:27:02 +0200
Subject: [PATCH 2/8] dt-bindings: i2c: amlogic: Add compatible for T7 SOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-add-mcu-fan-khadas-vim4-v1-2-2b12eb4ac7b0@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775140049; l=1221;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=/fmGQFbRzxXF36D4HUeJ6hELpl1p69vINpfqcmw5ok0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPyTNUP4Nt6jyGT9Oby1/TaKZlI9pCKDP6UFTK7qrNBA5J2OufsBqRdi3n9biF5H0IvMUHwNHsJ
 cNpvKnm6R1Qc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_152744_235795_3ACACC68 
X-CRM114-Status: UNSURE (   7.02  )
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

Add the T7 SOC compatible which fallback to AXG compatible.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml         | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index c4cc8af182807..7b59b60b62e5b 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -16,10 +16,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
-      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
-      - amlogic,meson-axg-i2c # AXG and compatible SoCs
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,t7-i2c
+          - const: amlogic,meson-axg-i2c
+      - enum:
+          - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
+          - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
+          - amlogic,meson-axg-i2c # AXG and compatible SoCs
 
   reg:
     maxItems: 1

-- 
2.49.0


