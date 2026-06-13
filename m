Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DE2CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNQdqW86qxYa8djwovcvqEdfyYcjTVULQCM3tAzMfOA=; b=pYbeZZAK3K8GAAoPvTCkf2PGZD
	Ci7EzHEwGSJisI432kXwUEvpT7yYScWseLWSriADNykM8+zxnohDNqSBVue23XEKYpvqJySlPJASw
	sImCD+uNMb55NdvYGYjpw/m2hjR5ibLIy5sPR62l7fvSm1btMkEfXf6+kfQYe8MXx4npNb3O7xu69
	21uOxKUbcHDDAvs42NL7zFyGVEUCdgZGFhPdB6HRk6L/rm2mpBZpyWel9L/Q949S+k4a6Lbz/35Yk
	vthOCr8pbdBcWJm3zipQ1Q7ijVD2uJr+3FO9evxVoD+4U1rCXhjbdq8hCbQ9QlFnvzu2uI3czWeWN
	POz3X9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYTe8-0000000CV0l-2ycf;
	Sat, 13 Jun 2026 19:03:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYTe6-0000000CV0c-41eX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 19:03:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0BB26008A;
	Sat, 13 Jun 2026 19:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072D01F000E9;
	Sat, 13 Jun 2026 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781377433;
	bh=kNQdqW86qxYa8djwovcvqEdfyYcjTVULQCM3tAzMfOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JZyPaiTwQEHgFYv9+ptz7FrUfwLZJQCtnmPXoENoJz+BEEG9IgpmWZJlC19D3pv0v
	 KCXEkY3O6ggSYdMmHOmig9FVqFwIM5Nwc4L3mqTlWcfufd8Mj8vBU+KsyA1JCeTV2B
	 DHPD4UiExZzcLOuNo3pzTs39AW+cWaNBb6jYn1DzO0JyEUhmVlILqmgxqkixmxLTrc
	 Gro2XMc3RSJxo0+thwl0IKGjulPPnzCPrwtvnPTpT/wsRfsJBM395uGp5pQQj4SqiH
	 Q7DVQtExb1DKJEc6l6ya3P4+guOrNgxuK1gBOV0/qItpovtwX9WQojPuPFSg2U2nfT
	 huGdtoUHGyEWA==
Date: Sat, 13 Jun 2026 21:03:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mmc: add Allwinner A733 compatible
Message-ID: <20260613-dexterous-admirable-ostrich-8cc679@quoll>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-2-7787c94681db@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-2-7787c94681db@gmail.com>
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

On Sat, Jun 13, 2026 at 05:42:14AM -0400, Enzo Adriano wrote:
> Document the A733 MMC controller compatible with the existing D1-style
> fallback.
> 
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9f3b1edacaa0..9e9590521210 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -58,6 +58,9 @@ properties:
>        - items:
>            - const: allwinner,sun55i-a523-mmc
>            - const: allwinner,sun20i-d1-mmc
> +      - items:
> +          - const: allwinner,sun60i-a733-mmc

So that's enum with previous entry... What's with Allwinner patches
recently that they do not use that syntax?

items:
 - enum:
   - ...
 - const:

 Best regards,
 Krzysztof


