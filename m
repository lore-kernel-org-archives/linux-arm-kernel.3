Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26931606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s1pCzJF6;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BcMOg/C7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u8e5CcNv9oY6VuYoJpUdtWSR3IA6s9zG0LDKZaQi/Ss=; b=s1pCzJF6aljCbtA/aN1JvNHjkm
	WQKWnfoXKy9vNfXAfwpqOoDt5cWhqn3GrenCcp/WgcQlZFp4JxZjQhdl8IdTxQ3reR7+m7nCEQvEK
	ILykDN/MVPn8h8y8+pkxYcAFvO8HZvVCdya89xWjyvSzf/NNyzKf+llgdxkjA8nMRoZlxk6eVAWK9
	Vbl7qnL4dkmyCny/ZSMo8ABdjc/Nd8tTeOEzuXibV3x/RAHy5Q9rDSzAsLhJ/7hXKMFdebBEaY/XG
	oKndvGCc23r7+A8BA92KmkhJ4B7GGOKTmDzQVNWyoJD8nsUFzg1Q0DvbvimTb3Skh/ISDr2dW6oAJ
	VApnfmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Jy-00000009wPf-0ngT;
	Thu, 05 Nov 2026 17:32:21 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Jq-00000009wMP-3kTC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:32:16 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C21582020B9;
	Thu, 05 Nov 2026 18:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793899923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8e5CcNv9oY6VuYoJpUdtWSR3IA6s9zG0LDKZaQi/Ss=;
	b=BcMOg/C7H7WJFt/S1JRxxIF9WXG/BXAjBQHBqve6ml8Ujh49lRId1pGfsFZ4vMJu8Z9qwc
	0/DZyNltrHH1Ps6iYoVXg+cNr0Qh2X3Jzs5qOhP16WHOGbqwZCgpK8j/fNGhRN7lrA6HeP
	PsD7itsZyec1TBKqY46nwajLrRVtCZANw/dGGvh3UO94YDMeDsVpjMj0UMdqMnH8ZxdZms
	F02Oq6KqnH5Y+ic4+j8CnRt8F71FUnQv2aGbkOZI5DdBNzKsZxV9ifkqPBneBdePJxDY8E
	V0TVF5Hh0hC7TkHM9m3FRTWTSi3xDPe02LwIBvW42PJaRmVisdVVHuwWdT3IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793899923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8e5CcNv9oY6VuYoJpUdtWSR3IA6s9zG0LDKZaQi/Ss=;
	b=ECXZQbomhNek9IQFp2tpaR9wkgR6pt/GtdOnFIHMJgc8XCdtCgLkyoDCF/mH7SEwNqBFwQ
	VgJdgcTShUDPjlaP1ByZCjcp8ui07ES+ZaqAz2LkvCDVnv/l8GVZk/nRbHWWi7Eh7Etqrq
	2eo24gz8t3HgXvi3jIRe9BOZZxB0z8/rGg9JhDecAxGQglzBTfOKeBT3g+GMZGYuAGx9Kv
	fB/vc9H+dM984DCX5ZNh7ZTGznbRWsMrS2DctNJ5rBdFBUSBHPvEEGCPUplqJZKtEkvxRm
	2Jwkft+CLf4fmcfNvB2EKWFQ96DLq8C7PoKSviue0TrrxCXD8siCGZCUb+vI5g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793899923; a=rsa-sha256;
	cv=none;
	b=Sk1CkR4+30LuOcX/BVLGSe504iIChL/PB43dkT4f65ElMCyQwzOD+FyGl29nWbe1UaUHeM
	x4X1utkSJgR++hBrVh3nJYnbdlixn+IRJyFB5c50Ik/mgZZZRWeOogQw35JDKM/X0BO9h4
	b32TUmda0A6s8cGaphKuGxPxy9tc7OWB+X9l2gzS2OXjq6wOS69oMWkwGgYl0BE2XJU0Bo
	yH8DW3pW6i02huKHBT+Cmq62ei+z2Kkpwbnn5tTQadfxlPvM12DIcQHggLzH59teQmb10Z
	ztRcOU30tcFP8duLG2F0RHFuvlIlyu5oexsV/fplq8oEtyhmfZJGgTCWKre23Q==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 9E0131BF678; Thu, 05 Nov 2026 18:32:03 +0100 (CET)
Date: Thu, 5 Nov 2026 18:32:03 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <vsnztvararyghlx4dh7kzfb7m4euztjacrzai5ucupcptncg4b@axurae5hrtfb>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
 <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
 <vvsd6rchs6wff2n7zxtcarxcvbnuxd7fx632xogm6hrcxxxqsl@dp5dvof3qa7c>
 <auyx155Caf3kwT4h@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auyx155Caf3kwT4h@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_093211_772390_FDA6F047 
X-CRM114-Status: GOOD (  27.56  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-05 10:41, Frank Li wrote:
> On Thu, Nov 05, 2026 at 04:35:11PM +0100, Marco Felsch wrote:
> > On 26-11-05 16:09, Marco Felsch wrote:
> > > On 26-11-05 09:06, Rob Herring wrote:
> > > > On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > > >
> > > > > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > > > > These .dtsi files are not included anywhere in the tree and can't be
> > > > > > tested.
> > > > > >
> > > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > ---
> > > > > > v2:
> > > > > >  - Rebased
> > > > > >
> > > > > > It's been nearly a year and these are still orphans. There was a promise
> > > > > > to upstream something for the kontron ones, but that hasn't happened.
> > > > >
> > > > > That's unfortunate, but these includes are used at least by the barebox
> > > > > bootloader [1,2], dropping these would cause a DT regresssion.
> > > > >
> > > > > Would it help to upstream [1,2]?
> > > >
> > > > You said you were going to do that on v1:
> > >
> > > Unfortunate no Kontron dev was chiming in. Will do it now!
> >
> > Okay, after checking the current linux source tree I noticed that
> > Kontron did upstream the carrier board .dts files but in a different
> > manner:
> >
> >  * arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts
> >  * arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts
> >
> > This means that barebox would need to adapt the includes. Can you please
> > mention that the .dtsi are not used by linux mainline and instead a
> > different approach was used?
> 
> So, Is it okay to pick this patch?

Yes, if the commit message points out that the final linux devicetrees
did land in a different way. This helps the other projects to adapt
their devicetree ports.

Regards,
  Marco

> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> >
> > >
> > > Regards,
> > >   Marco
> > >
> > > >
> > > > >> I will add the som.dts, please don't remove the kontron dtsi files yet.
> > >
> > >
> >

