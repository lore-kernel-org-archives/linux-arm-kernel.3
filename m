Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8009C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=; b=XwksKfX+KigRVc32j5mTZLCKuo
	Que1Jz9y4L6qRECO/hPhOerKy1zInKrR5VpLv6+KV8b334fsZl/N0pzXemFve76wSihwOVG8NfvSX
	YcgkQKYETcWwMSAsxYPYxRAHRk/k/L+Jh66ELdEgPftXb9FO62hDYDujiDwYJkSoWIXcApcPfi5d5
	LGik8wTynWa2x6GnDdXVOUqQKNbfU7td1SDD4s+LUokird9YGnP1Yd7DaQGmEI98BnxBFzVwz0ewV
	5lGWwFTkLAHHOoWnsdBG+kt9OmdVXJnX+mggAUoiXYhr1b4qn4xlwTCvesfLSxevyxqABtyJheZzn
	ciapEs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cqN-00000003RVe-3OgZ;
	Fri, 04 Sep 2026 22:57:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cqK-00000003RUc-3M4Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:57:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1249019a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788562626; x=1789167426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=b8iwMMhAgC1jWHZ+QAPT1Mz827JkWiVzD97HUMasoC7j3G2h7mFLTcVcbYJqgWgHAR
         i2ov+WNmpMwokHUBo1v4tnxwO77Ne6+dIAi8nrdvR+MTRuQ3glIPyEGkX0kaTAwH3I3P
         lDBNPGKOMSiJwtOtRckS6uED+nrW8yP1plLdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562626; x=1789167426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=Pv3GeLRncrUpYk1xzT5yui9aE7s1+r6xocUTAVX37r7d66GnbPxbhCXO2cW3tGxpLm
         yoZVEpbFaxvME3xcD97vCrkch8XWdd1ASOwvsTWTO+FxXu6okJ6AkKFIoPgpGu8YgkhM
         h0e/F1xhLkz0Wc6lc1AH9mT2PoSuQaz3zT4EVyscsJhdAFtQXw+2Y4DrHec0/AgusKeR
         KZsxlWceKyvWXjIO/YUC5FdQ6Giyv6t3VgFJBUOMJBSBvxaJv7GEAIwoK5XYAwpANLz1
         SbAawpp3Yh+EW8pM9JZbtFXR1c8a3Nq+mSdZuTvHUvfyqf/Jtlkfu4L8W0lqO4Hc7D9L
         G4vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVwMiuNzIabb8fFe5q1aToJ2hI1I2ehaOTho99AToYgcNPnK8JDDnIklxtUgTSbH2/T3zDS2FxObN6YiQ5bppy@lists.infradead.org
X-Gm-Message-State: AFuF++nfKwo8Jmo4igl5sqU3U1GrfrAA4k6jTwlDvE0+j3B+xB/svpxL
	FaJc78PXcnczFG7hfox7Av6AkRZA68E7KIbWobppJDciu5iWWUd+d/3kquiWeoHOzg==
X-Gm-Gg: AYBFou33fmsArTGsePdZTGfs6RVoKGiC4VWfDhyDqgWjBYc0Al3P9Ha607US2kETkFO
	k0OqbZyPFqBElH4heCkRjtVzIOTKbmcrTTpMZOwT4bVIU2TVC3p0SSLfLId+Np0kFwguWjFOYun
	LjefvtfM73ZFOGfZF3vDKWd66rPOsZbX5camVLedu3fpA3czXxTvYbfk0J+lXNkeJlizZPOSflw
	bmlz3fX439xksdW46vfFYYLeJFQcJJ0QvYJGfP233aMRiPOE0V+UjewHJ3N8TUWNAZSmi4IUqQM
	no5DfIJMCEWlnvMKr6AWIklHNFF38T216t3bnbBej3F1HpzZaLZCniiiHy38+hcHDPuvBhp+A33
	3vtPVcg1pJ5Et3ElgIOIX5mF6fhC8BGJKPhqpYb0gLXwcz98BgxVwstJ5I/ICVKHgoiXAPpkHyL
	EDeyhCd8YuNLmD+YuhLMpOzDToK0VwnHbfakGYhJKcp3e358WOk955mrttUMonHHSSsq6PpPVlM
	J9/2e3yO0+edL3UV9vGnuq1L5bJpmFN1MALNCI=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr13463573a91.16.1788562625925;
        Fri, 04 Sep 2026 15:57:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339aa37dbdsm8157345eec.11.2026.09.04.15.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:57:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Fri,  4 Sep 2026 15:56:22 -0700
Message-ID: <20260904155621.v2.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_155708_850966_65B0BF86 
X-CRM114-Status: GOOD (  16.90  )
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

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1 series:
https://lore.kernel.org/all/20260428200712.2660635-1-briannorris@chromium.org/

There is a little more background in the v1 cover letter. I didn't feel
like a new cover letter was needed for a single patch-resend.

Changes in v2:
 * resent separately from the series, since the rest were applied by
   their maintainers
 * trim other-arch maintainers from CC list
 * Add Reviewed-by
 * Add missing linux-mediatek@lists.infradead.org Cc. It claims to be
   moderated, and its "join" seems broken, so I'll probably get bounced.
   (https://lists.openwrt.org/mailman/subscribe/linux-mediatek is
   disabled, and linux-mediatek-join@lists.openwrt.org gives me error 550)
 * otherwise, no change from v1

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..777da2129e77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -16,6 +16,11 @@ aliases {
 		mmc2 = &mmc3;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 69cab9f9c530..fa359440ed60 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -22,6 +22,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells <2>;
+		#size-cells <2>;
+	};
+
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..2b327d9ef65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -26,6 +26,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size should be filled in by the bootloader. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..c65805f2a7e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -41,6 +41,11 @@ dmic-codec {
 		wakeup-delay-ms = <100>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size will be filled in by the bootloader */
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 40d34b16dc80..e8ebbb74987f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..f06ca2bc165d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -42,6 +42,11 @@ dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.55.0.979.g7e5102b832-goog


