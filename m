Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C65C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEkaYTBpTyj9OcYAhsqIvaEVI9TT3t5pdu0LgQIdf8c=; b=k43yr1f9fge29nybMoQTxsPSrz
	2AnDygw/YG7IRMSW7UnRov9RBbb0hgRQvLTuzoDvOdxNawA2AcyivrKCNhCWOjJxSaS/AAf0JPVEo
	8ZxcRSwJu+Cz5kxwP1Nx81L+mX9Sp7NnjkQb9LGVWPitv1cyFtvVHplWDKApIe/5mWTG40MPemHFY
	X8NAMk0PIo7mtdM2BTJTChSS6Q4Hc8HVbBmvoAkVrlqTwGx4NwAidfQaWJ0UV/7LgF6leW7yHDBnn
	vd17fFlydRETxQm2Sf8tYL7/4WMF78fiCXYioQys+AlEZI6sjtrDQL2tzHqNBRXsZfzC0zlKG/mQa
	neRnqkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA15M-0000000BtD4-1seX;
	Wed, 30 Apr 2025 06:38:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA12T-0000000BsmR-3q1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 06:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E276AA41B92;
	Wed, 30 Apr 2025 06:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F98C4CEE9;
	Wed, 30 Apr 2025 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745994924;
	bh=2GBR4Hi5ao4ZWwIgFEL+gg6kKOZ4jKqEx1gxgiu8CSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0+8I6l1mbFthpT1IzvMzXEMZJBe9cGpkyteul4sP/gD+CZQaFXc/Prp03BYRz3Ac
	 K2ac5c2s5IgBLnnVzfufMhZR8sqYGMvXrS3qkKzH+4XiggLLbNNxaXiCJYTzNP+3O4
	 RW8Ga767/nq9NsK8m8E0qD6W8OgR1VnsL4elc4srXSbuKUBUD1ATLJxWVB90P0Abal
	 gIL6jFKZHNNoij/zg/gDVt9PvQsKxyg4LUJumX0eIXbeUZnuNH97Yo+C2TMTpQ+6D/
	 8tDtpWmqF6qWj6tC2ArxMcgV9F/1NoJOQG9uX0yucecjDVB+OgPNOS+HZYvRcRUjMo
	 fzrhEQmSw/4IQ==
Date: Wed, 30 Apr 2025 08:35:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
Message-ID: <20250430-fanatic-singing-terrier-68acbb@kuoka>
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
 <20250430-01-sun55i-emac0-v3-1-6fc000bbccbd@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430-01-sun55i-emac0-v3-1-6fc000bbccbd@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_233526_014968_23CBBDBD 
X-CRM114-Status: GOOD (  10.18  )
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

On Wed, Apr 30, 2025 at 01:32:03PM GMT, Yixun Lan wrote:
> The Allwinner A523 family of SoCs have their "system control" registers
> compatible to the A64 SoC, so add the new SoC specific compatible string.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


