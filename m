Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765AEC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2Sa5x3Bk/YUxv2E63qa3JiF4ZIWXc5fzxQpkElp23E=; b=vjVgDb2/6OCRko9oSZhInOG3Jy
	jo97TqUJ5qWKSXiVmxnP8mIE2P1dXd68EpZyWdATM5laDmVvD6L+8kGHU/wOGo7l+rg4BPAhR0PE0
	z5OLGl3131Qh5/DZfocDSU3y/bDWVhEO85TnTqNlF97BvhK1XUde1SROEC1ETbtG9AaQyWpTLs1iX
	6u0/GL1DKXX6ouRVqGUU/9Sxx8Yk6VGrG8/t0X9pOPL+pGFKDDn/Gpqtqb3Drg/2fS204giSj737N
	e6o3rSZh3iYhZIF9yX4A1yizTvHZSuQeG5qCjl01VWU3/TSfzSs6slnCuNPV/1ledbsWAC9xm8VBL
	zPQhPtyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiliO-0000000DOXa-09fY;
	Fri, 14 Feb 2025 02:46:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilD6-0000000DJWr-35nU;
	Fri, 14 Feb 2025 02:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8006B5C5D62;
	Fri, 14 Feb 2025 02:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60E0DC4CEE6;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739499223;
	bh=LSub8CqtT51oEsBfEsqJC8pxZ3K0fNDMONrc2aB0cWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bQ9oiGRa6vXWIUC8Uk7b/PiGGuvFk7LS17ZhgT3IaLA/EAaL9VRarv8zAqzq8Pydu
	 2VNmJVEBLgwwvN5ADAwbxY71BbXFqtnb365Sx33gY4Ful/Z3ibPMf8AHgjYKeKR9pm
	 ezz7/pFbQQKTer+cT9FLtKU+1IvEWwFdJAaqEQbXqu7pB/3LMCmQtyOSFi+2JQCBFS
	 UkI91lafKeWaC9gC/07rycguqr3R/5I9nBatG0+A/CwErfmsnibdbqZk3vVpHvN/74
	 5ACgyPZwvNsTom4KccF9w+hdSCYEkpI9iqUf/WVVPwXr9ptQ9kWwFrygJGsVYjB2PB
	 +eUB7b2Hw/POQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5036FC021A7;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 14 Feb 2025 10:13:41 +0800
Subject: [PATCH v2 2/5] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-audio_drvier-v2-2-37881fa37c9e@amlogic.com>
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
In-Reply-To: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739499221; l=814;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=8OnnUULsGEdY9GdzxZfRzUcuq6+YRMad35rBMkND7OI=;
 b=iVATQz3nlsrKNfdNmI3UNFKCQYbGok4cwuex9n7friBYJiQV3quUPQ+Rddg8QkHgV9QR1gGF/
 y9fUHr7VKXxBAnh53ADeSHASQggTnpJpRiJIjaGFOn9Y1Dop+WwLgNt
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_181344_844176_B21F4F17 
X-CRM114-Status: UNSURE (   7.74  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: jiebing chen <jiebing.chen@amlogic.com>

add the s4 tocodec compatible

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
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



