Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D656ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scirrqqI4lOboEI3/AWvPAjONsAeNM4rjx3UmgFrhBA=; b=hVKGUxi9C1xafbvG2k7OaH+CkT
	pFf4K6j3zPr8yvE3n6682MmxaZx+fh7W21syM6AVdJjVN0eCf5zb8Eazt8qLfmngC+3cPOsEymAfM
	UXR+PxGTqcF+HLpyCuMmWS143gNV47V+I88i40HR442De9yqDa5d+J51TyIkg7IJ4G659qAzuWE/3
	/ylEBC1AwnswEZQeeELCtV7PGWrOktVIjbxvi63gASp4KZegfA9q6C5P3rD4p97V22F7EY10tzBJl
	HC7RzLIxZXNzVlXD97A5ADj6vvspR1eG91mzOiHbTNLxAkf1APYFNZqz4rXCLNgioU7BEtCG1emkR
	7+Mo4Cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrl2-0000000BLzQ-2iAn;
	Tue, 12 Aug 2025 16:21:53 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnrd-0000000AeuZ-19SF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:26 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755000733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scirrqqI4lOboEI3/AWvPAjONsAeNM4rjx3UmgFrhBA=;
	b=GWG+XfFZJGWUBXR2DfX9RM0RidgE3PuHgnxhkGyBvKors9KleZT7/IFPmBWTCyAYyO1h7Z
	tFXdiAm9r0QWnc1NIsiCMGGvSlmXhznINjn0zezrvbNJsZfL1/xQBcNDPtZlFryDOBZrt6
	XNGW7qqjaYw44iIX1jduDbF/B+CMkLl9RrjYQXpIC3bbgDQA4ihegz1XfJ7BvLhEfMgT4O
	fH7O7CjZDiklMuprfB+uvjJYxaPBONP/Si4D8AXmDl+JPzIk7LqLf0oMEgULu9Nsula/L1
	Nkt4akKX5hcwlK0S9arlLblv1EpoVuzUPkuHNSWPdaZDQ+0pok8FCMpwfe04Tg==
Content-Type: multipart/signed;
 boundary=6590abcb8affc04b8dd77226ffd5bce0d727acb00dbbc61bdd0f9c164e53;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 14:11:53 +0200
Message-Id: <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "Sebastian Fricke"
 <sebastian.fricke@collabora.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
References: <20250810212454.3237486-1-jonas@kwiboo.se>
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051225_600732_873F89C6 
X-CRM114-Status: GOOD (  27.39  )
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

--6590abcb8affc04b8dd77226ffd5bce0d727acb00dbbc61bdd0f9c164e53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jonas,

On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
> This series add a HEVC backend to the Rockchip Video Decoder driver.
>
> With the dependent H.264 High 10 and 4:2:2 profile support series
> finally merged there is finally time to send a v2 with minor changes and
> a suggested code style fix of this series. v1 of this series has been
> fully functional up until recent unstaging of the rkvdec driver.
>
> A version of this HEVC backend has been in use by the LibreELEC distro
> for the past 5+ years [1]. It was initially created based on a copy of
> the H264 backend, unstable HEVC uAPI controls and a cabac table + scaling
> matrix functions shamelessly copied 1:1 from the Rockchip mpp library.
>
> It has since then been extended to use the stable HEVC uAPI controls and
> improved opon e.g. to include support for rk3288 and fix decoding issues
> by Alex Bee and Nicolas Dufresne.
>
> The version submitted in this series is based on the code currently used
> by the LibreELEC distro, excluding hard/soft reset, and with cabac table
> and scaling matrix functions picked from Sebastian Fricke prior series
> to add a HEVC backend [2].
>
> Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for making
> this series possible!
>
> Patch 1 add the new HEVC backend.
> Patch 2-3 add variants support to the driver.
> Patch 4 add support for a rk3288 variant.
> Patch 5 add a rk3328 variant to work around hw quirks.
> Patch 6-7 add device tree node for rk3288.

It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
locally and that also had this commit:
- media: rkvdec: Keep decoder clocks gated

Is that one no longer needed/useful/etc ?

And 'chewitt' also had a commit to fix 8/10-bit selection:
https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df926d4=
35c7c
"WIP: media: rkvdec: fix 8-bit/10-bit format selection"

I haven't tried that one (yet), but did  try an other variant with
changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
in my tests. (Can ofc be PEBKAC)

Would that be useful? I do/did have consistent problems with playing
10-bit encoded video files.

> This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> <snip>
>
> Please note that there is a known issue with concurrent decoding,
> decoding errors in one decode session may affect a separate session.
> The only known mitigation to this is to pause decoding for some time
> and/or do a full HW reset, something to handle in future series.

Or would that be (potential) material for a future series as well?

Cheers,
  Diederik
>
> <snip>
>
> Alex Bee (4):
>   media: rkvdec: Add variants support
>   media: rkvdec: Add RK3288 variant
>   media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
>   ARM: dts: rockchip: Add vdec node for RK3288
>
> Jonas Karlman (3):
>   media: rkvdec: Add HEVC backend
>   media: rkvdec: Implement capability filtering
>   media: dt-bindings: rockchip,vdec: Add RK3288 compatible
>
>  .../bindings/media/rockchip,vdec.yaml         |    1 +
>  arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  826 ++++++++
>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    4 +
>  .../platform/rockchip/rkvdec/rkvdec-vp9.c     |   10 +
>  .../media/platform/rockchip/rkvdec/rkvdec.c   |  184 +-
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   15 +
>  9 files changed, 2886 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-da=
ta.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c


--6590abcb8affc04b8dd77226ffd5bce0d727acb00dbbc61bdd0f9c164e53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJsvjAAKCRDXblvOeH7b
bhf6AP0cQaPbNeNKgdBGzdSYqHMMSX3Ix/IZm7QpHlM11Q7PWgEAw2HCwp3ojWFd
ALwV+Z8FasxZfkOfjYJmcHhJyZdW3gk=
=zJRQ
-----END PGP SIGNATURE-----

--6590abcb8affc04b8dd77226ffd5bce0d727acb00dbbc61bdd0f9c164e53--

