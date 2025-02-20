Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC9C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u33bNsVrNxNtTUoEnhMd7zgtXI5olli4RASjpX/hNKk=; b=sQeUr8Qp9VegQFarBk3upeZhgJ
	LaT38HmyZ5Zuxhm0yuMr/RHfma1W/zth1VKeJg7+m5lH+xEEOCLl6REd7otDLR619qbcnv7RfqhBO
	fajDibsnThvKZere6+Ro0TeAlxdgiMWuEOtU4cLuKgSghGWJnOEQlFKq9Jc/fdmFeMJ4EAeIZeX4j
	DVlTyd5I/2xTUdQiasO3JW07MuB0s8QEC/Bh+YOxPczi0lNVrP5FOjY6aeE7EtWcOQYxTYV3+pICW
	beMOvVzW+1n9hIJuxl3DC+vhny+znUgyeaipbs4RwXJbYFfOCuIhjONv/gb8w/3n3pu0wAyi4U7wW
	AUzMpvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4aD-00000000VSA-3tA1;
	Thu, 20 Feb 2025 11:19:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Xn-00000000UgI-0Hjg;
	Thu, 20 Feb 2025 11:16:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso1216180a12.2;
        Thu, 20 Feb 2025 03:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740050197; x=1740654997; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u33bNsVrNxNtTUoEnhMd7zgtXI5olli4RASjpX/hNKk=;
        b=HA//ssvh4KvMJjfnNcsh09kBKPM82bWmRXddCzIlaFd6dQkewnBeXalrScay1aXTIP
         tpAynSfWOJRmVbKRcv0BmMJl8c5EzcDYivtG+i+N92u71ghjClvYhhEo3m7KAV9Rv0Tf
         6mZy4sBxKaKmCyF0CPPTCfOSqOWjmK5vlYFcJkp8zb1v422iAVmgeB4xSAUxwcxWoZki
         tGX6x4gVBQYaVWCXjMfuXUDZpyXZcj0DtzUQLYX/ffuHsaNlAlo98yrxpyffj97UCRWF
         AJ2vvSz9asaa7+abFntDUy1YOdfw6R3fVH6bOqzdQr02So3YO90O3XVAqj0C6Fd9skr9
         rFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740050197; x=1740654997;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u33bNsVrNxNtTUoEnhMd7zgtXI5olli4RASjpX/hNKk=;
        b=dqE/Ezh07YxkgogWps6qogi2LzFfyb5gAn9G2knT0zVE/i6K89OzCfIPsaMxTIrpTi
         BLB6PNWcAeUMiq7xMwJcAdsaktY+nDSXyVgw2J/NOJre40v5jHPuxHOLuI7S1Myy/Xrb
         wDGBJnc70sz6llzKUtms6rWuQ5yeY0GEXeD0UBhgzS/yNC16ysc5lw2cks1R/Z0VAHFu
         pk5Ep73Pud7EC9LBm7PYITqfE26DZU1liNyPSC6fpFloXdDBD4K7tujP/akMUH1DCSQZ
         PX8VGC0rHHR9T1VTWZ6suYRwfRstJYEQ/Ojte4PDpzhUtpWbkE+6c3QNIFbL5oZCDEiF
         N77w==
X-Forwarded-Encrypted: i=1; AJvYcCV5bPDJqScW05Nr5n6m0uhRVN7vzd4ttt/PYJfjiAwj1Hgu4N9fIPs610jirrjOm5yn+7+0zBcmPoCEc5PhsvTB@lists.infradead.org, AJvYcCWiczMruJIvULSskjyGC3Ha/MbeETCC3KDpLfmELKkkNRlz9/ecJkDW1oFtvXPm6/VMYOlghb7Q5fO961owbuI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuN5Fxa8UwzA6cRDk4MnM3k7oU2Xhj+47/5zsoVfFmYC2lj4se
	oAF7OE2dMxk7sMnwLk4eO4xWYMNKJneY9p2vLkUYUWE+8qY/cpE8
X-Gm-Gg: ASbGncu8rSsjTJAFK5Y5zS80yeBKTrc4amDOPZNkNI9u7THl/lWNkqOGtNZI34/S8Va
	DegdY/fboTmTERFYeeycaahdkrrNW49+MxGxSlnumPCtyL4E3eFbQ3A14ZbS+GXIwA5toUylL2G
	ntrd2aWdg87IfzKV5LRKTILHwuV4gBzY9GVfLu6/06GD2HKjEBw6xa3+0PCM2lYAFKBVCaedhXV
	0wrcThpm08dv2lvbKfuGaf0BiXd3N1fN1+bb3VDGZuYbgXgtmYnPvPjTti9myNMw4cd2fpNRpEH
	5T147N8cn0syu9QWI6pCTxZo4t11akChM9ycnZN6a68yy1Imeguo9bg6TTpBlUUbOOSvkPir
X-Google-Smtp-Source: AGHT+IFmWBcDPInhp9w4btY1qA9eIzy3GXZXztUdnckb0Hqqtby2WfdghhMP/SBKRVAMezhhUK82sg==
X-Received: by 2002:a17:907:3da3:b0:ab7:9b86:598d with SMTP id a640c23a62f3a-abbcce1eeaemr613793166b.17.1740050196513;
        Thu, 20 Feb 2025 03:16:36 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9bd6e22sm630838366b.121.2025.02.20.03.16.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2025 03:16:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250217215641.372723-1-detlev.casanova@collabora.com>
Date: Thu, 20 Feb 2025 12:16:20 +0100
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
Message-Id: <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_031639_116778_EEFE552D 
X-CRM114-Status: GOOD (  29.69  )
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
<detlev.casanova@collabora.com> w dniu 17 lut 2025, o godz. 22:47:
>=20
> To support HDMI audio on the rk3588 based devices, the generic HDMI
> Codec framework is used in the dw-hdmi-qp DRM bridge driver.
>=20
> The implementation is mainly based on the downstream driver, ported to =
the
> generic HDMI Codec framework [1] recently merged in the master branch.
> The parameters computation has been kept as is and the data stored in =
the
> dw_hdmi_qp struct as been cleaned up.
>=20
> The table for the N values has been edited to reflect N recommended =
values
> as well as CTS recommended values.
>=20
> The downstream kernel also implements a machine driver for HDMI audio =
but
> it is doing exactly what the simple-audio-card driver does, so use =
that
> instead in the RK3588 SoC device tree.
>=20
> This adds HDMI audio support for both HDMI TX ports.
>=20
> *** Dependencies ***
>=20
> Based on Linus' master branch, but also needs Cristian's dts patches =
for HDMI1
> support [2], which depends on Heiko's patchset for
> phy-rockchip-samsung-hdptx [3]. Patches will apply without [3], but =
HDMI will
> not work (at all).
>=20
> [1]: =
https://lore.kernel.org/all/20241224-drm-bridge-hdmi-connector-v10-0-dc895=
77cd438@linaro.org
> [2]: =
https://lore.kernel.org/linux-rockchip/20241211-rk3588-hdmi1-v2-0-02cdca22=
ff68@collabora.com
> [3]: =
https://lore.kernel.org/lkml/20241206103401.1780416-3-heiko@sntech.de/
>=20
> Changes since v6:
> - Fix arguments alignement (checkpatch --strict warnings)
> - Add hdmi1 audio support too
> - Move hdmi0_sound node under hdmi0_out_con
>=20
> Changes since v5:
> - Simplify audio math computation for N
> - Move hdmi0-sound node up with other address-less nodes
>=20
> Changes since v4:
> - Moved hdmi0_audio node the rk3588-base.dtsi
> - Enable hdmi0_audio in rk3588-rock-5b.dts
>=20
> Changes since v3:
> - Renamed function to start with dw_hdmi_qp
>=20
> Changes since v2:
> - Also clear the audio infoframe
> - Write AUDI_CONTENTS0 to its default value in case it gets =
overwritten.
> - Store tmds_char_rate in the dw_hdmi_qp struct in atomic_enable
> - Clear tmds_char_rate in atomic_disable and only write registers when
>   tmds_char_rate is not 0.
> - Do not use connector_state duplicates
>=20
> Changes since v1:
> - Remove useless audio_mutex (was used downstream for multiple drivers =
access
>   to audio functions)
> - Let hdmi_codec build and setup audio infoframes
> - Only access audio registers when connector is connected
> - Rebased on master branch
>=20
> Detlev Casanova (2):
>  arm64: dts: rockchip: Add HDMI audio outputs for rk3588 SoC
>  arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
>=20
> Sugar Zhang (1):
>  drm/bridge: synopsys: Add audio support for dw-hdmi-qp
>=20
> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  17 +
> .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  17 +
> .../boot/dts/rockchip/rk3588-rock-5b.dts      |  16 +
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 489 ++++++++++++++++++
> 4 files changed, 539 insertions(+)
>=20
> --=20
> 2.48.1
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


Detelv,

Just curious of your opinion:

I=E2=80=99m on 6.14-rc3 and using =
https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-bri=
dge + this v7 series.

On mine rock5b all works nicely but - at boot time - i=E2=80=99m getting =
some oops in kernel like this: =
https://gist.github.com/warpme/e1668acbef7817e5d2a88a6840328722

I=E2=80=99m not sure where issue is but it looks to me like kind of =
interference between analog audio and hdmi audio as commenting analog =
audio in dts ( =
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch=
/arm64/boot/dts/rockchip/rk3588-rock-5b.dts?h=3Dv6.14-rc3#n24 ) stops =
kernel from oops=E2=80=99ing=E2=80=A6.

 rock5b dts i=E2=80=99m using is like this: =
https://gist.github.com/warpme/a8a32afd4a05d4b7f25d2808984b05ac



