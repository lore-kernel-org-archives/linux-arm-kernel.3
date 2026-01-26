Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2078C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 06:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RbHnO23gWTWBJEA4LCA9XVRP2WoSHszlQCaej06bgE=; b=DcK6mNnIzC0tA2Ytm9Ma9awBYx
	NuXb78vQv6JsyLrG1VW6Fvl1VgXohwWmDbqpCrTC/AN6dj9tbVve9fFW6i+YSCTfEgiG55WAyg3Mm
	wMtfT7x+Xz3zRwsGw/U8aEjoyn/xcxpCauS6dg3egicnM/6Kz12lucuNKma0t9qx9NmQ+hE+1RBwB
	NXb/Rk4FmbVAt3xSXLHPMksG2H5221U//Qn0wGKX572IfjYeSqDrkXcbPZ4GZZIXkjjUN725+S4d5
	uQ6BISY51pWvDYvwcwO1mFxC59k+vZw9+0ME//Fv5fMrSKbwADtuwrkUJ0/a8hEP03btZ7YCku804
	TlsLE6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfw-0000000Bxf0-1cLD;
	Mon, 26 Jan 2026 06:02:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfu-0000000BxdH-0zaW;
	Mon, 26 Jan 2026 06:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BBD16012A;
	Mon, 26 Jan 2026 06:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2DFDC2BC86;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769407328;
	bh=jxtcZmmXRvFxetXecCwlHePQ5WuC4F2aOTgTeR++Brg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YxgsoX77H8JrFiEv4HyznXewixZZYEthN5QB3NpihQU/WDWHNI+1AvX1XT3ApCu3P
	 HuFqEhDlYIX0mwD/79WXioq+/BCgHw1hiGN2ticv3wKBrHnpBzhG6X5Fq72bRlO3oA
	 SNA2ohUBLfZZVQorgVPTtrwyxFg09pNm0H8Hri+HHvda4ZXezePitgrVIPQTfvC+sr
	 sIXmaSxTdVDffEnP42qt2g5i/eMn9mFfLtzf/3PX9HaU86wUevPSSP/QCz8KdfSuYd
	 fmFbxkUt6vaBJ2CmTE4WWW7rCLEgJ3CpajYOAtFSICU8JGLc3v3S6zucIEDs3VQfly
	 3bAxvm95VTw7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FE5C88E4F;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Mon, 26 Jan 2026 06:01:43 +0000
Subject: [PATCH v6 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-audio_drvier-v6-2-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769407326; l=804;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=6X1OSzRQHl389xrmv+iMGiIJqB/VbuISTBq7YBeGWCI=;
 b=m56U7HCt3M+4P+Y4dUx5wcdFcKrpEn4aqCpLtgvJ1trxe9jKFWPOOwHZdBb+9Lf6P3ClibiDB
 NFo35KoQ4oDAqMI5WhI4qAIKDRyOyZqcZvhWLON8aRCHYpaUSqYc6eD
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 SoC tocodec compatibility support.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..7e053aaa0f59 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -25,6 +25,7 @@ properties:
           - const: amlogic,g12a-toacodec
       - items:
           - enum:
+              - amlogic,s4-toacodec
               - amlogic,sm1-toacodec
           - const: amlogic,g12a-toacodec
 

-- 
2.52.0



