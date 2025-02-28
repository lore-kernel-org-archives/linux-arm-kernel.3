Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2545C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXgIwUFfcnXRTfKL18xxHQyr5xsRYovfLqKmpOqaIBU=; b=EhafX9GuFNd/y8Oqrl73wfxoaP
	mHvAN5RVg3q88eZa/VgOPPI0+BJGaF0U9mcDaIsQ0DrRj+eqqKX5+zjQHHsOzChzo7V+dqyNhRdOy
	v4RudEnKr3u0e55dpW8wNiNd5ZFM7PV6/Dk4dIry4vORdWuPvUsKNDS2zRqEVD/rXdpMnn62LgIKN
	xY9ank4tMSrxE1u6o0TUgrUT+gWAhY0esp1FU5cX7e1WZFOhFcy4qGx3EZWMZ7l3U1fJcjqJp/opa
	W2uZ7QQRCODI3pE2KmICESPGMSg2Yjwxy5LVq+O1d7NlLv6DnkUD2TdFuWwExe9K377OQ5ZhLhvyK
	aSluGxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7TT-0000000Cfdj-1wN5;
	Fri, 28 Feb 2025 21:00:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to70T-0000000Cc9D-0iFn;
	Fri, 28 Feb 2025 20:30:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo303078a12.3;
        Fri, 28 Feb 2025 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774647; x=1741379447; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXgIwUFfcnXRTfKL18xxHQyr5xsRYovfLqKmpOqaIBU=;
        b=BJ5BIfwEWf3SbMERm1/gqKmZw8ObXZFUKCRhI5AnhWYwqE777uqcrGg80BR058gj+0
         VpgtENHSZy4wN1JR9Eoiez7skmTWI8gWaYpKwzuvrf9DXW5vJlb4dz+vYv19sbFV+BgH
         itg2mv83lac5VY5thXA44WepIsXUbGPaErQVjFz4PwcD08YToSRRA9KoYOov80iRfEe/
         1LozxJ6IgJPGbsjKjGr1pZOgsXUPiREBWlhFBBSswBzkpDliS4nnm4SkJpcMB2zwd/Un
         q1bmem328h/ltF8xW74wtcczFMQyznsTv+cz0JHXdkroB1394EKzmcgajhQXAIeByzMx
         NpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774647; x=1741379447;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXgIwUFfcnXRTfKL18xxHQyr5xsRYovfLqKmpOqaIBU=;
        b=ltlmZ+7zA0A2jE4VRj/3yIh/JfyQh+yDKWvSpQwhcYJVEWrmw07IWlALToOnwv50P7
         mzCWKojtYtW85nrHbysuJOADcq5oBquqzoT6WgxSaPUcj937NPx2eA8Ioe0YnYLCSRGB
         Ow7UvF6NM9KFeGtgMuf9ptuOPiuUMTHllOtlvoAaD60lsZKHnW6tb/FB+BNf92UiFtnL
         fpQ/X2N1CQg+18yrBFOwWuZdequpB/K0Pvs1W3+4uSUen9986x5L4Nvj7eU72pc8GHaq
         syBM5sSe0UW17JnDs686pyZjaEB17ERG8i5DdDec6Rcl4tIU4yCeLTG+3DkSKEQCVkGm
         3l9g==
X-Forwarded-Encrypted: i=1; AJvYcCU9oIksQrPqyIKtZrZ05petkoTWJfmAmriT+2JRyOkH95c3Iw3+8KQf998+XvvHF8XclaOP8TVQj8G4PIc/KLSw@lists.infradead.org, AJvYcCWj2yTlcndIrAqZSWkDckJ4Z+7Zn6XZbmJLFrKLaFQZGNy3Z1FkO/4AWXQ7HHmyvr11WLI9hgtjlFwAp9vpzx0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvdia66xUfb6U+SbalN/Wtb1VM2JOBaVIghuHhEl33XZa5Jp7S
	TiBfVS3IFpzQkvhu8bqSngJijqMyeRW/VWuKOTWcvKLr3JSjnRp6
X-Gm-Gg: ASbGncsT65iAjDaTusgrCjWkkcNxyDruuPDIaEBf/E1rjhmmLq5pt6WZo3/u+mmMj7N
	Jv5pp14c6lqrIwnDbowNZp/XlJxIjiedzhPlarwOa1zof2yPL4pv9imqFQYTlT0nLlMXMxH5z9e
	A2L5rXqyBQTaSnj14m8UWIyQEOMksGH+sAIamWD9gahpapwe41WEjlH3h9ukvalgwxJLbUOdpF8
	jH87n0kowgr1bKwq/D3MFi+C810AcONoVOIJxmpcYBZtzXDbJxCUzjd+SHMTYDlxZ7+VRTFEdYy
	AbdAcDFN64gSsqu65ekJbF5S+iOw8iTHYZ3eLxhub9szmAuq4tlnzbLpj19W+akE4o7ZBrG+vHy
	z6HXfAdE=
X-Google-Smtp-Source: AGHT+IG2W1DgzC5HFOlMxfquiHOJsjopf4V1IKQfO3ADcRZT8QfnlN9j9L7rrPBIsVSyavnVTfhblA==
X-Received: by 2002:a17:907:9716:b0:abe:e1b3:78d with SMTP id a640c23a62f3a-abf261fba01mr544156566b.8.1740774646893;
        Fri, 28 Feb 2025 12:30:46 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf508f2288sm890766b.2.2025.02.28.12.30.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Feb 2025 12:30:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250223113036.74252-1-andyshrk@163.com>
Date: Fri, 28 Feb 2025 21:30:33 +0100
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
Message-Id: <AC3DE87B-64B1-4C34-8E1B-3900E2C53AA3@gmail.com>
References: <20250223113036.74252-1-andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_123049_207889_DCC9C64C 
X-CRM114-Status: GOOD (  13.74  )
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
23 lut 2025, o godz. 12:30:
>=20
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
>=20
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
>=20
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> *=EF=81=AEType-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
>=20
> The current version of this patch series only supports basic display =
outputs.
> I conducted tests in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C =
mode
> hasn't been tested yet, but I suspect it will likely work. HDCP and =
audio
> features remain unimplemented. For RK3588, it's only support SST, =
while in
> the upcoming RK3576, it can support MST output.
>=20

Andy,

Is tis series enough to get usbc1/dp1 working as video output ?
(assuming i will add necessary code in dt)=20

rock5-itx has second hdmi port using usbc1/dp1 lanes 2,3 to ra620 =
dp->hdmi converter

is it worth to play with this or it is too early?
=20

