Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A44E606A906
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/4y+men;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Zlq1Dbqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XBRPpKuaOzxRwmT+HiflPZUBlbHFQH3yMj9t4LnCfBw=; b=t/4y+menByVUsumt1+yZujXIdl
	BogRZyx8SPQpwkeiS7FI9I4+u/XXZKJsF7Tk7rfexpfTf6uQTWIxlSClaLNldAJIrZXaNJz9ard2J
	ryeN+UCXU1VhXesRF5C9WjqxG1guN3OjP1o87byNczSSYl0al52nlgiVlgUoqLzi1TQyVYeZ7VhJb
	gUAJOabdXfUTO6rYI54AHtaEXe+H6b76H3FHAj7yxVQzaKMcFAtPjFMUrvsF5S0tKOOv5uAbpCzJx
	CmffWFxlPEljDgTjaUJ419JHv24+welfufierFvdvEFRU3bAjOW2l3a4cs4pnBR4fgI+9Cxn7BeqV
	1ct442Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz5W-00000009Mqx-3Rp0;
	Thu, 05 Nov 2026 15:09:14 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz5S-00000009MqH-3viF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:09:13 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EEED32020B9;
	Thu, 05 Nov 2026 16:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793891344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBRPpKuaOzxRwmT+HiflPZUBlbHFQH3yMj9t4LnCfBw=;
	b=Zlq1Dbqp2HRnLFPnH4NElHiteCptV5CDdT13FhWecMKu7AxEteFGJAXEdcX79xWwPkf8U/
	YRYJGkkJO3bkOH7tCMTt4QMI5BaTh4JPDMPVi2iQodk6IMfRROsaQZwrDZ3Y8dGNUntrMn
	qAu1TebES3vAjZa++2kAmZrzaufnZCvd54cqRnZEtF7op0FnJff6VLehRwA6XvHI8AQak8
	y2bnNulvW47VCA2xFUKuP4RWNpQwbJR/blrAJkv1JNrKmQG/lG2vzDWm5spnC79BIsDo0N
	xyc+fx20Ef/jYOLoW+YmY6JQtw20RmuJvOpJ9y8aeb76wR/D/4VCCcuPxiEUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793891344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBRPpKuaOzxRwmT+HiflPZUBlbHFQH3yMj9t4LnCfBw=;
	b=bCNfkJTUdlwgrCyXrYY/qlB23nWsftk3X2Zbz+m0/xT1uBwCOgBRP9KM97rdiSAUwE8cGY
	3pYp9P7zw2xW3/A4cEbHByOsFgXboV55wUR1OQ5oO9CqDIg9YOfqnSqSNO3PxIzy0ukaZu
	rE3TvDvRSnS5C26DB4RwAx5K1Il2ntN615dfvZ9EIPOiDrLUCRkwzUId0OZW9zbYtcrHLH
	UXWkCAlHGK6jnqVwfb+HmJ0y2Vpd0IVSWSXSFsky7i71zOxKsbVBx+1wx5+UKJb1/Waas3
	vWsutFH1FThY4NWtgUljR7gRgMRtmYgbNkHTK6LqWn4EwL6dZSQh7T/AU23WCg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793891344; a=rsa-sha256;
	cv=none;
	b=f2uhe0YUakXdXc7CVHsvPJzqld4h7mT7TBr0xRBzXPpMmdMa9kFUlAwcJVelBmPxAoC5Ri
	+ZzaMb4yasuaW5DyWCFenag0eviFydcCp6rFrWBbtzHVF506sO8DjF0xxnilrbyz1+hu15
	BBTfjbX9+1IK/Ov8fUjMYJHpZrFunTDHCOM2TAk2OPCUcVqK69uduT3VOnhqsCjwHFZeJy
	/k0wi6vs1odwES5deFDejjyJdgSZicUBmX8xNKBZJB2bVnPQGKrK61Y08WR2DRbbRem9yi
	dYgRjgn8+Qyu6lXMk1e3/Oo7Dvbxr9oyDtHszzs5CdzZEPK1gjETSW9HFj0uFQ==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id D9C261BF3BD; Thu, 05 Nov 2026 16:09:04 +0100 (CET)
Date: Thu, 5 Nov 2026 16:09:04 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_070911_462208_50764673 
X-CRM114-Status: GOOD (  19.39  )
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

On 26-11-05 09:06, Rob Herring wrote:
> On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > These .dtsi files are not included anywhere in the tree and can't be
> > > tested.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > v2:
> > >  - Rebased
> > >
> > > It's been nearly a year and these are still orphans. There was a promise
> > > to upstream something for the kontron ones, but that hasn't happened.
> >
> > That's unfortunate, but these includes are used at least by the barebox
> > bootloader [1,2], dropping these would cause a DT regresssion.
> >
> > Would it help to upstream [1,2]?
> 
> You said you were going to do that on v1:

Unfortunate no Kontron dev was chiming in. Will do it now!

Regards,
  Marco

> 
> >> I will add the som.dts, please don't remove the kontron dtsi files yet.

