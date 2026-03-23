Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A078BF4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv7ISimnhseEM70YcQxBz1x71zZDUe8CYuIh4tJLlnI=; b=tv6+zlCdq9bvkAfmnw9JID6waD
	cghGkmqhw8uB67BS8FjqCuom+GvOU3JZBypzxNexs0hRV3NeoBpBDRsQgKb+WNqLIDvm0WleAqqSh
	HVK/gsD0h6tcaTom7rx6zmCl8GT/hcFssfJb510/Oo+Qee+PPKI+CY0hTJ/NMmiPosKal3spVS5rN
	a+yu0DwtSLveuGjtGLwq5FDD3nqvCLnnhTAAibdier2XHszRNmH38dLSu9ecgn7aVSgLkfSvM6KeF
	tef+eCVlEaVKfRAG3Cc9IBE++bV/qWh7FYQUP0xle3heBsduFC9olgs/HXfR4+27IY5mSSRSKSgog
	h569DAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n9V-000000002Mz-48ie;
	Mon, 23 Mar 2026 21:49:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n9T-000000002MX-2vXs;
	Mon, 23 Mar 2026 21:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06FEF44186;
	Mon, 23 Mar 2026 21:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E23DC4CEF7;
	Mon, 23 Mar 2026 21:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774302574;
	bh=e2ZhSCx0wJsAx1emJeyO4FU08Tb6VMlBPPL5XXi0V+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXR3s6Iie7Hp0vfWKYIxZqEwcifDLvFfeZtG7iRbEA0DhAy6OrFcIRNASgmDu1wES
	 zn4IB9ubKrtOy0wXus4wPsc0eBevTbJva1lSU9ESfklLjSd5pBNB1nV24Q36di4wYW
	 0lXP0/FiXiQNTgJjuefwj+TrVnsIet/iqOzKs3Iq+mE+Od+sUt35pv7eHj4n55e+gz
	 13fLIGiGQyk69OH0znKnUMNM0rDD9dbru0bdVoDvY3E2gfDe4vCze6n6yxC9kUGOMb
	 kSLEBVcMkyjMZKjC+Q98InaQDpdQcVNO4WZCXfb7pbVZYBqGq7rQw4g31sEWJnyczt
	 1LJaq/W2VhUWw==
Date: Mon, 23 Mar 2026 21:49:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 15/17] spi: uniphier: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <2f623083-5846-48d4-8c36-e55d663047c0@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <bcfc4a5191976b2ada9cd4094b61ac67a0ea9da7.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y/Y2tr05pHZcxD/m"
Content-Disposition: inline
In-Reply-To: <bcfc4a5191976b2ada9cd4094b61ac67a0ea9da7.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: Advancement in position.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_144936_279825_DC92BFE8 
X-CRM114-Status: UNSURE (   9.34  )
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


--Y/Y2tr05pHZcxD/m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:04:11AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.

This breaks an allmodconfig build:

/build/stage/linux/drivers/spi/spi-uniphier.c: In function =E2=80=98uniphie=
r_spi_remove=E2=80=99
:
/build/stage/linux/drivers/spi/spi-uniphier.c:773:35: error: unused variabl=
e =E2=80=98pr
iv=E2=80=99 [-Werror=3Dunused-variable]
  773 |         struct uniphier_spi_priv *priv =3D spi_controller_get_devda=
ta(host
);
      |                                   ^~~~

--Y/Y2tr05pHZcxD/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBtWkACgkQJNaLcl1U
h9BGOQf+P4qqM5W2u6LtXeZ+RqwAf5bIlruWN7Zu6y+s0RsmbnL8SLo7ezN1P5XA
CaagW1s3A1znQ+f+UOmPpt7CUIM1lfu4JMWMQEq/cZthfywlxT0GzJCFxfwmIfXc
CIg28KtEajxKDNgRhc5AUvY+uPwX0bN3q2rUJ/kMcSeopHH61rIVinefkvqchzj3
FcC4NVtnG1cKpbV/hwswiKs7/f4NPM3PJs/PUgGtrqtvcaylsOcjEkL/tUQN5bHY
TupvhVwEX8LSCuTL2A0ihBwbZj1FWzwTqmb2nkc+zwDd0wOWosktdz/D4qYx04Ox
knJf2rx/baCD+1NxJPUJXi0GgY9dkg==
=IvRp
-----END PGP SIGNATURE-----

--Y/Y2tr05pHZcxD/m--

