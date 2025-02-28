Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4DAC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/UMFY3PmG/1uLNOqdYStwAd4uZGvoG8DB49sRcvT7U=; b=mRib421db2eHBKf3u9X6MgJhGY
	+qp/obgsRZlTeVp60MY2t8ZsewoTamAJz89LULDMsNti7eApjw5w5t0lHLYTIGs5DEDA5NoVDFWff
	QQSpUJf7u2KBlir4bZSNd/dR4dEl+sm4a8e1RKpqtiIuV86ufWrSHBkKBSrBQHYrKv4R1QYLunIMe
	8277vkKdJfm+UFs+Gf2Dwi2MtwvRhf33AjXKaTcLjz3SblK6+YnehiO2MzMVj3uyug39ymKWhnyta
	QljM5cD4I7KklIuGBaUq/0Mh78c67J+VfRjnzjO1u0L6r1D1hZzFS6IWZhdViA3+sTFh+2w3iyogr
	WXSgwDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4xB-0000000C6bi-3kaY;
	Fri, 28 Feb 2025 18:19:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4vc-0000000C6ND-3z8h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61A115C44CC;
	Fri, 28 Feb 2025 18:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2017CC4CED6;
	Fri, 28 Feb 2025 18:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740766659;
	bh=a/UMFY3PmG/1uLNOqdYStwAd4uZGvoG8DB49sRcvT7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4WzT/G2oAFp+dNhWfYKlm79abS+NcpyQZ6eqyRwjYZ4EPAb0WBkJoTAYhTfQXByR
	 y6rm7XHSuoIOh9RpAt4GyGZQ7SxOXAko6BPndWwD4CieeqLaSwomU4O9NsoQl8360l
	 0mdhllvDDzddzU881slMEqFz7HdCuxBV9y+NyuoSkW6fGKQeZd9sEK4zvtbRwTsW/t
	 d/wJK//J+vfSHdknARu+bnfB9jrrTh/0ZJejmCmWWXixeXO1pizGB+VDSEnnfz7I5x
	 6HCMJuBpkd6gnm4BrtWF1NilRbb3MuEHHPkBya05AV0BdMIdrmUHtWD+eS1eha53t2
	 1qtZwd/tajQUw==
Date: Fri, 28 Feb 2025 18:17:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: sama5d4-wdt: Add
 sama7d65-wdt
Message-ID: <20250228-quaking-yoga-3ca96e2bd3c6@spud>
References: <cover.1740675317.git.Ryan.Wanner@microchip.com>
 <15d6f901e64dd36d25a62e27601252c59708275a.1740675317.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OwNJr0RVbE/sS7Fv"
Content-Disposition: inline
In-Reply-To: <15d6f901e64dd36d25a62e27601252c59708275a.1740675317.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_101741_029853_D385A6BE 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--OwNJr0RVbE/sS7Fv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 08:24:10AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>=20
> Add microchip,sama7d65-wdt compatible string to the dt-binding documentat=
ion.
>=20
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--OwNJr0RVbE/sS7Fv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8H9vgAKCRB4tDGHoIJi
0lJcAP9u9Uvx/4C75KIMdUEVO/h+wPDo8Rq2c+a08bA/fz8CEAEAl7uhrUKbEPRt
rrGARi737735dX3i+yX85Af/e9nLrQI=
=P3hd
-----END PGP SIGNATURE-----

--OwNJr0RVbE/sS7Fv--

