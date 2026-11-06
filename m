Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2907C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 04:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdWUbn6d;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Bk8cTMk/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pgE10eCMCTY/ZcVx7ek1lDVXJ0ro/xZZDrYhv8RrKbQ=; b=AdWUbn6d4tx8ilcSyNkdty1+BF
	Y/s00I0Y3chiOV2cl9treEh0wdeuaQe7Rcv9DXkrSHbo8I8RFG4QY/Nb7QlF8U0hmVILJ8o0wbQ9q
	vm698CcJ0eu0oeGDRm+lkx49Vkqpj9YTteFDLl8bJATExHaVoKWqge0i3JLRiqkAN1E51OZ0gnK6e
	D6cX/INSKj1aHPe81CpntzOZjuoZqptxJaVv4hXn+fU+GsKv8N68OG21aTk/tr0Hovw8c+gPVpVeP
	dpmBcmUdAYl/VDj3Wpn0CgYtfD2B8leT/TvyKk8jFAIIFl8mt4qIwD46KxzKQLNQLEqYbaZz3FDk0
	is5jPpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBkS-0000000BDuf-0fRB;
	Fri, 06 Nov 2026 04:40:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBkO-0000000BDto-2HxZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 04:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793940004;
	bh=pgE10eCMCTY/ZcVx7ek1lDVXJ0ro/xZZDrYhv8RrKbQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bk8cTMk/fNQGf1WV2bC9cjno9nlavkIUND5zvDV1Piiwz1bSFM2pjubO2ka40IVE2
	 Tbzh+Fu2D0O+T05AfWjADO5pT3gjwTKECtiKDvHCHgSLOa9zQReHwLFPXMrCj0lGnI
	 u9Rb9I/ay++2itl/y+LxMgZrst7bpuJI4AsgTgySwh/Q7yBzusCVYBmbuuUHZz7R2r
	 jIb5Y+PcaPlSPu6+mSBBt2MJ8Ld+LJzfrK+Kv/2PVGTNfr931iG2hJ8ZXOd/Z+Iqtb
	 6rb4XaJsVpru1GxcBh2ruOlEobO23x6N3vvQtCQqE0JQoednRHYKe8rDL6SfeJLPkS
	 FCo4nwCK82swg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A250C64952;
	Fri,  6 Nov 2026 12:40:01 +0800 (AWST)
Message-ID: <d7a1f55d822af84b00591a57d2bbc1541c184412.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com
Date: Fri, 06 Nov 2026 15:10:00 +1030
In-Reply-To: <cover.1792749922.git.dawid.glazik@linux.intel.com>
References: <cover.1792749922.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_204016_962247_CBF30E51 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-10-26 at 17:40 +0100, Dawid Glazik wrote:
> This series adds initial upstream support for the Intel AVCRP and JNCRP
> BMC platforms based on the ASPEED AST2600.
>=20
> The first patch adds the board compatibles to the ASPEED binding. The
> remaining two patches add the board DTS files and register them in the
> ASPEED DTB build list.
>=20
> Changes in v4:
> =C2=A0 - Rebased onto aspeed/arm/dt of bmc/linux.git. No other changes.
>=20
> Dawid Glazik (3):
> =C2=A0 dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
> =C2=A0 ARM: dts: aspeed: add Intel AVCRP BMC
> =C2=A0 ARM: dts: aspeed: add Intel JNCRP BMC

Bit of a nitpick, however, I have other requests on the relevant
patches:

For both of the latter commits, can you please capitalise the first
word after the prefix list (in this case, 'Add')?

Andrew

