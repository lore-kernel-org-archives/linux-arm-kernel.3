Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EDAC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsZVPqm3rjQ3pAmglYmmIyHPcK5mNfQSdWwX2nYVppc=; b=NvyPGsfd1LCLY2708+fCDXXZ2u
	yj51Z8UIbTiZnT0250Se9T8pesoGNHLkr20KL5Jd9IeHFx7MF2BKs86u0DTLHq8KyqvxyArbqeRGX
	Ae6gkn7FAC8caaUgNKxe3zUxpBKpJnLISelLjFBptYCwAjjZh4S5lOA49mZaHFtwNyBYvPLA0TmEW
	xOsgtUZ86AFyy+BrgQ7BtZScRAHrUdQxVx5Q6tQcspM7nnjEDVOXUT3qV7c3O7GrAUq3lasL+4Abb
	8a709ZraJblpPfBySsLkhaktd2ClCKg4CnROVmt6ow5RQpkecsKE3I9LApJUOcWRYrPZTSnBxz+ih
	39nLl6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvNt-0000000A69J-2yXo;
	Fri, 28 Feb 2025 08:06:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvMK-0000000A5Sb-2qmx;
	Fri, 28 Feb 2025 08:04:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5590361F45;
	Fri, 28 Feb 2025 08:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F0D2C4CEEF;
	Fri, 28 Feb 2025 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740729875;
	bh=Ql7EGFG/PFq+6KXj+pWudx+1SnRRrD+fDH+0tiFHkvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jhp/EMTqvni2m/xQ/9kA0/Fq9qK4sYg9ceSvfkiPMvBGmIbaXfVfYRMK0XbPfSdQj
	 kXWWKiJvFlmv5qtCgBkctX2jSWZwRQcqRo3NOwfBDryUmFflbEQ9Pr3y9KOodhkFRB
	 zp7uBlEa2repI20zRN4mZaEc3/lkKVHa0OyDeoOtXix6+FKH+t1wQRGedt5Cqkieua
	 mTr3CEjdVVDdmPcU9o0CnzLZPNNCSFX8WEIJqXiSp3geOQ1vTE1G5ZqOtH1xQdgo/t
	 KIxD3JDNkrZjqE/xk/5rPxgbFzCdzx9S3S6RNiejJrciw98qd4awQkksR62uF+87yJ
	 swqoUyejt971w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226CCC282C5;
	Fri, 28 Feb 2025 08:04:35 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 28 Feb 2025 16:04:11 +0800
Subject: [PATCH v3 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-audio_drvier-v3-3-dbfd30507e4c@amlogic.com>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
In-Reply-To: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740729873; l=814;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=yLn4ez8IBN5cqEFPit7mp5UgBhrhZLIZZw6YIL6gw/A=;
 b=Ln4I8fiQnLMfuiMcRK4BwIzEX2oprZoBT81J9aYb4LCt/OOibp8DXvXsERxzUJ2hkE7YS4brs
 WP3M5XyLV3hCFQSRZ8oPumPoEi5QCB9NJtHnRPPuQRCOpvXvy/3gfNI
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

Add the s4 tocodec compatible

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



