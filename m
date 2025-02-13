Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C4AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUwOmDEJF2wOs2nTiLIA+I47nkpCmb6VTNh/7P12ZFk=; b=RSQludt7eCG8/AG/loaCIxu0Oz
	psZRPwL8B/ZxCG1KXHeDXn+b6tDHJHwI8cHD5PG/BZ5GvhYkqpPeWAkDQ6Y/VT2n3oebLNvgNiDSe
	nC/fREMFehbHhdVWMrLPuZKRz2LJghld0i9tDIB5g0liOykrRGIxDnZEgMzAFOAo3IlR9px5BtYR8
	OpwxhVj1JwTw55RWPIx/5A05YykBLYBvAzXcVPIqWGHAwuEr4CcEO01yuFDzuD+bwQi1FmY8JvO4C
	D4prQjS6ePd7xtcPjt02uvDJK8t+BFS7twOcIMlGrDaMtwPqFWZzUIX7EgjkhciZCK00LgEiz24dp
	w8/9Kf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiafO-0000000BROP-31q5;
	Thu, 13 Feb 2025 14:58:14 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiabY-0000000BQS2-23ac;
	Thu, 13 Feb 2025 14:54:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab7d58aa674so149083166b.0;
        Thu, 13 Feb 2025 06:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739458454; x=1740063254; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUwOmDEJF2wOs2nTiLIA+I47nkpCmb6VTNh/7P12ZFk=;
        b=e554P7Wxe8RQPTwvboCVq3DFsn+R/v08qJQhsvx9BewYfz0lCHfL6b+aHiQe0Oqoh2
         HasyLwZFzkU1kQnJ+8Exfye3zSxL+YdNqRakGcGfxi29jDwnB3hQ4d2ZHtcVHzy8PdWH
         T7zVIUKu1fXZXd3NEiU2vLzSqyu+94RFA41JhmjDWVYz5W4lhYmZLIDi626pTz4/ux1f
         sY1+/EaY3EYcvUnhoZvOeQ3De1v1xqWZdSS5df1Tg6leJD9zuxJBU6OqUU4ZO4Fynbcu
         WeBK/Vj9xP07xl0UGaeCv0lQMKDEu75eBP6YgzedO6bRIcfRaoBd6sv77PF8F8fpC62y
         ZWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739458454; x=1740063254;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUwOmDEJF2wOs2nTiLIA+I47nkpCmb6VTNh/7P12ZFk=;
        b=EnRIbvavGE7alEWvuLAINe5NGAgXH1O9QLzqUfJZBMV3nBDwxMH+M3qadrn6aXbGrd
         FwQHaVVDSUt5Qke/AnB7yWj7ryHIhXgbmXeREzMEFfUg2cRLPBKzbin/ttmc1p1mxfQP
         UklBLmHN70irDVPxDghYHIrpBxQESdC+0VvKOCnrSCOtBBclA4kro99kKi+R8+HUzmqM
         x4ofgSfG2VQBKycyQYFFqHCSlaeWZzh62yb+WRiGqO5+x5rp0xuCj4qk613WzvcwJ3xt
         4hmurquqMHvcNHrpmVfObyhmoY2i69rLe25lU8DnnRrVTzdBZRdUHSIu3vbUV3TFXnYL
         PzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+xACvosdgzSuBCbaaRmJnqQTVyV+c1cRKic8H2DdRJC7UKblL/t/DylNuyL/b8zzk3Pj4QNw1E7oPYywx1ouH@lists.infradead.org, AJvYcCWKySDf/gKtil6x1AaPkm5wVBM9nWJeVu2fBhmGxw1ufy5b+992hqZEk+ztVz0iUgDD9ANj3hpEUvGl@lists.infradead.org, AJvYcCXHJVO0O2Sw2yXol8GQdnLq2GV9p3Fs9Q3Bx+tr3+NLk/reeYjNUPH0Poh8W7wZm2jdD8jXuy1bg/IWN5WM2SM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVVd2xA4FoKLxOgdrFx40IAVujPjU0dbeQFd5bYEogR/cIWkuZ
	T4fBea5MEdFCQBfA97ATzWWOnJre89yhMl7OCkPyG/a9gek2M224
X-Gm-Gg: ASbGncuFThl4NiVF2wEM94cr7NOv1hPg/rkidqT70o8dP3ikgl7UMYtgmjtwZmbxAKt
	+0cqmrg33tpAX2FFg+Hl7E5A7cJdu22qBoJVqj9GAIiBDPlHNW5oILSh03VbQEHBMWeGNEY6vOm
	K6zYiIMXbQvHCWfS1iBJcyl7x98c1pQaH3Su337G10YXcXfe9kDBAHcF8/QHn4upkm8LKMioIWm
	O88xurrcBdF1aXksgGbHg6hOrb4Kw7vS2flwhzYXPFfDYFqmwJYMrx2PqA6U21Rl6C8ImczC7le
	Nqm5FZyrvgXiGKxpUVdYkdmJeQ1JwaPpbfvzE0RMq67VQvvAD9rQCHENdZs3hLJ8xuko1zF4
X-Google-Smtp-Source: AGHT+IHRjDETV8MTnwCbNtSq+kIovSq5moe9v0r+//O++wk+ZnIkHd4F+W0Aw7g4U3jTuMaXq46XsQ==
X-Received: by 2002:a17:907:7207:b0:ab2:db7b:5db3 with SMTP id a640c23a62f3a-ab7f34e7515mr682372866b.54.1739458454075;
        Thu, 13 Feb 2025 06:54:14 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322c4sm146145866b.34.2025.02.13.06.54.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2025 06:54:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250123100747.1841357-1-damon.ding@rock-chips.com>
Date: Thu, 13 Feb 2025 15:54:00 +0100
Cc: heiko@sntech.de,
 robh@kernel.org,
 conor+dt@kernel.org,
 algea.cao@rock-chips.com,
 rfoss@kernel.org,
 devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com,
 kever.yang@rock-chips.com,
 dmitry.baryshkov@linaro.org,
 vkoul@kernel.org,
 andy.yan@rock-chips.com,
 krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 l.stach@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
To: Damon Ding <damon.ding@rock-chips.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_065416_530104_5AA360CC 
X-CRM114-Status: GOOD (  16.93  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Damon Ding =
<damon.ding@rock-chips.com> w dniu 23 sty 2025, o godz. 11:07:
>=20
> Picked from:
> =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D923593
>=20
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
>=20
> Patch 1~4   are preparations for the RK3588 eDP support on both =
Analogix
>            side and Rockchip side.
> Patch 5~8  are to support to get panel from the DP AUX bus.
> Patch 9~11 are the RK3588 Analogix DP driver support.
> Patch 12    is to add the power sequencing delays for panel model
>            LP079QX1-SP0V.
> Patch 13    is the addition of RK3588 eDP0 node.
> Patch 14    is to enable the eDP0 display on RK3588S EVB1 board.
>=20
> Damon Ding (14):
>  drm/rockchip: analogix_dp: Replace DRM_...() functions with drm_...()
>  drm/rockchip: analogix_dp: Use formalized struct definition for grf
>    field
>  drm/rockchip: analogix_dp: Expand device data to support multiple edp
>    display
>  drm/bridge: analogix_dp: Add support for phy configuration.
>  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
>    from the DP AUX bus
>  drm/bridge: analogix_dp: support to get &analogix_dp_device.plat_data
>    and &analogix_dp_device.aux
>  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
>  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
>    bus
>  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>  drm/bridge: analogix_dp: Add support for RK3588
>  drm/rockchip: analogix_dp: Add support for RK3588
>  drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
>  arm64: dts: rockchip: Add eDP0 node for RK3588
>  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
>=20
> .../rockchip/rockchip,analogix-dp.yaml        |  25 +-
> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++
> .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  54 ++++
> .../drm/bridge/analogix/analogix_dp_core.c    |  76 +++---
> .../drm/bridge/analogix/analogix_dp_core.h    |   1 +
> .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 ++++
> drivers/gpu/drm/panel/panel-edp.c             |   8 +
> .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 238 +++++++++++++-----
> include/drm/bridge/analogix_dp.h              |   8 +-
> 9 files changed, 401 insertions(+), 89 deletions(-)
>=20
> --=20
> 2.34.1
>=20

Damon,

I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx board =
with 6.14 mainline.

rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1 eDP =
with ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
(see page3 & page29 at =
https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5itx_v1110_schematic.pdf)=


I=E2=80=99m on 6.14-rc2 with applied:=20
[1] Cristicc hdmi code =
(https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-br=
idge)
[2] eDP support for RK3588 =
(https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D927765=
)
[3] Add eDP mode support for Rockchip Samsung HDPTX PHY =
(https://patchwork.kernel.org/project/linux-rockchip/cover/20250205105157.=
580060-1-damon.ding@rock-chips.com/)

Is edp1 supported by yours [2] series?

If yes - may you pls hint me about required dts additions in =
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch=
/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts?h=3Dv6.14-rc2 ?

(for reference: rock5 itx bsp dts goes like this: =
https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/arch/arm64/boot/d=
ts/rockchip/rk3588-rock-5-itx.dts)

in [2] i see dts adds for EVB1 - but i=E2=80=99m not sure will simple =
extrapolation of evb1 edp0 dts additions to edp1 in rock5 be enough=E2=80=A6=
.

thx in advance!


