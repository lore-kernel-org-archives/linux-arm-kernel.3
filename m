Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9285B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R70EfYY0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWZCW1uA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xL1/WihhcC8/bfzXm5vvKtqWTdAQfad4oJWwAFgPAZc=; b=R70EfYY0CzRWnh3AMv4tqyY9ek
	2tFkjOa0YXwsQQ96iB3CoSHaYrcq9TzdlhT+ehla7L5jELbGyhPRyOxVlPGuyhTF6PovlfQwykah2
	ekfRLMtahWEhT34P72GLfA+uy8QPE+WVs7P0hKHxboTHRc0JwjWHF/vS8pNz0aEHEAG9PoFZYFHVx
	3sx/2ePbyd2/mqR74FMTUGf7k5mtXQ1x1EXpImYDaFbJIlNPOLrWmxOZ7JOEiXQmUnqQ1vWMMZCHT
	1JLwwpz4kcMk911OFWaEsXZvCHxslHfexP7ijDUjakH2TK8spE5ph8DFML5X7P2N+6zKY+FL3FQ2+
	gavLuCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJRp-0000000CMXq-0teT;
	Fri, 06 Nov 2026 12:53:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJRo-0000000CMXj-0Dny
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF90641803;
	Fri,  6 Nov 2026 12:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181E51F0089F;
	Fri,  6 Nov 2026 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969614;
	bh=xL1/WihhcC8/bfzXm5vvKtqWTdAQfad4oJWwAFgPAZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AWZCW1uA2YEGa7lpWykb9ehRRaUudre15fyaGkb15MryhTmHOL6eUmfSt6mw00ock
	 8PNKcezQRU9qGP9WNT1j0qXqIf6nX2APZnU+e6H/lPFgj6T3DeNdw1A5scNCph7acC
	 aBxXvQOCQmbYE85mwFip7KL2w6c+xV5hwW9LerIOSZu86d/jd6Vw7s+3cKxw3xCl0T
	 qweqcMf6eEtQsoxcwBeDD9MX4EZ+2abXH9GoSRr3pIvaVrUTZ07FpUpqbqD5265ysd
	 4nN8BckQRvKA2Gsi8D/bPT0+6b9LVVOInouTaVZrmS2DFK92p9pjg3oxJbAGfkfylO
	 M1PJnQ45AYZDw==
Date: Fri, 6 Nov 2026 13:53:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	saravanak@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: xilinx: Remove description for USB
 host controller
Message-ID: <20261106-sensible-celadon-crayfish-643d18@quoll>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 10:48:19AM +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller IP relies on Xilinx Platform Studio
> and the ISE Design Suite, both of which were discontinued years ago.
> 
> Driver support for the controller is removed by the preceding patch. Keep
> the bindings in sync by removing the corresponding Xilinx USB host
> controller description.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - New patch to sync binding document.
> ---
>  Documentation/devicetree/bindings/xilinx.txt | 12 ------------
>  1 file changed, 12 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


