Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AFC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Wkp/VQf;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XmDVUKYp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o9kwmng/ZKZ68oeV09M3Z/Ujx6g9XVfoDBXSDUdg1Nc=; b=4Wkp/VQfAUCs5OXv00jlR0tmFF
	d+JZCkzfvt8k3l8Y8db0weEN+5v/dFZ6hf4fNYSxAf3B0TtdFGoAnswgLOYDINAJczof0QcxiT5yw
	qyQiwp4H89cpIMp/FcJstGN2ym9OZ4dqzAN09Ea4ME6Npmim1D1CB3t4MQnubqBxX5PRE00Wc/g2M
	Lh9WZdTA6f9bdyQ+DCIZgjRPOegmFjNXUxBA2JRy5mAqS8prjUF6YvNrcSQ3d9aosM9kHjBUbMrbq
	A5/TdY4tLZ/cw/nUYlUcIvqFw8tbG5i7Hu8fbKUisHRy2upwjwE+2l6lf28f3iQa2knelXsAkg7gA
	H2FuBb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzUn-00000009Q05-43W9;
	Thu, 05 Nov 2026 15:35:22 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzUk-00000009PzQ-0F0Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:35:20 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 029092001A4;
	Thu, 05 Nov 2026 16:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793892912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9kwmng/ZKZ68oeV09M3Z/Ujx6g9XVfoDBXSDUdg1Nc=;
	b=XmDVUKYpjZcwC7b8SlEXCovgkE/JBQsHmhhVyAYs5zigkZ87oowPnVy5aj3Q89rUMSTsoa
	FyNTbgM8GQKFolXErydMGzN0GKnXaLpIdxrYMOi5gcc4D28kiyjAKJlW/MkVsr/K3Pzpgw
	gbQLZZWgVLw2PQSM3mtoxdFLCx4jHsTpgbAzi/CPiKqRe7dq3qyNyoHKCKpT3aOmUSOJul
	nFyTSSq74Qb/hvmcL3oJU/CAF17hnBUFTuSlIWwAcBXqhVP7UmIJnQq2rFmIW8RY2ZVmBY
	OA/ksBPvOrQFjNg8basVTflOnG0YdJ+Sy9WsCc6X1Ztmzhg14xF5ZTUbbuVRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793892912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9kwmng/ZKZ68oeV09M3Z/Ujx6g9XVfoDBXSDUdg1Nc=;
	b=eIGmtle9gor9BJZPw2wpF6K1snehL6cGfp1+oFlwj4LMLugIgm+6bVtFxVR/Fqs3vYi77n
	Myyq3rQHLsZUKYkGi9RRBC7pRfuiocb4N9YYTI6jIDXTywq4uSVz1bfJA5Rrqlr5bVyFn6
	DpGsmL/8WH64BdR1VKUILhlamHop5oRDTDv07wULbTPerVF/leaAWdI2uLZnIBj+BtSu4m
	6pXFLNmFw1moZScD4X4RudOcDTVU2K/h2ea7e/uryswPVNkq0XN7lJDofhrH5Kdua7X8zV
	PHHVieSnhX2VCtfWfr6o+f0+lXoocJR/xf40S76c8qNFQUZpFUClmKQ2uUCy2w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793892912; a=rsa-sha256;
	cv=none;
	b=YBq/iClsbsm9V9sGw6to7W9CKWhSSAgQsh08spGFJmdt+gYRlYpVIzyvVsukUOe0/LuIW3
	S7m7obN/ZnmCBrd+YIHVcraz4vGWal/gt6muIEGSepK3ZhDGU7Rftr2+4iUWUikAAv2VBa
	ugWMDzIY2AoCv+Sjl2RAtG8Wm5qen+TpwJ6Ag/2D1gWoU9bmF5hTjajKxo0tZ7rVJ2nFP8
	GIYLLO0G9BBQCPwI5XsM/SrW/8ViJY06U0hqB3uSAM05/JvPhaUBNADsdYQDmck5B9a7fw
	xsGql6365IhC/14rsm0EobVq+6iq02Ybi1/bX8peEE0fdXjPY/GhkggSZQASEA==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id E15511BF56B; Thu, 05 Nov 2026 16:35:11 +0100 (CET)
Date: Thu, 5 Nov 2026 16:35:11 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <vvsd6rchs6wff2n7zxtcarxcvbnuxd7fx632xogm6hrcxxxqsl@dp5dvof3qa7c>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
 <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_073518_392688_CD227E08 
X-CRM114-Status: GOOD (  22.97  )
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

On 26-11-05 16:09, Marco Felsch wrote:
> On 26-11-05 09:06, Rob Herring wrote:
> > On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > > These .dtsi files are not included anywhere in the tree and can't be
> > > > tested.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > > v2:
> > > >  - Rebased
> > > >
> > > > It's been nearly a year and these are still orphans. There was a promise
> > > > to upstream something for the kontron ones, but that hasn't happened.
> > >
> > > That's unfortunate, but these includes are used at least by the barebox
> > > bootloader [1,2], dropping these would cause a DT regresssion.
> > >
> > > Would it help to upstream [1,2]?
> > 
> > You said you were going to do that on v1:
> 
> Unfortunate no Kontron dev was chiming in. Will do it now!

Okay, after checking the current linux source tree I noticed that
Kontron did upstream the carrier board .dts files but in a different
manner:

 * arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts
 * arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts

This means that barebox would need to adapt the includes. Can you please
mention that the .dtsi are not used by linux mainline and instead a
different approach was used?

Regards,
  Marco


> 
> Regards,
>   Marco
> 
> > 
> > >> I will add the som.dts, please don't remove the kontron dtsi files yet.
> 
> 

