Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5125C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=; b=bJRAOSc0U1LB+KetVGiGrb8sHl
	BpH2cORp8+8ptQLSRYs+1d3W8YOyNTN/XMMh1yJMIkO/ylsyAQzm4ByCsFd5h7Im4ed2gAM1n7AQM
	gjamJHU66y7sq/SWRJNCDmd5bY4imJt+YkcoFhMj5OgZj9bFCIv752ifl+ykB89i7H1EF2nHKkIKU
	ZFMbh+XFyil/udQ9UctFCXpAoWXFuX8z8QSyhU90/s44yEKp4iXgLCfEnZKMdMuxbsY1eNjXAPa3K
	TLzdR3vuNhjlI00q6C2UntwUiG3AZc1oD1bd96vn91SLXtR0u8Y2MOF4vDc+Muc+FR1xorGC87oBY
	6KGB1krQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aQs-000000083YB-2fiB;
	Tue, 29 Apr 2025 02:10:50 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aOw-0000000839h-1lLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 02:08:51 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b03bc416962so3875605a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 19:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745892529; x=1746497329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=;
        b=j6cBtDzSG4y2VPNKbhbq2IIhT0x5TTLbmqiCSnn2gZI0aeOENMNh97CV2uEVSXr5nJ
         aKsOYuiKYKuhzWW2Xsg/bEJXmf4WVaF8xFcWReQ7fU1r57c1OEqICLBbGC1Fhb/h7AUQ
         EOFGYjcNkM2+bK6S6eq8G2F2KSeJLr7vOJlB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745892529; x=1746497329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=;
        b=GjNEl7w6/hAV/dClAJGYbLfSeAdY3dhrJHiYrn+zDEvY8UChOOJYFAR8FrYM4KZUkI
         0ggkwwmRUpe6A6fRcn+uGXaf0LDleTV2GK0J2vZXruDLbt9RTSmbjm4q/NVGvDSx6xSK
         hVNVV5wMIsJdlmSXz8o6vCUL2zYLT8iNZxoY4NcxOhlYf4i+Gd6sB6roW9hpo2760Sn8
         rVU7Hmesy8UR3HTGsi/QYmrIS3R2hQTC+aukQe60XMhgKXZ9W/9TlKZLXuob/bpm8w5y
         NqnKPRDh6LjeUmseE84+SM9Pzwjcu8UHxiwH99EROfVmHC8mJd2Hd3ompfcEeTJklASR
         iHtg==
X-Forwarded-Encrypted: i=1; AJvYcCUaHxGKK+saQNKv5Te+trQRdFE9V88509h7WbNw5kxLDI1sl1Mm8dxTxdK+ggUAfcCzAhqZyDKkyWFcsLpfpbg5@lists.infradead.org
X-Gm-Message-State: AOJu0YyUcOiJf5SqviiTL7AsIOL80sGJecCaWyGiT8a61Vp+Tps7GXD9
	rQIMkv2GJjNOfHEdnOI+qyKxTcACaZuJQoHM98mB6EtlVtJg00ax+49RZW0vAwgH9xP+sfu3glM
	LVF69cmrnXQgGTixZnTEt5muqiO5rtAQlGwrnHw==
X-Gm-Gg: ASbGnctUhab0WJR5nS29D3ERfq/dN1k968MeooCDWmaTtTLJnSrOcayET/HDskNELZn
	BEJCLDc8xBFBBle3mk/9S6R+gsBMPIIbY+k5lQND/JDrV7RNnsTBrTiTBU6XYiZ59aQPCvpVPqH
	rf/zhpi34zNm8H5qNAHS0tPxCWPW/ar+YrmAx0h7fAoVO+Lnn3sloUGMI=
X-Google-Smtp-Source: AGHT+IHCPRZOUIvFcl8lsvnwfO+9RLYKzmV+Oh7P+gkUHVtVP2yGSVFYEv1JALFXz/61Bb1nArjTw0CpObv33VgEMCo=
X-Received: by 2002:a17:90a:c88c:b0:309:ebe3:1ef9 with SMTP id
 98e67ed59e1d1-30a013070damr20213230a91.12.1745892529578; Mon, 28 Apr 2025
 19:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
In-Reply-To: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
From: Da Xue <da@lessconfused.com>
Date: Mon, 28 Apr 2025 22:08:38 -0400
X-Gm-Features: ATxdqUEtIxVd1qwCtsriUSTxo6iPaZohjrD-HjaaVAgl0Wkxs3YcV-UpkMno1rk
Message-ID: <CACdvmAi9v=DFqSOjWdeAabNC1QECs0U3yHM4LZ=Gtthn-pUMNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_190850_460415_28BCECA7 
X-CRM114-Status: GOOD (  24.92  )
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

On Mon, Apr 28, 2025 at 3:50=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/04/2025 22:31, Da Xue wrote:
> > GXL I2C pins need internal pull-up enabled to operate if there
> > is no external resistor. The pull-up is 60kohms per the datasheet.
> >
> > We should set the bias when i2c pinmux is enabled.
>
> So, yes in some cases when the on-board pull-up is missing, the on-pad
> pull-up is required, but the whole idea was to only add the pull-up prope=
rty
> when needed.
>
> So I know the real motivation is again about the 40pin headers, where
> some applications don't add a pull-up and still want to have i2c working.
>
> So my question is: why can't the pull-up property be added in overlays ?

The issue is the property types. I wish the bias was bias =3D <PULL_UP>
instead of bias-disabled, bias-pull-up, bias-pull-down since we have
to hack a bunch of /delete-property/ in the overlays. A lot of the
merging tools ignore /delete-property/. This is a convenience patch
which may cause push-pull times to change by an insignificant amount.
We have been carrying this patch out-of-tree for 5+ years without
issues. I have not seen any design on GXL that had a PU for I2C.
Externally, I've seen threads of people asking why I2C does not work
on other boards.

>
> Neil
>
> >
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/bo=
ot/dts/amlogic/meson-gxl.dtsi
> > index 2dc2fdaecf9f..aed8dbfbb64d 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> > @@ -214,7 +214,7 @@ mux {
> >                               groups =3D "i2c_sck_ao",
> >                                      "i2c_sda_ao";
> >                               function =3D "i2c_ao";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -576,7 +576,7 @@ mux {
> >                               groups =3D "i2c_sck_a",
> >                                    "i2c_sda_a";
> >                               function =3D "i2c_a";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -585,7 +585,7 @@ mux {
> >                               groups =3D "i2c_sck_b",
> >                                     "i2c_sda_b";
> >                               function =3D "i2c_b";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -594,7 +594,7 @@ mux {
> >                               groups =3D "i2c_sck_c",
> >                                     "i2c_sda_c";
> >                               function =3D "i2c_c";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -603,7 +603,7 @@ mux {
> >                               groups =3D "i2c_sck_c_dv19",
> >                                     "i2c_sda_c_dv18";
> >                               function =3D "i2c_c";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

