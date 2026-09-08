Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA08C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3jSdgnbL5LvBC8GXl/H4R9qhk5svWd3V6MyFuObhUE=; b=sPwj7yKYSQnPiPJRLAB9vpV/lg
	kWTfFVrNbVh2OLisHUVEI6R546iaHFoKWmkamk9fc5bcGQuiER+3hEazw611J0g0+qQmiUtcxEk2S
	h9Fwmdvi1BmwXdr7XtqmJ92iY41Sm/DRftelSk4JWGvIfbxGGr6XCl8Q8dTlE2vKlr1qrhLZjw12u
	GSE+XZcWIP/hb3pTUqtt9e0xIUOv533mLjGhFgW3NzPOKiemBLGXIo72R112S/vRDH3PxIv7CTfhn
	wncelF+eMydKuQNtjihqAtrQkm53xLIVmio2xnabT3wj2raseiVo98rWjhuUFvo5mHxSa+lr/u3PN
	DcHG7pkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4042-00000009ujO-0PjX;
	Tue, 08 Sep 2026 17:56:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4040-00000009uj8-15oR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:56:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFB4B4161F;
	Tue,  8 Sep 2026 17:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D961F00A3A;
	Tue,  8 Sep 2026 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890215;
	bh=k3jSdgnbL5LvBC8GXl/H4R9qhk5svWd3V6MyFuObhUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCR5T3ug3ogPL0IrNrVo72MWGWIY1CA9c5kINyRxx0jaUzvEgFt/fv7Z9i5VJzOa0
	 j4aGiYDceRUzHWPvg/QxXjOHvU10uyJRc1AYOUlU6X61WgVrSBhv68zt6yi5yo5GY8
	 owJ1C5NmpGfZr8awAGK/5TJYXcfBcsGLQFdBGEJ18paDYS43f9oQVQoRQAjzTYh4BC
	 y0pNJGoN2yYjSZ5VbvN+xdqmPCIyV1XAkxj2QGQRtOUWZT5SFhiy8hVY2jOShketuP
	 Xye8BM6H3XWky726vCFJSqIt1/68eFsj+0cl3RazMPIlfJwZLr7ldm8TQHCdeLeNeG
	 /kto8pO0QYXeQ==
Date: Tue, 8 Sep 2026 18:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Message-ID: <20260908-pesticide-creative-6185ca4971e9@spud>
References: <20260908-axiado-ax3000-pwm-v4-0-19a03671cd5b@axiado.com>
 <20260908-axiado-ax3000-pwm-v4-1-19a03671cd5b@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kFlJqgktNAXA6FxP"
Content-Disposition: inline
In-Reply-To: <20260908-axiado-ax3000-pwm-v4-1-19a03671cd5b@axiado.com>
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

--kFlJqgktNAXA6FxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kFlJqgktNAXA6FxP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBMYwAKCRB4tDGHoIJi
0mf7AP9iW5keEM1nmOylKZgW02slNGlrttLScQ5pyEVZQL9NxwEA7+4S6lfDL6fB
sJf9uC3qpk4vYAvdb0oCNDo4HdaxOg4=
=VFZT
-----END PGP SIGNATURE-----

--kFlJqgktNAXA6FxP--

