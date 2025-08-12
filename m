Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/K6Kmzeo0smswqH+INF7WIXwUm2J6GEj868GD/UacY=; b=gcyqRHn6tK+qa/z7L8wcbUhKem
	+FY3V2wL0KY7ZDJ6EJTUz7tBS42ZsVrES8ave+yp9f23V5ThXd+BlnbXwT+9/D/Q1VPNTErdnK6PJ
	IzFOvYQJUNsNDfVTnifjsk6nAXLtCG3TFosH+9QPXn+t4vIzmHYw1Uj7u8Hmam/VgWrxXOk617JP6
	zGzi2khIIzLYIw9VJLCRSEJZXyluVsqOW7QGTofMo2b7jSRsL9OdmXgpRj6gaPG3Bz9ieyOEhQ6oC
	pSGVQW0gj8hKfLoRM3MsygF4rlSZ9eB4x0M+CZMVdLjmxE34Dv2cLpDVkVxMpRn52bFxvnv6EwFC3
	syR2iQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsqH-0000000BZje-1s0D;
	Tue, 12 Aug 2025 17:31:21 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloXs-0000000AqhD-0WxB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:56:09 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755003359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/K6Kmzeo0smswqH+INF7WIXwUm2J6GEj868GD/UacY=;
	b=rM2CPcxknPD2SbRacMWMBVPBBCQsqxe9vhib0K7Ko9FjPHBdJCGtjs27Uf4U+77CUquUmP
	rvGUkmHsQAPvPYxkLhE8EzUwvLWl52zW4IZViPkgTusRrjtBQAI6Q+ZvN/RDuSxlRiNbvI
	m2u7o3GV+nJUg17UlbNMTOL/eoV5GhMccl0lqnmlJopNW6whQoYTLsHfTXWQ508wOqr81y
	IVdCP+XPljYFGizwMvtlqGCBa5+QgHQTXVaTeESrk8Ih9u+HrCxvnkuM1B3VfmiBzToWTX
	vZqBHP2hC37Ou5OGWDKd/tmvBJp6MUOTD9R3H0cJG1+qwpl8y9wBOtInoEVSDg==
Content-Type: multipart/signed;
 boundary=5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 14:55:49 +0200
Message-Id: <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Diederik de Haas" <didi.debian@cknow.org>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Detlev Casanova" <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
In-Reply-To: <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_055604_604773_A3D77DEF 
X-CRM114-Status: GOOD (  17.76  )
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

--5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi again,

On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
> On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>
>> Patch 1 add the new HEVC backend.
>> Patch 2-3 add variants support to the driver.
>> Patch 4 add support for a rk3288 variant.
>> Patch 5 add a rk3328 variant to work around hw quirks.
>> Patch 6-7 add device tree node for rk3288.
>
> It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
> locally and that also had this commit:
> - media: rkvdec: Keep decoder clocks gated
>
> Is that one no longer needed/useful/etc ?
>
> And 'chewitt' also had a commit to fix 8/10-bit selection:
> https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df926=
d435c7c
> "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>
> I haven't tried that one (yet), but did  try an other variant with
> changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
> in my tests. (Can ofc be PEBKAC)
>
> Would that be useful? I do/did have consistent problems with playing
> 10-bit encoded video files.

nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
as it also exists with with H.264 files.

Cheers,
  Diederik

--5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJs51wAKCRDXblvOeH7b
bjcHAP9PnLzGZY1YCKcprzz/K1OPRxwql59MG2CCmBYwRNgpggD/cJPqV7R+iPpd
9qCnahBvk5X3jrA0jqxwYVblCkJpgAc=
=bXI1
-----END PGP SIGNATURE-----

--5eb61e0f6c0eadb653b8d59c45a8a0be8243b30f21a6b0198e575406c8d8--

