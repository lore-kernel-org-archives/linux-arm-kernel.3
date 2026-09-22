Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4FBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryw1ckC0LyGtXZnUSGqqdSw6vPzJYJA+e+eu0aiWzDk=; b=tWEUi8bnDl1pHLhpSPkCEOMpMt
	wL/1gv1I7qALseZHIfOA5zEXFjfXhkIBoxTIEliC7DacXBq54WhraQVQv/9YB8BGAHLfi3xMgHCJ2
	TRihcS+Ed6PA3g7lNDOAWrIu8HRggK4d+fMM1NU9XnnOHRjSHbVJJw7UPWPehR37Y4V9vbUq0ZFtp
	Zaumt69Gvt3ni9FJsal1eN2ZtQddMXiGbsEXfYYQ98/uQknhni3XiBqq9fGq7wb9wW9u4qk/TsxmK
	JnW2vliEBYLyD+Sw/8sQElB7ohJPDKZ2n+sruyc4jwKkms4FbzrtgVoWD3fEhOjYnADDEoRLHLafY
	5vOE7LNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93uv-000000068tv-2qIB;
	Tue, 22 Sep 2026 17:04:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93ut-000000068tf-2tAX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:04:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 245EC60142;
	Tue, 22 Sep 2026 17:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFC1F000FF;
	Tue, 22 Sep 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096666;
	bh=ryw1ckC0LyGtXZnUSGqqdSw6vPzJYJA+e+eu0aiWzDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LK58FBnokT4BZd7z9MJoSe+sT22fZ4uH11pNVyD5Mnf8sptKicd3R4Zy+yyywjppT
	 J90leobk6npQIuX5A0tV/IzBrkt4ZNNTa243Me6IPtmqpiqe6ofOajL93TiDPqXRX0
	 2OnMiHswX+S0rOndPrdHpznYnCEDLgnxjfZSFEBlEXgEMM1dUVsFti5Xm0slJ2lrgd
	 HxAdDBlD5XtmyX2jQ5+ln5rKRBYM28oPRj6AViczIoSJd9L9szwCYaGRYxxWhP8+De
	 I63x0txaW69cubtyDEF1Hd9JBWsiGVKOjk/J8WgRotBkoq/Xv/hjdFDWO5/y0wMGkD
	 LE6F0fBW7CD3g==
Date: Tue, 22 Sep 2026 18:04:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Message-ID: <20260922-perky-absently-2590fe901176@spud>
References: <aqE42NzerAiD2U1E@squawk>
 <20260920051501.3620794-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5dgaYu8dXVKiJatw"
Content-Disposition: inline
In-Reply-To: <20260920051501.3620794-1-Jelly.Jia@cixtech.com>
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

--5dgaYu8dXVKiJatw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 01:15:01PM +0800, Jelly Jia wrote:
> Hi Conor,
>=20
> Thanks, understood: with the SoC-specific compatible scoping the
> integration code, other platforms are unaffected either way.
>=20
> For v2 my preference is to keep the wrapper, since it leaves the
> generic arm-dma350 driver and its binding untouched. Does that work
> for you, or would you rather see the dma-350 node itself carry a
> device-specific compatible, with the clocks, resets and
> memory-region described on it? I'd also like Robin's take on the
> arm-dma350 side before restructuring that far.

The latter, since that's what we do for almost every other device under
the sun. Robin's take would probably be worth hearing, but you removed
all the context while replying which makes that more difficult...

>=20
> Best regards,
> Jelly

--5dgaYu8dXVKiJatw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarK1FgAKCRB4tDGHoIJi
0lGvAP4lmnDtOzTWLgbDhWbJVyNZ2BlGz/EtLftum4ZCqwvKLgEAgauaEkmh9CkC
pA8yWGCGYUl0y/3PxtT6G5PsRZq1Agw=
=X7Es
-----END PGP SIGNATURE-----

--5dgaYu8dXVKiJatw--

