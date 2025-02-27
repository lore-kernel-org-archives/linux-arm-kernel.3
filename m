Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDFEC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynTes2E+sllrgKK7Pc1RbTXF0zUigaX8+Arp9ABtM1E=; b=lGunR6VoI+wAuRAVQRBQqH6vSq
	RbCMoQLg/RUSwdgr7tHLioAnxBEvX0AKtjaTuRmCxz1+nUISFZ0TB1kTHcCwV2JxfukHGxsR7xPf9
	MmukkyCFgrKb8yAstswDDi538y4Qaqf4dWKJaK6Ctc32kDLd3wI4QjdcnDSA96DlW56iy1djT8rW+
	B2yxALmhll938lMWPdPCdFuAaBrCclZmkFP/HF+xo+Bw4vjihGjLCHjkzdtONg/g/lGE/ohBacU0K
	Z6btO9ZywX41ulbVBaRU5qwdvkterL2FgQ0dF2tbk1xmff7LrRKVq2LccuhioyfJhqKGGioeOjk6e
	KQdlhDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZM9-00000006iCe-17Lf;
	Thu, 27 Feb 2025 08:34:57 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZKa-00000006hx3-2DGQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:33:22 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DEB6D1140B96;
	Thu, 27 Feb 2025 03:33:18 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Thu, 27 Feb 2025 03:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740645198;
	 x=1740731598; bh=ynTes2E+sllrgKK7Pc1RbTXF0zUigaX8+Arp9ABtM1E=; b=
	pBzBVeXm7BR8+PVaYtSrz1I36VvE8Q0XzA7QE7iH+/1nv7hg3fLYUdLDCZuUr09u
	/WiZgPbEf75BxSNzINBed+pTJlkp1DLwAiXTbkJN2JQrNtpWAfAPTYWLS2snE8Nd
	pm1/wRRZdhtUuF7KlddBzZNcH+Mb7Eou03Op2qn9XZbUhJo9W3ZCKUHGKwafJ76b
	E1Eq0Xxy4ZqNOy4K5ZqZ0Xh94U9TDqvPmVV7m7BKJjn/6fFQoSGkWFYba8/8QZlH
	xieiWkmrFTNSpxopjvlXFn+noBEBTy88pY3VfPY1GduruTtuVX8d0ko08sOQWhbC
	htd1s0vFQYmubdJLP2//bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740645198; x=
	1740731598; bh=ynTes2E+sllrgKK7Pc1RbTXF0zUigaX8+Arp9ABtM1E=; b=b
	Sn216iu2rt2W486BVVi3X/PkSEM1+MuVI6oBXG4IknmLhw/7SbDFQ/Eg6s72GOyL
	3hPGxR6R5GrA28O6dI5IeeZmd5EhK6DhvQsBbOQv1ogH0VsCjkKEMoBvQwt9OohP
	NRGZxBtQItyqWH8puxZpVzrjdCboslpJ25WHqzv+t8k/H1iJ5pn0sVubgxeAbJP4
	dLyNOJMruzr1C25LQ8G488iOnmQ1wQh1vVeB/oR0I35Lj1tBE3roCtZ1JLy1c5yP
	eHTC9eFNFBwF+402WCgWwc/esvVo98I+CHsDI7bKvlmOk7Ui6Nlu6ox7RRkfwGDk
	kicTV19sXiPNgdWFGliZA==
X-ME-Sender: <xms:TSPAZ6b3cIGZ6H_d4XTNkrEHhIg74BTIyQkVJ0UXWfmQIB-wxy0gcg>
    <xme:TSPAZ9axliR8n2-Yxi7OJQOpOl3Bjrf4kQpjHioCV6UkAvileHg-AFnFkz8wma-0Y
    5TOIa0bbqEQxRYY_dY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekieellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhope
    gurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgsvghrthes
    ghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegvsghighhgvghrsh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhies
    hhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopegrrhgusgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrghrkhhkoheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TSPAZ09UmHSoI52io9qO7Fgn-Kw6QUgtDmxmc3Wg2Gnq59wJd0Ru4Q>
    <xmx:TSPAZ8pLUgAy0cs49dLw6Y9l_9jTfnXIm5MjGuWT20VqwwKyaQLT_Q>
    <xmx:TSPAZ1qFnVkMCOfbEYip6M4TC-zZex4RNS5HYCR21zgXQ0d76Kqj0g>
    <xmx:TSPAZ6Q_vynwVagQ4afcGJZLPSHwpgCI3Nmz2nXFqbgf2ZpuwbeveA>
    <xmx:TiPAZ-bc6NnwIrOr1Kqw3eEdzl7AXX03wclbQxxET-kqC_eQMeU3J82d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B32B22220076; Thu, 27 Feb 2025 03:33:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 09:32:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
In-Reply-To: <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au> <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au> <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_003321_123659_269AD73C 
X-CRM114-Status: GOOD (  21.61  )
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

On Thu, Feb 27, 2025, at 08:48, Herbert Xu wrote:
> The ARCH_MAY_HAVE patch missed arm64, mips and s390.  But it may
> also lead to arch options being enabled but ineffective because
> of modular/built-in conflicts.
>
> As the primary user of all these options wireguard is selecting
> the arch options anyway, make the same selections at the lib/crypto
> option level and hide the arch options from the user.
>
> Instead of selecting them centrally from lib/crypto, simply set
> the default of each arch option as suggested by Eric Biggers.
>
> Change the Crypto API generic algorithms to select the top-level
> lib/crypto options instead of the generic one as otherwise there
> is no way to enable the arch options (Eric Biggers).  Introduce a
> set of INTERNAL options to work around dependency cycles on the
> CONFIG_CRYPTO symbol.
>
> Fixes: 1047e21aecdf ("crypto: lib/Kconfig - Fix lib built-in failure 
> when arch is modular")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202502232152.JC84YDLp-lkp@intel.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

This looks like a good approach. Once it works correctly,
it should be possible to clean up the 'select' statements
in wireguard as well and just 'select CRYPTO_LIB_CHACHA' etc.

> @@ -45,9 +47,10 @@ config CRYPTO_NHPOLY1305_NEON
>  	  - NEON (Advanced SIMD) extensions
> 
>  config CRYPTO_POLY1305_ARM
> -	tristate "Hash functions: Poly1305 (NEON)"
> +	tristate
>  	select CRYPTO_HASH
> -	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
> +	select CRYPTO_ARCH_HAVE_LIB_POLY1305
> +	default CRYPTO_LIB_POLY1305_INTERNAL
>  	help
>  	  Poly1305 authenticator algorithm (RFC7539)
> 
> @@ -212,9 +215,10 @@ config CRYPTO_AES_ARM_CE
>  	  - ARMv8 Crypto Extensions
> 
>  config CRYPTO_CHACHA20_NEON
> -	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (NEON)"
> +	tristate
>  	select CRYPTO_SKCIPHER
> -	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
> +	select CRYPTO_ARCH_HAVE_LIB_CHACHA
> +	default CRYPTO_LIB_CHACHA_INTERNAL

I think the more common style is to put the 'default'
lines before 'select'.

It appears that the two above are missing a
'depends on KERNEL_MODE_NEON' line. There is still
a runtime check that prevents it from being used on
non-neon machines, but I think you should add these
lines here since it's no longer possible to turn
them off individually when building a kernel for a
non-NEON target.

> +config CRYPTO_LIB_CHACHA_INTERNAL
> +	tristate
> +	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
> +
>  config CRYPTO_LIB_CHACHA
>  	tristate "ChaCha library interface"
> -	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
> +	select CRYPTO
> +	select CRYPTO_LIB_CHACHA_INTERNAL
>  	help
>  	  Enable the ChaCha library interface. This interface may be fulfilled
>  	  by either the generic implementation or an arch-specific one, if one

I'm not sure why we need the extra "_INTERNAL" symbols, but I
may be missing something here. What problem does this solve
for you?

      Arnd

