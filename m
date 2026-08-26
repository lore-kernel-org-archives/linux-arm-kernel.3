Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023D9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JTQubBjvQfLu6jkJMJBI2lduoGr/GayHRTWlLhxVaQ=; b=I6BgK2exBT5kKz7j/D8088vfed
	IeVu8upveWgoJ8svZAN7uyG8l0K6ozo6xhWElKvOzPMrFwErWESeoltZKleRN4/IwtY+8v+Gh1a31
	mA2AlnYSOUiD7/KbsQC3rtN5vzJTCcknLNMMfJw7cwNeYgsrjaB97D1wFctfXtV31o1TPay+0zkZJ
	RhERW2bHqFgJU5XDTNU8XoyEcFgtppiv3chYKgVljNB41iUDcNBW8+xeUTCaVqfomprr/LhRN744K
	vPAkuw832HosYceNiROkGucxJ3w9WqzwfqkcVQWylYZ0ogUS9bJQxegFebdQCWxouM4GRhMvFKZSu
	/oamFunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG5i-00000002hxX-3yil;
	Wed, 26 Aug 2026 16:03:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG5h-00000002hwx-1sVu;
	Wed, 26 Aug 2026 16:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 772DE601E9;
	Wed, 26 Aug 2026 16:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EE81F000E9;
	Wed, 26 Aug 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787760184;
	bh=2JTQubBjvQfLu6jkJMJBI2lduoGr/GayHRTWlLhxVaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NiAhv3bqjbXVOACOHQ2GRxZQVGdO2Kaq0mkqd+GX5TXXCKw65bwY+LARjFOqA4ZpI
	 whoAr0go84Q8Q28bPs+kXWsGGRsjyvBx8bJlJmRlClz8Nz95nhi5DHTX+jmZSETcpY
	 I4S9ew4NeQgrVyy7z2mOSWOa9YsVoAWRL+O64GSQreXZFPOX+AnBOvzot4mhG8cZW6
	 bC91wUd9qT3QWi/StjnCok/s1ib6ZxsEI28QQ/DE1zSOpvpAkvDo5zK0rF9qmH8lr7
	 3hs74MgrSqpZAaA/yMfSGtYSU+RBtTqkIAN/LpuYODVhjhEon1QmJQKxYYv2ufaNsW
	 VYo4fFRq97vrg==
Date: Wed, 26 Aug 2026 17:02:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
Message-ID: <20260826-paralysis-apply-9808186a040a@spud>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
 <20260826-csi-2-rcv-dts-v1-1-bcd8d459684d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NQRpl0hx+glIk1I"
Content-Disposition: inline
In-Reply-To: <20260826-csi-2-rcv-dts-v1-1-bcd8d459684d@gmail.com>
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

--8NQRpl0hx+glIk1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8NQRpl0hx+glIk1I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8OMwAKCRB4tDGHoIJi
0qNVAQDws1oI74jTU6Lwdx4+GNMVbkYljAFVJrjengf0e7VoJAD+MR0x/6CRirei
QI1zIbqyBSCy8XYBjzxH/1LZtqqW6ws=
=tOwn
-----END PGP SIGNATURE-----

--8NQRpl0hx+glIk1I--

