Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B4ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbxGqq6JaFT/Nkk+dr+a6MvdLzycJysZKuCblzsAY+E=; b=bjmRun0YuDRhw4AqsqNBFZBGwR
	4/xo1z8pzBNP1HHP5LTjcMVdbep2PE1QVH61O9AWhGkOoZWtqwFT8ozPDpZZDVAMZSA5hC232dVON
	ZQGooU6rZHKZ29GIONGMVCpSpRWgUdCnF0Wn9t4b08FZIyTWS3bnziXAP55gc0dsjHTHNgZUtgRux
	NXmx+xmVzuRxKBfCq7w3jY0sktT/xmcOtFAcpHdhnUxBwJSDO/7PJxy34N50URzSbFDHd0bCSBc0D
	c5gAuiVNTKoDQa5tzIiwnNm4RCKkCEEwlHhi/h47Zcm8Aw1XFKynGZhMlsEMrGcaf/HDik1RXn9wZ
	+IGO8kJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgk-0000000BxG9-2Pr8;
	Tue, 12 Aug 2025 20:33:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulthv-0000000Bhz1-2OC3;
	Tue, 12 Aug 2025 18:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755023204;
	bh=69/IXjK3yV6/KOHFU1P3cPM9KgocQb+6h8pn3YliXQg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=c6eBDRSGAzq1MJtGpLaDtmEdS4kvrirKcJrrDOzzCPK4q+aJLTKgy8KMbqNO8Fffw
	 0Bd80jew4vb/AOLCWZt3JjE0whNfBJFjnRPSEJZqWbz7Mr9q2mkoc2484kfYYeVBo+
	 dnoGEHcIncM4IPzHv6gzKJuJ95Oe+HsFeh5+M5oHM5Kzn2xjXqsONUL1QxnjwLtWOP
	 3ZzOkljxXqjr7Ufw/BSRTnvrSX7eainxdUioGObpcLfzmqc/LxYiu7dBiD5DJnj5BA
	 1yC/zRsDvSPtwCRWtRRDvBV3L2v59T2Bba5ZenhVIi0UNagmWNq3RVjVcw25WYpKp0
	 frHK2da8L1aGQ==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D2C717E011A;
	Tue, 12 Aug 2025 20:26:43 +0200 (CEST)
Message-ID: <25ce30446e8e8d038273fcdfb398c90995c242db.camel@collabora.com>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 14:26:41 -0400
In-Reply-To: <efdf8c99-d166-4b78-afc5-d4a6eb5ac046@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
	 <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
	 <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
	 <a66feb89fa02f05b187e5603ffc3b1501ef3cbd5.camel@collabora.com>
	 <efdf8c99-d166-4b78-afc5-d4a6eb5ac046@kwiboo.se>
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
 +E7ItOqZEHAs+xabBgknYZIFPW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGlxdW
 UpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMCBBU
 CCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZMZm9
 gRfEou1FvinuZxwf/ms=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-1m44GyIlgc9M/VdWhbhx"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_112647_764053_79697477 
X-CRM114-Status: GOOD (  19.65  )
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


--=-1m44GyIlgc9M/VdWhbhx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

Le mardi 12 ao=C3=BBt 2025 =C3=A0 19:31 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> On 8/12/2025 2:44 PM, Nicolas Dufresne wrote:
> > I forgot,=20
> >=20
> > Le mardi 12 ao=C3=BBt 2025 =C3=A0 08:38 -0400, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> > > > JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:
> > > >=20
> > > > - DBLK_D_VIXS_2 (fail)
> > > > - DSLICE_A_HHI_5 (fail)
> > > > - EXT_A_ericsson_4 (fail)
> > > > - PICSIZE_A_Bossen_1 (error)
> > > > - PICSIZE_B_Bossen_1 (error)
> > > > - PICSIZE_C_Bossen_1 (error)
> > > > - PICSIZE_D_Bossen_1 (error)
> > > > - SAODBLK_A_MainConcept_4 (fail)
> > > > - SAODBLK_B_MainConcept_4 (fail)
> > > > - TSUNEQBD_A_MAIN10_Technicolor_2 (error)
> >=20
> > I'me getting the same result if I force a single job in fluster. The te=
st I
> > posted was with 2 jobs. Detlev found that the iommu reset is required i=
n
> > more
> > cases on RK3588/3576, perhaps the HEVC decoder in older hardware needs =
the
> > same,
> > I will try and report.
>=20
> Vendor kernel [1] check following bits from RKVDEC_REG_INTERRUPT reg to
> decide if a full HW reset should be done.
>=20
> =C2=A0 err_mask =3D RKVDEC_BUF_EMPTY_STA
> =C2=A0=C2=A0	=C2=A0=C2=A0 | RKVDEC_BUS_STA
> =C2=A0=C2=A0	=C2=A0=C2=A0 | RKVDEC_COLMV_REF_ERR_STA
> =C2=A0=C2=A0	=C2=A0=C2=A0 | RKVDEC_ERR_STA
> =C2=A0=C2=A0	=C2=A0=C2=A0 | RKVDEC_TIMEOUT_STA;
>=20
> Adding proper reset support can be rather involved and main reason why
> this series does not handle it, better suited for a separate future
> series.
>=20
> Proper HW reset will require e.g. dt-bindings, DT updates, pmu idle
> request integration and for rk3328 vendor even moved VPU reset to TF-A.
>=20
> Doing the iommu detach/attach dance not only on RKVDEC_SOFTRESET_RDY
> could possible improve some cases, until full reset can be implemented.

Rockchip is following VSI design of "self reset" on error. But since the io=
mmu
is part of the device, it also gets reset, which imply having to reprogram =
it.
This showed to be very reliable logic, despite RK doing a hard reset.

Since self reset is documented for RKVDEC_BUS_STA, RKVDEC_ERR_STA,
RKVDEC_TIMEOUT_STA, it would seem that RKVDEC_BUF_EMPTY_STA is redundant, u=
nless
its asynchronous operation that need to be polled. Possibly something to
investigate. RKVDEC_BUF_EMPTY_STA and RKVDEC_COLMV_REF_ERR_STA are not
documented a such, so its not quite logical to reprogram the iommu.

I don't immediately trust reference software for these type of things, we s=
hould
find what works best and have a rationale for. The hard reset is every
expensive, and hard to upstream.

Nicolas

>=20
> [1]
> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drive=
rs/video/rockchip/mpp/mpp_rkvdec.c#L924-L931
>=20
> Regards,
> Jonas
>=20
> >=20
> > Nicolas

--=-1m44GyIlgc9M/VdWhbhx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJuHYQAKCRBxUwItrAao
HGFAAKCCjxsKHnwiBkJhZl1nzpBQCCMhtQCdHzRB3yV4I1LVEzFyzTbwZPxMo8A=
=mrJE
-----END PGP SIGNATURE-----

--=-1m44GyIlgc9M/VdWhbhx--

