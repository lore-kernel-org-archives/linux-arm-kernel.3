Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C04C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//H5GEZrx8xix5H5r8gAAXiNMUAXhsLPmlXNUhiqpRY=; b=Z6PSzpTte/HBRT7xoN8vCRUzrk
	Zwf2HJm0TnIMf53r5IIel0BsINJUPuub6l9D6LMvKFI+tkR6f4A3J8UnnJ2yI1eYIVnJws5MCsH22
	HlcT8dx4S06xM4XpD23WhdpPAQ53sp0k0k53Rc0XOycKWfIFup+pG7bYdHYCRq0KoB/A24dqqE4yz
	uxhXHBAPrAQkY69PJBGrOaYoh1XCgEY2UPAcVN2uDl9oHY4XbM9mpNz7NBiyk/Tdajel8MjhvZWnT
	3TUD0Pg8qjGzO9R4pvpbGVL/oEQIC2Y6HYYru5GbUfMsu8sa82Cpi/YQq+Km3cCSkT80cVaOBTFNx
	L4djSb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJC2-0000000CfGn-3uKY;
	Fri, 21 Aug 2026 06:57:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJC0-0000000CfGT-1Ry3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:57:33 +0000
Date: Fri, 21 Aug 2026 08:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787295449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//H5GEZrx8xix5H5r8gAAXiNMUAXhsLPmlXNUhiqpRY=;
	b=tUgirkXO//2Xg6MfOKGf3OFDIKYL0B80RIS/QrJ2TDW55fUmSEJEsf6dzoFX0J/JSXC7fZ
	zRVaZAoLixo/p03cvkgMgsn1aCrEagZxcyHSy+Z7Kym7fqH49j/0ljxwKRPnw++Qfq1JyI
	kttBaMB/BsLVujnFIbPY41drRRlljWkAcEQQvuGlUQEHgFossD1wiE0f8+ZroFWp2CvfX0
	CdZey7u4aHw3Hq+A5+Cmhj9XZl4wSeqH3O9a97sfsE4coh7IYkuKfPE5F3GveCVBoeTGo8
	s4hx2IRWNCU+kIlT/6boTSIBLL9Dcp8wjOqiybg6iJe9sx7iTTVuWhNLyL6LKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787295449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//H5GEZrx8xix5H5r8gAAXiNMUAXhsLPmlXNUhiqpRY=;
	b=Np+eVljERw3TWhD6K2X6wafhgGDiLqKQy3Osth2WQPcl+cQ/6oBuTHT5AKIieplGmXiRQs
	ZnHbz0J5cspn7FCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, kees@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v3 2/2] net: sparx5: fix sleep in atomic context in
 MAC table access
Message-ID: <20260821065728.Grs_oZp7@linutronix.de>
References: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
 <20260817-misc-fixes-sparx5-lan969x-v3-2-c7c7fef723a8@microchip.com>
 <20260820143443.RTYj4Q3u@linutronix.de>
 <20260820102458.308b78ba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260820102458.308b78ba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_235732_569806_1FBE25D4 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On 2026-08-20 10:24:58 [-0700], Jakub Kicinski wrote:
> > > -	.ndo_set_rx_mode        =3D sparx5_set_rx_mode,
> > > +	.ndo_set_rx_mode_async  =3D sparx5_set_rx_mode,
> > >  	.ndo_get_phys_port_name =3D sparx5_port_get_phys_port_name,
> > >  	.ndo_set_mac_address    =3D sparx5_set_mac_address,
> > >  	.ndo_validate_addr      =3D eth_validate_addr, =20
> >=20
> > d6fce5141929 is v5.14-rc1
> > ndo_set_rx_mode_async has been introduced in v7.1-rc1.
> > Youngest LTS kernel is v6.18.
> >=20
> > What would be the "fix" for the kernels v5.15 =E2=80=A6 v6.18?
>=20
> stable should backport .ndo_set_rx_mode_async
> there's been a number of similar fixes, and the whole point of=20
> the new ndo was to help drivers avoid the sleeping in atomic bugs

Understood.

Sebastian

