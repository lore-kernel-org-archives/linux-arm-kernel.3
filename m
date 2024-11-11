Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D8D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiKvwrtTrJ0YB7W0NmjeDDdzE5hHsJ4Nb2c3nZtzNvM=; b=wlLthGTPjyKElTNke9PF/vDu1B
	JuhxelZzlzEoIIz3+zc60ZZE2dk8Sy4WWH2fan4MEeW/iEVsk3U8mq4QOY4AWbB6iESrd4FI98cND
	6SUjxg6kTJHSNGrZwRtSie0voLHpBslPOXBCjXsW71CgqJp/9zQKew7n6QYNRrV6FunjcNcpInohc
	Fc7lIonPa4lseZ6I183K7qjr1hIojkSFdzr5d59rYlMfsOrq+8ErbBKW8gRi9y/jfbTwoZZEtiYnR
	hNiFZtTXPdsTsAy3LMTRZOwY6QLVqrQN4mpvvOcvYbsvC+mDMiXKmhTugXoNpxmMe3vqIvCHDJzWJ
	LXNASZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaqW-00000001A3X-2uqg;
	Mon, 11 Nov 2024 20:17:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaok-000000019sz-1Qhx;
	Mon, 11 Nov 2024 20:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D47FFA40858;
	Mon, 11 Nov 2024 20:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CCEC4CECF;
	Mon, 11 Nov 2024 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731356120;
	bh=aiKvwrtTrJ0YB7W0NmjeDDdzE5hHsJ4Nb2c3nZtzNvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHsVV3WUFY+iOv+WkGKICY4Buc1z2XqejSWteivdHFUqqBIb2oinJ2ZSdqk4hLFkU
	 bjDSN/I4PUJxOV9l8zu/80aQjSiteWXgAbidWelBQi51MK/N/WmAawppevIc/rwl5y
	 ZlxwhdGlAAEJ2bSJv844gELPmeeoamTBTUhloEGOicvlYuyvKdpOzXE6/521zAg3BF
	 g07+oc90LFPlEVh1wpn+Uojs3rpyxdJLPMv2vJKuEbSjKRrSSCXAK7rOOJlkHqqt6o
	 1SHWPq+RBK+3WhPgyc+Y1izwmzEn7G95XJ5psiGAiYdiGiQMz2lGdZstYTRCXDUv+h
	 HDV/IvchZfU9A==
Date: Mon, 11 Nov 2024 20:15:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3 v3] dt-bindings: arm: rockchip: Add Xunlong Orange Pi
 5 Max
Message-ID: <20241111-status-reaffirm-c00e7a6f7240@spud>
References: <20241111045408.1922-1-honyuenkwun@gmail.com>
 <20241111045408.1922-5-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yHonPgt7DdqftVb"
Content-Disposition: inline
In-Reply-To: <20241111045408.1922-5-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_121522_465474_7F40D203 
X-CRM114-Status: UNSURE (   9.14  )
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


--3yHonPgt7DdqftVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 10:53:25PM -0600, Jimmy Hon wrote:
> Add devicetree binding for the Xunlong Orange Pi 5 Max board.
>=20
> The Orange Pi 5 Max is a single board computer powered by the Rockchip
> RK3588 similar to the Orange Pi 5 Plus.
>=20
> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3yHonPgt7DdqftVb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJl1AAKCRB4tDGHoIJi
0uw8AP458XwimgHVrn7gO//5n/RSwrWa9lCbkyXLZJP7JBZVjAEAkaa6Pi3KkTzd
NMsKQECdrz06LBCT0NasZp/yGotx5AQ=
=dHrm
-----END PGP SIGNATURE-----

--3yHonPgt7DdqftVb--

