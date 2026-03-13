Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A150F107BCD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZNYqBYQpWUnW/tLMvfUh2kjUY/YDWM5Q+UdXtOlsMw=; b=Es+pYnS8qVUtSeJkpj8ll/NTcK
	GkZZk/jG5ccMmiaBpbNYYxUB7Q4evltNt+2D2/CuAZPeMS65KRyMhsTZ/1jbKUTYO4KSVcIxujeA3
	cPp4aZqqfmUVdJj7oo736YqWc8ZhzJ/EJWMPmyUIehXEz43D0tZU7wODvzcOmwdHROHuOaOlHbdra
	yxDFbG2/OaWNMZD0ju/uP4BSOk3TMJmlFBro2304WwI+a7uFWUp4CmjiM8bwkz7vcVANWaXkjcAwF
	F08qjXnqJAbnlCfYItoN5mcDANDQOWyojkLY+bll0h5lg7oPdt/auUjATmDGTUUcYWsza63vcM62j
	MpnHDLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16H0-00000000lR0-3Bds;
	Fri, 13 Mar 2026 17:26:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16Gy-00000000lQZ-2zN9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03FC043F3A;
	Fri, 13 Mar 2026 17:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA1C19421;
	Fri, 13 Mar 2026 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422763;
	bh=zZNYqBYQpWUnW/tLMvfUh2kjUY/YDWM5Q+UdXtOlsMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLAW11TQMPOsxVrmWlW/razPRVJT/XzIxRENzZzEZi08nlNqc5BwR6QDve3cyQc8s
	 FKNe8qqR4s+fiCl3NZXfLPzVi7l4MNelmQRHbhhTEpf5QcvuTulzbKf7OvxGdz205J
	 v2PsYjA4wnU3vYXWzxywydeL+qHIs+Lge3CnzdY0uAO3LmPUZ9ZCUXstGxN6HesHUd
	 bxsYA6/2a3UtLWf1yp5g2p505N8B52jtZZHq8tTjOMwbub/+8KFA0lMEayGH6qeOCu
	 hgG1wfvrI5kWtMX6y5G4S/EjW7KYmzlJ5XjKQeCnhGi9/yEWVM2HNzWnDGocHmTayR
	 kP5EKJb/2YxeQ==
Date: Fri, 13 Mar 2026 17:25:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitsd@google.com, gregkh@linuxfoundation.org,
	kyletso@google.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: add pd-disable dependency
Message-ID: <20260313-cradling-rocker-7ea6db821916@spud>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
 <20260312-facial-backshift-7e810ca5f996@spud>
 <eew6denbcj2orizphwwl34qhbwfnumas44vx3f5t722csugmp2@zbsmhpcqazao>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6USddsxsDHkuXizf"
Content-Disposition: inline
In-Reply-To: <eew6denbcj2orizphwwl34qhbwfnumas44vx3f5t722csugmp2@zbsmhpcqazao>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_102604_767397_338DC107 
X-CRM114-Status: GOOD (  15.54  )
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


--6USddsxsDHkuXizf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:58:18AM +0800, Xu Yang wrote:
> On Thu, Mar 12, 2026 at 05:47:32PM +0000, Conor Dooley wrote:
> > On Thu, Mar 12, 2026 at 03:16:08PM +0800, Xu Yang wrote:
> > > When Power Delivery is not supported, the source is unable to obtain =
the
> > > current capability from the Source PDO. As a result, typec-power-opmo=
de
> > > needs to be added to advertise such capability.
> >=20
> > What's the impact on any users of making this a dependency?
> > I assume nothing negative, since this will only impact systems that
> > don't work properly at present?
>=20
> Yes, right. Most of the user satisfy this requirement,
> expect imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso.
> I suppose this user can't work well, so patch#2 is added.

Okay.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6USddsxsDHkuXizf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRIpgAKCRB4tDGHoIJi
0hTeAP0V1CWIyzl7ZQX9Pnvcy+h+Cv/hX+KNv50caRHWkfZH8wEA+tCGP/dGbZRT
gRj/q/9O7SsxXuj0iSXiNORmQNAeOgY=
=jVap
-----END PGP SIGNATURE-----

--6USddsxsDHkuXizf--

