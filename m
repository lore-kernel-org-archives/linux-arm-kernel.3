Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC532CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXWeJp8S/bE9DbKcDmsGycphOVF0L6UeyUVsirjFKfU=; b=Ubw61cZds2fXHh2ldtQHgp2S05
	nBNRqgYwrsaFqOxCzce1Zl2qiatwgVf0QIhDHs9vCWXRT3rJnmYhkcEYcidabFj2RPSw9GFgW3ecH
	KknysLGviepaVfMk44dPKUtr/KiCzRnV3x4RBVOaRQYMKYBI++1iRh+B6HH3nvx01HpBke3K9yNoE
	oIdQu5xaETqLTZntx/+wmSllxem6sThbSZR4hCppI7LAso1phrRrr5HQrO6wywu6bE/tfBOZoQeeN
	VnKuQGJK9r3Nj00BkZhLDZm2VeTIHMyulfxpi0t7csP9nzoOTA1FHVte2WgPmLe5HVN1DoVKc/ICU
	IkdHQL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWiV-00000002aQe-11U3;
	Wed, 22 Oct 2025 11:09:19 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWiR-00000002aOj-2KUU;
	Wed, 22 Oct 2025 11:09:17 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id BCE621C007C; Wed, 22 Oct 2025 13:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761131348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXWeJp8S/bE9DbKcDmsGycphOVF0L6UeyUVsirjFKfU=;
	b=bXI0pm5ffnL3+AJ1YDq6ByzhIzqDhW05PuGzaAdxOQGYl+Lm+AlDz3MdQi/I/eW7Tv6XzO
	RmC0EpXSaaCAwgwuNslZNdcqcGmnFxrXxXBX2D1AuAZ3qr75U/Xh8jhnIalx/tD8KlfQqj
	qS6ZLSXwMO9JYhBYy6XoND/5z/tWybw=
Date: Wed, 22 Oct 2025 13:09:08 +0200
From: Pavel Machek <pavel@ucw.cz>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>,
	Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: [PATCH v4 0/4] Upstreaming Pinephone Pro Patches
Message-ID: <aPi7VAZEDnbqdvG4@duo.ucw.cz>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="akbWoOZumakbWuit"
Content-Disposition: inline
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_040916_043941_34B4DB95 
X-CRM114-Status: UNSURE (   8.14  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--akbWoOZumakbWuit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Throughout the years, many have contributed to the Pinephone Pro (ppp)
> development. Unfortunately, these patches are scattered around various
> repositories in different states.

Thanks for doing this.

You may want to cc phone-devel mailing list.

BR,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--akbWoOZumakbWuit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPi7VAAKCRAw5/Bqldv6
8tMBAKCVnJToNB6sKoye/rzIFyxpfw4XXwCgkvYgDCeaz2VqXgPd7DgxxwCy93A=
=MQHp
-----END PGP SIGNATURE-----

--akbWoOZumakbWuit--

