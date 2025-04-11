Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27CFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 19:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytljFhHZ9vzcxX2THQj6db100xH07+2Kx65aOuZQsWw=; b=43uj10p34YHI0rPI6d039pOFoz
	1uXPisD98SQiO0QSlIiyhUPLw2XNMOmqey51h0uYDXN+pVz3xq9x9nrYXv37vktr5ZU+S/8qm8vn/
	PZItCa8va1JALWWHen/sIxq9vHRFizyA3UsdVfSSwNJOzxy1tfmuFOur9uFgfqDjv0W88ON8gOXZW
	Cu+FuFXad11NdTqEZqroJsZBPBmWhMVNcxZTCSNxvj6V1jFBTukiqHdWiUVW28b15IL16zdgPfYmN
	BgIs1bjzGSTDV6SOtVMJhd9naMIm9u/Eqsani0OhGIYJ1tcwhMr515qdOMQrDX0wTsIvzd+Z8QLh/
	4gmnN35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3KM1-0000000ElNs-1QnL;
	Fri, 11 Apr 2025 19:47:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3KHW-0000000Ekmg-14YP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 19:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E8DE61137;
	Fri, 11 Apr 2025 19:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785B6C4CEE2;
	Fri, 11 Apr 2025 19:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744400595;
	bh=hOEB6YQrTokdNyRISWiANEmdVnnbFKTd0VOc0CYFtps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2skaNCibdXg8ja374gy0Vpl9FvYpzoxTQsfprj9lGwTFuZ36Rj6tWNOhAl21Zcwo
	 53TNIJSqU6cAAR0ejWAg03wYlBE44yyEEEEIQYbT2Z5SWgyPV3Xd44Xro7ZStvi0wr
	 ny0tgi3EWJ3e0LJxQ5CTJDL7BVc8akwxdW3gjLOTgHL3Q0Es8EfYYN/maep6axfN7x
	 ImlFNCr8dkqGlbKvki52Smf1enXqfYGmZloC9riqaJbZPEisA+Jq8sTi32xFYgeDRP
	 cH8pxe2TL8Ptb9Rf0mxl5V4v+aawfCxUh/dff2gb1VhAYQzc/9eE8ddpVXhJsPe/Px
	 c4iIDBeNbgUtQ==
Date: Fri, 11 Apr 2025 14:43:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: edumazet@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	rogerq@kernel.org, srk@ti.com, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
	kuba@kernel.org, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: ti: k3-am654-cpsw-nuss:
 evaluate fixed-link property
Message-ID: <174440059064.3779768.16005295494092694036.robh@kernel.org>
References: <20250411060917.633769-1-s-vadapalli@ti.com>
 <20250411060917.633769-3-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411060917.633769-3-s-vadapalli@ti.com>
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


On Fri, 11 Apr 2025 11:39:17 +0530, Siddharth Vadapalli wrote:
> Since the fixed-link (phyless) mode of operation is supported by the
> CPSW MAC, include "fixed-link" in the set of properties to be evaluated.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


