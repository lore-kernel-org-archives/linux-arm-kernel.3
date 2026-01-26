Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095EBD19519
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjv2Yw081h0FcjvO4Kz0wydsExKWm01KIMGvO/zJ5bs=; b=N4giazmKlzmKMlUUra9QRgGzwU
	5WAENp9JVuiDXg3s+z1mlpUNpHX1EIVfgEk4FQ1yZjYp5RG0BpPoHZggQopt5K7/UIlOL2DbCYPL6
	oSd7tbw+WXV+7X48vwTe06onHAhAHNH7zzTb0ruK8gcZT4N1Ksf/IwItzG3umZI0prp8mSPLpIPzj
	k4MQs2ZF978nDa177FFG40tKDDkQKFbJhsCR07WBNGlXO9GDJ0vHKLVJvhaPwpgqo4241m9bgMYUf
	Mo5cLs6GkeUOZhj0KfGsQUhyEMn+P/nQvmM4IDhO5Now3Lq9H52EYLtinyVk/Vt+wCX+NXGHxmliz
	PAREUWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTBh-0000000DCub-3mrD;
	Mon, 26 Jan 2026 20:27:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTBg-0000000DCuV-3tYg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49E9E60097;
	Mon, 26 Jan 2026 20:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67FDC116C6;
	Mon, 26 Jan 2026 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769459272;
	bh=Hjv2Yw081h0FcjvO4Kz0wydsExKWm01KIMGvO/zJ5bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mo1sJUtmjHplBsBqIDimM0EW/wY6WhOptg2ueMr+ntA9Q7hGkT5A1f+vnFrgI5XT6
	 wOkj+yInJBM0sQ7fJPRYRFyJR7yCmmqO8QEpaRu2WZiJQSI8q0oYTesOq8GyyxFDfi
	 TUB9ymWpvRDG14fkpUO3BpGJUddyOragqweVeheOUIPw32jf9jIAoc9UrFTzXkGO/2
	 pzXS76Djqqo97qz6Q88x98hRLomo96CbR8sfX3uyjiQ9E3ffC1d+je28/0gfNoFKlf
	 nghdJxzLb1qsIKZ5Z+c4+YcfjBaZH88/UiCIBsr2usH4exbiwVx95h32nDpJS2BnRN
	 T4PSLf81G6bAQ==
Date: Mon, 26 Jan 2026 20:27:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
Message-ID: <20260126-broadness-usual-bec523f5168d@spud>
References: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
 <20260125-asrock-paul-v1-1-956085a4bd06@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KuxEHiadtSP7EwGa"
Content-Disposition: inline
In-Reply-To: <20260125-asrock-paul-v1-1-956085a4bd06@gmail.com>
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


--KuxEHiadtSP7EwGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KuxEHiadtSP7EwGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfOQwAKCRB4tDGHoIJi
0s5JAPoDcAVSN9xAbbUSLCIDny7M/EexK6qJHdf3IOAmst9B/gD/dULizOHoJ6Xj
fCB5mk29go1dluF1geo6mBCrUvOZoQo=
=33yJ
-----END PGP SIGNATURE-----

--KuxEHiadtSP7EwGa--

