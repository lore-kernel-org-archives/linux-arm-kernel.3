Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA4FC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smCE3zkHSVpYMLVZBYOzeCcQF45U8Re7SgEYlbSp9cs=; b=DCfymqo50uIl4Wt/TRpLL3pg1+
	u2xfU3sbNBNFXPaZwSHLmcXCw7cVaR+MC5z8AyupLUuTjx9eWSypNi1APWVW3d/XPguiw1IFfcbYQ
	QMD1DUSgFk5xqo74O2ZkDOO6dncPJ3IpPL4cm14mpCpmxW51hMEtQ1hPTd0pBWeMPatWAu3jdAPGT
	hCmudCyN67xGdFl5iVrJYKwYQoXTRRGYkVCuWjp8TYdo2x62m18BpYu5K5vf60bc6/SutwwKTC0AT
	7LornZJomKbp8bm+fD5wUs9qYgsHUUparz24j4+IgMyPw91N8qIMfd270asg4jJeYOFYpY32LMx4a
	tuWZhPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA2Z-0000000FetM-2TAS;
	Fri, 24 Jul 2026 07:09:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA2X-0000000FetF-1LdE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:09:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A886E600B1;
	Fri, 24 Jul 2026 07:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675881F000E9;
	Fri, 24 Jul 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784876986;
	bh=smCE3zkHSVpYMLVZBYOzeCcQF45U8Re7SgEYlbSp9cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xhe4gmK199U6siaMOiI145Lh0UaipXg9Lq6s7iLK2YY7Zyw8HlTfA68LYyREDo837
	 Qk9dbNouTA9JSeee4mAlk7VXy6znA3L4dmoZEw24xayrctYlwWviR73ZgfO7KH+N/b
	 U9xt3dTdRdpc5bVQ1xIULJ/nJ6YIsoh7FcEYLfTvBZuD5t0SX8gJmpLg/ZtuYLh5VS
	 ewEPV3CB470jf65SHg5rj83+cf2hyrU+7QKKltUoMyDJkzUHsV8bZ88H4Ckw9SPfoc
	 xSqSdK2KuV/JeJhRcdCW37cBEpdrJVf5dG3rgtVTsTLrAo0UrGxNcAwx8enXQ1zTse
	 lE9S2sUHvDDXg==
Date: Fri, 24 Jul 2026 09:09:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?U8O2cmVu?= Hantel <fugininsane@gmail.com>
Cc: linux-pm@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Rossak <embed3d@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?utf-8?B?U8O2cmVu?= Hantel <fugininsane@googlemail.com>, Claude Fable 5 <noreply@anthropic.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for the
 A80 THS controller
Message-ID: <20260724-hysterical-fantastic-koala-1756c6@quoll>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
 <20260722210046.2932498-2-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722210046.2932498-2-fugininsane@googlemail.com>
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

On Wed, Jul 22, 2026 at 11:00:44PM +0200, S=C3=B6ren Hantel wrote:
> The Allwinner A80 has a thermal sensor with four channels which shares
> its MMIO block, bus gate, module clock and reset line with the GPADC.
> Register-wise it is an early version of the THS found in the A83T and
> later SoCs, with the THS registers starting at offset 0x40 of the
> shared block.
>=20
> Add the compatible to the sun8i THS binding. The A80 takes a bus and a
> module clock plus a reset line, so the existing conditionals already
> describe it correctly.
>=20
> Co-authored-by: Claude Fable 5 <noreply@anthropic.com>

NAK. Tools cannot certify DCO, cannot be authors.

> Signed-off-by: S=C3=B6ren Hantel <fugininsane@googlemail.com>

Messed DCO even more.

> ---
>  .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml    | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a8=
3t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83=
t-ths.yaml
> index 3e61689..718c44d 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> @@ -18,6 +18,7 @@ properties:
>        - allwinner,sun8i-a83t-ths
>        - allwinner,sun8i-h3-ths
>        - allwinner,sun8i-r40-ths
> +      - allwinner,sun9i-a80-ths

Really, single compatible was co-authored by the tool? Folks cannot
write a single line of code nowadays or how does it work exactly?

And the tool did not even read the rules about sending patches, DCO,
proper subject for DT bindings? What is the use of the tool if it
produces obviously incorrect patch?

 subject: drop second/last, redundant "binding for". The "dt-bindings"
prefix is already stating that these are bindings.  See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/b=
indings/submitting-patches.rst#L23

Ask your tool to read the docs before using it, please.

Best regards,
Krzysztof


