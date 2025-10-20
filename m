Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24930CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKso7ybb9iJDanB4qNQL4k5Ww5/ll0Fs6J9dM79RXaA=; b=gp7306D6PUJVW9KFAld67RlW9m
	rBdZ2UlOFgV/sTE0nLjvDnjHvWIveAl0QxhL1WBLqz+6LlVmP3TeHG0N+l1FCzzIO6evgFwhOAp+4
	TjcNFLbRi8DhIXO6oasE+OhmhX3064gl65tbFhZaHfCvs49iLUrd57PV9/sXJO3dU7f9yzhaj8XV9
	EI3kVgcVArm5ukQwipuwmQePfYGzwBcV1hZUpNhTsp7ylcAha5I//x2Jr5Y3fMYmR6zKcsxI6w8cC
	cVMKUTC7y5Ll6DV5+XYgKFi35iUhFQXT1LFqtT1ht/4QPCA01yFfnlXaETMcyCff499u37Rmncdwj
	D3kTk1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtkG-0000000EV3b-1rvL;
	Mon, 20 Oct 2025 17:32:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtkF-0000000EV3D-3BKt;
	Mon, 20 Oct 2025 17:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E2E6620D8;
	Mon, 20 Oct 2025 17:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAD4C4CEF9;
	Mon, 20 Oct 2025 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981550;
	bh=cKso7ybb9iJDanB4qNQL4k5Ww5/ll0Fs6J9dM79RXaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxNlxydD+pAipulVtdKT1k0HzWG2vQdHfDvfTnx0eEVuwCe9TM3CQtoWtN1QqOc0l
	 RI7NLPfQxkgkKfh9EPWTrBq+oWWzFXZzakp2ThpB5MlPb/zorCXg1zKTcGSKhk5cmI
	 a8jlbqQC5rgQmOQ3WyvMW+mElJHzqMEyWP7gZat8dP5U3nc73OBhtBlQ3mCAKLFd70
	 o010CW37VeeUXx5YIT+56I40L4dq+r9LqEGhBjpE2o/+/QO4FVc9cFB0mD4+hzWVRt
	 vO8TTHzf0JMdYIDxejH3QPDCVaYZTm+J0f6+x9lajVz9uGkuiHOuCcVyqiaL5jgRDm
	 s39Aswgovvb6A==
Date: Mon, 20 Oct 2025 18:32:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 01/13] dt-bindings: net: airoha: Add AN7583
 support
Message-ID: <20251020-vision-outspoken-7083858d278c@spud>
References: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
 <20251017-an7583-eth-support-v3-1-f28319666667@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikE/IhHK61RqCyon"
Content-Disposition: inline
In-Reply-To: <20251017-an7583-eth-support-v3-1-f28319666667@kernel.org>
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


--ikE/IhHK61RqCyon
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 11:06:10AM +0200, Lorenzo Bianconi wrote:
> Introduce AN7583 ethernet controller support to Airoha EN7581
> device-tree bindings. The main difference between EN7581 and AN7583 is
> the number of reset lines required by the controller (AN7583 does not
> require hsi-mac).
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--ikE/IhHK61RqCyon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZyKQAKCRB4tDGHoIJi
0tFvAP9DJl24eno8NxIX9XQVm4OUQPtBYct3ESOFm89Kv/5TiwEAm7Cnd2e3nASD
TVa9KnbLfOIk4PROrVEsjg2j99tMHw0=
=RGLT
-----END PGP SIGNATURE-----

--ikE/IhHK61RqCyon--

