Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB0CA5FB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gLHs2t9q3rdfRccsJvd8/+ITtmTGzDrhLU/YD9VPFY=; b=lW1dlyqvHEgZHK4l2NCr97+5Me
	AkMowSPtHFv+R3buQCQE7DmS0Z75AEneC6hhgNfbqMfvF+fqSf7jV1RpfcqDIOtn1nT+FJ4+4k7RO
	SmA2kUKUM/Ot1OVsWXHTHH+g13HPQwN1JpZZl04LMMTo68nOSrrgvER6XWwLKuJsxCBuVwJl1L8BR
	zYFh5+c0E19pD2nS7INxH1NNmUvn4Ag76BgciwXfiswGHm3iv8a9xS1ArXVbJt7Vs4Woanjv8Xm6p
	rsZMIXb+4uRG9/BbKkkpW39+QQ5RDcTNbsL0qtIf0Zmdz3eZwqkEjBc3sEqLQzVnmE/XytZYGx5P6
	Xjohfq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFkB-00000004FZv-0Kev;
	Tue, 20 Jan 2026 17:42:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFk9-00000004FZj-2m2s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFF02600CB;
	Tue, 20 Jan 2026 17:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B337C16AAE;
	Tue, 20 Jan 2026 17:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930936;
	bh=meAvemZovZcmYZ+yrNIom6AqspQE+OsGeNd99DojcpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zh4bRul/KSBbvP6YPRQhiEGizzgIQH633prYhXN+vnF40G/S5IeovLHI4wDA40H09
	 Np+/OsVu57tOnLK6Ul24Uf/EzWuwUa6KxcYlnwplpQ9ujZru6w5pRR/Kmjvspv65do
	 B3EVm83mbcptf0KmNyZZOWnM+Hg8u5HIoV57ziBVUvBhe3maVdvSVk7JmUeCBUGHoz
	 urbXYB5/QxBYCoq7RJNX4D1nNHwv9A827koBZ0pbksEzRidOOKN/1sWdYXtxQCjGN8
	 3Ne0FZ3z7B75SLCTxiDykkxPLTXiSYG6ZRNNPuLHacwUS0zkeTZQg4fmJhZGpv8T5N
	 Mz7CYKtOndmsA==
Date: Tue, 20 Jan 2026 18:42:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Specify clocks
 property as mandatory
Message-ID: <hshg5k7t3sry3wzf6alfok5wodzrkjcec5z63pmlephs3yshdq@jshxaxn5po2b>
References: <20251228224907.1729627-1-vz@mleia.com>
 <20251228224907.1729627-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mduptxgnz2zv7264"
Content-Disposition: inline
In-Reply-To: <20251228224907.1729627-2-vz@mleia.com>
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


--mduptxgnz2zv7264
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Specify clocks
 property as mandatory
MIME-Version: 1.0

Hello,

On Mon, Dec 29, 2025 at 12:49:06AM +0200, Vladimir Zapolskiy wrote:
> Both described in the binding PWM controllers depend on supply clocks,
> thus it's necessary to specify 'clocks' property in the correspondent
> device tree nodes.
>=20
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

LGTM, I applied it with Rob's Ack to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

as 6.20-rc1 material.

Best regards
Uwe

--mduptxgnz2zv7264
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlvvnIACgkQj4D7WH0S
/k6oGQf/fLm9JvhCbgJIjQHpd/eY7kv8bDtODdscfIX9ICJh+dNX8S4QnKxW5CDQ
VRZu5h4ylnMEiIURtpWr3DdZcOmMPe2ItCwyvJep0pRc5IF0YL5szUguq/AT1uOm
txCLphKHOh1OATvDuVCjgJHBtCaOltPjJ/sCpZo1dvkMMti8ilKbTUaksq8ig/aa
mxOyOX56Q45kdVDXgMBeWPTi4fIBcmQAa/OPKOK+2IPkICNRtIc/gP3aYSPpjCLT
STHf6lzmOPn6zOXu8JrbeC53wef1qqP9Wr1d0T4cvYMdZ+LC0Y4dG3AW3Kc3Zv0r
7Yi9JDY9UtIZ1mkC4bpgtlIfGrJvzw==
=zDFJ
-----END PGP SIGNATURE-----

--mduptxgnz2zv7264--

