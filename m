Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F6C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0E6X8b5VsTlM/SscuJh6fDUouVQtARK1c/gejls4lSw=; b=oX1KrrIrwp7ot+IWCIt/GqcN7X
	1w+woPBV5Q/XUbworAAvKns6n7ulByyTrUAdsF0SWRVPsinP0so5FYI0PThnmcB4HZ4OhOCuMche5
	SQ66aAcwVEs+hLjPmhDUj6HkMTW0ylakIKuatdyZ2r/qSlgsu+gOiwOHPUxcNuL4knbWbDQj9+8kY
	Lg79Y3n5hHfKPMPCU6BRXJjWP+Cju0wg10gfkCtEbBJgJTu1Hs2reCh3jQjiTC+eLoUbnfVa7WSRS
	yTEXMn9cpOVIkptIR8k02uAEHhcSnuLW4JTlk7RoZWelKq8zJC8sFAz/xZ8WsdBHxOwcbqmS2nxLL
	rFFlD63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGay-0000000FqrQ-3JMQ;
	Fri, 27 Jun 2025 21:26:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGVn-0000000Fq1p-2Zin
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96BABA5308B;
	Fri, 27 Jun 2025 21:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C38C4CEE3;
	Fri, 27 Jun 2025 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059290;
	bh=eJ4JeujYEqEr8p7iiInQq4CDjHaLLtwxoaNgL3PVvp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psLuxavvIHRpyHijNtJpBPYSZpd4z1Or+RCc530bVYrLFxdjtwPN17Codm1L/WOcn
	 e+rbD54Bx3bwH7Uh+ZPJ2P42eQx9eN8u+e4GBoJN0agDLkSgZs3SSCQWGRjJdeRkl7
	 DLgm6dfoUUcVxoIbeNS2wiE3I01fvhgLu5WXALbMwY76Vku508KckvxCi51oX1YF6v
	 +4txAazDN069CRN7dbiyIZaxcUAejbfraSXeqTe0A1Xp4JN/aO/pWdZyyVZNniFGrC
	 tELVeQJuBp3Ls8JgnsVFQJYN/HWtPxsAqoWDZYr4KXsXnQ8l7N3O5WQtUusBMfgOa+
	 WAKb7Cxk9EG9g==
Date: Fri, 27 Jun 2025 16:21:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC
 compatible
Message-ID: <175105928901.164047.15283634095632177281.robh@kernel.org>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-4-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626080923.632789-4-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_142131_719968_C888C9D7 
X-CRM114-Status: GOOD (  11.40  )
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


On Thu, 26 Jun 2025 10:09:21 +0200, Paul Kocialkowski wrote:
> The Allwinner A100/A133 has an Ethernet MAC (EMAC) controller that is
> compatible with the A64 one. It features the same syscon registers for
> control of the top-level integration of the unit.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


