Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A422C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXnJEBFauyOMGfgxN8v3OYcby//GyPWCHAaTkDu0O3I=; b=hMtUqM7h6YTpnK6wRoCv9/RIzL
	t8gYwAuRjWoQGiFsKO5NGskllYPgr8/AykEnu1k68dFIyKNrAxjYCaSDZGKRIbR89RUgw05JbJVAP
	j7ZhnR8igEGGZLSbq8brA8JlkB3MlVcRBBViNjm8z6zjBlrfCOWWhYJOYtsokh0NsQEXZoymatBND
	Z0BdpkGsH6n0I2sV0bmDao4KljgLRvnyLyKj3trfj5d3lRhM/9ESOQynuycYTVzIkdBBI3bNPj34U
	EuWSdjZEnCrN8gYRdT0KzJgZpnDD8nYJ+TcOOzQIDDNhcAOQqBcFfFaNtUP3CA45Gk62co/qzOGmf
	aNDQCBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5Xn-000000013QV-1yAE;
	Thu, 22 May 2025 13:01:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5Vl-000000013Fy-3DXz;
	Thu, 22 May 2025 12:59:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF4B95C5695;
	Thu, 22 May 2025 12:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D97AC4CEE4;
	Thu, 22 May 2025 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747918739;
	bh=3UeWmO3Gu+/pCAZWrTHZMaFP839whgkO8tDT3XL2f0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3WZbfg42LGn7LjzdmUKp/O381+ow2RN1NgoAenJaRX+s0j67E+rCov2ZUwZrc8bV
	 FUwaEJE6LekczyCPmSUNRZPtedptklNeDBf2xe768yHmrb4DsXMPlO94NBTZm1EOz+
	 bksO+H2+5b2jjc/UqSe1fVnyKjyU78w64hRzU8r3G4jT513/LchNSRn6Ntl6h/tHGF
	 qTU9mE4fIzIkyNU5UlJzX6I171HnGQ2ej5glou5NKZ2pWm+VjH8FGimvxZm0WPQ8oc
	 Eq/ndajpwac91Fbf6pVp1AZ3ZWPOqy04QKEuzrcHZuC7RkdI41k85eyObfg8vxWoCC
	 4Y+NFQc8hudhg==
Date: Thu, 22 May 2025 14:58:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: airoha: Add the capability to
 allocate hfwd descriptors in SRAM
Message-ID: <aC8fkFUEmBgyT3-W@lore-desk>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
 <20250521-airopha-desc-sram-v3-4-a6e9b085b4f0@kernel.org>
 <20250522123913.GY365796@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iprZUwWZ4qRrgVsy"
Content-Disposition: inline
In-Reply-To: <20250522123913.GY365796@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_055901_893937_2BEF88BA 
X-CRM114-Status: GOOD (  26.97  )
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


--iprZUwWZ4qRrgVsy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, May 21, 2025 at 09:16:39AM +0200, Lorenzo Bianconi wrote:
> > In order to improve packet processing and packet forwarding
> > performances, EN7581 SoC supports consuming SRAM instead of DRAM for
> > hw forwarding descriptors queue.
> > For downlink hw accelerated traffic request to consume SRAM memory
> > for hw forwarding descriptors queue.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 11 +----------
> >  drivers/net/ethernet/airoha/airoha_eth.h |  9 +++++++++
> >  drivers/net/ethernet/airoha/airoha_ppe.c |  6 ++++++
> >  3 files changed, 16 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 20e590d76735e72a1a538a42d2a1f49b882deccc..3cd56de716a5269b1530cff=
6d0ca3414d92ecb69 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -71,15 +71,6 @@ static void airoha_qdma_irq_disable(struct airoha_ir=
q_bank *irq_bank,
> >  	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
> >  }
> > =20
> > -static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
> > -{
> > -	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
> > -	 * GDM{2,3,4} can be used as wan port connected to an external
> > -	 * phy module.
> > -	 */
> > -	return port->id =3D=3D 1;
> > -}
> > -
> >  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 =
*addr)
> >  {
> >  	struct airoha_eth *eth =3D port->qdma->eth;
> > @@ -1128,7 +1119,7 @@ static int airoha_qdma_init_hfwd_queues(struct ai=
roha_qdma *qdma)
> >  			LMGR_INIT_START | LMGR_SRAM_MODE_MASK |
> >  			HW_FWD_DESC_NUM_MASK,
> >  			FIELD_PREP(HW_FWD_DESC_NUM_MASK, HW_DSCP_NUM) |
> > -			LMGR_INIT_START);
> > +			LMGR_INIT_START | LMGR_SRAM_MODE_MASK);
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> I'm wondering if setting the LMGR_SRAM_MODE_MASK bit (maybe a different
> name for the #define would be nice) is dependent on the SRAM region

I did this way because LMGR_SRAM_MODE_MASK is just a bit. Do you prefer
to do something like:

FIELD_PREP(LMGR_SRAM_MODE_MASK, 1)?

> being described in DT, as per code added above this line to this
> function by the previous patch in this series.

Are you referring to qdma0_buf/qdma1_buf memory regions?
https://patchwork.kernel.org/project/netdevbpf/patch/20250521-airopha-desc-=
sram-v3-1-a6e9b085b4f0@kernel.org/

If so, they are DRAM memory-regions and not SRAM ones. They are used for
hw forwarding buffers queue. SRAM is used for hw forwarding descriptor queu=
e.

Regards,
Lorenzo

>=20
> > =20
> >  	return read_poll_timeout(airoha_qdma_rr, status,
> >  				 !(status & LMGR_INIT_START), USEC_PER_MSEC,
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/eth=
ernet/airoha/airoha_eth.h
> > index 3e03ae9a5d0d21c0d8d717f2a282ff06ef3b9fbf..b815697302bfdf2a6d115a9=
bbbbadc05462dbadb 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -597,6 +597,15 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32=
 mask, u32 val);
> >  #define airoha_qdma_clear(qdma, offset, val)			\
> >  	airoha_rmw((qdma)->regs, (offset), (val), 0)
> > =20
> > +static inline bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
> > +{
> > +	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
> > +	 * GDM{2,3,4} can be used as wan port connected to an external
> > +	 * phy module.
> > +	 */
> > +	return port->id =3D=3D 1;
> > +}
> > +
> >  bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
> >  			      struct airoha_gdm_port *port);
> > =20
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/eth=
ernet/airoha/airoha_ppe.c
> > index 2d273937f19cf304ab4b821241fdc3ea93604f0e..12d32c92717a6b4ba74728e=
c02bb2e166d4d9407 100644
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > @@ -251,6 +251,12 @@ static int airoha_ppe_foe_entry_prepare(struct air=
oha_eth *eth,
> >  		else
> >  			pse_port =3D 2; /* uplink relies on GDM2 loopback */
> >  		val |=3D FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port);
> > +
> > +		/* For downlink traffic consume SRAM memory for hw forwarding
> > +		 * descriptors queue.
> > +		 */
> > +		if (airhoa_is_lan_gdm_port(port))
> > +			val |=3D AIROHA_FOE_IB2_FAST_PATH;
> >  	}
> > =20
> >  	if (is_multicast_ether_addr(data->eth.h_dest))
> >=20
> > --=20
> > 2.49.0
> >=20
> >=20

--iprZUwWZ4qRrgVsy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaC8fkAAKCRA6cBh0uS2t
rMc/APsHFb0yGNDadbOPVqtqRVgDOqcuY/8cBBvHNN4yk6Ee2wD9F3b4lIMI3avz
UzFWnDg6PR+xt1ROJTD3LIJwNDjk2gg=
=Vggv
-----END PGP SIGNATURE-----

--iprZUwWZ4qRrgVsy--

