Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA98C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmSC34Df9sJwJgpBvXLUH1wyBX5cNGCOC9TM/UI+Np4=; b=1Cw6Fe72BZO+l79EZB3zncc9jR
	Yxf+TvHTnhzztVUQMdqFiyQrVqjWmq3M4g4C/QzhYdep98XZQqt2HnZFB+Ap5nT9Nr41RRAlas+Qk
	olgrOFkmj05jMMGVq5bqav0iKoymfpIr+s+ozMfhC/mHnjpnKBzt069wmEekfd7hmzcgTy7hJHiUB
	GcavYwr/BVBRfTlIxCmKO34AaiKYlvliTNTD/JEZSa4R9nLrJ5FQa1L9QBBlTSeAXz09dnKSCAhzM
	BN3yNEuN3sIrYUGSXUxYO5BEPZfQCojn3jSlU6Z7T31gmgwKON6oTokMYiyUgMBtcBnnU0SjV8kwU
	Rjn9VU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivIk-00000007WXo-3w3R;
	Sun, 12 Jul 2026 14:37:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivIk-00000007WXb-063m;
	Sun, 12 Jul 2026 14:37:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5404041713;
	Sun, 12 Jul 2026 14:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389BD1F000E9;
	Sun, 12 Jul 2026 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783867021;
	bh=pmSC34Df9sJwJgpBvXLUH1wyBX5cNGCOC9TM/UI+Np4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Li45TgA1la4VR8WDqwbcAj0SQ5f4lweEms7CnWe3laFL93TiZ5RXcogkxFVgPrty4
	 Kw5+PmjOq0Ot7YLkvUXW4aGOKGLAK8/2y9UJEU09fkVO46mZaDaRrUKmLhhQcdwaYl
	 Ooc1WQWcparey8ZxSRyvu505PmhPOcE+alU9ANihp0w0C0+nRuVsyeDLstBFc658cL
	 /WD/7PM+xXxIQ87PzDlQurkduAexHnBLOqZER7EEPjMBRzhigeRmRnHjqHc1jNMlV8
	 UnxG0i+8p6qO1XbdB0uCZjRQQfSWcqyoBkQTjIAwsjZwdeRsrKbHCmfmH9rlPwkDct
	 PuT3uDhw3s/dA==
Date: Sun, 12 Jul 2026 16:36:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, 
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	"David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, 
	DENG Qingfang <dqfext@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: mediatek,mt7530:
 add econet,en7528-switch
Message-ID: <20260712-hysterical-thistle-prawn-9c81b5@quoll>
References: <cover.1783770059.git.naseefkm@gmail.com>
 <2133035bb22eacc8a0e21f86c0c800a45023ee01.1783770059.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2133035bb22eacc8a0e21f86c0c800a45023ee01.1783770059.git.naseefkm@gmail.com>
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

On Sat, Jul 11, 2026 at 03:41:00PM +0400, Ahmed Naseef wrote:
> The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
> memory-mapped in the SoC register space like the built-in switches of
> the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
> are connected to integrated Gigabit PHYs and its CPU port is connected
> internally to the SoC Ethernet MAC.
> 
> Those three switches are MT7531-based, whereas the EN7528 has a genuine
> MT7530 switch core (its chip revision register reads 0x7530). The two
> generations differ in their register programming - for example the CPU
> port is selected through the MT7530-style MFC register rather than the
> MT7531 CFC register - so the EN7528 is not compatible with the existing
> switch compatibles and cannot fall back to one of them.
> 
> Add the econet,en7528-switch compatible, with the same constraints as
> the other built-in switches.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


