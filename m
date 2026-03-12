Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0692FED2E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPjPp02Fx5lBVnseTQPPYLY0cwMKwnu14ijRdPtP/a8=; b=yzORstYs4069bkJezQqkIF3XvN
	pWieZ/Ti32lzUSFgTlGZXtV6KySbDR4HK2oyval3pRwnqogChBuLRtl69RpW3U2yrFqOvhxeeMKyJ
	zN6p7TG/B5iYR+s3IAMon32cjHeHnvd4Wl5BuyYTYrYLoIZFbGgdskTiqU5JGhUeYEzAJZKqQW45C
	ckpkwdDckLg0h2jzzBVnd1GDsGbIKSmSauJwD6X1myvzyD22PP8e5i0W5+GkSBeM7d1JSTWjvjqxm
	BNqgDmfQiwc1SctOVT/baGu1pOJydyxy4HUCrmwzQ5rmwchjHB2yLEQad962NKd3zL+rAsJG4gllI
	I2w7g7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hZZ-0000000EIib-452a;
	Thu, 12 Mar 2026 15:03:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hZY-0000000EIhd-2SUn;
	Thu, 12 Mar 2026 15:03:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0D6A60142;
	Thu, 12 Mar 2026 15:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C83DC4CEF7;
	Thu, 12 Mar 2026 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327815;
	bh=GEXo/a8VwauPBc+5TYF8XHAHuKgUh3BlIdVX1JobXj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcIjGkrC7M7ZBopqyOoijpIoboeP1DH8ortMPA3WkMM2isO/EYn8K6TJ7dctpXrSn
	 a+leYTWNIEeztAr26C6uFQ+yBlRmIFEaT6Fg87RqRn9IoIxw2K07Gjd2KUxczorVea
	 fZSZ33BFqK7MdMRN9VloNCJD/Jnnyx9zye7RbWqRj+IU8sfc5XT8MOOwVZQVl+Hu/W
	 Rnlu21CQMx6Np2MAJ5lG1cUv144eodxoHnzwlM9dYjD1PCKghZj/cJKYeXQalKFTvc
	 Yhlwf2KtwpNJzvGgYs9gEOE6CbUFPcfGmkmwygSc8xtW+9NJ8gPh2Gf8HKwtGGB7xn
	 L4B+udfRJv28g==
Date: Thu, 12 Mar 2026 10:03:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, akurz@blala.de,
	linux-mediatek@lists.infradead.org, geert@linux-m68k.org,
	lee@kernel.org, hvilleneuve@dimonoff.com, conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	angelogioacchino.delregno@collabora.com, andy@kernel.org,
	robin@protonic.nl, mkorpershoek@kernel.org, krzk+dt@kernel.org,
	alexander.sverdlin@gmail.com, devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com, marek.vasut@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: input: add debounce-delay-ms common
 property
Message-ID: <177332781406.3127906.8010880733088237830.robh@kernel.org>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-2-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305192101.2125660-2-hugo@hugovil.com>
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


On Thu, 05 Mar 2026 14:20:47 -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> A few bindings are already defining a debounce-delay-ms property, so
> add it to the input binding to reduce redundant redefines.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  .../devicetree/bindings/auxdisplay/holtek,ht16k33.yaml    | 5 ++---
>  .../devicetree/bindings/input/cirrus,ep9307-keypad.yaml   | 7 +++----
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml     | 5 ++---
>  Documentation/devicetree/bindings/input/input.yaml        | 8 ++++++++
>  .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
>  Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml    | 2 --
>  6 files changed, 16 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


