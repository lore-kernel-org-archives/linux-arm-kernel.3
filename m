Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90224C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTUrSXfg09Nwvn6NfV7VP8ZhiyGW1oZOs57vjOlXqgQ=; b=oaP7VNx8EwNGQD3PaC4uERzGmJ
	WJUN/604pZl86sFBmf/YDHswrNS12U4E5lECOdfkl6TxgYhrAkJI2PyBFRKaRSeIK1eDHw6aQS1JP
	bX0ybyYvr8Kuh/NUZT65BELUTdI5teAK0QOyINitF1SgMpZ7dTgEVkswBEDT7QVXr8r/5hCemUO3e
	4SZ/GkrP2yERYSAjXChqveRXvkP7hsF/7aEAhXyD8eHtS5Na24u+lrjnqg0n3siZ0C/iU8zBX/6p3
	tSzlPygmZsX3YKc2ACJtQD9uz4aIipqYgal8e7hcEyGU83AFhTPIQv2/1t4QrQrIw2uTa63BU8hdQ
	QOlt8KzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgMY-00000003PAa-1aTL;
	Mon, 10 Mar 2025 16:52:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trg8D-00000003MbC-2Yd0;
	Mon, 10 Mar 2025 16:37:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20610A4602F;
	Mon, 10 Mar 2025 16:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EABC4CEE5;
	Mon, 10 Mar 2025 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741624652;
	bh=gTUrSXfg09Nwvn6NfV7VP8ZhiyGW1oZOs57vjOlXqgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isA2ib1aReU7/YMLC0A167HcEx4jP7QsuD8D2y4izHGn50rEOQFBDYZNSziKJjKDZ
	 /26GW9HwoehSWRa/6d33Fc8cngSprjxJxZrA4n6n9VOGCNjECpuQeOWVmZzxfmrtV4
	 qMFiHx1AT0EshM/qKjtN6lsVdN53CY57v2/L0Ztjzd9a1rTe/Vx0dnIrv3uMNSmh9K
	 hK5KecIm4Hmn+gZtOpdzc39eW5FKGo2b5TMc0yAV29emysm2hYQzguxuUdlnbwcRD/
	 zUEbNjzMydSPWccmYsjJZXLSxQ+eiHRvav47olH7OLoyaaJDl5ORxzODTZZZHyJuKl
	 HRNcOENPZvRWA==
Date: Mon, 10 Mar 2025 16:37:25 +0000
From: Conor Dooley <conor@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samin Guo <samin.guo@starfivetech.com>
Subject: Re: [PATCH net-next 4/7] riscv: dts: starfive: remove
 "snps,en-tx-lpi-clockgating" property
Message-ID: <20250310-climatic-monorail-f06784705219@spud>
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
 <E1trIAF-005ntc-S5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CZyrpZ2HiVDm2QKt"
Content-Disposition: inline
In-Reply-To: <E1trIAF-005ntc-S5@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_093733_708990_1CC38FD6 
X-CRM114-Status: GOOD (  11.69  )
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


--CZyrpZ2HiVDm2QKt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 09, 2025 at 03:02:03PM +0000, Russell King (Oracle) wrote:
> Whether the MII transmit clock can be stopped is primarily a property
> of the PHY (there is a capability bit that should be checked first.)
> Whether the MAC is capable of stopping the transmit clock is a separate
> issue, but this is already handled by the core DesignWare MAC code.
>=20
> As commit "net: stmmac: starfive: use PHY capability for TX clock stop"
> adds the flag to use the PHY capability, remove the DT property that is
> now unecessary.
>=20
> Cc: Samin Guo <samin.guo@starfivetech.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--CZyrpZ2HiVDm2QKt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ88VRAAKCRB4tDGHoIJi
0igTAQCFZVYFhHAngmyoswJyr+9kBc4WZx2CvPHD4XUtMbBjEQEA6wyvNZXw1B0U
/+2ky25MqZJCRKv33flXhTeDh7fNYw4=
=M1xu
-----END PGP SIGNATURE-----

--CZyrpZ2HiVDm2QKt--

