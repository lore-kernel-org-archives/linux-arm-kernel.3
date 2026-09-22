Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6643C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fi3feLtPVMOYDU5sUdusGNlECI2wB3sb2uL66NcRc9k=; b=rqhHZFGf90EJHdIiE1ujMCiDV4
	IkAevGIkR3H/6A5qUfOI/mA+AbonWNGUy7BT6DDXLTw6Pn6o+FBd1ZukAvFoWWAocQLRf+BfDJ+QX
	KHtJPUkV4QPG6xxl0vUw++TC0Vcj5oYUzzIJxJglOHXihi8PBx0LnwtMfIuPJK8qhcKKVIP8rIdK7
	E81xUaKmaDM2mP6/w6pD9MGe9ia1joPg0WlT9YA6Y4v6ib2Zq6roxgn12IevlG3HUOIbSVpvaThdc
	2OKL9fjscYPL2u7IbO8eVtQOdKmK89Mu9mPao7eVomP4K8vsFePwYok4+Wvb2gA+KPQBaK2afbGwl
	FhMIxNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w5Y-00000004iJL-2BFu;
	Tue, 22 Sep 2026 08:42:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w5W-00000004iJ6-3R4t;
	Tue, 22 Sep 2026 08:42:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E11D460200;
	Tue, 22 Sep 2026 08:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C911F000FF;
	Tue, 22 Sep 2026 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066573;
	bh=fi3feLtPVMOYDU5sUdusGNlECI2wB3sb2uL66NcRc9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BaEsM3dWk6wO/Saa4fIrO+Mh3NPfkoe9ZQcZyG/yXkQGiFFm5tTlbD32I7tzqlbg/
	 vx2k3Qn1Y6m896KGpgneohI2pxEl7Z0VFM3SUgQbsZ1rY4K6WjWQRgoe6/WZo7R17h
	 1NXYCUYOU2ubx20DuHLzFF8tcUZmmPgcbRDVrhNC5SndIekDeCDRw9CHN/AixWf8ER
	 tV80o5arod7lIY6Exk2YSycqkx0xHHFXWta/Ks1pUavYnqisrJIZmVSMrCNJtwGIkI
	 I8yhuEFrDftHcM8ggvz8sj1yTL+qkmywXYgiFFTBHMzHwNYwxp+KpM1sJp4TtKp8rO
	 /1Up6/elBhjjQ==
Date: Tue, 22 Sep 2026 10:42:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH net] net: airoha: npu: cancel wdt_work after releasing
 the WDT IRQ
Message-ID: <arI_i_JpOBsXM3ln@lore-desk>
References: <20260922000914.542068-1-mhun512@gmail.com>
 <arI5OD8X2Eoz_Ojd@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ROMP+kOHbe7PUdpe"
Content-Disposition: inline
In-Reply-To: <arI5OD8X2Eoz_Ojd@lore-desk>
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

--ROMP+kOHbe7PUdpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > airoha_npu_remove() calls cancel_work_sync() on each core's wdt_work,
> > but the watchdog IRQ that queues it is requested with devm_request_irq()
> > and is freed only after .remove() returns.  airoha_npu_wdt_handler() can
> > therefore schedule_work() again once the cancel has returned.  struct
> > airoha_npu, which contains the work, is devm_kzalloc()'d and is freed in
> > that same unwind, so the late work dereferences freed memory.
> >=20
> > Register the work with devm_work_autocancel() before devm_request_irq()
> > and drop .remove().  Devres runs in reverse order, so the IRQ is freed
> > before cancel_work_sync(), including when probe fails.  A cancel left in
> > .remove() cannot get that order.  Initializing the work first also stops
> > a pending watchdog interrupt from queuing an uninitialized work item.
> > Probe currently calls INIT_WORK() only after devm_request_irq().
> >=20
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> >=20
> > Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> > Cc: stable@vger.kernel.org # 6.15+
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>=20
> I guess this is net-next material, it is just an optimization, not a real=
 fix.
> Anyway:

Sorry I misread the commit message, this is actually for net, thx for fixin=
g it.

Regards,
Lorenzo

>=20
> Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> > ---
> >  drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/eth=
ernet/airoha/airoha_npu.c
> > index 5bb4817a898d..4d3195eb00f7 100644
> > --- a/drivers/net/ethernet/airoha/airoha_npu.c
> > +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> > @@ -5,6 +5,7 @@
> >   */
> > =20
> >  #include <linux/devcoredump.h>
> > +#include <linux/devm-helpers.h>
> >  #include <linux/firmware.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/of_net.h>
> > @@ -751,12 +752,15 @@ static int airoha_npu_probe(struct platform_devic=
e *pdev)
> >  		if (irq < 0)
> >  			return irq;
> > =20
> > +		err =3D devm_work_autocancel(dev, &core->wdt_work,
> > +					   airoha_npu_wdt_work);
> > +		if (err)
> > +			return err;
> > +
> >  		err =3D devm_request_irq(dev, irq, airoha_npu_wdt_handler,
> >  				       IRQF_SHARED, "airoha-npu-wdt", core);
> >  		if (err)
> >  			return err;
> > -
> > -		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
> >  	}
> > =20
> >  	/* wlan IRQ lines */
> > @@ -803,18 +807,8 @@ static int airoha_npu_probe(struct platform_device=
 *pdev)
> >  	return 0;
> >  }
> > =20
> > -static void airoha_npu_remove(struct platform_device *pdev)
> > -{
> > -	struct airoha_npu *npu =3D platform_get_drvdata(pdev);
> > -	int i;
> > -
> > -	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++)
> > -		cancel_work_sync(&npu->cores[i].wdt_work);
> > -}
> > -
> >  static struct platform_driver airoha_npu_driver =3D {
> >  	.probe =3D airoha_npu_probe,
> > -	.remove =3D airoha_npu_remove,
> >  	.driver =3D {
> >  		.name =3D "airoha-npu",
> >  		.of_match_table =3D of_airoha_npu_match,
> >=20
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> > --=20
> > 2.53.0
> >=20



--ROMP+kOHbe7PUdpe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarI/iwAKCRA6cBh0uS2t
rCBBAQDy2x6M/fi6duRrhEFZhDWaiM2e2dJo7Uiggfh389sWAQD/RM73V4pw21iD
BWMNWNTf6UaF0dWbwvNONop0kmUkHQI=
=o0gu
-----END PGP SIGNATURE-----

--ROMP+kOHbe7PUdpe--

