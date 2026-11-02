Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383C60A2614
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y42u7Ez6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUwko7vp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tl3iLmTid8/VrS6d3Y95ShDoORoeWrX++btEogTfWQQ=; b=Y42u7Ez69nALBsiYIu3ekb49dm
	wZkmPoE1NvBlx3rfNHygu7PPYuCxJrC9UdNmfQtJo23ChECfDQitmFofskym7QKfGex3u1HcysWxL
	1uNENIHtRnyQN0JUOMidmeQUc3RkMfKPq27juj+qfJ7A5t0zIAJ6tHQs520oBLz0jyPkD6im/FIeO
	2hFg0oglWmkwkl3vXak7xva4aEcFvnPBI6gxBzEUGSVlrl+ZF/73NzlhtlX3Gz6tEt/BpLYmnAukp
	f5jaJFeoslXmTX2TkdP/JFv5xvUhOzKqHuVZ5q+0p2K6wyfjVqLyUgDQIDqqFm7JKN4HmO073vxnv
	n4o7mYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp8x-0000000G9CL-3ORn;
	Mon, 02 Nov 2026 10:19:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp8w-0000000G9C7-2dj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AB8840F0A;
	Mon,  2 Nov 2026 10:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3741F00A02;
	Mon,  2 Nov 2026 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614798;
	bh=Tl3iLmTid8/VrS6d3Y95ShDoORoeWrX++btEogTfWQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUwko7vpee2/H6UhO5p2zvjf20y6adM38N3S906E+Yq8W46IW5DGmOGx7iS83Q7u6
	 fWK9u9aHAZITM6kTGz6wWjxWVe9gdnJLYHA8teLCfrbnjjM9ELw+1lcT1nCKWEsik6
	 EdDTFFMmmFhG7/RQcsyg76AaqA3VVoOJm5DstPqCHHIeTKgBWESPyMEsM/VimLOq96
	 dIsBNZ6EtmgZoN7Fqxf1FvWyu+Ess0C+p66ZnVFbqSWQLzyUWco40WZqhj/r3IweTm
	 eKqTR0JqFWpxenT5G/PNIU9fzBavR2cKzkidz7NXXXj4TkPsIlNoyG3+N44ysN/r4N
	 t/TG0ygxEe3GA==
Date: Mon, 2 Nov 2026 11:19:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: remoteproc: Add Allwinner A523
 RISC-V remote processor
Message-ID: <20261102-warping-victorious-shrew-7cee1e@quoll>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-4-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-4-tcmichals@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 12:57:31PM -0600, Tim Michals wrote:
> +  mboxes:
> +    description:
> +      Message box channel to the RISC-V core. Each channel has a FIFO in
> +      each direction, so it carries notifications both ways.
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  memory-region:
> +    minItems: 1


Here

> +    items:
> +      - description: Virtio vring and buffer pool, a shared-dma-pool
> +      - description: Firmware code and data in DRAM
> +      - description: Trace buffer
> +
> +  memory-region-names:
> +    minItems: 1

here

> +    items:
> +      - const: vram
> +      - const: dram
> +      - const: trace
> +
> +  interrupts:
> +    maxItems: 1

and here, same comments as for v2.

> +    description:
> +      Interrupt the RISC-V core raises on a fatal error. The A523 has no
> +      dedicated line for this, so it is present only where the system
> +      integration provides one.

Best regards,
Krzysztof


