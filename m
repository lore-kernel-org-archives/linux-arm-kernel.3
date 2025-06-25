Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB967C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TefMe7+EVc6B21SkQc/xfQtSbJZifUvozQvbOEYejRc=; b=u9S+9BvF0tfbGyLIPl5OI7HIH9
	nBva691irs/FQ+oOLn7xYYWwAe8G3Tz9NI4+k5G7LmeQiJmPZJTfFBt5m7RIxSPxuN6X5Bnfqhg4y
	qHtR/4rJHi5CU5gs+MsTtDvI/a5nJYW5iygi1dt+ZaEpHzKSAFyQgk7l/rVwFMdk0dmecG5t7Xmas
	bSSQ6v/4Fgj4SMbsEuREuxt4q3A+zn2gFR+X1RcSJu9RcFZrkaB/Jr8Px+oawo+YguuLn1lDPuDtf
	UthrM6FVoP1QIxKbDfonKA2femg8zKNs9ZWyQGcXwiszQPlwjgLqRRvVoS8YKdfFMqh1+Ss+yLOhZ
	iAfxVgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYWg-0000000A3iY-3g3O;
	Wed, 25 Jun 2025 22:23:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWBu-00000009n6h-35Yq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 729A74A366;
	Wed, 25 Jun 2025 19:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC77C4CEEA;
	Wed, 25 Jun 2025 19:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881234;
	bh=oJtgrg2aA4uaKMpl0XbF1os0gOTS7tT5N0iR2jpFqpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=my12Yse9ZQ25NYuivmGajU2Pw04oJr1rqieUW14Uj4uFYeERWhkJFrJiSmRjfNcqb
	 Mkbs9ACh34pjCAUjM4zCmQHTQKIdOrmVWTTyuJYiJ9XDusGQqueyai1nioJRqFWa1U
	 Sk84oYwOzyROLg3LdvwnA5lUWm2W/5sc5YPVT1BvvNjkiYhHMNfDbz6jkWlaH4bXDg
	 fl4tDyPCJholtV7u2vo+Maf9sa3nnQyPa/+wVhiD89t9m0pDQclO8ThbhK74OXdXq0
	 EReaLAixXVs6l7q/1bvrOmkrGx+6oqmp12A3LWOcIB9vrLLpNaDVgvdkAShAxbHNHC
	 MWOrvJUyoauRQ==
Date: Wed, 25 Jun 2025 14:53:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: fixed-layout: Allow optional bit
 positions
Message-ID: <175088123275.2111151.12116802075746070552.robh@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
 <20250610-nvmem-bit-pattern-v1-1-55ed5c1b369c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-nvmem-bit-pattern-v1-1-55ed5c1b369c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_125354_800400_78884092 
X-CRM114-Status: GOOD (  12.79  )
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


On Tue, 10 Jun 2025 17:17:34 +0000, Sven Peter wrote:
> NVMEM nodes can optionally include the bits property to specify the bit
> position of the cell within a byte.
> Extend patternProperties to allow adding the bit offset to the node
> address to be able to distinguish nodes with the same address but
> different bit positions, e.g.
> 
>    trim@54,4 {
>         reg = <0x54 1>;
>         bits = <4 2>;
>     };
>     trim@54,0 {
>         reg = <0x54 1>;
>         bits = <0 4>;
>     };
> 
> Before the conversion to NVMEM layouts in commit bd912c991d2e
> ("dt-bindings: nvmem: layouts: add fixed-layout") this extension was
> originally added with commit 4b2545dd19ed ("dt-bindings: nvmem: Extend
> patternProperties to optionally indicate bit position") to the now
> deprecated layout.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


