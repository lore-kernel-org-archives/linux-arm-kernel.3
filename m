Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4033C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDwNgigD7L550za4PiGHYs8jF5hGK6ShTZPwaclA8Jc=; b=JnetE2iFp3MIpCqdL3AXDd6hCC
	o6J1Jt0JA9Y1kA13Q57nUWKLrVItjRUWjixF0Yhe/RSvGITADfsf8rAcSBxV8uMWq7rTP2b2IThLV
	gzdSER+CzylAsHIYJu7zlYrz470PhDlQAetq73UOURYSQ9HaLevx6xP3ksY589ylwxJBIIfgczokk
	wI4j5hGCY4Gy9/NE798nQTs6uRXwmofZFQtbN1n2ZtOAvXF7ewjXdG1bMRFalBsuQjjW0tMS789zx
	fX9ifH0UEl+LcYQnJv01bZc4duj4daHtL6SzOJvasG9Wrr74n71XOTmozO7kL5JeluMEoZhfMhSlE
	Fa9uKzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Rd-00000001aPy-35cN;
	Thu, 07 Aug 2025 21:46:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8P6-00000001Zwm-0Gjx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 21:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62DE8A567D2;
	Thu,  7 Aug 2025 21:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88C0C4CEEB;
	Thu,  7 Aug 2025 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754603043;
	bh=4Hhu1mY/9d5fc4oL/G5cBEXvFuP6pZFVnFE808w7EtU=;
	h=From:To:Cc:Subject:Date:From;
	b=Up+I9puWM3oEE1Q/1CwuKRzUqxg3kHpLkqWTEJjBti0j9cgoD95zMXxI9m5o/e0Ai
	 PGbhwjMfOKggtYcltqjPAGeJQTg9haPoGMEQfGAg1OKLz6aTwuHGYCThOKyh+kJEW1
	 ceVI8s/b3s2vO18QACXme5GoIH2GDNDjZVjPBp0mTXpezDFBN5bPznUWiu1pp3/HiH
	 cJQvbI3SJvxcm+3+CX5RZBLr1kst7v5yP2IahcZ0eEG7ilaovLW0ZCCqn3+BXwhner
	 UF+x353kaUz6OaICKFULCE++0QHgMHiHmRQ8tOeycYE/UJwj2eEdU4yseZIbC2wwA5
	 D7Ft8yp9p0QHQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Drop imx-audio-sgtl5000.txt
Date: Thu,  7 Aug 2025 16:43:57 -0500
Message-ID: <20250807214358.4172451-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_144404_163831_81443411 
X-CRM114-Status: GOOD (  11.49  )
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

The "fsl,imx-audio-sgtl5000" binding is already covered by
fsl-asoc-card.yaml, so remove the old text binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/imx-audio-sgtl5000.txt     | 56 -------------------
 1 file changed, 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
deleted file mode 100644
index 2f89db88fd57..000000000000
--- a/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Freescale i.MX audio complex with SGTL5000 codec
-
-Required properties:
-
-  - compatible		: "fsl,imx-audio-sgtl5000"
-
-  - model		: The user-visible name of this sound complex
-
-  - ssi-controller	: The phandle of the i.MX SSI controller
-
-  - audio-codec		: The phandle of the SGTL5000 audio codec
-
-  - audio-routing	: A list of the connections between audio components.
-			  Each entry is a pair of strings, the first being the
-			  connection's sink, the second being the connection's
-			  source. Valid names could be power supplies, SGTL5000
-			  pins, and the jacks on the board:
-
-			  Power supplies:
-			   * Mic Bias
-
-			  SGTL5000 pins:
-			   * MIC_IN
-			   * LINE_IN
-			   * HP_OUT
-			   * LINE_OUT
-
-			  Board connectors:
-			   * Mic Jack
-			   * Line In Jack
-			   * Headphone Jack
-			   * Line Out Jack
-			   * Ext Spk
-
-  - mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX)
-
-  - mux-ext-port	: The external port of the i.MX audio muxer
-
-Note: The AUDMUX port numbering should start at 1, which is consistent with
-hardware manual.
-
-Example:
-
-sound {
-	compatible = "fsl,imx51-babbage-sgtl5000",
-		     "fsl,imx-audio-sgtl5000";
-	model = "imx51-babbage-sgtl5000";
-	ssi-controller = <&ssi1>;
-	audio-codec = <&sgtl5000>;
-	audio-routing =
-		"MIC_IN", "Mic Jack",
-		"Mic Jack", "Mic Bias",
-		"Headphone Jack", "HP_OUT";
-	mux-int-port = <1>;
-	mux-ext-port = <3>;
-};
-- 
2.47.2


