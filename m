Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FDFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7a92QhB9JFz6Q3apWyfq8VOjLkUMmUw4CLg/hPMxL0=; b=KNe0vEn9mQI83UdSN5PoWBbOau
	DqsRe2IGDPwl/EeuleG9Jl1JzfpqXkIKbQNU+SoqcB4AWl/vGVhMdjadAh6/CWY+eR+e3ebmUWzI7
	/uc/4vNlsou7FbGmslZcjMJm5MMHM9X0FFRDw+jFwjiCMe2ehoUsbs7d148Xz7626CWiP9BZvIDcr
	ZbixQgIt5MtO3Jja6GQkviejWsPBAT431TqG4FLtl/+KtGNRPKbRaY+w+E2K6vNl0JD8eGthRbpNM
	L+KaJdodepjEFS/737qyvqC10i2bemdltNuNXqfp3d64b/FnxL/afvFHPsntwprlzl34zY5QPgmZM
	hnDna9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX3e4-00000009SAh-0plB;
	Wed, 02 Jul 2025 20:01:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX3aR-00000009Rjp-446P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 19:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1214C45E37;
	Wed,  2 Jul 2025 19:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFD4C4CEF1;
	Wed,  2 Jul 2025 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751486261;
	bh=CaQXOmGi1Q4hapePQLyAziFqod4bCIqfR+jrX6VTL94=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oKTwQiBw+tkM75pAVuwwZGva/mguhz9C9yn+RLuaHYRNtie1OVR0XlbcWjgube/WX
	 nBPW1fc7RincAaOEAxsvLr2o1PRB0EewchJFTYWZoRwvcrfzttARHZg0mxreIW2t3V
	 /JaZtglvZW6djsskXWmzLj2uPHsxtGpQghiRDbzZqz5O/ad595fzxRuzTwglzLbQco
	 57lGg9kbMbDEl+UGIJeipvsRov6NpduFTEw75KNeCpoDvacFuK5lXkh44mjAgADScc
	 MIWQaMjLCwSAHH/LYoQG0RqzrjlgnD3bS7vnL0D6mE/LXwJzEEnZbC5j5F1fuH6Kbv
	 QSCDuUD+WvuBg==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6F059F40068;
	Wed,  2 Jul 2025 15:57:40 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 02 Jul 2025 15:57:40 -0400
X-ME-Sender: <xms:NI9laCs28QYlhPXfNvAXECAXg4qbxhG3NuDCBMXg9YZfRFjAY3ul-w>
    <xme:NI9laHfO-CyLcRVqKE-_Ol55xS5aXihGQeRdR8XIEc0iMEY1hznDUBHvDOksQBBDG
    S9-EIZPOlTvXWVMPyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggr
    thgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghlvgigrghnughrvgdrsggv
    lhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvg
    hmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgsvghrthesghhonhguohhrrdgrphgr
    nhgrrdhorhhgrdgruhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NI9laNwqgy5fmKbVuN6ufKbwO6ci8zaZO8U14JNHCAEgzh5P4AhQcw>
    <xmx:NI9laNNTDjb8W7aNnQQcl_IMMDlm4R1XJ0V42VSvlKV20oZtIMh-Vg>
    <xmx:NI9laC8HMWDKpPVud9dKnhSew2dXQKf_9r40M52mqN30aq_C-E9CWA>
    <xmx:NI9laFXljuNhqBIZQBYp2UflD1FESwb5MFox1kvgplWN5ZIFPu17ig>
    <xmx:NI9laLeU29iC9nuQZTXb33cj2kzAeIBV2fTVHCIrvSYT0kEtjwVZsWbA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4464B700068; Wed,  2 Jul 2025 15:57:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tf4af6f8839cae169
Date: Wed, 02 Jul 2025 21:57:10 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Robert Marko" <robert.marko@sartura.hr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Mark Brown" <broonie@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 "Oleksij Rempel" <o.rempel@pengutronix.de>,
 "Daniel Machon" <daniel.machon@microchip.com>
Cc: luka.perkov@sartura.hr
Message-Id: <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
In-Reply-To: <20250702183856.1727275-2-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_125744_052488_308C9269 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
>
> However, this means that new Microchip platforms that share drivers need
> to constantly keep updating depends on various drivers.
>
> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> could instead depend on.

Thanks for updating the series to my suggestion!

> @@ -174,6 +160,27 @@ config ARCH_MESON
>  	  This enables support for the arm64 based Amlogic SoCs
>  	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
> 
> +menuconfig ARCH_MICROCHIP
> +	bool "Microchip SoC support"
> +
> +if ARCH_MICROCHIP
> +
> +config ARCH_SPARX5
> +	bool "Microchip Sparx5 SoC family"

This part is the one bit I'm not sure about: The user-visible
arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
here, or more generally speaking any of the nested ARCH_*
symbols.

This version of your patch is going to be slightly annoying
to existing sparx5 users because updating an old .config
breaks when ARCH_MICROCHIP is not enabled.

The two options that I would prefer here are 

a) make ARCH_SPARX5 a hidden symbol in order to keep the
   series bisectable, remove it entirely once all references
   are moved over to ARCH_MICROCHIP

b) Make ARCH_MICROCHIP a hidden symbol that is selected by
   ARCH_SPARX5 but keep the menu unchanged.

Let's see what the sparx5 and at91 maintainers think about
these options.

The other patches all look fine to me.

     Arnd

