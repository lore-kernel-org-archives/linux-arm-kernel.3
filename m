Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B38CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Giq5qPPsLXMfxm/YhnvybTapzE95kM59A2+7c6V2t60=; b=1QWA7EufsGE/Vgs7VnCKUOaswb
	qt9P8PMvmWD9x+EU0jACx6rt52POKxuVz4qjvZTkmJD1v1+GID0+7BxVqhNYIrxEsW9V9y1tgXNaz
	qsO6VSlf4dLm3FhkzCmjVBozTL9vA/PkTA6r9GymD2T1MHO6LnettlNf56RT/NYiEeJYZ2oa+z8Ss
	dBqRUT9o6WoezBYNqeVWR3ih0DvyCOBvxhDuzVV4lhI4ud4qRJQpQeqrcSe3qn2Xp9SQRhzV3Qyb0
	3ON6h9I/n0c1AFjTv0gEAgCx8kjNtyOyFtumPgLGHIjg3llai7h9ysgujlDGnGAhAFUMcOFBWWrqo
	cLSyqMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYTeS-0000000CV2y-3Ucy;
	Sat, 13 Jun 2026 19:04:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYTeQ-0000000CV2T-3vns
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 19:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6013040DFF;
	Sat, 13 Jun 2026 19:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8607B1F000E9;
	Sat, 13 Jun 2026 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781377454;
	bh=Giq5qPPsLXMfxm/YhnvybTapzE95kM59A2+7c6V2t60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9nNUecsDFh+QQwnTiEXgtsMvlFPhobCTokdVoKUs6tzZW/vYFgPQDnD3/qZOeoss
	 sp4OaEsZhj8Tu/todRXEuBdxPUwwliLoVWOJEFDZIushrmQPLN6cAWMrT+5r68WS4r
	 vXWHDThPrPIBbP5tndSG6GYBbm4aRIK2nnMPcSV83kyx0QzGBFR/miA95T48DEdOaZ
	 m3oy7CVGi1Lrnz24k2/sSuEP4ioamphINRlZYM1HKZetpvVw/eD4yUwJ0yOEqQMTuC
	 YqIhdWI81KHtztQrSNJm8RLUAztKjBn0zOPPxGv4amA6DoJe2lgH4oHxiPDt82g62u
	 NpwLdeft68TkQ==
Date: Sat, 13 Jun 2026 21:04:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: add Radxa Cubie A7S
Message-ID: <20260613-voracious-lemon-frog-bb2edd@quoll>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-1-7787c94681db@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-1-7787c94681db@gmail.com>
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

On Sat, Jun 13, 2026 at 05:42:13AM -0400, Enzo Adriano wrote:
> Document the Radxa Cubie A7S board compatible for the Allwinner A733 SoC.
> 
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


