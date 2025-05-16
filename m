Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7EAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYgEmFkLzngjrAp+Ezttc9ZzVi7JvNzJScbPscBcw1k=; b=S2kp8B7z35sVwz1FdTWTJ+1bYZ
	H9+8XoaykTwJEYm/mLgzzo52dEJ0D0j2dvYmMjw1NcYRuJslwqb09tyXFhKwIyPfV+n99CzsciYun
	JpPdQTnaXJJ6lnE2+pr6f3C3SiX/MREd38Yiums7BcZExTBKzDbzC8FY7vxS+rxbjnO4xCU8UE6Wm
	OTmWSl7JK0c/Yjt4KbXUXeiWg3k8dua+ttkALRiDvqrZXaTYU339s3SCAUmA8Tg3x2rrW4Scmd4GC
	VB62iYNyZQ2Q3v/wyftd6oRDsvf9wVpIgZLxo/EkuUCw+FqeGuTWAkYzrw2a/Gkp0rW1ohJZNHjRG
	61uli56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFs4z-000000036XS-133R;
	Fri, 16 May 2025 10:14:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFs2w-00000003694-0gSN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:12:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7426c44e014so2077481b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747390325; x=1747995125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYgEmFkLzngjrAp+Ezttc9ZzVi7JvNzJScbPscBcw1k=;
        b=MTelkW50o9wR7MyG35v86BtNgTCg1iwfy9ISwRc0PAfd+7VQ4wUjvFJbPY6eELtXnR
         sxJTOyvFVRMb1U15UryNuNEGj9/p2bLOPzDLi8BdafNDfQJiXM/xVswOjRyIrudFhEQ1
         BI6LXN28k7Dya9jES5n9Mqr3Tm2CMyTCdYh/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390325; x=1747995125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYgEmFkLzngjrAp+Ezttc9ZzVi7JvNzJScbPscBcw1k=;
        b=sIjAakUur0OGbA4RexQvbAeJqNS5DyUS70T2vN3Ii8jlBGmkWmRdUSPJKTuJ3w7jqA
         8WcXSdbGq0mxpU9HhmcxDyHYOIwIKjdh9E8UzXhuyh+MMp2FHwArW74AkUKJH1t5Gzr0
         N4+eYxXixGmv+4AvJKdLmLbpb3MOm9wmtYuNymzL8YENG3AyCqYRTYDrZBvc8AOCdc4n
         OEc/hNajdrgTHmRINSuz+0uuYZV2B2WV2Y9zqSOndnFVprjvee7eaUzNjmZTomm5OXL4
         xk2WzJ74sbB6nr1ARs+DLWQN7hEsFcbPtH+RwvhPM4THOosp9qEBiYZs2uN9qdohFEOQ
         /3+g==
X-Forwarded-Encrypted: i=1; AJvYcCUCoG38ikrIhxXhCDfvCmTjrBnlSl/mS0BWcrl6hDCqPef87kkKAd+HzDRfSwelNKbp/tak2gQzG52dErQ0ENoG@lists.infradead.org
X-Gm-Message-State: AOJu0YzedCEaQlmjhSaQlWECwUP895xvJqxzs8SGsopucywTVUAyVTox
	KqftXwp+7YNtsLVr7w7ZS4nRMnu8qPxVwpBLOOhW0eHSPYr/s2Vu+QODTbMqDPFlGzf9ovwRTNU
	00RgDRXt3arxnNEnrVuJeGpT6dDvbaD2kNXi9+JPLww==
X-Gm-Gg: ASbGnctqYJaXiGf+/JDOphAuEiP5AEecL3LAiWw/XwudUMIVO3VTgkfHuECess+te4b
	GZKvERsgJqhTCdgIWUVscrxs9odZKm4I+X8XKMdyQBgVPDjEhhmwS9a2pSGlKZ/1+llcJemt82e
	ZKI4fDkn3DvwAnkWhUMxcmmN8snVMLKao=
X-Google-Smtp-Source: AGHT+IEahdby4WlhFBrzP3TTtfzK9CfL8PPGgJOtXddvjGzliwZ++ZJsevn/WphCoiZBknrEiweCADHFA4Ad2+v0G9U=
X-Received: by 2002:a17:902:f691:b0:223:5945:ffd5 with SMTP id
 d9443c01a7336-231d452d9e8mr35792465ad.32.1747390325218; Fri, 16 May 2025
 03:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
 <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com> <20250516040520.GC28759@nxa18884-linux>
In-Reply-To: <20250516040520.GC28759@nxa18884-linux>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 16 May 2025 12:11:54 +0200
X-Gm-Features: AX0GCFvTTvkYmZgAupUSG_j3MamO3A5m7OZvwC9De3vE2YHP6-H68MG8tQS5hHE
Message-ID: <CAOf5uwmM=+QoaJH8vsUKL-fDab_Fmhxd1d-622pRi-hK=EXk4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable uart2
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, 
	Wolfgang Birkner <wolfgang.birkner@bshg.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_031206_198295_32F58D2A 
X-CRM114-Status: GOOD (  14.63  )
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

Hi


On Fri, May 16, 2025 at 4:56=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Wed, May 14, 2025 at 09:05:34AM +0200, Dario Binacchi wrote:
> >From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> >
> >uart2 is used as wake up source.
> >
> >Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >---
> >
> > arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm=
/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> >index 5c32d1e3675c..fff21f28c552 100644
> >--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> >+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> >@@ -37,6 +37,10 @@ &snvs_poweroff {
> >       status =3D "okay";
> > };
> >
> >+&uart2 {
> >+      status =3D "okay";
> >+};
>
> No need pinctrl settings?
>

We found out that in imx6ulz, if we don't enable wakeup on uart2 (or
other uarts that do not conflict on pinout) we are not able to wake up
from uart4, which is the console.
According to the TRM and the code everything look fine but the real
result it's we stuck in suspend

Here is how we are able to resume.

uart2
echo enabled > wakeup
uart4
echo enabled > wakeup

Michael

> Regards,
> Peng
>
> >+
> > &uart3 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pinctrl_uart3>;
> >--
> >2.43.0
> >
> >base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
> >branch: bsh-202505-imx6ulz_smm_m2
>
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

