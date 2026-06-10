Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26295CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn6N6xN8kwOSamzqhUSen4F7Pt/+IGDXXkpj3JNNU7s=; b=DLAp/FkNf/pJdKyUUcULasD9d/
	J4PnZTQTcup8zEx2P12IQrMuXGH2jZgsIaSC5JEKNDbIBrf4EEVGmjnUOKjWI5mTEBNCGRewW7hmD
	BHoblk3pH2jLR11md2OvGJ9/LAxs3IsHeEBz5Mm44mcN9J7PTY1QaOR/yP0uWC6GQjXGrLBpM98qu
	xOHozkIvu0xJIa2rqazpd6jhDoT+1TCFjTHVXDGr1QbgXwwSiDFg6Z20WncCSxaZ2z0nWGwERXRnk
	Q5sEm6tcWGeNWTFLXYLNsGdwCRd64LOw7O2TbDEXul5DhUZPLnnV4xBsk4rLpfHvU2viBPGHZUgB0
	eoUfrilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM1v-000000088nJ-1ioA;
	Wed, 10 Jun 2026 16:43:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM1u-000000088n9-0YYy;
	Wed, 10 Jun 2026 16:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78B93601E2;
	Wed, 10 Jun 2026 16:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965951F00898;
	Wed, 10 Jun 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109829;
	bh=tn6N6xN8kwOSamzqhUSen4F7Pt/+IGDXXkpj3JNNU7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ik0bcyBpjYO9UzSh7tDhhz4MK2FKmlJvsXOXxfJ9mCV9xnAcknSErdeQdKAHew7Ch
	 1cg7/1miK0DzFW3JttxeQJKAZAki8ekzy9bhksLH0UCFMMA9MaN2Rv+bFV3EPbWIdD
	 Hf1RNCYD2pTzM1MfK02oY/78sFKH7MknvgvdOwvaZaACjHuyizUfCKP44I40++rXFc
	 0/TdfLujYjdoOtct8dALQyFp79bJ0TWikrjfSpvdUiVRpSrY1ffI70+5YS19VgrlJA
	 evA781Wu4q1VeG5D6bF8pST3Ci8KLXsZmel9SBYQXIS8f5sXhlItq6HGJVJg1NUuJq
	 PwwaH8CVB4bWA==
Date: Wed, 10 Jun 2026 17:43:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add HINLINK H28K
Message-ID: <20260610-rectal-subtype-77250f6bc6ff@spud>
References: <20260610100006.366963-1-amadeus@jmu.edu.cn>
 <20260610100006.366963-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R5PhvYFlf8xOfZ6z"
Content-Disposition: inline
In-Reply-To: <20260610100006.366963-2-amadeus@jmu.edu.cn>
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


--R5PhvYFlf8xOfZ6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--R5PhvYFlf8xOfZ6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimUQAAKCRB4tDGHoIJi
0gyrAQCcJYH3VNNAIDsVLNfzgLdpTHWpQjB7Lf9MyhpkDl2BwAD/TTnRs1Pj9qhH
ThozJYZ5aQXDt/FQIikiHL0DbSk//gk=
=i2Si
-----END PGP SIGNATURE-----

--R5PhvYFlf8xOfZ6z--

