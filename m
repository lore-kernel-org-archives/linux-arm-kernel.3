Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85DBF327B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSQsA0VzdaHyqI40eVjgx/fi5hi+oc9Ozgxti2jjPwI=; b=zJh3SgRg+ecPYhG2FomaAFekhE
	l3qvMEHGu2yG/MpJWjh+iGv/B5FWvdDftgXK2NzJYN4yBO6I1E3PWk9ZeE/pTUlAx8tFXBcOm3N4q
	LZTygN365TizL4asIk44ArQjugYyVTYeALk5c+VL4pUxNWizMCH1Cvz485OhJlOZbimQvgDnLrR8N
	ALsM99rN2/Tfxd0hKAt3WFnPaYwK99sU3xgT2LUOlQQJUcXQfOixsE9YV5PAOWT5Gp3rHpTqatt+f
	DGOFtBqTSREGl0laOI+qUzHP52gn+vbg6F+k5mR7JFyqGzEkktBPLNPrU5yCr3GFIVLJw5zA3g4zZ
	V6Vtcz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5M4-000000089hG-47Cg;
	Tue, 21 Apr 2026 07:17:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5M3-000000089gw-1ebg;
	Tue, 21 Apr 2026 07:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1CC9600AE;
	Tue, 21 Apr 2026 07:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29ADC2BCB0;
	Tue, 21 Apr 2026 07:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776755826;
	bh=oL7Rd9GJ0l4nrvo2o5ZqNhj+AWR0EznmOcr0ETuYJ3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKoXBfX1iDYVokCK1QnBS2adAyetU5axjQ1aYa9P+SRwMXYTmXiUCirgjZaWzpKvu
	 xxIo4rcookmIIrLPNMqBl5/ypTVljyPcSlxkcJSV2qCtuUX3vgxzhmF7D7Ur6AGa/r
	 eRScaiYU9VkKjoSh//mjb9xtVij+CVas8Bf8UnlcSdbqg1fVCCrNIzknYu9UdDKOCj
	 rIqgXJ3WCMZl1+wjqCumDLCmXR6NRLAgX+9lcgPGEEbnby1kcgzhjTRe37eFxB+f9C
	 GkWyHxxzPpv7y/ubyHQEVf5LfE6/B9nEUWymCuSZX3NRylQg1dbjDDY/e7Kzm+XwUc
	 h/YtjfixVpwQQ==
Date: Tue, 21 Apr 2026 09:17:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/3] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <20260421-axiomatic-sensible-corgi-e18edc@quoll>
References: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
 <63aa9d62fef13e0991c17b16a836d8b5667aca96.1776702734.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63aa9d62fef13e0991c17b16a836d8b5667aca96.1776702734.git.daniel@makrotopia.org>
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

On Mon, Apr 20, 2026 at 05:35:09PM +0100, Daniel Golle wrote:
> Add compatible strings for MediaTek SoCs where the hardware random number
> generator is accessed via a vendor-defined Secure Monitor Call (SMC)
> rather than direct MMIO register access:
> 
>   - mediatek,mt7981-rng
>   - mediatek,mt7987-rng
>   - mediatek,mt7988-rng
> 
> These variants require no reg, clocks, or clock-names properties since
> the RNG hardware is managed by ARM Trusted Firmware-A.
> 
> Relax the $nodename pattern to also allow 'rng' in addition to the
> existing 'rng@...' pattern.
> 
> Add a second example showing the minimal SMC variant binding.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


