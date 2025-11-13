Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB3DCD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pux3hN3Gl7vLivHnYvNqjnFb+a2LWEYfciZAIz5y2kE=; b=fvEfTJ4jridBDUFK+6Ohx+NImJ
	hg0Lcky3zfgyIY7F0y7OnjrCpI1WDLqrBhJ9DCIxrN70ztcbZBLsEwMtfEKR1yi9fTjarGvkeBnKG
	Uwx1NTtZqTow4xxEoHzd85RLbmvyBQa5OZpF9cK4HhNYYPJsxbDXaqd4LhkeAQOUjW/SI1tKpN3dX
	LGKM0yd5246sT3Z7teR1hu4cObCsz78hpoQMbeGsGMoFEkUaZPAhNVSL9NBKuhjFxyBYrIzV3UypY
	AC8qu6jBIsBeEFPc1r5WqOAXrKv5fDevsIlVDA7OTgWHAMiw5D8sYtJkdzttTaRH8cMoZEz17BYk0
	aU770xuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV1b-0000000ALRb-2aMG;
	Thu, 13 Nov 2025 10:57:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV1X-0000000ALQ8-3f5b;
	Thu, 13 Nov 2025 10:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pux3hN3Gl7vLivHnYvNqjnFb+a2LWEYfciZAIz5y2kE=; b=lyrDlTBuN+tIi0mnoEc2sf0Xt6
	ZIhkEwsTYMAQldfj4iH1fc6gdZnCGaiUBtaeeUHiGTNPy1SZoJxU49Lu0CnWYwJ+/8uUOCW6MKd73
	BMEiaolNJwlmOc0NqDW1YJzF5oHFyNEpByt0cv5PrETzMpovJz2swK8gWPzR7lpo4fVm/lFujLkQ3
	CGcTQKPPgFW4rvE0wQDZGxXdDN0ZrRiUgHHWUWfKxiJALhk0ZuL0/jknMlymDtDVtd/NC9BA7eowp
	sCDLmaXd258ETRBpoqZ4XQMTuoTGU+z8m8UTo9UDpeF0uIVlGS91nj7psUU87x1wDzuWOv2REyXHi
	FjyBJ37A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJU9o-0000000HZvz-29SI;
	Thu, 13 Nov 2025 10:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1AAB41992;
	Thu, 13 Nov 2025 10:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E90C19422;
	Thu, 13 Nov 2025 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763031465;
	bh=OMfFW1nnKw5k2mezbZUycTzr4g1sGGxhFbFHTc77Xdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyS+VXkBGeRBeL5aBOjs4Sn+VEaE8YGlvkKK2hPFzt7EwSjw7KcbtxQVJ3iXn4ybL
	 wz9BbOzaNDw12FDRBwsGzz3aEM2VaycoDGFswsIVB9Qxw/CRx6NroC8NhBlKnVebQ0
	 WeSpZqhOwDJarwAc+UEFyNGVkIck1h75Vue3D/qw8nWTBWcNoOtNzw40HLySVKuP86
	 +my6QnYEhxrsArnkQjOOWBJaZ90wuoIypbYpfTIH9o6K/b97vTX0ujhlZtF4HnT8uf
	 u5IXhpTj20X16k4aTVjRilFqJ6qpyh3LrRLH9AFpeK2EU0znmDMOWiph3Badx6zl+C
	 Kjphjdzx0Bkwg==
Date: Thu, 13 Nov 2025 11:57:42 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, jianhao.xu@seu.edu.cn,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com, nbd@nbd.name, ryder.lee@mediatek.com,
	sean.wang@mediatek.com, shayne.chen@mediatek.com
Subject: Re: [PATCH net] mt76: mt7615: Fix memory leak in
 mt7615_mcu_wtbl_sta_add()
Message-ID: <aRW5phMmzul8wTn-@lore-desk>
References: <aRWF9QJuwGaDlUvT@lore-desk>
 <20251113094135.348383-1-zilin@seu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="39OyxfwhcaPPfO4y"
Content-Disposition: inline
In-Reply-To: <20251113094135.348383-1-zilin@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_100225_014802_63A23857 
X-CRM114-Status: GOOD (  28.85  )
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


--39OyxfwhcaPPfO4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Nov 13, 2025 at 08:17:09AM +0100, Lorenzo Bianconi wrote:
> > [-- Attachment #1: Type: text/plain, Size: 1475 bytes --]
> >=20
> > > In mt7615_mcu_wtbl_sta_add(), an skb sskb is allocated. If the
> > > subsequent call to mt76_connac_mcu_alloc_wtbl_req() fails, the functi=
on
> > > returns an error without freeing sskb, leading to a memory leak.
> > >=20
> > > Fix this by calling dev_kfree_skb() on sskb in the error handling path
> > > to ensure it is properly released.
> > >=20
> > > Fixes: 99c457d902cf9 ("mt76: mt7615: move mt7615_mcu_set_bmc to mt761=
5_mcu_ops")
> > > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/driver=
s/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > index 4064e193d4de..08ee2e861c4e 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > @@ -874,8 +874,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, =
struct ieee80211_vif *vif,
> > >  	wtbl_hdr =3D mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
> > >  						  WTBL_RESET_AND_SET, NULL,
> > >  						  &wskb);
> > > -	if (IS_ERR(wtbl_hdr))
> > > +	if (IS_ERR(wtbl_hdr)) {
> > > +		dev_kfree_skb(sskb);
> >=20
> > Hi Zilin,
> >=20
> > I can't see how this is useful since if mt76_connac_mcu_alloc_wtbl_req =
returns
> > an error, wskb will not be allocated.
> >=20
> > Regards,
> > Lorenzo
>=20
> Hi Lorenzo,
>=20
> Thanks for your review.
>=20
> You are correct that 'wskb' is not allocated in this error path.=20
> However, my patch is intended to free 'sskb', which was allocated=20
> earlier in the function. Without this change, 'sskb' is leaked if
> mt76_connac_mcu_alloc_wtbl_req() fails.
>=20
> This approach is similar to the error handling logic later in the
> function, where a failure in sending one skb results in the other one
> being freed.
>=20
> Hope this clarifies.

yes, right. I misread the code. I agree with the fix.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> > >  		return PTR_ERR(wtbl_hdr);
> > > +	}
> > > =20
> > >  	if (enable) {
> > >  		mt76_connac_mcu_wtbl_generic_tlv(&dev->mt76, wskb, vif, sta,
> > > --=20
> > > 2.34.1
> > >=20
>=20
> Best Regards,
> Zilin Guan

--39OyxfwhcaPPfO4y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaRW5pgAKCRA6cBh0uS2t
rMwDAP47wALgPmIE6tUjCgJFQCsffcrKOTD677lZaRxgFK1KiQEAgtoWFZ4Rph8X
FRyBF15dTBXErLYgBnyapoMTJ/x/gQw=
=IWEV
-----END PGP SIGNATURE-----

--39OyxfwhcaPPfO4y--

