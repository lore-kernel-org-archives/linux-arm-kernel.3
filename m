Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB291606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zR2e76nf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZJ17UrE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EcvgTWW8MsRG0BTKc5s9czcoej/1XE+Z4BhVoKAgo5Q=; b=zR2e76nf8HlOLdvBwt9/EuyMEq
	6+pK/a/QwHAUODK+9UZAPH/UcgdnBRp1Oj5g1y6wVwaDPOZhQ3AqtWPmYIhyDS5BW9J6juztwq3KU
	n+oihucMGvVyGG6Qo0O0bm6blkorAH2dxmkuHWFUIWTqxn/KYw44vnRznjZPH80C5PDtzSsNgCtu7
	T9mMLulkTGcNFeP5OuhYDt0tXxFRtufsWhRutFTKEIMPjaqP6IpUsf1zbCox77oyFUjy5NumL4wYp
	m6Bxihov1BpJiVDoqvf1qEnl+moMSdlOW0b+2QEDVFSqZ2mPmPJwHH+8bZCTO9xX0jXkiVUdkrsLN
	0Leq049A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLoln-00000005naX-1WUh;
	Tue, 27 Oct 2026 21:31:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLolm-00000005na4-04zE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:31:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C41724363F;
	Tue, 27 Oct 2026 21:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DCE1F01825;
	Tue, 27 Oct 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136705;
	bh=EcvgTWW8MsRG0BTKc5s9czcoej/1XE+Z4BhVoKAgo5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZJ17UrE4oUShSJsg80PvOj9MmEUBK4H6ODDb/FNJlRxoJRFtNXLQgU0oAcn6p2i6
	 0srTzQCSXnSBzEQtvCIfWIYU5QTmsHTDtnpZc20s2OidI/B8Uy2iylpQ2GBmb0SP7B
	 Jg6J83lCD0AV0etNRkVtcU+C+k2lL3shvYsvFJ0gL7SRUZP3cseEUVk/YFcWG/39Lj
	 e4pVkITpSwPSwXhIpII3V623nWDfBtt2RsFda7Lo4Nr8no/53oNxNK4JZ9N66jXnWg
	 2l9talGxept+BkdSy40ZWJuoXleI/J4hOJNdUAssDJrZ3A/eCt5vD9hgjgvw9O+cjo
	 bfjB7r3dg3Akw==
Date: Tue, 27 Oct 2026 16:31:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: stefandoesinger@gmail.com, Bartosz Golaszewski <brgl@kernel.org>,
	arnd@arndb.de, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 07/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO
 controller
Message-ID: <179313670254.1191089.9686644505713095094.robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-8-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-8-ghahramani.navid@gmail.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 14 Oct 2026 08:20:47 +0100, Navid Ghahremani wrote:
> Describe the register-clock consumer and GPIO banks.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


