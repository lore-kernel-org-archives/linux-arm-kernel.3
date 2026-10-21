Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E184606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bK32rd0l;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bil76e+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=; b=bK32rd0lF1pwIAgm7habC1cnjI
	0KA+Z/CNOWtZMPS1g4mkNfFEbfKX4v7uZod603q+tqFa4etAuPyPoDMpN76ZBdMrDye26zOxOziIY
	FzZNQAfs6bvqs0loPftkxZRjYarH+hTWhrgy7qHfIjFWAa5PJTWaaEnN+FjXOc4SO0i1iOtFsfUlc
	JOcZlF+Ay5zcS/YsSS57yaLjIxFrFzwFwEvvFiKCnipQsP4YOtRe87vPYoA8/AniGjGKcVPrIHTwJ
	Li66iEgfIYksuW6I1rv+ww2kHBL7Bah6aD4ORiBMEY4apSI6vI+DJw5L2GFwE1NSMSEr0lOjjBQXG
	kxo4HK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXrR-0000000CCFc-0SvQ;
	Wed, 21 Oct 2026 15:04:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXrO-0000000CCEn-0C8P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:04:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so6057215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595048; x=1793199848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=Bil76e+4jXwSM5ZdlQBI8Clgb58tnHcyh+L7645jbOMksetxJ3IJXDJrzG0Y5I19fO
         K5rslRraC+8zhilefdRJV/+pdiEx2JBxjSIOB1ppXZzewSlEzwEGiZk4JRpsftgBXwLE
         42l4a8at4pQF8mAH7MMhPnS0UVHxOSSVFXlpcVF4b7LEB4oEA0N+HHVo/Qhp6TrygMDf
         RPMkEthwPCgCJMaJzIF2bpS2GJKIruZHh6zOD07QmgTeeSTjmbZa8dEePbdsupC3xo8f
         EqpeZsL0Ik/zizl2M9TNaoGvIOOIhDfX2m4IRhVNZELCyKlNQJmeXlKRGrdIlL8Q2Ti5
         RnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595048; x=1793199848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=abRciKecivnVZpJv+5TEuhNxmGBNWB4q5+ABSzjQmY4dfGk802ny6ujP3ETQ/y+Lld
         e6Ri412IhaIK9JGeAtz0EeF1/+31fLnGZCcUiGs4TP3JyemJq0XWzAnKJPrYAbHFmb0a
         CWuM3tesIQ+CBrQ5FbRLhLHd1FDDCtd0a81ssXxwL/y3yZNmbfsKTEdyDSOcoZd4dK9M
         90itIXsMBUOhQ7CklxI7BY4RFzqxuLH80Jjz42g1zGIGoJstas/BrR9MXTrFhG+howyh
         7nGZPHIRAxzQgKycLVeSEYxxTjP+rDTKAwoDW4EhC6pbLtvtJ3tijBEibgjCQQwIGIi7
         Ouxg==
X-Forwarded-Encrypted: i=1; AKwUvBywnSXOP53TgICBEPfc9RC9U+ECVjNkX+eVWbVeUNW3A+FHuCltXCi3Pxu+xzDYIaCoXtoOFLwwkVlOVNJFBDUO@lists.infradead.org
X-Gm-Message-State: AFq9FYJzt8UJ84v72bk8HrnN7nSIRPxT2UD/Xsi3NmFSGzTE4I4CVpHi
	MEX8KC8vKmBFlnDZMLdJ3fzORUG5FmDIQ9CypR+Qz6NNSOFD8oUtnsGu
X-Gm-Gg: AYBFou0ZKZI1eiMtE/ZsvNkhAiZ8ULbl/I+Sv5lt931KgTTmg5SvRq/2Vrb+bb9jkGy
	pQTKKSDfbKbfcHMRZ9hx20Ekwv5tOozsa6ZZf6FGzRmWBQP/S5rbpQPwkCDhTB+Yg+32fhBhBDW
	VjBc7TfT9yZi2okmmbp8MdY216R3PHKrYuw/UUxfL8Hof/uFp8WuU/Ut+iX0sAl1I8L7vJ1V5Sq
	ATzIowgvXox0yQ7tGj7T0FuPUwRDXVXTVky2Di/3ddcYIqPC3U/s3k1BHIf9NwWLgFotFaVJZsx
	+O/ELwZIb2NPIZBbPICnH/eOm088R1yLlXorDMctMZtFj3vmih/bfgPSwMw6Xf21tbXqoXuiDVw
	phUnNirpVPnh0f3OXCvqfW89KrPL23hL0iFyOROlmrKL5PkIoPyRRYD7YblxVdS4VoX1Mi0BcLU
	0rGmm4LuLjFOXyXSsTwAF5QyyRyQnTA67Z7+bky05oif5M2V1C7STxpprGZ8sjC3d3SzjjkeSTA
	MaMFf0Tp6WEqLOK4HWq2zAmJTdNXbfjmpAQlkHyfNB2hZN+trunPyxHmqdivAHbrims1V14a7Px
	jqScC1mOwWJHCkJnomfTDJXdvvaMO1eKOjJbqo9nsNu6vYVZxq9SYgsYyA==
X-Received: by 2002:a05:600c:4713:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1fd8a675emr51336125e9.1.1792595047719;
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
Received: from FLK-B04Q314.fortive.net (217.97.98.50.ipv4.supernova.orange.pl. [217.97.98.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm179698705e9.4.2026.10.21.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <sympthicode@gmail.com>
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 17:03:31 +0200
Message-ID: <20261021150403.71569-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_080410_102402_1385DEDE 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -2.1 (--)
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

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - sort TPM6 node by unit address

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0


