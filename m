Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D8CFF512E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRqD0imszs524WQf5gj0L39h0B1pNS9NWfFkzN7Pyt0=; b=tFFaDYEkYHlOTansBHh3vCbN78
	9v5AmrGrbsf9sgj92pzWgIhhXOPnDeTC13zuFjALqbcVg8677r/jwfgS9u2W2d/vgG1UQFfRyyHTH
	5DyQ32VzK/EM6hS05d3Ewa+ciwYya5O7hq+cMbCtrl/7KdDFFOBZE3lQujsHft4BJCG0Cw2zzS1e9
	+WTesAZtJa1E9rin8BiAV8yhHdCjpuaoaHHFJ200zdAp8l24G7QfVW2BUQJRCwf877OhpamAkzJsm
	U1MVcGx+Tp58nHZoQlaaMjs+T9c+N8nZxxw9UERaOL1IKMVO0qZ24maHHk7QlD591HHmiSeyELXKb
	7GAMCalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAaP-00000006swe-2Y2R;
	Tue, 07 Apr 2026 17:51:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAaO-00000006swO-0ioI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 290AF600AC;
	Tue,  7 Apr 2026 17:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD42C116C6;
	Tue,  7 Apr 2026 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775584294;
	bh=rlMvpKgIOlZglIA88qVLTA+ty+Ojl1Tbj1KHcxZ+sM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yk/IZ0bkIfxY1NwrYVPkE0J/y6mUTaVCt2SijSspoxtSH0SsddcagzZWemgmgefgS
	 Og0tgurlxvYiL6aHknxY0oc+xnDkKydEA/ZXne54HBIpY04+ZzlfsjXcAHPGxxWVgp
	 wtcKaMCBq69EhA8p8Uc/hLsBEJ2dCK9JLooaYWdzzP0iZunoJRxhH4cmCUQfqvb3VK
	 9d0ZBS/qGUczOV2O7OYf5Sl+ahTwPjO5C8ihpWUVAebchf1d6o8weM0fj/wVJfSRpy
	 hrpITt71+aEaJSDc28XCZYti6dkDAkK6+JfaAfUs4cN077L3EZbDMzgUCPqd85NG1A
	 eTeq1c8O/5teQ==
Date: Tue, 7 Apr 2026 12:51:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Message-ID: <177558429222.3170780.2861586740779038011.robh@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324164357.1607247-2-wens@kernel.org>
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


On Wed, 25 Mar 2026 00:43:49 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
>   The mux value for this region is different from previous generations,
>   and thus needs a completely new compatible.
> 
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
> 
>   The mux value for this region is the same as on the A64 and H6. The
>   existing compatible for the A64 already covers this.
> 
> Add the compatible for the VE SRAM to the list of covered compatibles in
> the generic SRAM region binding.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


