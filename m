Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62B0C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEek4i2ZCkx6tmbDOfSqfNqakadAzuvY5GsHOU0PtgM=; b=31IexRSQ1HVZW3L2UMr7bgZ6ZQ
	jIUv7SkZ83TOmvaJYdbepLik3HbUzxmG5cb54xE37ZyMy91rLSk+ADaLeU6JWTVLAqDaqYEL0H/RW
	Yji/h7fgJR0RpnkRN92t6J65l7Ykt1zvHoVxaXUtyYCcuYD+IfqsKzFfhn8OiMdUmLN/Q2y5buY25
	p5e4fx08ViZvMDCbv2bdNfm+2dpksgMEK/8Pgii2Z6HKAKcRJQYpcrLfRV9IrfahxOJlPrNDmRQ+z
	EyHtip0V78y8qMXEYUD7h46aSw3V4BhlNOBVPE9omKI6rU+3/ZV9cxy0eiFJwgRRLYIfZMpOc5Egu
	NlF1EUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO7X-00000008swk-0qpn;
	Wed, 12 Mar 2025 15:35:47 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMza-00000008gQp-3FhJ;
	Wed, 12 Mar 2025 14:23:31 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so6445600a12.2;
        Wed, 12 Mar 2025 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741789409; x=1742394209; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEek4i2ZCkx6tmbDOfSqfNqakadAzuvY5GsHOU0PtgM=;
        b=FUdHO/gARKtrSSJCWFIn5RH8B//Gvkmme6NxRnQmTglEwtIB4FUFGbEyPYS9FA3wrD
         aZLDheJRSwOt/uBWOEMG+VLSeC0quXd2375hNvUJsfmGAYXUATJdytQClSwEnVRHGRRf
         Aox4sS5BESm52rCgR3soqQ5xp+WAdSB3i5GblqklGhfmrXb8ElrgUm3Mdz3TjsSbrX16
         DYhwt7Z+IREyc9WtQNozeP1XL1DbrbcLyJeK/HrOTubsBhEq6OWD6I6N80QK/maCSeCo
         UOsPz2x1fEcfpAnSCwMn8RqwITD7NPwCrOBqD5lk5w+Hhdx6LxqPFn1hLAQJFujvQNV3
         aLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789409; x=1742394209;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEek4i2ZCkx6tmbDOfSqfNqakadAzuvY5GsHOU0PtgM=;
        b=hvcyqLBATH3kTS+Jf9pzb5r3JlCxAfAymjUaw9WlX06XWmIJxe3ShiWHpWNPtWBbnR
         qWx0SHaIjzjnJXrB6WFHutOB7VImouahTGIp94EsDy927lPuEETbn55Gfu6WDeurNerT
         XiDLtBjuARBdcvG46SgfqoUQVc4LfmQyBpGR1NJGUM4X6V5gtneIU2WCVr+y0c0aNIQO
         6d1VysdCnY/0+2VM1R2ZddwwHjU/BWyjj5gf5G9uiCT5FSc3kRkoTxK39HYWieV0Aca9
         b1YAhdFveJrgvVOg2e5nIEraqVs3hVSr+sydsPes7s6JQbbwWYFxhE0hd+PkWd6v20N6
         mNjA==
X-Forwarded-Encrypted: i=1; AJvYcCWPFmM+yBKmoIrRzBvaxNqLkW81omwqiLqN67fcwObibSRbTPdDel5UwZ6ryDkV7mYZ+gZKejzZeo5uEyD0bxPr@lists.infradead.org, AJvYcCXgBmp/24K5JKFj8RsNn8/vL1Mb9IZLYqpsKHbnGVuECbnNe0MnhZd/onX+0YI3vGBMz3jhtwpC23KmoHkkZQQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAzDMjTzR+PIjGJpjp2ww6Xh6ruduTfJV1AreX1mRvPVL8TUne
	WCORZ67W54wswKqZMxtvzZE1CmgMro3vXjwa6/+ctcD6cXnTzDS/
X-Gm-Gg: ASbGncvx80ngUlMHAnMInD+HqMX5USevNoMAmx4ei1BkQVi71xnH1vSyz7m5GUfW3YS
	N/cYJQJzwWdw23b3CL4cwMJ7ddjH0R+lLScJKLBP0rA808XNopfcmie8BbO0RnGUavJEP0WtsKg
	EckgMoAZctWJUqzruOLbb0OQqAW//u7wjXe+DBWI9N/kcttbWLUK9QNr0tX8H+Sxu0mCu3jHFdC
	N9hG0jWxXUMHD3YOtiSqfK4chUfguvf9FMM3NOqHIvBFFQ50nr+2NEC6CA+eojGwSXZVAu9BSnx
	70I57Xa2OfDDLpN62fTQ06l9Uvl/bY3+vWm5RQmsF1ZRMPgsi7lKXqRhhNvJWRc/bC9IPrzYzba
	9XmWmrNNmoYQZy81meGyEj9BJHA==
X-Google-Smtp-Source: AGHT+IFdFvbIc6D4mXkiIL9CFWFvWjoXqM1m/Hjn3uEOvZC5n66LBMKABPlNlB63rI+HegTYSS5ruQ==
X-Received: by 2002:a17:907:d9e:b0:abf:6cc9:7ef5 with SMTP id a640c23a62f3a-ac25300a440mr2449963266b.47.1741789408746;
        Wed, 12 Mar 2025 07:23:28 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394825efsm1073903966b.45.2025.03.12.07.23.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Mar 2025 07:23:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v2 2/7] drm/bridge: synopsys: Add DW DPTX Controller
 support library
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250312104214.525242-3-andyshrk@163.com>
Date: Wed, 12 Mar 2025 15:23:15 +0100
Cc: heiko@sntech.de,
 neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com,
 lumag@kernel.org,
 devicetree@vger.kernel.org,
 hjc@rock-chips.com,
 mripard@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org,
 robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <61E9B36C-8568-4C0E-A9A7-07FF612912AA@gmail.com>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-3-andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_072330_818128_EE162812 
X-CRM114-Status: GOOD (  15.20  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
12 mar 2025, o godz. 11:42:
>=20
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DW DP TX Controller is compliant with the DisplayPort =
Specification
> Version 1.4 with the following features:
>=20
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
>=20
> Add library with common helpers to make it can be shared with
> other SoC.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>=20
> ---
>=20
> Changes in v2:
> - Fix compile error when build as module
> - Add phy init
> - Only use one dw_dp_link_train_set
> - inline dw_dp_phy_update_vs_emph
> - Use dp_sdp
> - Check return value of drm_modeset_lock
> - Merge code in atomic_pre_enable/mode_fixup to atomic_check
> - Return NULL if can't find a supported output format
> - Fix max_link_rate from plat_data
>=20

Andy,

Just small Q: do v2 needs something extra to get it working (particular =
kernel ver or extra dependency patches)?
I just replaced v1 to v2 and dp stopped to work for me.

e.g. on rock5a i=E2=80=99m getting:

root@myth-frontend-fafc53b591a6:~ # dmesg | grep drm
[    9.245284] panthor fb000000.gpu: [drm] clock rate =3D 198000000
[    9.249464] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 =
minor 0x0 status 0x5
[    9.249472] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[    9.249474] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
[    9.257979] panthor fb000000.gpu: [drm] Firmware protected mode entry =
not be supported, ignoring
[    9.258030] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
[    9.258604] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
[    9.259671] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor =
0
[    9.324353] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
vop2_component_ops)
[    9.324617] rockchip-drm display-subsystem: bound fde50000.dp (ops =
dw_dp_rockchip_component_ops)
[    9.325202] rockchip-drm display-subsystem: bound fde80000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[    9.325506] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 1
[    9.325531] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[    9.325594] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes =20

dp status is "not connected"

replacing only this patch back to v1 brings dp back to work.



