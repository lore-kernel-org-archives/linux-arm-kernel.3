Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F070ACCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kCSOGJcwbOC+7+5BLR+gRNJdgGMuPaf20hsggRiPEw=; b=CahDmfq6q4igt8VNROHc7tGSwP
	OiCGl1YNgEPm1KnFu74jlUvx4dgvyuc9KG+MAZDG3JutDU+/nF4uAPAJlApHvxdUuwxnygE+dSknx
	DLsdHqW0UeO1yX8zUpfFFjtI9qeVuLOOIjEauWYhSv479rNMe7uv8m05y9VuBUSN62PYcXPx4djYv
	JEGlIlTGinFiYgfh/ME/tvXqpGYrtidRr9WtVmsRVRmzjYS7Nk9eC9Ha+sU0W0FnzyXnxTyZiuATj
	ZP1OYhKe8IMJ4tPpSvk3vS0sr1z8Wxdg82Xt+67Wa2Ful2AE+Gndncxvv8f7FakJxRGRwQbodoU1N
	vo1TgZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mR4-00000008H8j-0jW4;
	Fri, 17 Oct 2025 15:32:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mR1-00000008H6z-03tB;
	Fri, 17 Oct 2025 15:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5kCSOGJcwbOC+7+5BLR+gRNJdgGMuPaf20hsggRiPEw=; b=mcmdI+8Ec0GfoXPv/N67l3Halm
	Yya0Q5B0/PWM39Qc86WIvX6vfGjWWFBy1arjLAmuHXZgbVbnUepNxYtckRprYmzgoBg6CNGgajxOH
	YTAqP/e7xGd8Z72YkU8YA8/jJnd5ImnKkrryPAIBbOY65qfsuFJdsLfyASZWYo88Jn2V2JuDcaPz/
	4JBHCa87ZtLg2a+0Jmo9Yp0WGVZa4vfwVwBEPqDnu0JAw9R4ZLKpzR8MBKTsUPXVzQD3etOeCvqTG
	0txzDiJy6E8X3kMSIyD/Y4YOTjBUk/BTBTOtiHIVl9P1Ka3DYe58OpiIqdJvvm++k0WuaO5TLsm/B
	LGezMWWg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mQx-00000007gSh-2cZP;
	Fri, 17 Oct 2025 15:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760715099; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c4cU1iyQ+Ldu7go/75NsLMcc895EysOzW9pPYMezdD/MCDBTPomGNy/uWJ+bgeTjT1obaPdxQ4sNYdYmVKnVNBci9PQIE++MXOD60PApvrwczh22YRj0vzlv7yCNiV3YN1fBo6NKy0okE4Alh5lxk4ioCVYJ8BzOEYBcoI8AvSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760715099; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5kCSOGJcwbOC+7+5BLR+gRNJdgGMuPaf20hsggRiPEw=; 
	b=FgeIcvHv9U6SUV9dE+nY+V2+u7r4znOqrJK5wIizK8lz4uykVEkdZrVJPLNmA6D2V0wDB+NTPyCg0xsuqdg24HnvTfMcdIypuLrbBA8+pwkuQsG2ivNuWwLIoK6TnwBi2TMA0eqs+5ZpRHBNPZDX4MXtfBd5wDAUmH4Ac1Xn53c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760715099;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5kCSOGJcwbOC+7+5BLR+gRNJdgGMuPaf20hsggRiPEw=;
	b=dcRJGFVr87gKIRNY9cqyB1Pde29JDLQJFEqztQwXYYASI1ZGZaIrFxNmV89JpIsr
	/W90DLOR2KhXfrKfQlX25SMmfViqCAOjs8zHh8DYLKcLAnNGm2y0IA5wignMKKiXPHn
	Ejg6ZbvEQI+gf1I9Br+M9i7TaqIYMx3r3mVZrTfQ=
Received: by mx.zohomail.com with SMTPS id 1760715097932797.8703392963683;
	Fri, 17 Oct 2025 08:31:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 17 Oct 2025 17:31:08 +0200
Subject: [PATCH v8 1/5] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-mt8196-gpufreq-v8-1-98fc1cc566a1@collabora.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
In-Reply-To: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_163200_210559_BAB418D1 
X-CRM114-Status: GOOD (  11.01  )
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

The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
control the power and frequency of the GPU. This is modelled as a power
domain and clock provider.

It lets us omit the OPP tables from the device tree, as those can now be
enumerated at runtime from the MCU.

Add the necessary schema logic to handle what this SoC expects in terms
of clocks and power-domains.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 37 +++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 613040fdb444..860691ce985e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -45,7 +45,9 @@ properties:
     minItems: 1
     items:
       - const: core
-      - const: coregroup
+      - enum:
+          - coregroup
+          - stacks
       - const: stacks
 
   mali-supply: true
@@ -110,6 +112,27 @@ allOf:
         power-domain-names: false
       required:
         - mali-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-mali
+    then:
+      properties:
+        mali-supply: false
+        sram-supply: false
+        operating-points-v2: false
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: stacks
+      required:
+        - power-domains
 
 examples:
   - |
@@ -145,5 +168,17 @@ examples:
             };
         };
     };
+  - |
+    gpu@48000000 {
+        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
+        reg = <0x48000000 0x480000>;
+        clocks = <&gpufreq 0>, <&gpufreq 1>;
+        clock-names = "core", "stacks";
+        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "job", "mmu", "gpu";
+        power-domains = <&gpufreq>;
+    };
 
 ...

-- 
2.51.0


