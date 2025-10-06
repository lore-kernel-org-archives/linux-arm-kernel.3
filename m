Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586CFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJKGDNdU8m0GKn4DG9vWD3XiDoVnlveSOTBo10Qwg4M=; b=bgRnzNmoIdeNV+i6IMTZ5nss5R
	sYhIiNbjN6MR+EPm8kJWfu2hmLZDXCkwOmZ+K8VRh851Yv8zpcxDw9NfRsZF5CKieceyNoID69/c6
	PGEeGvF/0iGO0RWVVuECy17aTNY9K5YDJ0GLrfbUehO8EgMScLgMmIo7NUO1gZx9lFfGKMSwgAoaX
	FwrYyaHezMK+pOPGgdy2+AlueOL9P6czMLuOHTTAK0z8630GLxXwTCzaP/GG4vVAdJuaP1E3RF0iH
	i+wlieUC4Z3FrOPA/DasExRhVSbTBU9lfIZHJwEFaZtXTBWmqU8GphIdIqWSe3DjerCaL7rgFRQXa
	K1xuonrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ssw-00000000rgi-3H5c;
	Mon, 06 Oct 2025 21:36:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ssw-00000000rgc-1Ulx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 21:36:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBD0760365;
	Mon,  6 Oct 2025 21:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC37C4CEF5;
	Mon,  6 Oct 2025 21:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759786605;
	bh=Wc+JgdfB2HdH0elOKIjjG6YIjjzGSAhaMhztbt8QOzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSJbfBOIuUhvEerY6D13zJsFE6bPufqjG2fMQYtMuR3GaU9AkOagbe1wXishsyuFy
	 yaAXw72c0NyBZO6hr3NC0CmWuQGY24hg/26ZlnXngujAGzzAgQRR2gynSYa9jcnx6w
	 XfMT15F/nDAbc2xPv8iBQadx7suWCBi4BFUennKXJ7XN2Xws9wawVcgtWHrluYdiT4
	 32TD6Dl3uU5N67rbb4e8EswXaRC2Jt1Nk/s6o7oYi83ekbHZ8YuItbokVV4abiL7RP
	 cBC96KLw6IWtSUb2fUiBGcJ0a0AHFFdwQ4o/YtlrHiHGqjvZ8MfVtr3NHx3JyU3irR
	 RN7SUOzG5Waaw==
Date: Mon, 6 Oct 2025 16:36:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Sameer Pujar <spujar@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/4] dt-bindings: sound: Update ADMAIF bindings for
 tegra264
Message-ID: <175978660352.625360.14343154592016440283.robh@kernel.org>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
 <20250929105930.1767294-3-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929105930.1767294-3-sheetal@nvidia.com>
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


On Mon, 29 Sep 2025 16:29:28 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Update the ADMAIF bindings as tegra264 supports 64 channels, which includes
> 32 RX and 32 TX channels.
> 
> Signed-off-by: sheetal <sheetal@nvidia.com>
> ---
>  .../sound/nvidia,tegra210-admaif.yaml         | 106 +++++++++++-------
>  1 file changed, 66 insertions(+), 40 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


