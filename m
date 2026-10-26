Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y4yEKbQi;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aXiMSi7I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=; b=y4yEKbQi11WwoT
	19Yu8thPaeLlDo51i331iQxDi7auFN9GEzXZWSNLfVaKR+8K3HLCireNN/X+3YTv29Mwt6S0g5Zu/
	c0g3SuJm6QCctyXghsE/fG5trHBBJmJPQJkGE8a8DiYfDJdUubFUcmdeu+OgforA1AmP8PPuxws0I
	nUipHq2ttnHHlds7UEQpjRQ8jQp8vwUDCLlJCbM3oUKVTPc242lh1CDeRsU6aujbuWi1j/3kGlq0G
	6xBpn4Bho6/16bdQYEY+/y/lzDyKMFipzvpHA6MOujqd+fwp/H877AwVR3DuoD/m3czdvRaC7EEL9
	X5eBf5cQEpOavdjfcHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG7x-00000001xLe-0YJH;
	Mon, 26 Oct 2026 08:32:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG7t-00000001xKV-2xxc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:32:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1325978f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003535; x=1793608335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
        b=aXiMSi7I6QCdmHa2+gj60QU+xPc+njNgrEqIqBubKF+eq2f+doRmmm97UoXwS9ZsYS
         XKcUf/xtiAZD1pbTG9mBRNommFUh54aabqgcU5tpnvkJCptkJZp9nVVVo5yeKBZ7dKRU
         F7OqXx9gRM2yS4PgUrjVUEDfmhvq+h7Cg1V+o3gQIXCSkQpXLq1mYyPi/xPouYbgqWcw
         ktdO751XMFWDztuFzcRnkWl6VeNi/QZpywHEcRTHGDHb6z7zfNAUCy3MNghLj2ISdB0Y
         LmzUCstHGVNnQu5ooLmfCkJWQWiGszJT4gyMrF0+RdckMALPI5v80l6d/LbngRCqcTMk
         YxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003535; x=1793608335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
        b=RBaKfpCjk67iajUeFqHgmHuKOwEKkeUdlySSglW5tCNl/tTVFIfgddAx86Cgg3meme
         /16vb0TOvTMLUPTFTtwY6UpqLRlyvcjdJzaYKk9/1NKdafl+Oa9NiyjcmQt0iy+G/j9R
         ML7UOGkAqgrkhPlEflkg1cRUWbGc+GUgSWFqCtRU5ikpYAm6fBpaYuUqM0NKiGEBqpqx
         qNoAxv9t4TavdjpUJwpnn5HWKs8k0iwVjwx6OdMkksPbF+WK/qEETbbOVtsCqPW9xX8w
         TnZEZxbLmGCJ3lIUoI9gaUEYW3+9bpI2Kxz1NYLP9EJ+c6tBYPJW7D0nGHX2oLjTtugJ
         hixw==
X-Forwarded-Encrypted: i=1; AKwUvByAccxLa6libdyi9EQKbHatD8L7AUKYelUM3iYoQvLvJZAriasn61oupIMuJiEnfw8xhkX+xOtvfLr8Xsy06nnf@lists.infradead.org
X-Gm-Message-State: AFq9FYITDj3+i6sNMXrYCmDbg/830Ue5qv2o8gCCP3I91yTADhVwKWFu
	TRs5mKZdpMowLz6X4MjsEHDIL4HgzKs43snPoL6TaQCtxyl5icIFpbJ30kWIDOGBr84=
X-Gm-Gg: AYBFou2fAwKBZcVRaWCx0yL6va3rfGxGpIriFQhac/NWBL6VdRdrDvlyoSdIGDBdkrH
	AGvDS2XuEkdyXVUE7dDmUsnjLq3s/AaPnILPeu4XB6hK3HqiIAPKPCH+PNwaKbpqwoi6tFs3/rU
	DyIXLYGHc08yAVmm2sCe7ldmxGjoeBPpQrlhzjlVKYGivv2UmmsHNbHQ5lvVwbIU4gqS2r85jBo
	IyKf8AtILofljuLvNQ7XSeDDGa52MTUTsYNsq4A1wH1f4XValUk49eGBUYswtZaStGBVrq9aMTK
	0wElIslT6lky0Xwm04+rqqqnBkHLVm4HjIz9xyPLXV4dtkI2RnPEuO/c84XE3Ulj5s3KPmG+6w+
	i8dRUvibyQsD9rvjUDSUcyf937wmkc8Q+461PmSDgYgS+FTcMsGGVwfQbRRtGDKF1Vz7kzJRyou
	jCz4fizBLe8d0/7sVf6tGP81tijsplCsGPoNc46lARpUbQvdXhKvZztDN6dWyot3RlMoJap5/bL
	ffcVCqF1a42CIZXFYOp/kKhrvoxf6gRHCi3qR7TuCZSNmoyOWF8LCMzt4Sl91bKZaG9Noz+dcHy
	bgZUUs4GnCbl9MjGai7+
X-Received: by 2002:a5d:4fd0:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e3eb9fc55mr7018739f8f.46.1793003535324;
        Mon, 26 Oct 2026 01:32:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm15026669f8f.16.2026.10.26.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:32:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] clk: meson: s4: keep the PWM clocks off vid_pll
In-Reply-To: <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:32:13 +0100
Message-ID: <1jpkwwkgky.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_013217_784587_9FFDA585 
X-CRM114-Status: GOOD (  27.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On dim. 25 oct. 2026 at 20:18, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The PWM driver asks the clock framework for the fastest input it can
> get (clk_round_rate() with roughly 0xffff/period), so on S4 every PWM
> channel ends up parented to vid_pll, the fastest input of the PWM mux.
> vid_pll is derived from the HDMI PLL and is reprogrammed on every
> display mode set, which silently changes the period and duty cycle of
> whatever PWM runs from it.

While I agree with the general principle of the change,
"The PWM driver asks the clock framework for the fastest input" is a
fairly inaccurate representation of what the PWM driver does and it gets
repeated. Please fix this.

You've disclose the usage AI, it is great. It would be even better if
you could summarize its output a little bit. This is very verbose
for a simple problem: vid_pll is dedicated to another usage in general
and should actually not be provided to PWM devices, eventhough the HW
allows it

>
> On boards that use a PWM regulator for the CPU supply this corrupts
> the CPU voltage: on an S905W2 board vddcpu read 699 mV at 1 GHz and
> the first cpufreq transition hung the SoC. Boards that feed the
> 32.768 kHz low power clock of an SDIO wifi chip from a PWM see the chip
> intermittently fail to enumerate ("Failed to initialize a
> non-removable card").
>
> Drop vid_pll from the PWM parents and keep the remaining inputs on
> their register values with a mux table. xtal, fclk_div4 and fclk_div3
> cover every PWM rate in use.
>
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peri=
pheral clock controller")
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  drivers/clk/meson/s4-peripherals.c | 38 ++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-pe=
ripherals.c
> index ba41fcd90588..329cd526749e 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -2588,51 +2588,65 @@ static struct clk_regmap s4_spicc0_en =3D {
>  	},
>  };
>=20=20
> -/* PWM Clock */
> +/*
> + * PWM Clock
> + *
> + * vid_pll (mux input 1) is left out on purpose. The PWM driver asks for=
 the
> + * fastest clock it can get, which made every PWM pick vid_pll - and vid=
_pll
> + * is the HDMI PLL, reprogrammed on every display mode set. That silently
> + * changed the period and duty of whatever ran from it: the PWM CPU supp=
ly
> + * (a cpufreq voltage change then hung the SoC) and the 32.768kHz clock =
of an
> + * SDIO wifi chip (which then failed to enumerate).
> + */
> +static u32 s4_pwm_parents_table[] =3D { 0, 2, 3 };
> +
>  static const struct clk_parent_data s4_pwm_parents[] =3D {
>  	{ .fw_name =3D "xtal", },
> -	{ .hw =3D &s4_vid_pll.hw },
>  	{ .fw_name =3D "fclk_div4", },
>  	{ .fw_name =3D "fclk_div3", },
>  };
>=20=20
> -static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +#define S4_PWM_SEL(_name, _reg, _shift) \
> +	MESON_COMP_SEL(s4_, _name, _reg, _shift, 0x3, s4_pwm_parents, \
> +		       s4_pwm_parents_table, 0, 0)
> +
> +static S4_PWM_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9);
>  static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25);
>  static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9);
>  static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25);
>  static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9);
>  static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25);
>  static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9);
>  static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25);
>  static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9);
>  static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25);
>  static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
>=20=20
> --=20
> 2.56.0
>

--=20
Jerome

