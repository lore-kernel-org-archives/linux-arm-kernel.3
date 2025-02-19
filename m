Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E57FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRDH7JUOK4Qt3XrdNtvjAwI3P3XDa0EtyA9y0a/Ff1Y=; b=BkiYNGcYWmB+SodhCXrAzuWKwo
	PEOi0iYGM8PMM784Q8NFv4WonYAaX+WaxNiF5KWOS6GKf7tkV4BYpC6BWKOpdhklH/Vqer+/Js3ZV
	jAAWJGFXV2ZMBpXSR8HScecFMpkZc+NHodXTSTNhs8W+i/eNjLMpSZoH380Os7iIwr7anFFfrjKXb
	NKbd3YpYFzDyJhvYeVCiqqnz79sjo67gAHFMtQKbAAUqVeD86x1IQNQDuJ0Y7vOsC9c6uul0N8dbe
	GuYMs7+h75fCIl6wVSHGeLDqPEhQcy84pxDRVUN5GPHUUC/S3ozRzLspt3AjoXWl7szbna+WosteA
	dthWZipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgUh-0000000BuLD-2NOK;
	Wed, 19 Feb 2025 09:35:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkftb-0000000BgkL-1iEC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:57:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43987d046caso3842345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955450; x=1740560250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRDH7JUOK4Qt3XrdNtvjAwI3P3XDa0EtyA9y0a/Ff1Y=;
        b=zqZLtzm7FiYv20ZNJgvozrmKpTDlVwoUBUKtsBWzOy7sw2oXOaNIqzS3H70/sKxik3
         gW//0I15H4/uyPlAnAHIRBMc3wmoYMmdATo3gbOpPKdxvGdsKf5sRqeJ9sJm+WYtS/yD
         odh/OHvfsFJwRTIji1G+OyMleKnGHZZoyTz3lQotxy1Uh3wXZmFNIvk5EhqSQdzgCsZV
         BySCI+5T4+ybjqhp2teGweBO6ciXbTLmPlmcOlkv+v2VA1VyDgIGPuuiwDWiC0+TlL5y
         QKXfmaaze+XGf2ayfyTGIb+ymzSIkW35wQhOmqikleiIQYmdULFgPeydn824mEg+2H+v
         I8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955450; x=1740560250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRDH7JUOK4Qt3XrdNtvjAwI3P3XDa0EtyA9y0a/Ff1Y=;
        b=mqwI1ZSUDDrCG63hieRp//xGna7g1UnCxEUoWoOMxUIUkglKq0cHDeiEUwFzM8IygS
         oHRSHPTaoh/2O/SS/pY4vzz5773j5dot8ws3N3fNg6j7kZAIjNBgs1XOW+auwCmeKWoM
         8TsbH9tRuJWWBxT7j4pEG+P2YZHgv3rwGZuNqo+qL0sbImp7S4QosbG8i5eN+lBPsfq0
         Umboq0mHyQxzpTcaq86cOXaciQ/KHOktmeF5DT2p/cDOKcSROuyk0zkMciJk25JoSnxl
         MXfJyXxOV7JdAgos3KTSHFGTD0yKxnZ1CO3/xCJm50wokt4G88AEHeeLljLijK3ZSQUI
         XnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFqIwrlnIWkcQf/KDsP8M4wJmxzIbn8zhYxs+d1NkVmF2b2Hd3eHCmB0KAndJzG8gfbDtNAVu0VOA1fGmyyMqy@lists.infradead.org
X-Gm-Message-State: AOJu0YzlRpOsqohy7XbhNVSkYN0blwt4QBaAArjcLk+lHaobPh7I8bH0
	cBuEZxOPEw1HDs04wZpHjDVXDscnIr+nDNQUR334BmxMvW53azT8n8WCEe1Z52A=
X-Gm-Gg: ASbGncui7dk5E5yx2QFlMBc6CKWGSkizi0QtcXOiFMUyGZ1A3cDrakEZec25/E9jXa1
	Y0JMac+Wg/fhUnHALBkkwnqJum3pIwKEKYGQuJxbglyYlkY6JDkL2Pkh5fVxSlNJWAX4yxzVhCo
	SmfZAerKNsZxdgHcZMM4dnq5UaTA7Djb12QfhICiyVdgpJgKXbn4lUXJQKvLbyvhd5iOXpH/6fV
	DFv6v93I13mgjdF1WgmMfkejFItLH6r2Ee7kOUwCmg+I9lrDsw3T/6u+TjAvUf2XcZZpZdaMDwE
	SWNbrEVxY4TMcYFTnlbFLS1B0kPW1A==
X-Google-Smtp-Source: AGHT+IGb1jEC7y+Y7Rl+PioMxXoJSfQnw0OF7LzA+zc795fUjhCn+RhDum3IRhMvx+QUGzwJ/XfnIA==
X-Received: by 2002:a05:600c:2d04:b0:439:84d3:f7fd with SMTP id 5b1f17b1804b1-43984d3fb0bmr37040725e9.4.1739955449623;
        Wed, 19 Feb 2025 00:57:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399beadf31sm10007375e9.0.2025.02.19.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:57:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to lower-case
Date: Wed, 19 Feb 2025 09:57:25 +0100
Message-ID: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_005731_466452_096417AB 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..80c1af3a8836 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -73,7 +73,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -83,7 +83,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -93,7 +93,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -103,7 +103,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			enable-method = "psci";
-			cpu-idle-states = <&ANANKE_CPU_SLEEP>;
+			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
 		};
@@ -113,7 +113,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			enable-method = "psci";
-			cpu-idle-states = <&ENYO_CPU_SLEEP>;
+			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
 		};
@@ -123,7 +123,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			enable-method = "psci";
-			cpu-idle-states = <&ENYO_CPU_SLEEP>;
+			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
 		};
@@ -133,7 +133,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			enable-method = "psci";
-			cpu-idle-states = <&HERA_CPU_SLEEP>;
+			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
 		};
@@ -143,7 +143,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			enable-method = "psci";
-			cpu-idle-states = <&HERA_CPU_SLEEP>;
+			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
 		};
@@ -151,7 +151,7 @@ cpu7: cpu@700 {
 		idle-states {
 			entry-method = "psci";
 
-			ANANKE_CPU_SLEEP: cpu-ananke-sleep {
+			ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
@@ -160,7 +160,7 @@ ANANKE_CPU_SLEEP: cpu-ananke-sleep {
 				min-residency-us = <2000>;
 			};
 
-			ENYO_CPU_SLEEP: cpu-enyo-sleep {
+			enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
@@ -169,7 +169,7 @@ ENYO_CPU_SLEEP: cpu-enyo-sleep {
 				min-residency-us = <2500>;
 			};
 
-			HERA_CPU_SLEEP: cpu-hera-sleep {
+			hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
-- 
2.43.0


