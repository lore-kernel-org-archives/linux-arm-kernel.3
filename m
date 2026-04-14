Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F33ED7B8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnxSsdQSwxp8X97PpUGHLpgxiLqFzOUXvBqz3/GWOfI=; b=OMBSFW+IBraK/dnPG4lLkDHHmk
	B11v2hn709ib/5mEOCPxSNwLMp1z3w2ixdT/Z+4GUUaYwcAqO5Z8RJqyxnpjEeNHehQY/TuFaf4QQ
	xlq3um82xapbo4FVWWPQfEDIP+sOv5nYSSep1mRt4GEM7/c8AUqiutd2Vm8ovlr1D5iMvpZTHcZ0L
	/XlXbqVxvudaTB3MoTGb0o06uWS2zj/kN1uGIfH3R79IaqQvyhqCNx2W0JqUbdr0bwuYSBU+5yWwF
	5zpuraIbAYtrxmoW7SROxkg8wxkoQwyAClXuNjJaLhLSvHCZVZ4qdC4qRu3dwAZwOmKsfKkMnc27k
	rg+jmgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZaX-0000000H1R6-2iyD;
	Tue, 14 Apr 2026 08:57:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZaW-0000000H1Qn-1OPm;
	Tue, 14 Apr 2026 08:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65B3A60018;
	Tue, 14 Apr 2026 08:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFF1C19425;
	Tue, 14 Apr 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776157059;
	bh=lUWPEDw2DjZ1dgMC7s3MwDU2q8Tz/2D26MRcskvU9JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOVJBdYSJAB4kqVME5GuYkdjjQ8r+wmfye6NPtk12e8D+nABK/hxsEt4h51jSEcxa
	 4/+v4ur5cxjQdwXZW9J26Q2lfg77+dChh3lixbrU0nKj3EstT/v8xUFo7hUezBBcZ8
	 9pUuzL2Ov/xkbuwONlXp42lJcAgUG1XYPquH78mBWAR5ujg4/WK5y2VbkMFsC0L+Ms
	 nhFAMVJoChi8GbN7MfWehrngrSujPnz8e/5t8Qt4NLrki2wax/GijSEzDZhP2Kn99C
	 wS7DAT0lnYKVKAL5OB+oKAghDnW7q5NSCSp/5SF/2cBVEBWMc/uYfyUtKQfgjZOEMg
	 i1rZOhnl20SFQ==
Date: Tue, 14 Apr 2026 10:57:36 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com, kuba@kernel.org, davem@davemloft.net,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next] net: airoha: Wait for TX to complete in
 airoha_dev_stop()
Message-ID: <ad4BgCGNYjYACUdv@lore-desk>
References: <20260411-airoha-fix-ndo_stop-v1-1-caddaa181739@kernel.org>
 <20260414082949.104611-1-pabeni@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eigqXCj77aqg9JTa"
Content-Disposition: inline
In-Reply-To: <20260414082949.104611-1-pabeni@redhat.com>
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


--eigqXCj77aqg9JTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>=20
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> net: airoha: Wait for TX to complete in airoha_dev_stop()
>=20
> Wait for TX to complete in airoha_dev_stop routine before stopping the
> TX DMA and run airoha_qdma_cleanup_tx_queue routine. Moreover,
> start/stop TX/RX NAPIs in ndo_open()/ndo_stop() callbacks in order to be
> sure the TX NAPIs have completed before stopping the TX DMA engine in
> airoha_dev_stop routine.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 8e4b043af4bc..9e40c8f375c1 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>=20
> [ ... ]
>=20
> > @@ -1684,18 +1686,26 @@ static int airoha_dev_stop(struct net_device *d=
ev)
> >  	struct airoha_qdma *qdma =3D port->qdma;
> >  	int i, err;
> >
> > -	netif_tx_disable(dev);
> >  	err =3D airoha_set_vip_for_gdm_port(port, false);
> >  	if (err)
> >  		return err;
> >
> > -	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++)
> > -		netdev_tx_reset_subqueue(dev, i);
> > -
> >  	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> >  				    FE_PSE_PORT_DROP);
> >
> > +	netif_tx_disable(dev);
> >  	if (atomic_dec_and_test(&qdma->users)) {
> > +		u32 val;
> > +
> > +		/* Wait for TX to complete */
> > +		err =3D read_poll_timeout(airoha_qdma_rr, val,
> > +					!(val & GLOBAL_CFG_TX_DMA_BUSY_MASK),
> > +					USEC_PER_MSEC, 100 * USEC_PER_MSEC,
> > +					false, qdma, REG_QDMA_GLOBAL_CFG);
> > +		if (err)
> > +			return err;
> >                   ^^^^^^^^^^
>=20
> Can this leave the device in an inconsistent state? When read_poll_timeou=
t()
> fails (TX DMA busy for more than 100ms), airoha_dev_stop() returns an err=
or
> immediately. However, atomic_dec_and_test(&qdma->users) has already
> decremented qdma->users to 0, but airoha_qdma_stop_napi() was never calle=
d,
> so all NAPIs remain enabled.
>=20
> The networking core (__dev_close_many in net/core/dev.c) ignores the
> ndo_stop return value and marks the device as down regardless. When the
> device is later brought up again, airoha_dev_open() sees atomic_fetch_inc=
()
> return 0 (old value) and calls airoha_qdma_start_napi() -> napi_enable(),
> which hits BUG_ON(!test_bit(NAPI_STATE_SCHED, &val)) in napi_enable_locke=
d()
> because the NAPI was never disabled.
>=20
> The early return also skips the netdev_tx_reset_subqueue() calls at the e=
nd
> of the function.
>=20
> Should the code either continue with cleanup on timeout (don't return), or
> ensure NAPI and DMA state are properly cleaned up before returning?

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> > +
> > +		airoha_qdma_stop_napi(qdma);
> >  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> >  				  GLOBAL_CFG_TX_DMA_EN_MASK |
> >  				  GLOBAL_CFG_RX_DMA_EN_MASK);
>=20
> [ ... ]
>=20

--eigqXCj77aqg9JTa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad4BgAAKCRA6cBh0uS2t
rNmgAP9RniNbQ5atnC99/hDeG+1/vN79rvITBQQqpU0PDLwR5AEA5/vQe6+SQyC8
86Sc7ARxKYPKvkm2qY8grGKYTvVMAgY=
=qwvR
-----END PGP SIGNATURE-----

--eigqXCj77aqg9JTa--

