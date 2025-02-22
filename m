Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2962AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/GVEbxQ97fbkhIcJUEnqr5o5JOI8aPTh6cyD4iHKT0=; b=bjgFOb3LeCNU4Ouk8uaxXx3Gx+
	RQibmTheElfMMayp8gbstsCGKQzHeJJRyblBeyonQo2NpsXCgQT7KEDroLdqRCV/bYDhCHMubb7Ih
	GR2wrzcljnJ5P71N3qk6rJwlwJYNz6gI54cKsSSwWAwY3OWAYF8HqFazrytNtOXeYheJfiwBf4TPh
	wDG92PlXfZcZxJt16+aLNbR82MUvKdJ65DWbaQZhVX/KUnigMe1swgKuPK7SLx/5RTaDf6RXA18JG
	tTQJRu/qDHRMj83UDxeUO2b7nI4/49n3QFQOLjw8K/X40WgpGQik41AdryKn81/fv2fKfbEizxYB4
	OPiSInPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tly8p-000000093ci-2PYx;
	Sat, 22 Feb 2025 22:38:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tly7K-000000093KH-3nYo;
	Sat, 22 Feb 2025 22:37:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so31255405e9.3;
        Sat, 22 Feb 2025 14:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740263821; x=1740868621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/GVEbxQ97fbkhIcJUEnqr5o5JOI8aPTh6cyD4iHKT0=;
        b=f/4ndnN6ZKZ2GvdGgprE3cicEpiGwt56E2DTQjMNYj150pY37FOeYGts2jasBvbgl8
         KDQpwcRbGcsaCtPwFcIxy+Fqv3IIR1r/EiUym/SvmJHHehB7H4LDZX4OV7+iSTTNuVkf
         rgtWHTFhIxvX/zZ6jYvFG2vJN5hEFP0XvaN6YRGf/eU46EAbdF4fL9N5nfEkBaqFGHLe
         wpFz5tNh8Uby9vwwL1J95NFulFYQEjmCsnukQ/3hj7CSZ/zNogs0016L26+oWbK/xRJP
         ETKY85lvFZmwVGPNkktmNCrSfCE4SuoME4dxouaKU61R9n4EsKvgCSyreq+k0w/l+Ute
         tFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740263821; x=1740868621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/GVEbxQ97fbkhIcJUEnqr5o5JOI8aPTh6cyD4iHKT0=;
        b=YizL4sj9+FPGnwRpLV4tJIvIbBVqs5KE1LiIOYzQCByDIWR40uPM+00s9WCFT0nXSq
         qFIYP8glvlK8y5bKUiZ2jJdkSoyAy5RYKN3o3JqIr1xXY9vd8Dss8Eud8kwCXMRYOpnZ
         LfLLD8e+qMQMPqS5ojZDRd/4Qi9sS2U+JxAnZlGBD8tkcq6ZXjzbXpEC4YacXxG1/jsJ
         bg6g+lY+dSyXcSUF08/WNntGZtC/EwCnSWP2w8eOCa5q7l326yfeWbolcKvJ1lnjqSuJ
         G2RGL85oI+x4IiBXZYZlY0Q6cqz0VLdh8pt9r7WVHuLllGHdNixM7OYHzOkYOlgm6vJi
         sqUA==
X-Forwarded-Encrypted: i=1; AJvYcCUj+0q07qJTTdpdkwspJwuv5rDGX0qhLn8j7ooW91XH+KftNsn1QXlgZVGfYAlbYeYzWkq4mWtbjbOD7no0wVQU@lists.infradead.org, AJvYcCVcCwpa61ufTUOAWSaL2eqy14JNEGatk6dwjwE/zxHldMDPKHb0+DkNCfZuR9XwI26kpnRC5KqLR0MzyYJTkCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxObbUqX1UG1xzgFZJpVMCkHOaUM+cTC4TORsgrn2DJo6B/LmXM
	nPsqcTuevb2pO+Ahk8ga161EsL1/L7q+3pLxi/Jmgbol7tLKgasy5m22KacLMQV5fU2K7Zf+318
	bw0YoA+lO/fIm9No/UXTYSH3nNBM=
X-Gm-Gg: ASbGnctKj7Bg2YhsOJMKOGjUmwN9tevRiR/qe+oiWxkBfJpWm4XpTKdDkp8uosTQn+/
	EHGHEdmjKBcS0rTqQXZ0FJGEj5Us6E3k1hjqZDuVtorPLrdnXF0lilLzXqQaxEm9pv1Kv3aTRV1
	2liBCacQpTvtvf7g79Nzst3Vj9ti7O1MiaZd7IYz8=
X-Google-Smtp-Source: AGHT+IGHmpDWi6/WtmtOBhBVoA+cMa1qycvf3lB7IeXFUX1UY4PKgFEcR3pytfVzteR2rj111qNX0UWQpuYrewIJGhQ=
X-Received: by 2002:a05:600c:5489:b0:439:86fb:7326 with SMTP id
 5b1f17b1804b1-439aebb5558mr53829545e9.22.1740263820918; Sat, 22 Feb 2025
 14:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20250222193332.1761-1-honyuenkwun@gmail.com> <20250222193332.1761-5-honyuenkwun@gmail.com>
 <20250222211820.GY16911@sventech.com>
In-Reply-To: <20250222211820.GY16911@sventech.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sat, 22 Feb 2025 16:36:50 -0600
X-Gm-Features: AWEUYZl7mqFGT6hL26BmUv2bUvBOH_-pwsfvZ96RvVOY1DCUAzUtL_VvJwDEiN0
Message-ID: <CALWfF7+82pkOhqpRxCzPMhvdV6_e9o4UGixWMvwj2gStQ9PgLw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
To: Johannes Erdfelt <johannes@erdfelt.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_143703_092743_78A55218 
X-CRM114-Status: GOOD (  10.08  )
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

On Sat, Feb 22, 2025 at 3:18=E2=80=AFPM Johannes Erdfelt <johannes@erdfelt.=
com> wrote:
>
> I've tested this patchset up to this patch. I unfortunately don't have a
> way to test audio on the HDMI port currently.
>
> All of the issues I had previously are fixed in this patchset.
Thanks for the verification. Will you be sending your Tested-By: for
patch 3 and 4 then?

Jimmy

>
> Thanks for the work in putting this together, especially without access
> to hardware.
>
> JE
>

