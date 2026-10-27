Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E682606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SNA96aIY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aj/lYZAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dplzi2jZF0nyquCM7rHIi1KSd7Abrm4kSHyoRVVxXRA=; b=SNA96aIYMqGfQDCU3wF06hh6Mo
	EtV3tmmB6/KLP/EC0wAPIF8gCxpYXTXbi9d0BqpvVnhjG2T8cUqAI34vH5Z5cQ7LmQ0UXDECzH7UQ
	2fghg3l1BSdEmXHFSJh3Hyv4427A4iuL572+xBV9bCCsX0YaFDi6MCx3m3A1aD3WEN8Dj4BcBD4c1
	N38WKV4TcDymxsX9FZdlW/6aAGpQvYlK4p77pN2XSlRqszHkde/hDaiNT7txrALyTqMk0fkKIpBya
	vxltOtAsG6uQZmyOnRjBdG5UK9O1zu+iKGeIiKzMBvgK/c7ycbtPfUV5OR+//OeqLGFsbvMlEBq8j
	LeBXI8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdbR-00000004BAa-2Rje;
	Tue, 27 Oct 2026 09:36:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdbQ-00000004BA9-1oQ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C946E601F9;
	Tue, 27 Oct 2026 09:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539271F01825;
	Tue, 27 Oct 2026 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093779;
	bh=Dplzi2jZF0nyquCM7rHIi1KSd7Abrm4kSHyoRVVxXRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aj/lYZAN94E+6oT9IogJZDY05+cE2hW1lTqN2T63l9yDpAGpWcsfyg1/t3Mup8w30
	 wJjK3nV1p6T1ggPDeD/x5scfRxApF9EkOpoFvra2dF1dLjxxEvI4+iQjc/xtIbu+dr
	 5kPrz9bMduX6FgzsCDjVqlOXmucjsI92g8Ehw5Z9jJKVA6sDxbkBQj5STdbeoMp7qt
	 2caDa5n3rjWAjXs0iIlQmsdE4PISikdcKPzWaAk2MThAmkzgeALKqWVro8pFRGh8Qt
	 ZkbmWMND8JyQKudyxAK2deV7K7NfXYveO387oxAbggPHn1s+t7c5nUHzlWrZXUzADs
	 hBTXght82atfA==
Date: Tue, 27 Oct 2026 10:36:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	andrew@lunn.ch
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Message-ID: <20261027-savvy-powerful-seahorse-cc1079@quoll>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:19:10AM +0530, Prasanth Kumar Padarthi wrote:
> Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index b7e70868e..3e6133e2b 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -79,6 +79,7 @@ properties:
>            - enum:
>                - ampere,mtjefferson-bmc
>                - ampere,mtmitchell-bmc
> +              - asrock,b650d4u-bmc

That's v9, so where is the changelog? I see in cover letter only v8, no
links to lore disucssions, either.

What happened here with previous versions and reviews? And why is this
placed in non-alphabetical order?

>                - aspeed,ast2600-evb

Best regards,
Krzysztof


