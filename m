Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBDEFF512E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8USDRGrStxklpLbE+eVdp/+x6IAlCmkqXhRiL60nX0=; b=aUQqVO2z0AVXDRPTFbmdSJanrB
	pjYcSqoas+9eVXpBOxcGphjs/Yhr2oI9PrLbhfopSWBO800qMskO5RiUoCxE9YBh3LHahv4XAcWRr
	qJVZMdPjzrnNNjB0WBNC44x2ItTG89C7ODb8Mat+/5NKApp0MlMXfm3fEQR9iPbgYw6/NrM8rviaU
	azNwrzJoP2+znBhb/25tLWoYpg8YX+vd5lsiYVkFVqYwYhNQffoD/rtAi0uD4cyE3k6HrA2qWM8+U
	deaa54YPpyL982ZXEengYreZRr9trbdOThVk7Rjw1yBxkVu055s2tDMOfIIqkgz0WGqKtOL60wwIb
	mAR0f1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAZ3-00000006soJ-0wui;
	Tue, 07 Apr 2026 17:50:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAZ1-00000006sny-0RaU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3067418AE;
	Tue,  7 Apr 2026 17:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1ABC116C6;
	Tue,  7 Apr 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775584210;
	bh=bk0t9JxzLqimVaNqYIGraaIcJm28+bUHxoQt8DKwcns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrOmdQNYO53qMjFtef+XyTituPTiiHQwEslqk4MDJDPSCyNKJxCq4LBvL1fVBeVeP
	 0iiVTlFF2BfKL9g/MVZ3SNgAVkYJ7PNZtNxvhGff7VzyKIvJGCXAKAp7OBqZXvg3Bk
	 a0msLbwpVJJB5thd22ZLzQ33LUdW2E88LqF5HEAb6xzmYj0anyDe5Nnde1kDDXMY3n
	 jZe39fXIftfiruB/yPIY0D1wr7fguQxtXsUIv+b2PSq/J/ym4P++pp6IL41/JNSEVM
	 DjgMaf3kn2ycx/GDaIhnP8866v9/kQ4jVabNVHSWlVq/d3R5DbQeNi7UpbYYx4IMa7
	 xrJPO8ninRv+Q==
Date: Tue, 7 Apr 2026 12:49:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
Message-ID: <177558419254.3168496.8723941339416449025.robh@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324164357.1607247-3-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_105011_170015_252672A9 
X-CRM114-Status: GOOD (  15.29  )
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


On Wed, 25 Mar 2026 00:43:50 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
>   The mux value for this region is different from previous generations.
> 
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
> 
>   The mux value for this region is the same as on the A64 and H6.
> 
> Add compatible strings for both of them.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../bindings/sram/allwinner,sun4i-a10-system-control.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


