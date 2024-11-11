Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7427CD3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03zyUPxMborpGlQtL1eawvT1ZJZeuenQ9E9nO9+dfCM=; b=edU3FwODRUO9HieY124QMmp6vH
	z4SoObLauyaQsII6bFJqYGRS9HdAK8vMMVRisoEIM8bbCyMt3+7mtjGfpb7Fx6ItFxDqFCFDg9M6w
	LTxKy/oTex7BGCEsHF8XMtLghX5d5V703ykuXvL+PfVEF+fz3gRUkDDJ3zuc+16rz4J4h7GugOKvV
	2Wm8zSh0endeMPNUlR2GclpGwmb9i2x+aTvwQCTTiIO09GivS0X5uVeiqHMgPIW08IwP73scMfNEP
	hKIv8WaWnVbp5/kJUx9ZGK6I5i6f2NZClWKNvFeOZ/adYaLyaEDXdQB8y0uUJ2ngkA+yexns/e93B
	822iPGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbUe-00000001HFN-1l9B;
	Mon, 11 Nov 2024 20:58:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbCA-00000001Dna-1fs7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D7865C45E6;
	Mon, 11 Nov 2024 20:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966D6C4CECF;
	Mon, 11 Nov 2024 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357573;
	bh=03zyUPxMborpGlQtL1eawvT1ZJZeuenQ9E9nO9+dfCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gwvs+SPUcRquo+j/QMt3OMFSurofedHdAK0AA5ZW6nl+e7hh+4G+30fsGSPLKO0rG
	 OugN2iJdtC3Mp5DHlDawherM/1uZqMtqSfNz4WWkGC4zCg+VUwB92N3WgWAW8VQr0Z
	 57KEuagul09XSkBQNovwe2rNt6RlrFOTS7PDF0L6eLgItWYx3xq+CHDJfNCXs+AcrA
	 6v7dGDqaamzhRbTyKGVjD+rWHeqalGhHTgL5Ze8V5vQvBjNoWehrk1LiTuzTfgfXYe
	 zDmHm/NYFIxXSZXDCIz+szHTePaBMj1VmyjXGjVj8on3JHo0VMcmn2XdXuoZV14IG6
	 5VtxCVcM+ePNA==
Date: Mon, 11 Nov 2024 20:39:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/14] dt-bindings: vendor-prefixes: Add YuzukiHD name
Message-ID: <20241111-mystified-salami-5ce813076da0@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-13-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8AhoWu5KXTV+96/t"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-13-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123934_506820_C472FE75 
X-CRM114-Status: UNSURE (   8.92  )
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


--8AhoWu5KXTV+96/t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:31AM +0000, Andre Przywara wrote:
> YuzukiHD provides Open Source Hardware designs, and also offers
> ready-made builds of them: https://github.com/YuzukiHD
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8AhoWu5KXTV+96/t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJrgQAKCRB4tDGHoIJi
0oj2AQCQatM9URF8kIUa0t5BcOVADZNN0C9gGdPZkAar7KpvtgEA7nNIlUfxXv6n
uITe2G0vFrjDoeDAx1H7kp43kxvBqwM=
=zFr0
-----END PGP SIGNATURE-----

--8AhoWu5KXTV+96/t--

