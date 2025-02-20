Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA1C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtfmfrXV4Fenqpt6KK3zaAtg3JmCzHplb9SYG8vsTp0=; b=G58ymugW915evrodh1X89F+jU4
	7SW1pnl0I3qGXfmE0eDBdFRsbePbNUI7+uIijywIBW9LK/OC7T1OjvW4B5acdUo30E7X4qhoYGVY0
	IcmeCGqBoq/ZWq9R9PbMDPepwAsVlmvCdUe90w80Nt4YWgR8cW5yakEccnyORiAaZVp9RwzTuXo4s
	z3Wj88MPuyILBtVdoBQnPnJOwC8nd4FaIcysGEEyyvmjty+QGyj9NQF4V9f1iB20iKo19Il7e2ibe
	nW/xJLzPFMZYG+wOcHluBrNQJZuyyzayhXgXSCFJIMQzm2hksvSKG9K/Mfn/F5IelmGT8uZE/3xi8
	wFJ1+WRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDAO-00000002n1K-3t5o;
	Thu, 20 Feb 2025 20:29:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlD8t-00000002mm9-2puM;
	Thu, 20 Feb 2025 20:27:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-439950a45daso8966905e9.2;
        Thu, 20 Feb 2025 12:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740083249; x=1740688049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtfmfrXV4Fenqpt6KK3zaAtg3JmCzHplb9SYG8vsTp0=;
        b=aCaAZWc7txPepAmaqf+HDZ/d5WWfbS6C8HYd8bKRVrKLJ4HMyMUCHEX0hed/ZXXlZB
         WHAFZieur+iQORtyucOjHhXrRZXhULykdc13RXcK/R8XQgu3ekln68fwj5P1TozaaJP1
         l7j7zp8TqDBiEt03j/PPfZyhIuNdVmE4zn1KCF2c+i9CUzJX8ygCnReOpXfv52K51cz3
         mA2sreunPUcXu/dUO4J2TqMpQBpY+YWmHnz8izp+OEPvDejrjTbiPTbt9foKq8OL+u1B
         843Ul2fdGQ/yFhLZlpSH1S+mQMfwzrDInz3JkAE0aMAwcsSCCwJIT4mT1bxyng1tNGpx
         xAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740083249; x=1740688049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtfmfrXV4Fenqpt6KK3zaAtg3JmCzHplb9SYG8vsTp0=;
        b=iLZZyagDTFGK+SPVlAufghwfwckdlgt+EFGlWgr3nUFkZ/b+I+9JKou+jha1+cDnSX
         mlO2ovP6+lmQRBHzuheWpMpiQXYY80gxHU3yW6g16WC8bEChP4SIb0VT8unqCoezyIuo
         ZLEsTbfD/6g7lZfzh2aveyPExrhXSrVZh2ICeniT1Z3hxZ31M8/8h2StG8gTiZLvDQ7i
         VhD0wnstIPHJjpuO06XyLzW65n8KtbLS7tblsS0NvfxFEhJVmApsLwmJpHlId9xBbOJq
         VuUoTSin1u8zbVlspZGFOV3gejmzeFayAWJ1Jas3YdniYFnUBo4lg95icWREv8Q+7BIh
         yrFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVElDgKkfFY6omn0KLWeUNZE6vqO5Udv96fvtwPbPQLAfePoWZTDYmyMeATp6M94mXalrOgUci9wwRzoKjvQ87U@lists.infradead.org, AJvYcCVzh/lRV7DxsQI70PBhQZ7VYIC5Sswzddjx59DO59dToGK5UXK/E0mipNeFctCmcgkM3jqWpziZuWv4@lists.infradead.org
X-Gm-Message-State: AOJu0YxRtbdanrcC36umCtZJztUw52FzM6Trtk3CCouFC4fybSFMgSv5
	IwZMTaBQuvxFA1ztFHg6heQp5uy+Y4G9Jt3smM03UbdFPk8Pc0DO
X-Gm-Gg: ASbGncs1IAzIPC37wluigCzb7+OOH/2GRvpH5qci5t4BttriZd0i0A9IlCaM3BUZOA2
	BIQy+hbjtwsbWK8Pp28Td2UfKugP7KP3E1/Trz5Hb/0+ldOMS22XggWHrWIpNR6C9Yq2/D/uoQU
	DjbM1yScDeS2p1Vdp7rI/8cjmKW8SvEmm5vqQk68BZ5LLNt0lv6DCxyxpoxUIoCbGl6THnPBuDR
	XQMn17RR+SlbVWsw+MiQX2Al2hhgXZnYAz2Uv3sN0EfWVfTRLLoGirsuyRWm0pFEhcE+fOZUTGv
	CHka1hcgNrPnGxDN7eEbSSHr5Ncj4Rt9vJ+0z8ObHuo2OGiiow/TYTdjx9TdYcfcBGI=
X-Google-Smtp-Source: AGHT+IECii+tVv+IZA8Kwcb9HLreQ7WkQqdHkR9yh3R3Vri6Dsiv8yRmWFnRoRF5/CwPCmIDOfBbOQ==
X-Received: by 2002:a05:600c:3b93:b0:439:96b2:e9b with SMTP id 5b1f17b1804b1-439ae1e6a3amr4585785e9.9.1740083249349;
        Thu, 20 Feb 2025 12:27:29 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b824dsm250156575e9.34.2025.02.20.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 12:27:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Philippe Simons <simons.philippe@gmail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH 1/3] phy: don't let controllers change vbus reg
Date: Thu, 20 Feb 2025 21:27:27 +0100
Message-ID: <2261426.ZfL8zNpBrT@jernej-laptop>
In-Reply-To: <20250118102207.9339-1-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_122731_714517_D9B26850 
X-CRM114-Status: GOOD (  19.74  )
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

Dne sobota, 18. januar 2025 ob 11:22:04 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> Allwinners SoCs share phy0 between the MUSB controller and HCI controller.
> If we let these controllers independently power on the vbus on that phy,
> peripheral mode is dangerous because HCI never power down the phy, result=
ing
> in 5v being applied against the host 5v.
>=20
> Override power_on/off for phy0 in that case, and let regulator be enabled=
/disabled
> based on id_det only.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>

Is this fix for some observed issue? If so, Fixes tag would be appropriate.

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index b0f19e950..24fbabe7a 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -465,6 +465,10 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
>  	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
>  	int ret;
> =20
> +	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state =
*/
> +	if (phy->index =3D=3D 0 && data->cfg->phy0_dual_route)
> +		return 0;
> +
>  	if (!phy->vbus || phy->regulator_on)
>  		return 0;
> =20
> @@ -493,6 +497,10 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
>  	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
>  	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
> =20
> +	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state =
*/
> +	if (phy->index =3D=3D 0 && data->cfg->phy0_dual_route)
> +		return 0;
> +
>  	if (!phy->vbus || !phy->regulator_on)
>  		return 0;
> =20
> @@ -573,9 +581,21 @@ static void sun4i_usb_phy0_reroute(struct sun4i_usb_=
phy_data *data, int id_det)
>  	if (id_det =3D=3D 0) {
>  		/* Host mode. Route phy0 to EHCI/OHCI */
>  		regval &=3D ~OTGCTL_ROUTE_MUSB;
> +
> +		/* Enable VBUS reg */
> +		if (phy->vbus && !phy->regulator_on) {

I don't see any "phy" variable in this function. Also, you should add same
protection as it is implemented in sun4i_usb_phy_power_on(). Skip enabling
regulator if:

sun4i_usb_phy0_have_vbus_det(data) && data->vbus_det

> +			regulator_enable(phy->vbus);
> +			phy->regulator_on =3D true;
> +		}
>  	} else {
>  		/* Peripheral mode. Route phy0 to MUSB */
>  		regval |=3D OTGCTL_ROUTE_MUSB;
> +	=09
> +		/* Disable VBUS reg */
> +		if (phy->vbus && phy->regulator_on) {
> +			regulator_disable(phy->vbus);
> +			phy->regulator_on =3D false;
> +		}
>  	}
>  	writel(regval, data->base + REG_PHY_OTGCTL);
>  }
> @@ -603,6 +623,12 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct w=
ork_struct *work)
>  		return;
>  	}
> =20
> +	/* Disable internal VBUS reg if there is an external VBUS */
> +	if (vbus_det !=3D 0 && phy->vbus && phy->regulator_on) {

Ideally, this should never happen.

Best regards,
Jernej

> +		regulator_disable(phy->vbus);
> +		phy->regulator_on =3D false;
> +	}
> +
>  	force_session_end =3D data->force_session_end;
>  	data->force_session_end =3D false;
> =20
>=20





