Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA67CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzTgkEW/VzjYQsZb4pmYhJboSv9V2pycrc3aBF7hB4M=; b=q6qPJl73FoZ+MgKyI79x33Hx/r
	m4EbBJFb0U3j5wUjaQ1r85JdyvtwawV9yZ7baQyUMnSHFDSA0l+ZEacDB0nn+cPY5qwssM3ovEHPG
	P6qIAfoP4Djrxv/ZKkZdmpk5Y79O8yhbU83B5dW7H/ooWw2YayWDp50THqMCL/m42hwadW2xmkspp
	KZleU94guGXLs9T2w+Kt2JQMUumH7jj1fjYZrWI7x6cx/jZ34CrKU8ryHUXAlOaVWXBwF3iIvOlss
	H1nBFVz4xdBFYxSpQqBAkSQqE3+xqym0+FvSoyufh0ZIpeMbghxLAl3xrsr5YomhHsVLolh0TZjIv
	16nUJ53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyEnS-00000005V5K-05lV;
	Mon, 15 Sep 2025 19:23:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyEnR-00000005V55-0nSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A276024D;
	Mon, 15 Sep 2025 19:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81A3C4CEF7;
	Mon, 15 Sep 2025 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757964207;
	bh=0wgdASjQ8+qDJ79gn/NuVPOeE4bNUVFLO8UtfwxeGVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eI+9acgiP6WXqQyvH3870s+EQuPE3FRAzxwJsd0aa6K04KAM/Mt/17qm2MtmTVOsz
	 3OZQJkwpbm2815yS21+T4NM9Ovp5xQfhEtH7sstIkx/65axdj5gaAz/pT6uzEjOJH2
	 rXFDqdpyrvmZLrBcl9c72pYJg8wY2x4eIrw46PB2s0nt5uQt7z7QW71UqTno/gQJ0E
	 P75SbBo4i8eKKqCLxOxEKBYPTkZFbHTeMT7pBspFrHWjYiVTi529rRxtAWfxyQ/Sfp
	 V7999w8IbTuEcxNseeyUHX/7aq4xSgQwP4p6jjc6yJ2ljNnbKFlcDDMo9F898K/oI6
	 CovY+eYXxaOrg==
Date: Mon, 15 Sep 2025 14:23:26 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v6 1/6] dt-bindings: net: sun8i-emac: Add A523
 GMAC200 compatible
Message-ID: <20250915192326.GA3089483-robh@kernel.org>
References: <20250913101349.3932677-1-wens@kernel.org>
 <20250913101349.3932677-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913101349.3932677-2-wens@kernel.org>
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

On Sat, Sep 13, 2025 at 06:13:44PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The Allwinner A523 SoC family has a second Ethernet controller, called
> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> numbering. This controller, according to BSP sources, is fully
> compatible with a slightly newer version of the Synopsys DWMAC core.
> The glue layer around the controller is the same as found around older
> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> this is the second controller on the SoC, the register for the clock
> delay controls is at a different offset. Last, the integration includes
> a dedicated clock gate for the memory bus and the whole thing is put in
> a separately controllable power domain.
> 
> Add a compatible string entry for it, and work in the requirements for
> a second clock and a power domain.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v4:
> - Move clock-names list to main schema (Rob)
> Changes since v2:
> - Added "select" to avoid matching against all dwmac entries
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> ---
>  .../net/allwinner,sun8i-a83t-emac.yaml        | 95 ++++++++++++++++++-
>  1 file changed, 93 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

