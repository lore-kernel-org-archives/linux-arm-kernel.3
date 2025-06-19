Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD99C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLUNA2btcTVM+29cX0zM/hTgXoUCcTegeYyK/w6c0IU=; b=KAXJsRpcU3v+uunLJ50qYeFWen
	n8+umrhdohpvYT3955wSBwwHnsr5ihYsxFVaXcPXPwehUG71xuWwMzV6TaNf1ZcBkXwwvG7ye7AYf
	i75Q9OoK/XblCDb70L11v6e/IEVBtQNF2Nd0WJHwCtZlfTeEfJzTmBYIJ49wa5zXonmmIrK4dGVfB
	ZQn1rdqFz6PQuvXPsnbF8TgUrgnBhH4R1X8caw0fnzu/IbRsPwEDwvgk/kJ+L9Bf3+EzVwrnHXbQs
	HqpQnhKtyzrhQFHTavk0xK50FuX9z8ROr5Cd4jkWt5/bF1Sxd3+aRha+IkVfRl8yB+OafIswvVlWq
	UOH0AAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLuJ-0000000EE8Z-2Ios;
	Thu, 19 Jun 2025 20:30:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLLD-0000000E9mP-3VZV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46B9661136;
	Thu, 19 Jun 2025 19:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6B3C4CEEA;
	Thu, 19 Jun 2025 19:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362871;
	bh=lLUNA2btcTVM+29cX0zM/hTgXoUCcTegeYyK/w6c0IU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u9YRHxfC2xlyG6DZZGG2H4+kRICD2k+XrdDMTw95UheQdSuU7WXUyqa7d/X/I/5W9
	 lds/oNSwWQMZ9+9D9buuuMwKk8/BP7S53VMzCF+tcmORbRyK2N2bEn8fglN5Z4RmS0
	 looOeJz4yzN/XHK6M+HsBczKMbUZwPHBtqF5FyACkFc56WuU2H5Hx3gXGidLOpDDqg
	 jhv2DQG4XnwNkLRyR9LCQ9dIChLOjhglo4qR7O+BYpaT0JwevNdxDsfXjxUqz3/tzq
	 W36TozvzLJZRh5Z+WHwssmjL4oNAKG3Bj7gH1JgI31kMERvkG3lmY3LQhcmoy4Vwb4
	 ltmC0ePBpT2jQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619171025.3359384-2-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org> <20250619171025.3359384-2-wens@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>
Date: Thu, 19 Jun 2025 12:54:30 -0700
Message-ID: <175036287011.4372.17190370496961036062@lazor>
User-Agent: alot/0.11
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

Quoting Chen-Yu Tsai (2025-06-19 10:10:24)
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
>=20
> Add a reset entry for it at the end of the existing ones.
>=20
> Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner =
A523 CCUs")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

