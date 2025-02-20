Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13482C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMr3lvJ7EopRpQyFUlg/MoDrJDe+8pm+RaJvLNxz/5k=; b=D8+PQOO6R8RC+byzSqxrLDi5KM
	9aScEFXrROaO61UjHVEQr3FZg1nHOWzl2f13zsScdlg5PBe8FpB6kZSUvY4kXtFVF7zQnTU6/bzmw
	OORXBUZbZFK862qSz62VXJPAdm8S++JkrhzFV4E7YQzIQnquOi6NaAN10/XOLhuS/XWlQPWMtvrK3
	CrIRc5cy8fSPREDBOkakI4ZlacuG0bkNDV6qLq5HyykucinMs7K4mOx0Otja7HAn1nJ9urohf3eqX
	2gxzMZ3+Y4ln1pu2Xnvea80EceexT93TRewUIHoCYuCCoxWq5UQvGaaZJbssWut3/G48O9o7THwjy
	GImJTF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBNW-00000002OjM-07Ci;
	Thu, 20 Feb 2025 18:34:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBL2-00000002Nro-09ac;
	Thu, 20 Feb 2025 18:31:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so4465762a12.1;
        Thu, 20 Feb 2025 10:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740076314; x=1740681114; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMr3lvJ7EopRpQyFUlg/MoDrJDe+8pm+RaJvLNxz/5k=;
        b=YJVJj34Dmmw54le9GVDCl6WwY/SJaN6gvxreIiBzRXYm22BLC27aCI0Z9vMjv9wAlh
         Kcub7+Z/9jtTLRDNyyOtJCqVE/kq+uYpJHsMFDKau7VhLcUbGOpVv/frW/h6DmVxdkqX
         so2mC4perwfc6iBuNqkma9lmiJZKpdRXK9+QgHiMG7bZzQ70onb+HUZ9nb4MIzx6Mlii
         Afctsxl9M8KCnc9oFoeefSE8Jk4e2aAEwR0iQoSPAjJf5TafpXDBA7NFYQYViMv7tHFO
         exnkpPAWqIsYncoPZv5EyF+YH1Mz3/JjJYAl3wWVZEPb71XWRCUzUUaAQlFNiYbSPsd1
         /+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740076314; x=1740681114;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMr3lvJ7EopRpQyFUlg/MoDrJDe+8pm+RaJvLNxz/5k=;
        b=CcOfWa+64KdCou+W5Xh66f0dRTsF/wQrRoautYta1MsYRKR1Y9O98slembbHf8fL6M
         27UmUlbx+rGuXWObJNk0gd4KZVFrJHIFYyVgq75giSEagBt1QSMsWssjGnKZ8lgA/JhW
         D1WeX8/NdioNaBCMzOyaxkTBA8lI/b0TZJohEaVjWxpQY/5x1FalM5BLoiM84nasuaZH
         1spWPA31hEe1koRq+mwoZoItFd+2zITl0l1SUw64pdMxF6GHNCt+pCcqSI9q3YR66ddK
         6i5E9knQGHwWfzVeQOPw/u67cglpYqLHzsamMPzPO5/kXO8pvSEJNRLaJn2+vKno/apS
         HTPA==
X-Forwarded-Encrypted: i=1; AJvYcCUOEuq32Tg9/T2g74oeLH64+RGJz+4mvIkAUZLpYzgWaKNBa4KDsBSnfK6koUE2aTKK+E3+SRKmzfCT1RK9ReU=@lists.infradead.org, AJvYcCWTiYfTrSB3EAyt/n6wkTbsF6qISWA1JKxIFXm87X1Anyk+Of5bQFiAuk7NRl21k7zyoT3merxYjfGVPt7NROu9@lists.infradead.org
X-Gm-Message-State: AOJu0YysnbGUSTt9xci9kUCRiYmqMbWZXGJ3H2hDO1mBmlUe9oYHv0CT
	2GzF7yasbdHmDy91y1jGMN3Gzyrb20qXUy8/hiCBVkhkfCZhyP4T
X-Gm-Gg: ASbGncu7VuCX6HVDZgGe0JYloI2lqdj615fvvA4PRdbYK5IsnSLhZSCaw3TKEuaSbW6
	o1qN6qRofh3RotHGGd2U1KeDY55Z/1KgL4knsi4X/+sJklPMkZ3BNnlttblMD5vDCFIthgsagwS
	gEY4K2QSB5ZHJVFTkYIU+KbPgiwP+UUEiSlg6eDKlkP3beOmkV+16Q3QITftL0YTCJXYAVkEawn
	RmCg76zW0jIjo43o1AAhrCn6Avg/ewqzPFNRD2lingDGtKAIJKmOPySl3oZvFp1KPALx2D3lCpX
	cLXviicd0OR5ccKUygDIYe3tRIlTlKRmjc6wBcUFS9cblBq0hmD6bRj8QgzK9G7oFA23cpWj
X-Google-Smtp-Source: AGHT+IFbxBiIiVyThGFUApBE/J2v7Yf4y9GSheJDY9cjGQbwdKH79wDotPht1emZ1XR1jrwSaRJKuA==
X-Received: by 2002:a05:6402:3491:b0:5de:5e08:babd with SMTP id 4fb4d7f45d1cf-5e0a12b9c7amr4570026a12.11.1740076314077;
        Thu, 20 Feb 2025 10:31:54 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270b17sm12453533a12.62.2025.02.20.10.31.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:31:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <2357838.ElGaqSPkdT@earth>
Date: Thu, 20 Feb 2025 19:31:36 +0100
Cc: linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 kernel@collabora.com,
 David Airlie <airlied@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com> <2357838.ElGaqSPkdT@earth>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_103156_077734_4A1C37B9 
X-CRM114-Status: GOOD (  15.63  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 20 lut 2025, o godz. 18:03:
>=20
> Hi Piotr,
>=20
> On Thursday, 20 February 2025 06:16:20 EST Piotr Oniszczuk wrote:
>>=20
>>=20
>> Detelv,
>>=20
>> Just curious of your opinion:
>>=20
>> I=E2=80=99m on 6.14-rc3 and using
>> =
https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-bri=
d
>> ge + this v7 series.
>=20
> Do you have the branch available somewhere ?

My tests are on my MiniMyth2 distro.=20
My build system is vanilla upstream+patches style. =20
Kernel is mainline 6.14-rc3 kernel with applied series of patches:

PATCHFILES +=3D 1001-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES +=3D =
1002-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES +=3D 1003-clk-composite-replace-open-coded-abs_diff.patch
# hdmi video support
PATCHFILES +=3D =
1010-FROM-ML-phy-phy-rockchip-samsung-hdptx-Don-t-use-dt-.patch
PATCHFILES +=3D =
1011-FROM-UPSTREAM-drm-rockchip-Don-t-change-hdmi-referen.patch
PATCHFILES +=3D =
1012-FROM-UPSTREAM-drm-rockchip-vop2-Drop-unnecessary-if_.patch
PATCHFILES +=3D =
1013-FROM-UPSTREAM-drm-rockchip-vop2-Improve-display-mode.patch
PATCHFILES +=3D =
1014-WIP-drm-rockchip-vop2-Improve-display-modes-handling.patch
PATCHFILES +=3D =
1015-drm-bridge-dw-hdmi-Sync-comments-with-actual-bus-for.patch
PATCHFILES +=3D =
1016-drm-bridge-connector-Sync-supported_formats-with-com.patch
PATCHFILES +=3D =
1017-drm-connector-hdmi-Evaluate-limited-range-after-comp.patch
PATCHFILES +=3D =
1018-drm-connector-hdmi-Add-support-for-YUV420-format-ver.patch
PATCHFILES +=3D =
1019-drm-connector-hdmi-Improve-debug-message-for-support.patch
PATCHFILES +=3D =
1020-drm-connector-hdmi-Use-YUV420-output-format-as-an-RG.patch
PATCHFILES +=3D 1021-phy-Add-HDMI-configuration-options.patch
PATCHFILES +=3D 1022-phy-hdmi-Add-color-depth-configuration.patch
PATCHFILES +=3D =
1023-phy-rockchip-samsung-hdptx-Fix-clock-ratio-setup.patch
PATCHFILES +=3D =
1024-phy-rockchip-samsung-hdptx-Drop-unused-lcpll_config.patch
PATCHFILES +=3D =
1025-phy-rockchip-samsung-hdptx-Setup-TMDS-char-rate-via-.patch
PATCHFILES +=3D =
1026-phy-rockchip-samsung-hdptx-Add-high-color-depth-mana.patch
PATCHFILES +=3D =
1027-phy-rockchip-samsung-hdptx-Cleanup-internal-rate-han.patch
PATCHFILES +=3D =
1028-phy-rockchip-samsung-hdptx-Avoid-Hz-hHz-unit-convers.patch
PATCHFILES +=3D =
1029-TEST-phy-rockchip-samsung-hdptx-Add-verbose-logging.patch
PATCHFILES +=3D 1030-WIP-drm-bridge-Add-detect_ctx-hook.patch
PATCHFILES +=3D =
1031-WIP-drm-bridge-connector-Switch-from-detect-to-detec.patch
PATCHFILES +=3D =
1032-WIP-drm-bridge-dw-hdmi-qp-Add-high-TMDS-clock-ratio-.patch
PATCHFILES +=3D =
1033-WIP-drm-rockchip-vop2-Add-high-color-depth-support.patch
PATCHFILES +=3D 1034-WIP-drm-rockchip-vop2-Add-YUV420-support.patch
PATCHFILES +=3D =
1035-WIP-drm-rockchip-dw_hdmi_qp-Make-use-of-phy_configur.patch
PATCHFILES +=3D =
1036-WIP-drm-rockchip-dw_hdmi_qp-Add-10bpc-and-YUV420-out.patch
PATCHFILES +=3D =
1037-WIP-drm-bridge-dw-hdmi-qp-Enable-10bpc-and-YUV420.patch
# hdmi audio support
PATCHFILES +=3D =
1040-drm-bridge-synopsys-add-audio-support-for-dw-hdmi-qp-v7.patch
# cec support
PATCHFILES +=3D 1045-drm-bridge-synopsys-add-cec-support.patch
# var additions
PATCHFILES +=3D 1060-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES +=3D =
1061-net-ethernet-yt6801-gige-pcie-silence-debug-msgs.patch
PATCHFILES +=3D 1062-WIP-iommu-rockchip-add-flush_iotlb_all-ops.patch
PATCHFILES +=3D 1063-media-rockchip-add-rkvdec2-driver.patch
PATCHFILES +=3D 1064-media-rkvdec2-add-iommu-support-v3.patch
PATCHFILES +=3D 1065-wip-add-hevc-support.patch
PATCHFILES +=3D 1066-wip-hevc-add-ref-frames-support.patch
# dtsi additions
PATCHFILES +=3D 1070-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES +=3D 1071-arm64-dtsi-rockchip-3588s-add-hdmi-bridge.patch
PATCHFILES +=3D =
1072-arm64-dtsi-rockchip-3588-hdmi-add-audio-support.patch
PATCHFILES +=3D =
1074-arm64-dtsi-rockchip-add-rkvdec2-video-vecoder-on-rk3588.patch
PATCHFILES +=3D 1077-arm64-dtsi-rkvdec2-add-iommu-support-v3.patch
PATCHFILES +=3D =
1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
# dts patches
PATCHFILES +=3D =
1080-arm64-dts-rockchip-rk3588s-rock5a-dts-improvements.patch
PATCHFILES +=3D =
1081-arm64-dts-rockchip-rk3588-rock5b-dts-improvements.patch
PATCHFILES +=3D =
1082-arm64-dts-rockchip-rk3588s-rock5c-dts-improvements.patch
PATCHFILES +=3D =
1083-arm64-dts-rockchip-rk3588-rock5itx-dts-improvements.patch
PATCHFILES +=3D =
1084-arm64-dts-rockchip-rk3588s-opi5-dts-improvements.patch
PATCHFILES +=3D =
1085-arm64-dts-rockchip-rk3588-opi5plus-dts-improvements.patch
PATCHFILES +=3D 1086-arm64-dts-rockchip-rk3588s-add-opi5pro-dts.patch
PATCHFILES +=3D 1087-arm64-dts-rockchip-rk3588s-add-nanopi-m6-dts.patch
PATCHFILES +=3D =
1088-arm64-dts-rockchip-rk3588s-nanopc-r6s-dts-improvements.patch
PATCHFILES +=3D =
1089-arm64-dts-rockchip-rk3588-nanopc-t6-dtsi-improvements.patch
PATCHFILES +=3D 1090-arm64-dts-rockchip-rk3588-add-rock5t-dt.patch

 patches are from: =
https://github.com/warpme/minimyth2/tree/master/script/kernel/linux-6.14/f=
iles

Kernel config is: =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.14/f=
iles/linux-6.14-arm64-armv8.config

Above patching is effectively:=20

- =
https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-bri=
dge
- Yours hdmi audio v7
. added cec support
- added rkvdec2 (including hevc)
- some dts enablements for above


>=20
>> On mine rock5b all works nicely but - at boot time - i=E2=80=99m =
getting some oops
>> in kernel like this:
>> https://gist.github.com/warpme/e1668acbef7817e5d2a88a6840328722
>=20
> I did notice that at one point but it disappeard after a rebase on the =
the=20
> latest master so I didn't look further into that.

Indeed - i.e. i don=E2=80=99t have these oops on rk3588 based =
orange5plus.
Also 6.12 kernel is clean.
But i have them reproducible on rock5b (and also e.g. on rock5t)
 =20
> Could it be related to 2518a0e1b878042f9afa45ae063e544a16efc1a3 "ASoC: =
simple-
> card: use __free(device_node) for device node" ?
>=20

I tried with 2518a0e1b878042f9afa45ae063e544a16efc1a3 revered and this =
NOT helps.
With reverted above commit, dmesg is: =
https://gist.github.com/warpme/dbfe813583e4660a02b74315f193e768

 =20

