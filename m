Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357F9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnZT6ZOq0Mk/tb82Bl5SiBs0WKnPFXIEG0Jtf01o8LM=; b=MQXFxUKnxmeaxNBzuOpix6zXqZ
	ZMkBQvrmK1xjhkoGsMSU4H6QoS76AlR2DtJDgpqFgE40uUt0LK5aeTAYcnGaFVIB4wWtLJdTJXOfN
	wLadzM3V4X8tBMzq5xnOxI/Bu7eiAER5VW65lKOptxQUFGtsbkVeWx5I3BMTZgZ7kUj7JkacB6jck
	SNHFg+43XAs4GaUZbA3mLcvaUEhZ16dpquRXAyD6qsaqlCbsJSFWE7EHkys5JxWOKsg7qx+M3IH84
	Ku3tQb18pfDc5BjmxbA91M84kCKzm8ioGGKHj0bIui0p7cuPsnV0pPf5XeVSdyKr45y9mPqcKzPpZ
	D+Bn7isQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxz8-000000042d3-0srB;
	Mon, 17 Feb 2025 10:04:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxja-00000003zXc-3TXm;
	Mon, 17 Feb 2025 09:48:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abb999658fbso94572166b.3;
        Mon, 17 Feb 2025 01:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739785693; x=1740390493; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnZT6ZOq0Mk/tb82Bl5SiBs0WKnPFXIEG0Jtf01o8LM=;
        b=VEcFEk/+C904Ar3fHgljUsE7MROpKxNEdKQ4zBRdEcXrMOwGk/l0v3bW/d904/47EV
         DB7bJdkb4/J8pHJSqGVV7YTenutAEa66g0IC6OCpkpN22jXiq5WfIWqa7qBjviXSleUV
         redx/eZZO/lXZEu+Dz7Kavu/qkg7Oi6a5DThUMuAtMGE3RaQb3GLtTHYhv0o0YVriexI
         LzhuskrvMZIRM29nSgmGyJVy6oS7+WbG2FYiMkorRgWy7H1j1GzH/rBpUu7iNMMw9mFX
         ydYUOy9MNo5Y6pfhZXhOt2DU9IFBnSOK3up5uOZJ+tgx4hH1PjdMHohvH85+AGtUQh9n
         +70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785693; x=1740390493;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnZT6ZOq0Mk/tb82Bl5SiBs0WKnPFXIEG0Jtf01o8LM=;
        b=K6W5kNnWfwHblIYMK9KFW54xERmeLw2AHeNRdSxhF4g8aU9y6vuFsrlvgctoHOdDYS
         vXe/xAJp4lxruTEYo/BnJv4FFbbWGpzeeVhTrm5jKXWH5AsjEhxBq+/yL6BcsMAYn4Bp
         d8/ZtjX/kb5vY0nFlBPXmz+5H8aKg0NMUh4cIY6XK5YrGXC72ElFgC5nEIV644kOW7J7
         Fh0QaGcpuuKkZHNuib7mH5VAScMMFcizhSEsEENuod9Rr+MfF8jwkiUrLJ6+gl21x/vP
         QFHKp6lwr2noP2epSF5vkNZe3Ck85C5aXESDBh/lh5fTdWjGA/K7ugGpWEamniIKDk1X
         ibUA==
X-Forwarded-Encrypted: i=1; AJvYcCVwl79r0QMTapwbPwDp2J24AuhZR1G2iSA6JpgGTWuMsFQG5kbLU2gxIxF5T4YDW1YVtITykfRt/wbDV1t/nyY=@lists.infradead.org, AJvYcCXPOiytz7gHbmgcJ9NiARnXnHyxnlIuoQb38jLukL0RCDwyzbl/ITO2JHm6GweYEzv0Y6tF+AtV7H+r8RZi3APZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzC3LeKTc019031p36f3wNKcaff/uwzrIH1lGv+qqCLG58Hl4uU
	6MG/RSahG4Bi0M3ADK6I3c9Vag7xCUWVmXoxE3jwABDbO9OEdu6x
X-Gm-Gg: ASbGncu0/gqFsA6NhSBmF/Gf7Gxo0fVofWuR4qkC1vb95YTAlmdKBj/7cJSb7LuRaCo
	eFi43m6frDnie1tyqSU5rm+8UFQDaiMaF4aIr4YqjedwNQpq85dtwSgjkx+hR9o2qiC/U6z0q9L
	1ZqJyvPNf1FYOyuVXkRZdcA0cJEZujl9aJLcRgccUahAajY2JLG8OzMopcnN2GB83iUlUgDqwVt
	YWiT3OSCQ35aRXRZNbGyfj80usVr+HwY5ebNu6gR0r0Sk6FHNn6FA8MkJKnygSZMzwtjl1Q/rzo
	ALjbWeQodmGQba2I95pSlaMYDe6eTeCRASjRDThKcZZ75ONouubNo3O7xhBkAM4jS9YKFa4r
X-Google-Smtp-Source: AGHT+IE7UjRmly5ZRe5H57cBCYRfro4iVdDEYEpGmSZjMPaWgTgD+u8eMLWweNc3hp3YASP3wNo/5w==
X-Received: by 2002:a05:6402:13c9:b0:5e0:68de:ab93 with SMTP id 4fb4d7f45d1cf-5e068deabbbmr2293237a12.21.1739785692680;
        Mon, 17 Feb 2025 01:48:12 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322b9sm856628766b.37.2025.02.17.01.48.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:48:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250217023521.35071-1-liujianfeng1994@gmail.com>
Date: Mon, 17 Feb 2025 10:48:00 +0100
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
Message-Id: <975CFBEF-4E37-41E4-BE3F-7294FE7E4D3F@gmail.com>
References: <2FE649E5-61FE-4299-81D1-F838298A04A5@gmail.com>
 <20250217023521.35071-1-liujianfeng1994@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_014814_867701_775B1DB0 
X-CRM114-Status: GOOD (  16.29  )
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
<liujianfeng1994@gmail.com> w dniu 17 lut 2025, o godz. 03:35:
>=20
> Hi,
>=20
> On Sun, 16 Feb 2025 20:53:27 +0100, Piotr Oniszczuk wrote:
>> [    0.531139] rockchip-drm display-subsystem: bound fdea0000.hdmi =
(ops dw_hdmi_qp_rockchip_ops)
>=20
> It seems that hdmi qp driver is built in kernel, while armbian builds =
it
> as module. I don't know if this is related. And here is the dmesg =
output
> of drm on armbian:
>=20
> jfliu@rock-5-itx:~$ sudo dmesg |grep drm
> [    2.190256] panthor fb000000.gpu: [drm] clock rate =3D 198000000
> [    2.191470] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major =
0x0 minor 0x0 status 0x5
> [    2.191478] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
> [    2.191482] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
> [    2.195853] panthor fb000000.gpu: [drm] Firmware protected mode =
entry not be supported, ignoring
> [    2.196019] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
> [    2.196407] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
> [    2.221006] [drm] Initialized panthor 1.3.0 for fb000000.gpu on =
minor 0
> [    2.566800] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
rockchip_drm_fini [rockchipdrm])
> [    2.567523] rockchip-drm display-subsystem: bound fdea0000.hdmi =
(ops rockchip_drm_fini [rockchipdrm])
> [    2.567882] [drm] Initialized rockchip 1.0.0 for display-subsystem =
on minor 1
> [    2.740995] rockchip-drm display-subsystem: [drm] fb0: =
rockchipdrmfb frame buffer device
>=20
>> Is it possible to provide me url with kernel package you are using =
(wich works ok for you)?
>=20
> I'm working on 6.14-rc2 now and this patch is included in this armbian =
pr:
> https://github.com/armbian/build/pull/7835
>=20
> And here is the kernel deb I built, which is confirmed working:
> =
https://cdn.haguro.top/share/kernel-rockchip64-edge_6.14-rc2-rock5itx-hdmi=
1_arm64.tar
>=20

many thx for providing me .deb
this is very helpful!

I manually installed it on my sd card and sill getting:

root@myth-frontend-56b0f018b5e0:~ # uname -a
Linux myth-frontend-56b0f018b5e0 6.14.0-rc2-edge-rockchip64 #4 SMP =
PREEMPT Mon Feb 10 04:45:03 CST 2025 aarch64 GNU/Linux
root@myth-frontend-56b0f018b5e0:~ # dmesg | grep drm
[    6.996022] panthor fb000000.gpu: [drm] clock rate =3D 198000000
[    7.002431] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 =
minor 0x0 status 0x5
[    7.003155] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[    7.003972] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
[    7.185792] panthor fb000000.gpu: [drm] Firmware protected mode entry =
not be supported, ignoring
[    7.186635] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
[    7.187616] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
[    7.188861] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor =
0
[    7.225079] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
vop2_component_ops [rockchipdrm])
[    7.227485] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops =
dw_hdmi_qp_rockchip_ops [rockchipdrm])
[    7.228666] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 1
[    7.229327] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[    7.230466] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
root@myth-frontend-56b0f018b5e0:~ #

but why roobi os works ok on hdmi1 on this board?

btw: looking on dri debug i see following:

root@myth-frontend-56b0f018b5e0:~ # cat /sys/kernel/debug/dri/1/state
plane[32]: Cluster0-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[38]: Cluster1-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D1
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[44]: Cluster2-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D2
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[50]: Cluster3-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D3
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[56]: Esmart0-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D4
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[62]: Esmart1-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D5
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[68]: Esmart2-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D6
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
plane[74]: Esmart3-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D7
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
crtc[80]: video_port1
        enable=3D0
        active=3D0
        self_refresh_active=3D0
        planes_changed=3D0
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D0
        connector_mask=3D0
        encoder_mask=3D0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[82]: HDMI-A-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D8
        colorspace=3DDefault
        broadcast_rgb=3DAutomatic
        is_limited_range=3Dn
        output_bpc=3D0
        output_format=3DRGB
        tmds_char_rate=3D0
root@myth-frontend-56b0f018b5e0:~ #
 =20



