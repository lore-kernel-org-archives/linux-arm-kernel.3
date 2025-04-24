Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B78EC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=; b=ekm3mjKgKMiosnp9RSJk/S1wlx
	HFs649cSUIDRUWiGC/PxPHCJvxmkjmDGBC1r0bVv5Hz8JRxBzX0vfW4LcVXK0EQH8c7L3VnudoXuo
	j3+NscLyfAQnJq86vU4EzELi3eF9AFeYcuwmvyntboEgy1xu4bgeYc7evfiiX8yPr7sly135t+B33
	w7yvPfeOXg/qcEVN18pZlOR9O8pf94Wa1puHMljD585Iw6MimZJlXAgM6cIor2DNwdHeJ0Roqtdy6
	XfvgMlLxuvTD0Ptchzkh6BU+v4nmfOElFNST7XaGNcrj71pF11egRiyau2SqwV/mzQ3M8HdmB50Xt
	SVQOkcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x03-0000000EGlv-1b9Y;
	Thu, 24 Apr 2025 13:52:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlu-0000000DfSK-1xIk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=; b=Jj0jAm+WULslT3FNJQ3n8K7RhG
	FKVucKVVnITdurpZN3crJNoofs/hWV95e0fKzlgoP3RF3j5YnEr/ZcKkrOjGVRs98L0c9vvTQJnF+
	0VYhuRZdMaaAcwFPYE1MtJHjOpHRQuNDwXSAwPUicip2zV2M73tIuv0fvFcII/gxZy0Pe+bmyEGqo
	HyeLa0DIFNW0Ml6ku4PO2ZcpGtHmSN7tnTKiopR4Af706qyVJJBaTQVlUeF3TdBt2v//yY/6jr4VY
	3Wc5pCAAPE7NtyR1bTTrnWLQ1YSEkV3qBKFYSv3iAUidB3cZnZ+UfN8v7ldW2OrbC4Z3qhmo8w1ih
	wHTWtNrA==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tlq-0000000BjUl-02hx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-225df540edcso20474075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490326; x=1746095126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=;
        b=EcTdTVvIGuBBfQBX02UU1JkMbdxpOZPWABIaoUcGs5Ars85ySJ89UL/+/csYot8C6+
         e7MlN7uJxVpNlWoEJ2vFa7tB2hy0SNh0JOxWRxipf4b0Qj2vAuCDde6s5ANJ2209f8Hb
         9nhXeydHtp4WF4crhqghyTiXctBknrBs3LUvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490326; x=1746095126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=;
        b=Li6KbUkEUUT3kzqw+7PaThg8xJT6wxfRmpFOC3Mj3t7SIw0VBZ4c0I2+MJ0cw5MDNb
         y9lq3au5Ng+Ft/kwwKLahlqz3irsaV8Zw+yeUf3aB7Q1/Svw4qRdXPe9+iEGaDBPIBoD
         GirHSteKxTYi/3HnnV6dzQ9FazvD9oeZeSMfogRcG/12V/N0fRKLA6zuahZz1CaDycQT
         JrzA6vtAOyEUTv4SyMBBccDViE2p8gcmKgiVUHaXCQXBm22LWTCwEINqUuAZzbm0gaqR
         /H0xitGP4HaLeFJF9jzTmV5ZmSE4MJ8wMaeDRSwxdu+9J1w+xgI4ycZG7jwh+MMCTAMk
         qEng==
X-Forwarded-Encrypted: i=1; AJvYcCXU523s7Ju8qsKKoq1+pSMv/EXsUa6CNE/QJIPXNz6prUKVjmsDiLXGVj7MuS5+u4GERY+WuqSVWEXThR28635E@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XUBikZTLgfAWqD3wgQleq03n8LOcV0YygAKLTYbhHPS/xXGF
	hfDhxM4FgsA5kcgfKiElYQhqx9fdYSl6/rlz9gkUSw367m+wehAEC/0kdU/O8g==
X-Gm-Gg: ASbGncsgtoqDfxT7TmhwGRn3dB2GPe9Rkzu5/u+CEH+9AE14wByx60l30xK00L7XGsr
	mjLP81CYdRR7zlAWX76UME0aILh6rkUee0C1wQDTMaVXm40IJsSHNl5od64cfMhgigA+YAiwIre
	7e+NRbLccpRRYVRvdcuGMHn90TzFaRqbFg3fNPn22n9VY7oCFDoB4SUOnlA0ip5fayYf9Ihp8D0
	4Pmf4ZyHkrk6DfUWJSl6rFUXX1m8FdjtLX3ixjHMHG6DFaJMkz8Y86HBlfs5DbqoyNur5bIGMAi
	EBqO55cmbSXkAGY9k7G3gLOapm+uFmSTeHYRZuBYFWFiL4f5SJdN36zl5A==
X-Google-Smtp-Source: AGHT+IFNflA0jQPNmROa9h8mKkta9N2LCXUl+MkxIZxkk1EuSqHoA4OT4/Txgj+BWOug6XhvWUVquw==
X-Received: by 2002:a17:902:ec84:b0:220:e91f:4408 with SMTP id d9443c01a7336-22db499755emr24690085ad.22.1745490326648;
        Thu, 24 Apr 2025 03:25:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 24 Apr 2025 18:24:56 +0800
Message-ID: <20250424102509.1083185-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112530_103385_CACCA8CC 
X-CRM114-Status: GOOD (  10.63  )
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

The audio subsystem sits under a controllable power domain.

Add it to the binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index a95215ba6361..666408d32f5c 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -45,12 +45,16 @@ properties:
       - const: i2s3_m
       - const: i2s3_b
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -59,11 +63,13 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mt8173-afe-pcm@11220000 {
         compatible = "mediatek,mt8173-afe-pcm";
         reg = <0x11220000 0x1000>;
         interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_AUDIO>;
         clocks = <&infracfg CLK_INFRA_AUDIO>,
                  <&topckgen CLK_TOP_AUDIO_SEL>,
                  <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-- 
2.49.0.805.g082f7c87e0-goog


