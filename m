Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749E8C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL5v5lQdZldPAbLm/+TpEkR7SMK04/J+TrzXP5wZgHs=; b=dqvrxYHjpzeUAnknr9yuFNDbB8
	tW+1zPiglbcxNs/YG80hIWwharQxR1RXGgqBObT/f1Z4c4tUoxEn8Fk1kRuJcxHuODOlNbxTlk8xv
	5MI6+foMxLNF5xOiOZ+WNf3SQoFXktHspgppVpikGrW8j1NsqwhhW+UnsUcjElfp4zglcfTK3QUtr
	GeSCbml3MhnwFtq/yqixFfPYX1flApsqiN4PXK82eby5cDqB6zwGswJeaEQSOnnkQKD1VXG6jsV5O
	GKJsNJZLvqxRfxMmtYoTcClwqx/zuosq19HeWo4Ld7wH4HQrQVScLr2vDgw/RQs6SYtRoSeeN1Bfn
	yl1xkHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4F8w-0000000BNFP-3I5V;
	Wed, 09 Sep 2026 10:03:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4F8v-0000000BNF2-15St
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B51143EB1;
	Wed,  9 Sep 2026 10:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E231F00A3D;
	Wed,  9 Sep 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788948180;
	bh=qL5v5lQdZldPAbLm/+TpEkR7SMK04/J+TrzXP5wZgHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hX5tVD48XCtUCVXCRL5G9+dGlaiLOYwvKuJ4NPg+7iYrzwq4NCV8g6oaBxe5m2yMg
	 YFzqWD19PJoZBRAvWrNqsHYPyobZWghyBI4oMIm1QU3dacJS6Anoi+7fmzTp+TZSDD
	 hJnr8MoHeZwP3ui0gZeUFrEdNwfw+lYeOr0o3XK9Y1Clx1cqeDjv6nu78+5S+8YRH2
	 Ooi/ot9PfJ1faexvtpbohSFlvFk+uJZ3KMwBK9dBfzG3h5xeF/uboedCwEtDbJWcgg
	 p3Kz+K+d4PgpQQZ3/qh+rfTRqNCQZjsE1nKxIvl7fyJg5VqIosP5HD6mug4nRDY9PM
	 iw4Y9KYc8sJyw==
Date: Wed, 9 Sep 2026 11:02:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Message-ID: <aqEuyLac2OGkSYX7@squawk>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
 <20260903-sandfish-likewise-820d64daae2b@spud>
 <9e72a269-1b19-4c60-a32d-8f93c499f205@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="msDbi5syonYINgjJ"
Content-Disposition: inline
In-Reply-To: <9e72a269-1b19-4c60-a32d-8f93c499f205@ti.com>
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

--msDbi5syonYINgjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:28:47PM -0500, Judith Mendez wrote:
> Hi Conor,
>=20
> On 9/3/26 13:00, Conor Dooley wrote:
> > On Wed, Sep 02, 2026 at 05:27:57PM -0500, Judith Mendez wrote:
> > > Add ti,am62p-efuse as a compatible string to the uniphier-efuse bindi=
ng.
> > > The uniphier-efuse driver can be used to read AM62P efuse registers as
> > > well for GP_SW silicon revision detection.
> > >=20
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> >=20
> > Why is a fallback compatible not suitable here?
> > Either it is, and you should add one, or you need to explain in hte
> > commit message why it is not.
>=20
> Do you mean the following? :
>=20
> compatible:
>     oneOf:
>         - const: socionext,uniphier-efuse
>         - items:
>             - const: ti,am62p-efuse
>             - const: socionext,uniphier-efuse

Correct.

--msDbi5syonYINgjJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqEuyAAKCRB4tDGHoIJi
0kbTAQClPJISrFz94rICYGVYujAIAlIPpO10JQHDUyUxLH6E1gEAqYmy4Hgv2dII
OViZOLP/U00zE82DsFTWQKfQ+vKrhwc=
=ARD7
-----END PGP SIGNATURE-----

--msDbi5syonYINgjJ--

