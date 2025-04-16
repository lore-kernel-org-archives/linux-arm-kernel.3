Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C3EC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFTttSMWEe6WUcCuhrBOaWXyAxacApFdRAg8nwq3Dm8=; b=uDEw+Z+mms4Qiw92YGFRkXGzez
	0VrvgN3tFHllCqIPcX31rKcDSn+onnzNmANPH1W/RO75HRAg4HQ3Y87zgo92GmS+21Ib+yu9Sypww
	DqdcCXUe0aRJQZkaVEx31RST4IdP/nxJPK24Y74wjfXaaMduPPUvIP1O4ELSlJsYNSCE0Dl+UEPb3
	LSlvv3kLSeeeima0Kb2Lh0QoeJxEgFbyVGJhbyeNQOzbFGUwdBDhJRMT9RkbKmHufs6+AQGhYGiFS
	ATQxl7Qyq6tlpXpRvZXwTnOnwHamm9pcmmfwvaq45ZrAFbzUqG3+J0D1TmyBUFRO84KaqSVdirCMO
	eevKs7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55mn-0000000AIBz-0vHn;
	Wed, 16 Apr 2025 16:38:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5574-0000000A9s8-3I89;
	Wed, 16 Apr 2025 15:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BF8FA4A37D;
	Wed, 16 Apr 2025 15:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C4EC4CEE2;
	Wed, 16 Apr 2025 15:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744818945;
	bh=dfwF5GJl4IxlOW7ntQ9dhIcO0/jyuEl/v2DpwfVSskk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLY5I+tuao6fwDQvZPHDtYmSj1Tb7PKWvE7Z2LXwMkKf6O7gC/Besn0YPcgLvkGar
	 h4+iNchY9Lsym8n9OSalRKeYeAoGNAKeDbAkaWXz+v3jA/CP5rOdXd9yyAo3rPbPwj
	 0MzL/ge6E8JFrxMlgVWRxYp5veFtCK/caNGSUnNFblZhNWW/yZuG8Z6UcZmCN0ehzC
	 uSE844QvUdP4HtWSS9KJV6ypGAHWubtp1NhTZWNIxecHwL1xtQZuzqSl8QrO0Rv6yD
	 Cgz+t1+3GtsOfXW8JhAT5XKC0nTUAFUyxhI+moBa8tL4V98sOIFwfMxJtufDq1PzeP
	 QfJWMt48C7jpg==
Date: Wed, 16 Apr 2025 17:55:42 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <Z__S_m9fBEKmoos1@lore-desk>
References: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
 <20250416154144.GT395307@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vm+HhZE4wwBkQ3HG"
Content-Disposition: inline
In-Reply-To: <20250416154144.GT395307@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_085546_963100_99554116 
X-CRM114-Status: GOOD (  28.21  )
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


--Vm+HhZE4wwBkQ3HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Apr 15, 2025 at 09:27:21AM +0200, Lorenzo Bianconi wrote:
> > The official Airoha EN7581 firmware requires adding max_packet filed in
> > ppe_mbox_data struct while the unofficial one used to develop the Airoha
> > EN7581 flowtable offload does not require this field. This patch fixes
> > just a theoretical bug since the Airoha EN7581 firmware is not posted to
> > linux-firware or other repositories (e.g. OpenWrt) yet.
> >=20
> > Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_npu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/eth=
ernet/airoha/airoha_npu.c
> > index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c=
3611b4a154d19bc2c 100644
> > --- a/drivers/net/ethernet/airoha/airoha_npu.c
> > +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> > @@ -104,6 +104,7 @@ struct ppe_mbox_data {
> >  			u8 xpon_hal_api;
> >  			u8 wan_xsi;
> >  			u8 ct_joyme4;
> > +			u8 max_packet;
> >  			int ppe_type;
> >  			int wan_mode;
> >  			int wan_sel;
>=20
> Hi Lorenzo,
>=20
> I'm a little confused by this.
>=20
> As I understand it ppe_mbox_data is sent as the data of a mailbox message
> send to the device.  But by adding the max_packet field the layout is
> changed. The size of the structure changes. And perhaps more importantly
> the offset of fields after max_packet, e.g.  wan_mode, change.
>=20
> Looking at how this is used, f.e. in the following code, I'm unclear on
> how this change is backwards compatible.

you are right Simon, this change is not backwards compatible but the fw is
not publicly available yet and the official fw version will use this new la=
yout
(the previous one was just a private version I used to develop the driver).
Can we use this simple approach or do you think we should differentiate the=
 two
firmware version in some way? (even if the previous one will never be used).

Regards,
Lorenzo

>=20
> static int airoha_npu_ppe_init(struct airoha_npu *npu)
> {
>         struct ppe_mbox_data ppe_data =3D {
>                 .func_type =3D NPU_OP_SET,
>                 .func_id =3D PPE_FUNC_SET_WAIT_HWNAT_INIT,
>                 .init_info =3D {
>                         .ppe_type =3D PPE_TYPE_L2B_IPV4_IPV6,
>                         .wan_mode =3D QDMA_WAN_ETHER,
>                 },
>         };
>=20
>         return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
>                                    sizeof(struct ppe_mbox_data));
> }

--Vm+HhZE4wwBkQ3HG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ//S/gAKCRA6cBh0uS2t
rGtIAP0a0nDJnt9xlhk00XoqLts5Lx7FkrJmgGFM4xHwaFzmfgD/Qj/RZUt8ixXy
r90iuK6aFvdqeduSdanLNu9LRkQC6go=
=dH3c
-----END PGP SIGNATURE-----

--Vm+HhZE4wwBkQ3HG--

