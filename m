Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45EA606B81F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mtr7CYg/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c51QBABz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mGS4GI/jAb9ZPIqUcHBrz7HIHg2WVEdgOBXskoS5LME=; b=mtr7CYg/8lMWq5qq0ai0WvSV2X
	MHTxMcyhCz2fIJHI8cwH1iJWLd1EbJYC7fw4xMsTvKP8OtGR7xzzhpWUsM2aF15zroFdSD5a8EGhh
	TdtaPlsV34mQcvWk6LmHETAfLkdJ8wWpBa2kTaXNVxUJuQBd13Khlx8KXDFTxBeqoiAztqZfKsYQv
	/asCJGnOENowZyiRvVjxVvJ4sW63KeARjkpgboHLSeuDs7swPlBFyCVNxgnZbHY2t6dOLfZ2mehAk
	G6c7FIaH7Lfa7aW96iPX4vilufO9ZK1zoMUcjAsx2pSA1ogUqimiJ6g9YTbYtOgMeXGzCul5Tj70+
	/ysH8wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjqw-0000000BOc8-2oE5;
	Fri, 30 Oct 2026 10:28:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjqu-0000000BObg-1RAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:28:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84292412AE;
	Fri, 30 Oct 2026 10:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680811F00A16;
	Fri, 30 Oct 2026 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356131;
	bh=mGS4GI/jAb9ZPIqUcHBrz7HIHg2WVEdgOBXskoS5LME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c51QBABzlB1Z0L7tkhHFjdXxIEvBUzlTIrGg5pqBlRLYGH3ZtTsTHI1pnjKlD8zVT
	 bJqu78k8kaH4rA6Cz1BgopPQ79CxJbvHU+zpDEQJXASmYM+enIwCgWGR+JfXrqzjZh
	 XUPlLgwMvM/Fm3FVPxcHeXZEHpczGVGJYSFSX9GTkKgsZ5m0sM6pbkj29sZhsYBIYZ
	 EyTHGZs9IVXf7t1A81a5dp5BvLnG8B9yU7JNrYJJFguN5UVXsNWayOr0X6UKB5ouLk
	 TmOOxU7AjBRkngMFvKt6YSgpIHodyu9DhDM0+ih6ys21rd8mC0Oq3H9Bi3emo+AAkY
	 OBO4HUZzXLUww==
Date: Fri, 30 Oct 2026 11:28:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
Message-ID: <20261030-chital-of-pragmatic-enthusiasm-837a0e@quoll>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
 <20261029-submit-h616-uart-fifo-v1-v5-6-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-6-53b433aebbf8@gmail.com>
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

On Thu, Oct 29, 2026 at 12:47:27PM -0600, James Hilliard wrote:
> The A523 UART integration has different FIFO depths across its controllers
> and reports each controller's depth in the FIFO Clock Control register.
> Its receive thresholds are fractions of that depth, and its optional
> register layout differs from the generic DesignWare integration.
> 
> Add a compatible for this integration, also used by A527 and T527, with
> snps,dw-apb-uart as a fallback.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


