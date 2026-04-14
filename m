Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36031F9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XVkGTDzW4/sLTyq2ds3zFoOfu2PSlh7GL0qmxrBxE0=; b=RLsUkVXHBXAHcv+9xEg3915CBj
	ns/EySMJKWXBClaRB8pCSlCvkozskyJlSHKts+sHj85Wr0jRSWxvKF9T8mS7nONV1xbduBrroosyB
	nv4G18IBQbE/g+2T5tR+0kyHDxC8MFStHQJir6DPG/SV6qXasHHtQiUF7OYnS8ePS30JUme2s29bI
	xoblg8Semq9GxwlfMBVgIKizjmF97jqNAw6BVy0iRlbrxI/p3TZG3EHQXIWFqhgzkztweWF910cY7
	Tbdqfc0tfo0EkuMNlgpGLK3eUbAot5K1QXq1/+GfaA7NDN8UXr9YCNYYadVsIDN8bNIwxXzUUXdMs
	BBcw51KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdbg-0000000HMAd-04rc;
	Tue, 14 Apr 2026 13:15:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdbd-0000000HM8G-1TpA;
	Tue, 14 Apr 2026 13:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38EBF438C6;
	Tue, 14 Apr 2026 13:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE2CC19425;
	Tue, 14 Apr 2026 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776172504;
	bh=wEv5mqvmrSOGSAYKMInPhiGsKDkCJqa9FtAb0FRnrAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R363Qf9vqymirGwgv+28hUY+lIpw1XfX7/+X8NapLj91KX6VFRlnSChUhkW9hf6Ni
	 MgOY8g1U3o2JTWjuVvvso4iobwr1xBF44PSAKodTwTSO31TrbH4G+Y9XWccc/vxBhD
	 nLc97t9hQrdRf2IOLOtRAlgYXfPAX7Rmit/EVDwpXkeS93hb0r2HlFsgyr4zCi/7d9
	 1jAWQpXyMuULNW7FZAR8u1Gg+VaiWJBH8hYJwLOg85vqfEZopbK5y+8F5G8lLRljo0
	 BXUjjJKtBKYIvHRnrHhX1CmFHveGov7AkrtIDhsQnZqpw6vyetHYsXqe0co5UCb7/e
	 PM/7L5AI+V5fg==
Date: Tue, 14 Apr 2026 15:15:01 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Wait for NPU PPE configuration to
 complete in airoha_ppe_offload_setup()
Message-ID: <ad491UEDZFUoxpoF@lore-desk>
References: <20260412-airoha-wait-for-npu-config-offload-setup-v1-1-f4e0aa2a5d85@kernel.org>
 <20260414124641.754059-1-horms@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+y3x5upWOivh3efE"
Content-Disposition: inline
In-Reply-To: <20260414124641.754059-1-horms@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_061505_433469_D22A6006 
X-CRM114-Status: GOOD (  23.64  )
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


--+y3x5upWOivh3efE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: 'Simon Horman' <horms@kernel.org>
>=20
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev
> ---
>     net: airoha: Wait for NPU PPE configuration to complete in airoha_ppe=
_offload_setup()
>=20
> This commit adds a poll loop in airoha_ppe_offload_setup() to wait for th=
e NPU
> PPE configuration to complete before running airoha_ppe_hw_init().
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/eth=
ernet/airoha/airoha_ppe.c
> > index c2c32b6833df9..52199f6b39f9b 100644
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> [ ... ]
> > @@ -1340,6 +1341,13 @@ static int airoha_ppe_offload_setup(struct airoh=
a_eth *eth)
> >  	if (err)
> >  		goto error_npu_put;
> > =20
> > +	/* Wait for NPU PPE configuration to complete */
> > +	err =3D read_poll_timeout(airoha_fe_rr, val, val, USEC_PER_MSEC,
> > +				100 * USEC_PER_MSEC, false, eth,
> > +				REG_PPE_PPE_FLOW_CFG(0));
>=20
> If the SoC has multiple PPE instances, is it sufficient to only wait for
> REG_PPE_PPE_FLOW_CFG(0)?
>=20
> Later in airoha_ppe_hw_init(), the code iterates up to eth->soc->num_ppe,
> initializing all available instances:
>=20
> drivers/net/ethernet/airoha/airoha_ppe.c:airoha_ppe_hw_init() {
>     ...
> 	for (i =3D 0; i < eth->soc->num_ppe; i++) {
> 		...
> 		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
> 			     ppe->foe_dma + sram_tb_size);
>     ...
> }

ack, let me look into it, I will post a v2.

>=20
> If we only poll PPE 0, could the driver race with the NPU firmware's
> initialization of subsequent PPEs?
>=20
> Additionally, does this poll condition properly ensure the hardware is re=
ady?
> Since the break condition is simply `val`, it exits immediately if the re=
gister
> contains any non-zero value.
>=20
> If the register retains a non-zero value from a previous session (like ac=
ross
> driver reloads), or if an unclocked domain returns 0xFFFFFFFF, this poll =
might
> succeed immediately and bypass the wait.
>=20
> Could we clear the register before polling, or wait for a specific bit in=
stead?

I guess check val !=3D 0 is enough since we reset the FE block and defualt
register value is 0 for both REG_PPE_PPE_FLOW_CFG(0) and
REG_PPE_PPE_FLOW_CFG(1).

Regards,
Lorenzo

>=20
> > +	if (err)
> > +		goto error_npu_put;
> > +
> >  	ppe_num_stats_entries =3D airoha_ppe_get_total_num_stats_entries(ppe);

--+y3x5upWOivh3efE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad491QAKCRA6cBh0uS2t
rHlaAP4rfMeHRF6mcqYQkq2q6DoKFIguOTwyIQc/8amuWQy1qwEAkQYNgGlR1Tiy
Sp8gdjxgWaIvIlF8f9kYq/GTEaZjxQc=
=Ngyp
-----END PGP SIGNATURE-----

--+y3x5upWOivh3efE--

