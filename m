Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64006C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 19:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af1SOjIZIJuY/yZ1MYRyyrZydDPDM0jQ3H4asZdVI0w=; b=PbCz+yC/i6JYbRKotsT4Czrj42
	oYuMnfDUCy5L9r3hSZVExbASfhWdvkyD+3J2ZnUcp1PBlN4Y1r4T9/uELaoDlTKLX+wwRgub2P4Vt
	MZRNOdcgxcN0dk57MSmgJvsg0jrUXNVWjT87mT2n+CrpqJXFNt+HatFgqbB6lwSkZcfn4HERsHqfa
	+SkpYHt+bj+p0XJ6CGzuF8DuK7fvqTR6gz4aKtPe9+d5ldmiuuQB9AvOwpweMDQ2doanQPQrCWP0l
	Mk5qB9+70Mo76TAzvdY1JH6XTPLLMt2YM9vsNeEAYEeLar1PMrHkaSnIryVkNLmaLSC58ULLnJclV
	xbDXc+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkjS-00000002UzP-0VOE;
	Sun, 16 Feb 2025 19:55:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkhz-00000002UlV-2kqq;
	Sun, 16 Feb 2025 19:53:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so6962158a12.1;
        Sun, 16 Feb 2025 11:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739735622; x=1740340422; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af1SOjIZIJuY/yZ1MYRyyrZydDPDM0jQ3H4asZdVI0w=;
        b=kWgNltUNbzf7og0UpIANHFMEr3thKuT8LRgEQtnAkaCrSYz3mBpfQFxVq+rZbdmTnB
         d0W9C6bm8NACzgCFMMOovFrs5PqIAYeJS0EN3SeliaEl+Y1dPin7Tny84MhPV/lRsH7n
         xfBnjfo5phlvBE7OaT47pgOIThyhegnu1zyWqEhQ0auAVPM8DW62SXHCZ7nGmBIYGrKb
         Ru563JSamRG02HFPZw6t5wUKxqqC91zp0snuRBdKSb39eTDgSvPUkhIdtI1N2vMaW9Lz
         Hcy5Pudr/MUivIxZl7valFpsor6NCIO+9oykH6+WwY/gs2X/vhSPrZJVCqgs04Q3RRK3
         i7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739735622; x=1740340422;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=af1SOjIZIJuY/yZ1MYRyyrZydDPDM0jQ3H4asZdVI0w=;
        b=QzIGAQwVRBoiADdaxiwa68u2cW56v882z/ORLkyNTQSjvmhkl1lPE1ZkeRppDJiy/2
         PaYEAckPFRvFdvFZvFTiOa1Y8JMreZaOTaE1zdpvZFmM1Mmc7kOqZlAT8Yiyw/H1sBcH
         TOzNx3rqZ2uPOgDl6UW0ahyi+bMYS9uH6zMjy9BW8iTxYKghdbbt7AA8RNjcrBJ00JQD
         40pG2NyFadwm4a5IPfaBsLJn5K5bNHQ4Cd3YrTYgkyiIeqIIdXyXHUcK/MBNaWOpBnHF
         MgV+ZhvXAwP3Ec0HwjlyOUqvOsIYHcobZTjcBnfC0CBOOUACco55p0AzUMfUlGtR5rl/
         BTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBfkwOVrA63x7kJqCtztC3DZbMUHfCgpJ1SmcyqerUuk79T4OLNQUTH1RM/DRcWogkAchkN9omuFonXo/zNXGM@lists.infradead.org, AJvYcCVO2YpeW0gAgQ/SoaSbtZNrUb0IX5Mcv7DNp4z3DpuFAhtx+9iBF4KB+gEWxSgoqrLvfZPCqRTwTs1Ao4Te8MU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4wl4qvHzW9Ud/hZp11L1KxnuvbZimsOwTeYKHOe1Dd9zLeNQu
	wNWHz4i+Ep8K1B1WMbTAWppacvJ60YIVNx6NQsRT4rQtqUYMdoZJ
X-Gm-Gg: ASbGncvuPa7B0t7SuxOICezTKWvmUOhMCAmEhHhXGlFWyAlFJ75Lcdr2t2eT7lChfqr
	YD7NakLOsvDGmjvZvp+Op9c7oooFPDGhAmwxHXoC8wSJdx9KCfmH2OtuFLYqn9yDFRY65218TJm
	iQcVj6klJ6PNXolNcUUcjTppENJksfGRjShS0m37ahHMSeZt7/lXbPoa7ZL5BHLZWmM02cVrA7N
	8IjGnya0IFhQWt27IpiC1PfXAhHUTRzIBlhsiK4+OXgCIqc7dTm151IhjiA0kycj831de/q0MhU
	6Yxj/kON60/3hEF9Ww36najAO9R4zekYYAg646JnkCaXHDjUg9u++6cork34vN9j1gODohsR
X-Google-Smtp-Source: AGHT+IHNAYN/ohlBH1PsGGST7ieKr2wc9iNQj10zrIC3IuwUmk0o8j5XTagbop5wOPUoxS8ZwtDvrg==
X-Received: by 2002:a05:6402:51d3:b0:5db:e88c:914f with SMTP id 4fb4d7f45d1cf-5e037222d59mr7744568a12.4.1739735621515;
        Sun, 16 Feb 2025 11:53:41 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d3493sm6225309a12.35.2025.02.16.11.53.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Feb 2025 11:53:40 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250216134918.1357069-1-liujianfeng1994@gmail.com>
Date: Sun, 16 Feb 2025 20:53:27 +0100
Cc: conor+dt@kernel.org,
 devicetree@vger.kernel.org,
 heiko@sntech.de,
 krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 robh@kernel.org,
 sfr@canb.auug.org.au
Content-Transfer-Encoding: quoted-printable
Message-Id: <2FE649E5-61FE-4299-81D1-F838298A04A5@gmail.com>
References: <566E6F11-765C-4415-8805-55DFD3C2BD4D@gmail.com>
 <20250216134918.1357069-1-liujianfeng1994@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_115343_697136_DBF7F7E3 
X-CRM114-Status: GOOD (  11.22  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Jianfeng Liu =
<liujianfeng1994@gmail.com> w dniu 16 lut 2025, o godz. 14:49:
>=20
> Hi Piotr,
>=20
> On Sun, 16 Feb 2025 13:37:05 +0100, Piotr wrote:
>> Is there anywhere repo with this patch applied to test it on rock5 =
itx hw?
>=20
> This patch is applied to 6.13 and I was testing with armbian:
> https://github.com/armbian/build/pull/7829.

Well - i build 6.12.3 with current armbian patches:

=
https://github.com/armbian/build/tree/main/patch/kernel/archive/rockchip64=
-6.13 (all rk3588-*.patch)

 + https://github.com/armbian/build/pull/7829

and i=E2=80=99m still getting:

root@myth-frontend-56b0f018b5e0:~ # dmesg | grep drm
[    0.529361] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
vop2_component_ops)
[    0.531139] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[    0.532197] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 0
[    0.532846] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[    0.533538] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[   10.157564] panthor fb000000.gpu: [drm] clock rate =3D 198000000
[   10.160033] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 =
minor 0x0 status 0x5
[   10.160755] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   10.161569] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
[   10.219825] panthor fb000000.gpu: [drm] Firmware protected mode entry =
not be supported, ignoring
[   10.221411] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
[   10.222315] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
[   10.223733] [drm] Initialized panthor 1.2.0 for fb000000.gpu on minor =
1

Initially i was thinking my board is defective but=E2=80=A6..hdmi1 works =
nicely with Roobi OS flashed by radxa in eMMC so i=E2=80=99m really =
puzzled with this=E2=80=A6

Is it possible to provide me url with kernel package you are using (wich =
works ok for you)?



