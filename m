Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nk0H57S1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+g8D9oO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=womGwJTHKJOD+1XH3NXRfs1nx4BuGXpRtnEuUmoaI/A=; b=nk0H57S1m9oi7WCZRuJ8IMvW8Z
	SWGIvO0pJrir9o5bupPgIQzm+d7+rnGk5jJe3Ezf3445nUQPPNwK7JQeM9GFoo0r//IoPRQvW3aB1
	FH32Gsq/bZo//WaeHQvUKMletwZjkt83J7PP+QFYPg+fSCXbqLLTy/zMiMIK/+fo2TYPHB2z4CIQb
	3HxwKd4UlztGZjPN+cgaOezvcrVA3p67/CvxOfEA+GKL4DM8r/bgxpyV78Gf0tA/ybpL4PrKG81iD
	kdWlIAA56muMl5wKMNWJ9abPZr1FzzLbaodXNzgKLC8JN115UJxpAwxFLeM5jAF7bbz0P/1Jd+LYU
	9Pyh4UpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLo7L-00000005l6L-1S2d;
	Tue, 27 Oct 2026 20:49:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLo7J-00000005l68-2aQh;
	Tue, 27 Oct 2026 20:49:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A31443C93;
	Tue, 27 Oct 2026 20:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD611F01825;
	Tue, 27 Oct 2026 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793134197;
	bh=womGwJTHKJOD+1XH3NXRfs1nx4BuGXpRtnEuUmoaI/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n+g8D9oOWgSr6eO7E3AJwHkYv7P+3NtQQWr3w96N/lGGIecQSI3UOQDRkzC+9W1kq
	 hc8K9ipWWWfgXBi1kDHX6NSt5La2dD0J6ijk35St7Hau/FGpWcma2ONjsBtaluYbUh
	 eSUa9shwBBOx2kgsfZY0TLc1QX+D0Qvl53807eoj7u02+F4Ly2t5Nqo3V675BPu/KH
	 oyzsS5B031jep4KsRCFL+8fdrj2N6MUSv6J2ZbXxYwU2m9gM3r/soqO7Djt39LlMBp
	 KI3OBjmfYNcH2jd1STfUIxNn/bzIdfxlyjCckHnP1CRoC5ojbrHRngDpoPBcPCWusU
	 kIIIjyCljcw3w==
Date: Tue, 27 Oct 2026 15:49:52 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: ulfh@kernel.org, angelogioacchino.delregno@collabora.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8188: Use
 access-controllers in the power controller
Message-ID: <20261027204952.GA896421-robh@kernel.org>
References: <20261011184755.2058017-1-michal@nozomi.space>
 <20261011184755.2058017-5-michal@nozomi.space>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261011184755.2058017-5-michal@nozomi.space>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 11, 2026 at 08:47:55PM +0200, Michał Kopeć wrote:
> List the blocks that the power controller accesses in access-controllers
> instead of the deprecated per-domain mediatek,infracfg phandles, and add
> MFGCFG, which the power controller needs to enable the GPU timestamp
> counter whenever it powers MFG1 on.
> 
> Signed-off-by: Michał Kopeć <michal@nozomi.space>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 14a320f0c70cb..cf0da77c5fd29 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1000,6 +1000,7 @@ scpsys: syscon@10006000 {
>  			/* System Power Manager */
>  			spm: power-controller {
>  				compatible = "mediatek,mt8188-power-controller";
> +				access-controllers = <&infracfg_ao>, <&mfgcfg>;

Do these providers have #access-controller-cells? Doesn't look like it 
to me. You should have some cells here that define which access 
control in infracfg_ao (and mfgcfg) the power-controller uses. Looks 
like you are abusing the binding to me.

Rob


