Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B457FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CUEba9p3u6UEcMzK9BFwgMPNBiAwDvFKoMFq78Dx2g=; b=psDoCT+xvktiqw+7wfBvINfDda
	y6Q658IGCa9iuUKbqMQs7qXC5IvVd8djubatdTRFwjeWhhqjhx5TTPkAXDaYCuilz6jgtK4WNDIqN
	v2US8xmNqLbK24bAYrhiCHf2qrGf1JMHQuFi494YdF6DdoZ2UxgVa6QJLQFBqdnJnRLTXIPdDL4Iv
	v7nTo0rlAS5/iu0Z7nhUpInxiabIg0XVw17Hl7ZU73bpkHSeNnU6XIZYBC/yg6A2g5dVTUGl9Txt+
	P/qM6Aak20b9FGCjqnDfDsp49WHVUs9cGi1YzQXOHIfqXcyQhyy8Q2QB+i5hjbN6pgfZMnNrvckJM
	0xTfk21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC3C-000000066jE-0EHf;
	Tue, 08 Jul 2025 17:24:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAzh-00000005wfj-1NNf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 512926112D;
	Tue,  8 Jul 2025 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4BEC4CEED;
	Tue,  8 Jul 2025 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751991390;
	bh=MlvZZ4a52AP4+QDRvUm5hDSogr1vDDiw9bguTeqre4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHkDMXpma6mUHWY1TvjLFbvGC4viBk4MR8OV9MrwZ/dTNKgT07LJpTY/NtXTCDXrZ
	 dLjEZd/2stfi0fb8CD8B0SfIzQ6PTtunA4hOdl0neEM346rL6WymLLAFpuM3/xZ6Gt
	 QO9DkRI4enn0lmHhspykXYqEdWOWahdODkBNZ0jylxzCe7tU8dP/VwqS6CGmJWrNjv
	 EAETLzByJ4JTzHbGr3uk4fmxiyz8y26a7mwrercqkQST5xUubduncf9Zx5ya/jTpl+
	 AsCll8GNnqL7PMZs3WvYXratllAkSary35yho11OgaklEU601N3wuM3bez/8naSIX0
	 JoFLA4S0GU+Ww==
Date: Tue, 8 Jul 2025 11:16:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Eric Dumazet <edumazet@google.com>,
	Andre Przywara <andre.przywara@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RFT net-next 01/10] dt-bindings: net: sun8i-emac: Add
 A523 GMAC200 compatible
Message-ID: <175199138810.517400.11158407408233098308.robh@kernel.org>
References: <20250701165756.258356-1-wens@kernel.org>
 <20250701165756.258356-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701165756.258356-2-wens@kernel.org>
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


On Wed, 02 Jul 2025 00:57:47 +0800, Chen-Yu Tsai wrote:
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
>  .../net/allwinner,sun8i-a83t-emac.yaml        | 68 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


