Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUzs23jv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j36bVuhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4NjwcCRUit4k9bfPnEwrZTpteoTnUrUFgb+iE1jnD40=; b=LUzs23jvMZGqQZXz+bV/umBGxo
	GCUcMjo/wnak8PR74Os9DjDxZ+UKTDTY7of7c9NtMfPS6qFdc92dSvyPJ7tjQ9wXM845MJNNGhKyI
	fcoPZORdz3RpV7SyUoOEfwdXalHpVs7eibwEMXf113llHB42xLBzU9wyCSHqKbXk8Z1BSE+J2y8/F
	pE1Fb0KhG+nkZCgJzI8bvrQ4OexZxYtV040Vi3z6mQBj/aDgY1iY2QaYo7WReo2FhBJdYYYKl1ZER
	TpeXEVqmIlee5dgAzeAu8MfivBItVsXesUCf86pxxzi7H4YjWr8Dus0rYpGYfcKGXmCMyx9alhzM0
	ysFm04xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkry-00000005SBB-02hZ;
	Tue, 27 Oct 2026 17:21:54 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkru-00000005SAj-2A2l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:21:51 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso261681eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793121709; x=1793726509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NjwcCRUit4k9bfPnEwrZTpteoTnUrUFgb+iE1jnD40=;
        b=j36bVuhJ8yudrvt0bA93dkvIo3Lf6ly/xGf+tqvFM5h+JO0guARiZNB5DlHXBrxOG8
         xhZPGg5149mruXcmD78vZlzdLI275KXFBcvwtItNasgHxUiuPUSM50Xdfr7+N87v6jlv
         4z3VP3Q1/HcNaxq84w4/J94uTdVxc1Wq464jc4euW7um9m9iP+WH8tjck+kXSRrYmAPR
         g4tshWAI7wBdiYTWGBmy2XuJ8DXTMXAjAkoCulnl9ALtp6JhSz6if0+2mdZCBnrr2m4w
         ptr+YEP+wYL2gmuHoMTfghJMpLisk4txUgc2GavpNbmPmXq6cfcYon8MtGZoH/tE0hZC
         QGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121709; x=1793726509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NjwcCRUit4k9bfPnEwrZTpteoTnUrUFgb+iE1jnD40=;
        b=ReAOmXa9O86FMNX58lYc9ac9BmdgAXoY0OLSbBW3dPPWKZaJ6eMz48nXqcII1TIEB3
         M+k6G30cabEg4g33eipVDUT+1esk2FURgkEGd1+aB9mi0EXRT87ZhhlYTLbooQCT83Dl
         P4tz2zFspsy0Aev7zimvJoL3GBUIBuV93cmYoIkN32Sbs9eA8cQZrbvu3TloIOxzVJOI
         Lmie1yEe6h00z8YFQTIdX/tAMr7h9N/h4K7aHkY8Kn7XKk4e1VKVqJ3I/9yUBwl5kJtG
         BudxK/g6JGiCZKjlrG3qP/CvssQFG2f+C8JgUEp6oi6sK4zDO8iNt9eP9hhj8mlCadjS
         pvaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcKx31nkbpmRSuTtFLaMnkilF5c2P+/oErhUr7pXkmBCmRxTE5mDpIMKW3WSIQrnBn2RtUyIJtpImB+YgGAzsU@lists.infradead.org
X-Gm-Message-State: AFq9FYJdkXs+LCMMM3C+qLVSNvnk3U/iNwD5zd2UP5fEe9x3zF5buGK6
	hEs6eWZgnIpl2FPQeH+68YeemC333hTYX7Lyb/vDbkz1lqiB9mxYFu3P
X-Gm-Gg: AYBFou1qJSApTfXVDOHBzV7z3gx89dvYVK+NMUf5y9B59rrpNWKXXgx2Cd0B81PEkko
	MC/rQYezxU2tOd1ts/6qilAF4nMgWMR2FIKPaJO2+jl9wSCLSvEoT+f0picR+XcZe6c9vFeAeA/
	109PjgvvXj2AKxcSO1yIctpAhs3MipSaNSxjx7NdneVbjOkEZjNaavGcRDSL4DHpuzG+jlHACNR
	CkZjfTDxq43u8QeP7A1ztFMXh2njhkHiCD/edw8w0n3Gg5CRoLkdimpBKU4NGDJbOKmjQNibdFG
	HxiYCHqqBiqkh/HIERs/A89VpAw4eehGY/t2X5Nx7RtBRBMMLZYoT4ErOfvpgS1o3LCH/FfWcsb
	re0GAACUBB9TALrfOnYfboDUn0IroloFFSTwe3fTP7E28QFtREG4YUD8Lv4XY/24zv/ZIiF8dRS
	sO/cB7L20roAPa0cjDVxtlevu5fihASUuCY2/bkR1KCq4HJ4i/CgWKnfDI6WhCHUnq2o4aRvKsG
	pmeMm+jsXUWJcGBLVKm1OyBTqYbWZ/hQtRaZvfU5Lxihdp/wMn+zg522g50FDImu5zpX7ZgGy91
	x5GKeUEcsidaRQ0v+Is=
X-Received: by 2002:a05:7300:f587:b0:366:c497:610c with SMTP id 5a478bee46e88-36a204276a6mr78399eec.33.1793121709042;
        Tue, 27 Oct 2026 10:21:49 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm59948763eec.25.2026.10.27.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:21:48 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 2/2] ARM: dts: kirkwood: Rename netxbig LED child nodes to led-*
Date: Tue, 27 Oct 2026 22:50:52 +0530
Message-Id: <20261027172052.129283-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_102150_560188_918926A2 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rename the LED child nodes in kirkwood-netxbig.dtsi and
kirkwood-net5big.dts from descriptive names (e.g. blue-power, red-sata0)
to generic led-* names to match the new YAML binding schema.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Fixes: 59cf91cf87ab ("dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610270710.aWUm0pbv-lkp@intel.com/
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-net5big.dts  | 14 +++++++-------
 arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
index 2497ad26b5b6..49deeb40f4e2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
@@ -85,8 +85,8 @@ g762_clk: g762-oscillator {
 		};
 	};
 
-	netxbig-leds {
-		blue-sata2 {
+	leds {
+		led-0 {
 			label = "netxbig:blue:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -96,7 +96,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata2 {
+		led-1 {
 			label = "netxbig:red:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -105,7 +105,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata3 {
+		led-2 {
 			label = "netxbig:blue:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -115,7 +115,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata3 {
+		led-3 {
 			label = "netxbig:red:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -124,7 +124,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata4 {
+		led-4 {
 			label = "netxbig:blue:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -134,7 +134,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata4 {
+		led-5 {
 			label = "netxbig:red:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
index d4edf2727388..23e8e8b4597d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
@@ -115,7 +115,7 @@ &gpio1 13 GPIO_ACTIVE_HIGH
 		enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 	};
 
-	netxbig-leds {
+	leds {
 		compatible = "lacie,netxbig-leds";
 
 		gpio-ext = <&netxbig_gpio_ext>;
@@ -123,7 +123,7 @@ netxbig-leds {
 		timers = <NETXBIG_LED_TIMER1 500 500
 			  NETXBIG_LED_TIMER2 500 1000>;
 
-		blue-power {
+		led-0 {
 			label = "netxbig:blue:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -133,7 +133,7 @@ NETXBIG_LED_TIMER1 3
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		red-power {
+		led-1 {
 			label = "netxbig:red:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -142,7 +142,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		blue-sata0 {
+		led-2 {
 			label = "netxbig:blue:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -152,7 +152,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata0 {
+		led-3 {
 			label = "netxbig:red:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -161,7 +161,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata1 {
+		led-4 {
 			label = "netxbig:blue:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -171,7 +171,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata1 {
+		led-5 {
 			label = "netxbig:red:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
-- 
2.34.1


