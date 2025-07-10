Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D92C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 03:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TbRyUEuJzF3obqDrGuDFAgS9Z95vj0fEWT/dyYBeT4=; b=nUOOovkJs6jSOeNk351pLOJm5M
	pk/SHfDbIFLu/aVMHSU29evHCyq2R+mOmnQ9Wqb6iSPl1d16uTnBp0TDFUroiOg6BZTl3SuxsPHvb
	2/XkeGuNANZBKumVxk+esP9BUrPElkHDct4IvIu9HXhsRvP2kyxqrgo52M6HMjsrVavReA6o69Tf8
	0r7f1G0i7HUFJ2zRedXex2bxA3UuEGwi6aqmZpokFnQIMYQz9j/TcFfsxfB1IhDOBx1SNKhG4Qwcy
	uOsC4UMm6mLAmqAxhQQJZdBozActEifXFP1oPWOQwfTyFqMxNyKJnKuw23/6ybTi6vMGbCjKoeW0M
	WRioF60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZi7M-0000000Ab8s-1dhP;
	Thu, 10 Jul 2025 03:38:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZi4z-0000000AaY3-3THm;
	Thu, 10 Jul 2025 03:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B24E61444;
	Thu, 10 Jul 2025 03:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04152C4CEF8;
	Thu, 10 Jul 2025 03:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752118572;
	bh=5MnEx6d6Bp+tncNEQjSvFZsKEzB4p23EOo3WP5jzh6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TeV4YdE0/0rnz9PoZCBSS2MrMka0Ys//W3ff1VsuYSM17QAQbVkcsklxFr/D9Apat
	 fh+3yvYWUwzvpa3nEAB6lzngn0tVUruGp9w6VBZVCGnjQkUbMWVfaNaE7uJgJ+g1ti
	 YTHYCOV8KMRsIk1FQO7RpBuitvp+n0WOdatTDDYc4Ri2fO2CziHqRz13/AbajVo7ZS
	 QntSU3Abvrm6NuDncOZai5be/6EfLpvZaWlj5Cx4XTXZAnMf6un5wf4zm4TAWUC/bX
	 NKyiUjhxbRJAwuTCaQFL0xBNU7/lLx4+Jc09U1Six3HVhRt0pDVQzk3ZbX6afuz2oA
	 iroxenrl49U+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B5AC83F0F;
	Thu, 10 Jul 2025 03:36:11 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Thu, 10 Jul 2025 11:35:39 +0800
Subject: [PATCH v5 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-audio_drvier-v5-3-d4155f1e7464@amlogic.com>
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
In-Reply-To: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752118569; l=873;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=x6WA+WpOIp5OPvSngtyt9yMnHRZE3lLhDSWKJO4Usbw=;
 b=8pDuK0vyXUAHxnZ7z6r+YQxBmz4b0lZ/mfWeKQkyV5k1GOC4ZXtfvhBnjtVB12AUjeTjzEuO9
 AkCwFAr9iapCq1hjjNtYMbmLOyfFx1oEyxcMurQyj0Sy/tSiJe81BaI
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
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

From: jiebing chen <jiebing.chen@amlogic.com>

Add S4 SoC tocodec compatibility support.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750898d20c866015bc2e1a4b0554846..ea669f4359bc81b0f45bc2105c832fc2b11d8441 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - amlogic,sm1-toacodec
+              - amlogic,s4-toacodec
           - const: amlogic,g12a-toacodec
 
   reg:

-- 
2.43.0



