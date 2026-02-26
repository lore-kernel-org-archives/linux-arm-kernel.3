Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A522FC5907
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvtdgDqcPfybbSQHXR7lx5Dth27D3jGXinDcpdpn804=; b=QlVyTSgr1T6qEo9IASGdZ0+kek
	HUrceFB/hxqK9+LJEy1aqE4/8ZhwojLomIYQGUzg6FPXYQLMZbKu/D40Wm1F93olN8Wedvy1ejEm9
	KCylo65Qmc/iz9Nz3XEcPus6G+PeMpQTS3z5RBDgC5M38X+4jP9vo/RRH1SyhT7lVA7Z1NXNprHuz
	XVKTs5uRvu26X3S67WB+wV9ozbQh33RuyWd9R3BAGh1/CfH9zfBkU1oYHSApjI+l0hLVx9da/js+/
	Xw6/qLxIStGfCWPFBYJyrtT9U6Ps06rAVx23Y0Ea0rm4cNtfBf2FWWcqH09y+5RH/ws28qStnz4TA
	IuCTI3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW9l-00000005bUH-3c5X;
	Thu, 26 Feb 2026 07:51:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW9g-00000005bU9-0NFQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D49060097;
	Thu, 26 Feb 2026 07:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492DFC19422;
	Thu, 26 Feb 2026 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772092286;
	bh=853EE6JswtL146QPlx0xKJwmaPwSVMEPY+7ZFJPHw8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h96dgHq6uDpjTwC9DhcsgikND4HsHry77CIHiqyyBGvDugPykCFJOgqSg8hYVQ15E
	 IfODci0b11FRoVgL1ug+B0KbnpZoYSsaYWY4VJeTwXTnUr48pwTROSsETiskG6otXf
	 XP50fObZBFdwjGCuajvMxGAT4A99JRJbaEFEG6BgA66kkpKczqQo5xl8IPuie20VTO
	 ajUkQ+HGmFtrduFIlVcrrm+kgkCCOZ2TL0A3scIFlDasyUwcmeeoIJkbFrtqnQStCF
	 fIqVnF8Rg/S5MQuSEGA4NNcr6KL6dVv/Bg8IyFJJeMe/vDwQmkYxPCZKV5IZwLB40z
	 m/KsF+NHYe6Aw==
Date: Thu, 26 Feb 2026 08:51:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for
 Allwinner A523 SoC
Message-ID: <20260226-heavenly-silver-nyala-557ede@quoll>
References: <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225160828.1687643-2-wens@kernel.org>
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

On Thu, Feb 26, 2026 at 12:08:24AM +0800, Chen-Yu Tsai wrote:
> The Allwinner A523 SoC family features an identical LED controller as
> found on the A100.
> 
> Add a SoC-specific compatible for it, with fallback to the A100 one.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml     | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


