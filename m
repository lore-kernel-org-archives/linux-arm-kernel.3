Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AD8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0vWWMcXjFfg9c9qiH6NSV7bmKttHRNGNsOhNehrSvM=; b=Hbg5U6zh+cJX7WxA/dhX5lOya6
	leWLI1Y9cd2LjhP2YFFcwY5uUCF/tpdAnnNDBGb1zdjHdhsi0oZMso+AgEQzUOugxPJWQvZuDKIIW
	w17sytHU7fq0G3JZSy+XWhloCxPEKx9DDjg1i7ED6naGM40aP+dpuAsDPjJTDAFn599Rt2x09xSwj
	IEP3cpmhGlLg6sNXzsr8SfJ6a4RwBXNPpk7LsqzB0CSTWy89aFNFO8txfg8a0wR+R422UIW2yNu67
	JoCnCTvbi3hAB6lxLpaETEV8HAKC9tYPjh/63jB6Qw8dT0Z+YcSNpbOB/JEarBWgA05k9Dl/Rs2hw
	eCntlxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCEf-0000000BD5H-0aXc;
	Thu, 06 Mar 2025 14:30:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCD2-0000000BCd2-119j;
	Thu, 06 Mar 2025 14:28:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abbb12bea54so150316966b.0;
        Thu, 06 Mar 2025 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741271302; x=1741876102; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0vWWMcXjFfg9c9qiH6NSV7bmKttHRNGNsOhNehrSvM=;
        b=dfnXa6Zc3caRJ3q90eoTQnOdnsvIHDdtkJDqNdkOYDwxMDuozLlPkldjpdFebkC26V
         A9XgWuPMSXPSp2nTuEBPQ9VhXqhExp7NtRzAPnaSybXS5Jlb32LcJTCk4OSVq6BxmPD8
         GPvf9d/Q/suwgiDXRN2jg4w08vwWiwrMt4Jfz5qdrGH8kM44nTvab9Q4Am8hBjl2mHjW
         AtVLqtzhYV+d3pANBahalFiuXK2eDQ6YGFAfvnMs6j9pXxA0XHZg9C9Lc5foUslaDTE8
         iN6/croAhQwi5nC/kbnwMsYy7Qjm5/UctpV5P5+8QPqJtpEc3c2GLA77ab3aTouG0dLs
         7SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741271302; x=1741876102;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0vWWMcXjFfg9c9qiH6NSV7bmKttHRNGNsOhNehrSvM=;
        b=cs0rUYMp5Eiqlo/A5O/T6/iF6WW0PGtTvGyGFNLJi5T1CKB8Wd+RCZEcAPcBuItkU5
         BjEIlPKB7ao2UKMQ2El6ftIo/3QGxZ9aA2JEuvE9jSTdrNO42Y9d6T4szN5W3iU97jQD
         BzIvf7nouz2MTMxttZ/cwWKRYSLOC6DQ8jCVzSla2YMUK7G3kXlmqWS89VeDLFFgA8oO
         ijPtIFmEYNaYRwuTEQkN/RvKqfaJoo/oyg11imHTr90a7HvJZTgteJM0atSC/a9Irq9d
         JyBkcQwLoYgHgsNY5Z0WzidwM+Vxps8f/fF96GPIehgg5jtUwoNK5UOIoWSWr2Sn9C4Y
         Nk0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPCYigjh+ZcIlnG6vMSJsD4D7R95FCDun7Sfk6wp9shYCQmKh9onovFVCOzgEPT4R7SjNSpm9oYy3GA021/ERW@lists.infradead.org, AJvYcCVg++kDdejMH4Ovk3kxaYPxKRVbeA5d2SyvihkeA1RgxOMuyiTC42O/z7eM1hgFzkin0MOaP3uqgG4q9D6/cHo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoCkLCyoV5dlqiLK6uxvUBkK/7gVFv7VrQBX9bMkSR+jrjXJgP
	Vlvd90pn+/IyR3xTmvklIbb/71rEAEqIsQt3XfWA2H4l2Md7wCDS
X-Gm-Gg: ASbGncvrQeUGNooNf+PS9OaskMWFJhyCJMHMYXbpkLHq8AUoiWWNGHGbTQION4u1sFT
	i3RpIsE+IgpGHqmgPZHNGcGBOpXEdlmGubega6O+cjZqHiG5RbwBa1gFlkqQh4jqFOQnVeCrXRS
	X49z8mPsLMSaYypKVrxn0e8woNSoGzSgcGn7E25bN14oSAPbfpYyU78i3TmTuxiKwBBIrUC3dfI
	scD1ybJGtfLL4G+FlsWo9yRkJp8tCqbvWYQ9gakNWAO9Rs2qY4AlW9Bivj8fHncH+wgf3kc84gc
	CWsXiZbNyTIF0u+okp1196Cq8snVEqYYQFz1wcKdISvLBJT5YOooS29DXHoq7lQKLXoQaixDKnz
	zyrjmNMZalBmE3EDUqQIUp2qskQ==
X-Google-Smtp-Source: AGHT+IFozHswlf0bg9ThZSp1FbgljtVYCPPvnTD1k5tckBB+eJRBJhF1NQdof80kjppsiFvLEvgOsA==
X-Received: by 2002:a17:907:3da2:b0:ac1:e2e0:f8d6 with SMTP id a640c23a62f3a-ac20d8bcb19mr672425066b.17.1741271302225;
        Thu, 06 Mar 2025 06:28:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d4ed4sm104210166b.178.2025.03.06.06.28.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:28:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
Date: Thu, 6 Mar 2025 15:28:08 +0100
Cc: heiko@sntech.de,
 neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com,
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
Message-Id: <326B91E9-FB91-43C3-B98B-3EF079F313C6@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
 <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_062824_284593_435FA956 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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



> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 6 mar 2025, o godz. 15:08:
>=20
>=20
>=20
>> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
6 mar 2025, o godz. 13:15:
>>=20
>> Hi Piotr,
>>=20
>>=20
>>=20
>> Then when you DP cable plugin, you can run command as bellow to see =
if the driver detects the HPD:
>>=20
>> # cat /sys/class/drm/card0-DP-1/status=20
>> connected
>> #=20
>>=20
>=20
>=20
> Andy,
> Thx!
>=20
> With above changes i=E2=80=99m getting =E2=80=9Econnected=E2=80=9D.
> Also it looks crtc gets reasonable mode: =
https://gist.github.com/warpme/d6220e3cc502086a4c95f05bd9f9cf0c
>=20
> Still black screen however=E2=80=A6
>  =20

some additional data point: /sys/kernel/debug/dri/1/vop2/summary=20


working hdmi:

Video Port1: ACTIVE
    Connector: HDMI-A-1
        bus_format[0]: Unknown
        output_mode[f] color_space[0]
    Display mode: 1920x1080p60
        clk[148500] real_clk[148500] type[48] flag[5]
        H: 1920 2008 2052 2200
        V: 1080 1084 1089 1125
    Cluster0-win0: ACTIVE
        win_id: 0
        format: XR24 little-endian (0x34325258) glb_alpha[0xff]
        rotate: xmirror: 0 ymirror: 0 rotate_90: 0 rotate_270: 0
        zpos: 0
        src: pos[0, 0] rect[1920 x 1080]
        dst: pos[0, 0] rect[1920 x 1080]
        buf[0]: addr: 0x00000000017e1000 pitch: 7680 offset: 0
Video Port2: DISABLED




non-working DP:

Video Port1: DISABLED
Video Port2: ACTIVE
    Connector: DP-1
        bus_format[100a]: RGB888_1X24
        output_mode[f] color_space[0]
    Display mode: 1920x1080p60
        clk[148500] real_clk[148500] type[48] flag[5]
        H: 1920 2008 2052 2200
        V: 1080 1084 1089 1125
    Cluster1-win0: ACTIVE
        win_id: 1
        format: XR24 little-endian (0x34325258) glb_alpha[0xff]
        rotate: xmirror: 0 ymirror: 0 rotate_90: 0 rotate_270: 0
        zpos: 0
        src: pos[0, 0] rect[1920 x 1080]
        dst: pos[0, 0] rect[1920 x 1080]
        buf[0]: addr: 0x00000000007ed000 pitch: 7680 offset: 0


