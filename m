Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F942CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhxNwBLURE+vww7KiNLQnWr2U3x4Oum0L5j9e8N0Yrg=; b=1ZlbyEkFdhf5untkpTJ+mZKpKu
	ymeSBX0GMqIvwUTEWunLKhfVIFrQ0/BZH4NyrELyLmXPtGrO9ruc2htaSTzt8rylh3a03Dn19ugOe
	z8pGqB6OdYTJCWc2GeIbN4AfkksTCjq0pRDkRcx7Z10s+QdwkbRVmSd8af2NG6jY4lwcXkSpuL/qm
	zbFjIYITYWIXacbH4ZC8K5HKTX1NFxRhB8Lss7UquvRq+NjVNcs8YymifXKbzJt2otquxCZLzjLXq
	iDXDYQi3OBniDrmbSw2lRFcdYiTeBxACaA6FX8ZCGXb87mIYTShYZVhnRZsCKaY4lnPgFiEfPJ23G
	rBnuKVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrr8-0000000BPZw-0yHh;
	Tue, 12 Aug 2025 16:28:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloc6-0000000ArFH-0NzC;
	Tue, 12 Aug 2025 13:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QhxNwBLURE+vww7KiNLQnWr2U3x4Oum0L5j9e8N0Yrg=; b=gXY7PRWesbGfpUh6lPA4yEThGx
	vm4QBz+kPLAd/eyTzr7A8bs+u4c/JLJH8X0m9XkMSabpHDqifFshzFQljHZlHU/6bMUMV5QqcxUex
	A554SOjYYBSF0RdacbxgWy5EjCOE82hEdjB8lxRCGtvAc5N3drdZwgTraE/OOV6Nk/zuVWK3JlgGb
	Q6R3EjcoiErETgp+COvqjvgwvqzGmCjfW3VFp3yMPEH1pLj/QeBT3SozV4a0H/+eTrVH8JEQjA0GK
	o33eHH/6yaCYqmXmtdkJM66ooJjCeZHv2qUAlaSR+pAKXB3v+dbjWf+uIcUubOnBOwMTPzyLkEQyw
	5hh6xPrw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloc2-0000000FoMS-0WLg;
	Tue, 12 Aug 2025 13:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755003619;
	bh=BPZhi1cYHWPs10d8aw+eUuAT4jQOgOOanuDWooHD66M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oSvgX2of80L02E0fcdOtjkRdCDV4W2cJtF0VNyeDf7vjjydxLjB5DamTHdsrGAIT2
	 cy6fVuTM6Rh5ao6b3R8HQKvqZAT4t71qjg7sk4xB76Z0Wr5AvXbuutFT4TMO93mva1
	 nW+tgKKfU/5EVJobEPLS18jDbotTUzhEtTOimDI/3bfffrRUVZO72qClzwOZwHSqTf
	 yQ1AbYoT7OQHWwYpHOkh1gEP2Z/CCiSUbjvHfLyyRmrDPzVN6P1OJxrIzYWCOBIdxq
	 isrZ5ygEstVzItRUu8B4KssVP8vJtRjHTLv/1lz5Rqrr/1gFRv6C7AUkOIDG2topIQ
	 hv3ctCcBhWyog==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19A3217E04C0;
	Tue, 12 Aug 2025 15:00:18 +0200 (CEST)
Message-ID: <f2908b2d35671e70e6a8b295de623e3a3ffe2212.camel@collabora.com>
Subject: Re: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on
 RK3328
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Alex Bee
 <knaerzche@gmail.com>, Sebastian Fricke	 <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 09:00:15 -0400
In-Reply-To: <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-6-jonas@kwiboo.se>
	 <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
	 <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-JAuicq2EIvWHvsvtmtAs"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_140022_330969_DCE7CF8C 
X-CRM114-Status: GOOD (  33.42  )
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


--=-JAuicq2EIvWHvsvtmtAs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 ao=C3=BBt 2025 =C3=A0 01:08 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> Missed some comments in my last mail.
>=20
> On 8/11/2025 11:25 PM, Nicolas Dufresne wrote:
> > Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=
=A9crit=C2=A0:
> > > From: Alex Bee <knaerzche@gmail.com>
> > >=20
> > > The RK3328 VDEC has a HW quirk that require QoS to be disabled when H=
EVC
> > > or VP9 is decoded, otherwise the decoded picture may become corrupted=
.
> > >=20
> > > Add a RK3328 variant with a quirk flag to disable QoS when before
> > > decoding is started.
> > >=20
> > > Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > ---
> > > Changes in v2:
> > > - No change
> > > ---
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |=C2=A0 9 =
+++++++++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |=C2=A0 2 =
++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c=C2=A0 | 10 =
++++++++++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 12 ++++++++++++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> > > =C2=A05 files changed, 37 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > index 1994ea24f0be..f8bb8c4264f7 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ct=
x)
> > > =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> > > =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> > > =C2=A0
> > > +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
> > > +		u32 reg;
> > > +
> > > +		reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> > > +		reg |=3D 0xFFFF;
> > > +		reg &=3D ~BIT(12);
> >=20
> > I wonder if there is a better way to express that, if not, a comment fo=
r
> > future
> > readers would be nice. If read it will, we keep the upper 16bit, and
> > replaced
> > the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not sp=
end
> > time
> > thinking if I walk by this code again.
>=20
> Vendor kernel use following comment to describe the purpose of this [1]:
>=20
> =C2=A0 HW defeat workaround: VP9 and H.265 power save optimization cause
> =C2=A0 decoding corruption, disable optimization here.
>=20
> From the TRM we can see following for rkvdec_swreg99_qos_ctrl:
>=20
> =C2=A0 27:26 sw_axi_wr_hurry_level
> =C2=A0=C2=A0=C2=A0 00: hurry off=20
> =C2=A0=C2=A0=C2=A0 01~11: hurry level=20
> =C2=A0 25:24 sw_axi_rd_hurry_level
> =C2=A0=C2=A0=C2=A0 00: hurry off=20
> =C2=A0=C2=A0=C2=A0 01~11: hurry level=20
> =C2=A0 23:16 sw_bus2mc_buffer_qos_level
> =C2=A0=C2=A0=C2=A0 range is: 0~255
> =C2=A0=C2=A0=C2=A0 the value is means that left space <=3D
> =C2=A0=C2=A0=C2=A0 sw_bus2mc_buffer_qos_level, it will give hurry
> =C2=A0 15:0 swreg_block_gating_e
>=20
> So yes this set swreg_block_gating_e to 0xEFFF. Possible this configure
> hw to not auto gate most internal clocks?
>=20
> Could add a comment and possible use something like following:
>=20
> =C2=A0 reg &=3D GENMASK(31, 16);
> =C2=A0 reg |=3D 0xEFFF;

Thanks for the information, I think this form is somewhat nicer indeed, and=
 a
little comment, its fine to say that the QOS bits are undocumented.

Nicolas

>=20
> [1]
> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drive=
rs/video/rockchip/mpp/mpp_rkvdec.c#L857-L867
>=20
> >=20
> > > +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> > > +	}
> > > +
> > > =C2=A0	/* Start decoding! */
> > > =C2=A0	reg =3D (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
> > > =C2=A0		0 : RKVDEC_WR_DDR_ALIGN_EN;
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > index 540c8bdf24e4..c627b6b6f53a 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > @@ -219,6 +219,8 @@
> > > =C2=A0#define RKVDEC_REG_H264_ERR_E				0x134
> > > =C2=A0#define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) &
> > > 0x3fffffff)
> > > =C2=A0
> > > +#define RKVDEC_REG_QOS_CTRL				0x18C
> > > +
> > > =C2=A0#define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
> > > =C2=A0#define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
> > > =C2=A0
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > index 0e7e16f20eeb..cadb9d592308 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx=
)
> > > =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> > > =C2=A0
> > > =C2=A0	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> > > +
> > > +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
> > > +		u32 reg;
> > > +
> > > +		reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> > > +		reg |=3D 0xFFFF;
> > > +		reg &=3D ~BIT(12);
> > > +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> >=20
> > Can we deduplicate that ?
>=20
> Guess so, any suggestion on how to best do that?
>=20
> One possible way that comes to mind:
>=20
> =C2=A0 if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS)
> 	rkvdec_quirk_disable_qos(rkvdec);
>=20
> >=20
> > > +	}
> > > +
> > > =C2=A0	/* Start decoding! */
> > > =C2=A0	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_TIMEOUT_E | RKVDEC=
_BUF_EMPTY_E,
>=20
> [snip]

--=-JAuicq2EIvWHvsvtmtAs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJs63wAKCRBxUwItrAao
HAUsAKC1sBxNA1+yEIFCnD/e1Ljvs4W7zQCgkzXoEfYGmIbzQwoE/GL67jAV2K8=
=/EUA
-----END PGP SIGNATURE-----

--=-JAuicq2EIvWHvsvtmtAs--

