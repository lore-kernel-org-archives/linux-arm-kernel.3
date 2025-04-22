Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FBAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoutxDXMBduqXkCuqWjStm0QPuDtQY2bdrFerkEpW68=; b=ucp97h1ihv6xK7UAi0W1RobHNM
	t1Gw0YkE7mAT9zgUrPj37pOHU6WuIUM854vQgQxWBKG4SAsb8VNleM6Fsc9DjZ5lbm2CdBPZaO1ca
	5lYwUvV5+3MFvGj/w1w90l9TzdTyIVnLKxnTgi+egMeKF0MolbENBqW/fry3PAwPfXJN5YYWxnK5v
	qXMnbt8d6gvHohuoYlkpsocXBm/XbkUQqd5twQcHFdXS1ZqDd1bIdDzcynhar9OqjyFJOuGs4+n/C
	g8zNWX5J9fgq/ipwcOxx8PjxMriSk+JqintMtrDA6FYrjY40zmfZecGwF4GT056wKeqxZoMK4CMKT
	C0O1EpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KDt-00000008Saa-3P7G;
	Tue, 22 Apr 2025 20:28:05 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KC0-00000008S9k-2esr;
	Tue, 22 Apr 2025 20:26:09 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so1550608b6e.0;
        Tue, 22 Apr 2025 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745353567; x=1745958367; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoutxDXMBduqXkCuqWjStm0QPuDtQY2bdrFerkEpW68=;
        b=fLay7akMI3MmWhoez3eb8u9ezVLKGDsZSUmQYYnhcF9o+VJs4M05+M5BnIW77xqMBv
         32HZZs8oU8nGHT1I1Hlwxh+LwAxcKgGqGd7AAa1onl6KG/ySNrTPxq0NV3Lxm7f3Axsg
         wBR5Ckv4YWbjZPg5gUgrtX3pWBeGmMn6Ta4tvq7owEa0MXv6Z8TK7sOBj9giUnSsqA+d
         mg6DURvJSfdZmBWwY8X4MHGCg346ldD9G97AXQouP1mID0m2l+dUD1/g5waIS1+hpga0
         koWNzpqkolTokaweiQWN8Tpg61CsggNfY3A8+3dTjHnp3xVhJuTDMDePc61YhVUeanX4
         lwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353567; x=1745958367;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoutxDXMBduqXkCuqWjStm0QPuDtQY2bdrFerkEpW68=;
        b=OaFEKC11MGCyB5G4c6bJqnHst7QylZ342OgNgtZYVgbIk9K2TLTV/CfE0DX+BhHBLa
         0mIiK6+SnYkoqkj7n+eav+6OMTz2cbp3rQLii7rzQKpQRu5AZ6P+nWKKBzZrwKlW8LXS
         xMD8NdAmPrEDI1GQ+WbZVl289PmovjkDZULayxBmQ73AMh4ggF0UWWgHRaeVr5dFQlga
         acQuyiuy6PaBAKSwaADAEYLH1If6brfMx1FsJjUU54MDJvg4ZmOG9ZAlhEztS/8toqQy
         EI7qHkuzIO1rC4z0LwmueWas9InneHtq0KpcB3nCyX6ICnc5MOBLhkz7TBGhD8CiqNwZ
         ISvw==
X-Forwarded-Encrypted: i=1; AJvYcCVnztrLsskZrVQwNExEZLu4Ya5rcWo9V2iCvKSkDczZbiW5RYBvYoZVPiqhyaqf4FuqUwcpZfbiFrtGyRvpR7g=@lists.infradead.org, AJvYcCWscOi8aITW3WywWGMas28wk3rqwQ2RdRiDgyi/+JUr5V0aRZJd80VEqCAsBPbnDMBsz85oe0ecLd+/zr0mNS4z@lists.infradead.org
X-Gm-Message-State: AOJu0YzAzVF3j7i9K46ImUag0UsdVHtITKKVmGvoydqQGIF9+HyBtqvx
	7DNx1dWtCyiabFpGo+4hkOpLFSxYtW3dbBSCn9VIqegug382o4K8mH5wPIduMwCxpStOusSTRpu
	C6jws5dfBpDYfLdIHdjz6Y93W79s=
X-Gm-Gg: ASbGncsK6xrI8KlLxc42Fq+u5cCZAMm59fj8l9bndMWmNd2fOktJfdKf5j7evDOEDPu
	JAB6yLgUBfBw6vNZ6MQnE9OsHd4cZBG2lNAO+SZbaAqGUQS3WTNLPmIblYZVY000AINyBjV41qS
	E+DakxOdRdYvnv1eRcZ4kqd+rFV2BijTZreHlAx93lF/F9qLCm1yrENkc=
X-Google-Smtp-Source: AGHT+IFkAZywjoSDdkL2hP/eBGjk1HB0egz5l60coUbGPSwKPLGDjvJRBE1HdJHOzv6S/R4K/hCFH5XEocQXUmUdn/I=
X-Received: by 2002:a05:6870:ac10:b0:29e:2bbd:51cb with SMTP id
 586e51a60fabf-2d526d6e952mr9594105fac.24.1745353567025; Tue, 22 Apr 2025
 13:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250318181930.1178256-1-anarsoul@gmail.com>
In-Reply-To: <20250318181930.1178256-1-anarsoul@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 22 Apr 2025 13:25:40 -0700
X-Gm-Features: ATxdqUH6-tftE_bForjP8SC5aE6ZcyndqNGbLVHkh__U5cPkKzAMq9GnA7-6_1s
Message-ID: <CA+E=qVc7tG7LXA86c_Urp0B3a+Oo6+ssZ_vDp8hvDDW-n1M6cA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PLL rate for 33.3MHz
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_132608_666733_41BC7670 
X-CRM114-Status: GOOD (  13.84  )
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

On Tue, Mar 18, 2025 at 11:19=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.=
com> wrote:
>
> Add PLL rate for 33.3 MHz to allow BTT HDMI5 screen to run at its native
> mode of 800x480

Ping

> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3568.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk=
-rk3568.c
> index 53d10b1c627b..1c73e18a9862 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -89,6 +89,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[=
] =3D {
>         RK3036_PLL_RATE(96000000, 1, 96, 6, 4, 1, 0),
>         RK3036_PLL_RATE(78750000, 4, 315, 6, 4, 1, 0),
>         RK3036_PLL_RATE(74250000, 2, 99, 4, 4, 1, 0),
> +       RK3036_PLL_RATE(33300000, 4, 111, 5, 4, 1, 0),
>         { /* sentinel */ },
>  };
>
> --
> 2.49.0
>

