Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9046FE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvxoChevFDcpPFuBoB9RlJpW10YfXE7rNoibpEC76z8=; b=yomILjeqA5p4qVlq+ukql3JOv1
	jGngyUCZBL1v6sj/y47F4Dle4wASy4YMqKChQBwdgthB2Hi4Aq2G0qlDYDDlEXoCyBrcD5iVKPSyU
	3lvGkiPgQUfB+KwIUq4N5kCeMQhqRFbO7wPN+O1ZoslwIZk6bMYDCyQGOXMqOebmWWTr+mRBsHqNQ
	eyTvIFc4Qf88JtThNUK5u1pWIddcDKRE63G6uDYl+rGKgv4BGnkV+KYb1/zQeNsBKdb0wPiYs0Mz8
	MPmTrQYdYLD2+bwFh9zQ9xF84Nfkq5NGdAifUeIsVNaGdy9BJrBTX4ngDwVyjDrb2IkHs2gY304HN
	17+bhaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFZ6-0000000Gvpz-3X6D;
	Thu, 05 Dec 2024 17:23:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFQm-0000000Gtjy-3fs6;
	Thu, 05 Dec 2024 17:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B6A15C6720;
	Thu,  5 Dec 2024 17:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F28C4CED1;
	Thu,  5 Dec 2024 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733418864;
	bh=DvxoChevFDcpPFuBoB9RlJpW10YfXE7rNoibpEC76z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqCZMf1UjcdONKdFB1EAa5RuQouG9awwXivJhG7HsQs0m+9HR13r+kx3TcsG6LlSe
	 vm7PBCKCjamVbe4PxqVt3Sru9UR+MOT+nA4IcTXI0s44I9o6rozBMzrF8KNpV710IL
	 C38+hAiXd/R/C+8tKk74s38O0Bp114wBUa3J3Iy6mospoSH1PlBJUN2tMm0rGlxEso
	 Hfdo/Bh88K3z4QS75TwvGtf52C5Y+Mn5D5J8DP8oJ3f1Py8VmjSLYypt/Imf+qrSOx
	 oAlPLU6lBP700E3BzNBETYo1HosJ19hLcwkQYQ0NlmkWcyJYY4E0S/dbcCWl/K/6Cl
	 Cu058GEnHvENg==
Date: Thu, 5 Dec 2024 17:14:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>, Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Tim Lunn <tim@feathertop.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: arm: rockchip: Sort for rk3568 evb
Message-ID: <20241205-twisted-vintage-c4db864b6049@spud>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
 <20241205103623.878181-5-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rzNymi1S7MvzfVbm"
Content-Disposition: inline
In-Reply-To: <20241205103623.878181-5-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091424_959523_80DD27CE 
X-CRM114-Status: UNSURE (   8.01  )
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


--rzNymi1S7MvzfVbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 06:36:21PM +0800, Kever Yang wrote:
> The info for rk3568 should before rk3588.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rzNymi1S7MvzfVbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HfagAKCRB4tDGHoIJi
0h/3AQDatnQCPpZyqr5jco6CiQ99+WPzSf3clYyZmVhCPAUq9QD/Y8+mQW7x17Dz
8urifTAfl+oyCfmNeD47h/oLvA5tggk=
=LEIv
-----END PGP SIGNATURE-----

--rzNymi1S7MvzfVbm--

