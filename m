Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754EBCA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 00:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvH3gCh3YcyePorgXaVz1lgEivaFSAAjIPEZY4vEWpE=; b=xupdxTegJl4UboDouGuKVX94b2
	bkG0rrSFbWiLQmUfuGynhxKcCVoyQIhQm2rC/lC1jL6S4apM+DMyCtxMCBST0SNpkLZ6XdoeXIa1y
	pnM5UiXxavy0jdIT7ZYUXx+3Osxv6NCiFqzx/d2ziocTdfR/rLum/ld+B5pN5hp/CWEspYJdBOHSZ
	4YCnTt5EimVikcyPyMN2FjroEzq2BeT8v62GtqHKTVBRm8APPVYpkq3hpLGgOMULcKadZrCWdG6mi
	2PMKNStiOmjnoDj/0vdGHWyo7yaggQQ6x+OK4mUFmViJ2yV+QwYdCPCb1k24pI7Anpl2bh1gpNOLn
	z2faLSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussXM-0000000As7d-1H5Q;
	Mon, 01 Sep 2025 00:36:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussUf-0000000As3Y-0oN4;
	Mon, 01 Sep 2025 00:33:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61e425434bbso964865a12.2;
        Sun, 31 Aug 2025 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756686835; x=1757291635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvH3gCh3YcyePorgXaVz1lgEivaFSAAjIPEZY4vEWpE=;
        b=BbhqPGBMposKMQFNaPJXuaDBvuJvemqnxWLzYpdT6SfXY9ANLyivTFu28CRyAYYGJo
         J5HUcGBQR3TYkHBol0kd333qvQxnDoYxdOKlaiepES7pgXfLXXXp0AZb/Ey6WIl8Lq6c
         2FQy9IDQUQfpzn8J/yoOM+0OhWyfowUwDN4dKXS81f4e6khqfXMX72RUH1nzpg9bxnZ7
         vRiFlmK7GtgfoC7+zUFEk5WxIX03Xd9wXHxejoN3ga34a3xIfooZ9ujph4qQE+os2d2+
         DsQN9uCiEzAZWbwsulaZU8ur0j3p6AoEHD2xnNrgUpRMAagNtYSgZfPdbuvtW8Ut2hYO
         gGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756686835; x=1757291635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvH3gCh3YcyePorgXaVz1lgEivaFSAAjIPEZY4vEWpE=;
        b=uCRtn/yAdvhfN1sueP6xZyGsUkfozUpvifIye+bsEHa/Ofz7VjZ22Gm6ZV3uwrUo1c
         nSDI53D9qHHYuNxOkMlcLLN7v/B4hZGiVpsnOeOvEt5LjIERkygFteqPAhvbgdDOd1Fs
         k1npakIQfZlhdJ0R0hYsJq0qkx0/qQ43cy7AYDUIb+eAz/Fmfbs53CSLBRPIBAVWMhDY
         lha9wzVtq5rh/Gq7NYFhAY79jgC75F74TCMV/qCuXxWenjcwAwHg28FBhJAGWPkuXopj
         /nic2ryx0kTb3k+oHqhEcxgEnd8bSMweywsSL9Y0AMudJZ/pL9GvaL+Ra5hLY9TF/cbV
         SQzg==
X-Forwarded-Encrypted: i=1; AJvYcCUkuACg/+0Oj5kIJTOs09EMlIYmeZ/gE0XF15xmHQwjdoWdBeX3fX1iY0a6SYwrQyGN3RQQ51GN6vMZNKZAUnI=@lists.infradead.org, AJvYcCWT7nrvJIoSD4kJt4UzcYY+kVCIVoRhXdabI+zh+9iEDFpy2FOLQvtQ2d4amOCOj8/RAdOJi3O8QurTbuoGLixb@lists.infradead.org
X-Gm-Message-State: AOJu0YxmOu6+G+Kpo9FZDK7pm3pNTXujmohik3N7vCpgSuxhEiS+KtVi
	poWHqtcpNa2Rh1GQES4fH0y2tNT6h//yLP2O3tUh69g+CIwVim+7++nHhtMHsj63zECOWmTKqH1
	FnerUaA70NKMasSRyn+Y9AtQ7S1E7rgM=
X-Gm-Gg: ASbGncvEY4pCZraPZooUsAfSY16eG8EtaUdYZ1Jtan+Xe6wpV4BGi8qiQt2Z0xbji1j
	nujEsGN6Xm9NN5MUEubkZnYFzFHgQAe5vTjRq/wYonNzdn2D5NgoWwbB50HxjkrCpqZ6AzUJTIh
	aLWk+qH3CVUpMNxPOgu1XUFnVQwG+TNRjSnG4fRFufGdtLqTKIbLJ4DabQRb6nT1dq0ti4VnXhf
	TVUEvDaNp8oeD0Ui/kSJuis
X-Google-Smtp-Source: AGHT+IHsnDIYWknvZ46S599IimzZF74o7ha/d+7Cbv/hBrVMIpqV1LTK6TMA9HYQ0QgUHmynIKjrSHRY7rxC6a02QK0=
X-Received: by 2002:a05:6402:27c9:b0:61c:bd9f:723e with SMTP id
 4fb4d7f45d1cf-61d26c3fabfmr4557103a12.22.1756686835238; Sun, 31 Aug 2025
 17:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-7-cn.liweihao@gmail.com>
 <8571992.T7Z3S40VBb@diego>
In-Reply-To: <8571992.T7Z3S40VBb@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:33:44 +0800
X-Gm-Features: Ac12FXwjlx-F7jqLTPXkOkYRV923MnWRyR-cXYRmkjdjk9ub15vW_5_Mbgck2YU
Message-ID: <CAPEOAkRpuOOVXwDDha+990znhh0-PZwqa=F=mibGkJck5rgZ_w@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] ARM: dts: rockchip: Add D-PHY for RK3368
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_173357_237608_5C1EE930 
X-CRM114-Status: GOOD (  14.78  )
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

Hi,

This phy is a MIPI_DSI/LVDS/TTL combo phy.

maybe it be better to use dphy: phy@ff968000?

Best regards,
WeiHao

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:06=E5=86=99=E9=81=93=EF=BC=9A

>
> Am Sonntag, 31. August 2025, 12:48:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
> > trasnfer rate of 1 Gbps per lane.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3368.dtsi
> > index 0e47bf59a..674a3676d 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > @@ -884,6 +884,20 @@ display_subsystem: display-subsystem {
> >               status =3D "disabled";
> >       };
> >
> > +     video_phy: video-phy@ff968000 {
>
> I think the node should be something like
> dsi_dphy: phy@ff968000
>
>
> > +             compatible =3D "rockchip,rk3368-dsi-dphy";
> > +             reg =3D <0x0 0xff968000 0x0 0x4000>,
> > +                   <0x0 0xff960000 0x0 0x4000>;
> > +             clocks =3D <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>,
> > +                      <&cru PCLK_MIPI_DSI0>;
> > +             clock-names =3D "ref", "pclk", "pclk_host";
> > +             #clock-cells =3D <0>;
> > +             resets =3D <&cru SRST_MIPIDPHYTX>;
> > +             reset-names =3D "apb";
> > +             #phy-cells =3D <0>;
> > +             status =3D "disabled";
> > +     };
> > +
> >       hevc_mmu: iommu@ff9a0440 {
> >               compatible =3D "rockchip,iommu";
> >               reg =3D <0x0 0xff9a0440 0x0 0x40>,
> >
>
>
>
>

