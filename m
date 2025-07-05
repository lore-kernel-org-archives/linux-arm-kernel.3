Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB3C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRJ9jiTJDBWt3qXURvtflcpzWtNbC+13knBAj6BHXgg=; b=PdKTUBgC6RrqBlkTetyR9tDn24
	IoPxpgFJJePFUfCBQxUD3cjD2aIfZmiFplH8MuLqqQDfRHp4qtGJag5aw086YDgItlWAocpl33eG5
	lPTgbiiepE3SJ+W9z7yLwKwXPmNuCXDDPOTf9wcXPXaH+MlqlDwIjP3AwRWOOFKRdBIhQh2hNCdkw
	gP4jtjCGWDRojqx6VYOy+NeCZhqkijq7kDFgzabdtBA8hApGbxwqe1qF2TJuRTgMTc29qzVLK+AWY
	WM1VixGukBM7p0+x2U5ipXyd412sA6IJ902mDw7TN6Ru1E9m93Ome7ncaJGaSEa2VMBBjbre0CkkW
	gINXXGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxfm-0000000GFR7-1ctQ;
	Sat, 05 Jul 2025 07:50:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxSm-0000000GEK9-1jcb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:37:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01A61153B;
	Sat,  5 Jul 2025 00:37:17 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 785EA3F6A8;
	Sat,  5 Jul 2025 00:37:28 -0700 (PDT)
Date: Sat, 5 Jul 2025 08:36:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
Message-ID: <20250705083600.2916bf0c@minigeek.lan>
In-Reply-To: <20250628054438.2864220-1-wens@kernel.org>
References: <20250628054438.2864220-1-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003732_507621_73F962EA 
X-CRM114-Status: GOOD (  27.33  )
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

On Sat, 28 Jun 2025 13:44:36 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> This small series aims to align the name of the first ethernet
> controller found on the Allwinner A523 SoC family with the name
> found in the datasheets. It renames the compatible string and
> any other references from "emac0" to "gmac0".

To be honest I am not a big fan of those cosmetic renames when it
touches DT files. It seems to not break compatibility in this case,
since we don't use the specific compatible string, but leaves a bitter
taste anyway. Also I pick DT patches out of -rc releases for U-Boot,
and did so internally already, so it's not without churns.

So is this really necessary, and what is the purpose of this patch?
I am fine with using GMAC for the GMAC200 part in the SoC, but the A64,
H6, H616, A133 all use the same IP - as the fallback compatible proves -
and they call it all EMAC.

That's not a NAK, but just wanted to bring this up.

Cheers,
Andre. 

> When support of the hardware was introduced, the name chosen was
> "EMAC", which followed previous generations. However the datasheets
> use the name "GMAC" instead, likely because there is another "GMAC"
> based on a newer DWMAC IP.
> 
> The first patch fixes the compatible string entry in the device tree
> binding.
> 
> The second patch fixes all references in the existing device trees.
> 
> Since this was introduced in v6.16-rc1, I hope to land this for v6.16
> as well.
> 
> There's a small conflict in patch one around the patch context with 
> 
>     dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
> 
> that just landed in net-next today. I will leave this patch to the net
> mainainers to merge to avoid making a bigger mess. Once that is landed
> I will merge the second patch through the sunxi tree.
> 
> 
> Thanks
> ChenYu
> 
> 
> Chen-Yu Tsai (2):
>   dt-bindings: net: sun8i-emac: Rename A523 EMAC0 to GMAC0
>   arm64: dts: allwinner: a523: Rename emac0 to gmac0
> 
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 2 +-
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi              | 6 +++---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts     | 4 ++--
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts     | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 


