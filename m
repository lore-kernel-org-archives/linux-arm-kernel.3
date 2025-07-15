Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78DEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xxzs0W/OWz7Yf0jqBLWNHPj02B/wiWEvkccSHlPTKps=; b=n5a3IP+x1ZlBn7Mk9fI5sApVJH
	epGDLFWTjhBh+pyQsWoGW4FobOqUsMb2jdv84H1aQ9uhDaWrKW8RQ3tSvIVL22wryaoAl+TgcjRPW
	T8Z7AKAPOOrlBnBYnd5XISv5Nq5pEfLLDpYiJAHd0AqJVcvSpSbTwJUc50ycl6odSNnkZ9UViWLpa
	u3e9qodQYFe2JM5rU/8JoVogl+cpyrinwVfO5qa5ihPBG2mdw3zIBeefMxVq7J249x9EpGwQvpPwM
	VHZZs13eq2kftjwq6SxNF/c0EzMJnM8Xot7++WY+MZ+8hWDr6b5V62M0gUXPng5dKjVQnSvShkzOA
	Almm6O5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXit-000000043d5-1Oqx;
	Tue, 15 Jul 2025 04:56:59 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXfr-000000043Lx-0RqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:53:53 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6051653a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 21:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752555230; x=1753160030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxzs0W/OWz7Yf0jqBLWNHPj02B/wiWEvkccSHlPTKps=;
        b=hQcn/1R3vqJGFSJJw6Y4nVVal6uHue5evh4n7tobXjyB07ciwH3/N6t3e6lG1H1Wh1
         cCQVSMc6FhPISTLWy+tUO2QtjCpH7sYiIsfUmI4Xgbl7KWcz8+eAV7AjrIQyBDCLwRlQ
         dzdmOaJPhruI/YcwH+XiPy5lCSUx3y04l5bDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752555230; x=1753160030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxzs0W/OWz7Yf0jqBLWNHPj02B/wiWEvkccSHlPTKps=;
        b=pe1d1QGUeJoonbidvsFMmmYKGcZr6eufHz+JUpCHFXzqBE3uxY3DJO0/m+EdadXhLE
         GCwBExjAYXLQi2+4X+PojFYX0CXZb4S6YK6qpTRdRb4U5MhARGZIM3ixruYwNbXOdDFk
         3cOBpnG3tIHiGR1ATAWgrPjnl4o17ktX6AWo8F0I2Wbt1oWfr34e+i/tXpXqJaP8wF3E
         UehzaJOR5BAiHufKgBTPJ7dNCm7qnS5qvXIP128G05Ru1ruL7lCdkwwKJuBEcVhIm7Fd
         JIpJu64jjKXtQ8bahvfIsUYxU6htkispglEP/ZXTgpxl84fkSuI/0zziUWvqkdCQeFww
         rWsg==
X-Forwarded-Encrypted: i=1; AJvYcCXRMVxeeUj90NSs7F2tZbFpKN4lDlz4aMrn7pY3im8CLw9Dh+6Be6sJ+NmCvfvlHRg/nqd4LDxu9bi7xB1xLDDB@lists.infradead.org
X-Gm-Message-State: AOJu0YweT468HzbBoQNSAoTNIf0TTh76B6Q7TPo6YA8504y/wV1pHOYd
	by7O/EgibfghY85rdFlBDiXcB5VpSa+eiKpMQ7JDDYwa2uOVPgSGxNR32VWDJHNUUgvF8KSMsWH
	sc8LKquT5LdNkyelu+U1Wmm4mG9sqW+SyBsqErGRv
X-Gm-Gg: ASbGncsnXDPkHcoy6ky/gkZj7K9Kl7Sd4Ma7kqoh4NpvAjWLm8a4YktjWs1R8uUN953
	d3l5w79QV3cSEijhJDmxafbtPwdnQWrRRfeapbCfiLXNwdb6yx3ySYPrB8oSE23inM1vVAKGcCD
	Y3DSM7B0Wcal4UV5X2nIK4kkTxsWFCBzPiCRSp/I7ahe6nBQjXv5rs7Jf4JGAtj1eHPuCmpo6hy
	MyvXDGb0609dlHSmKnb3cKVv/87GpkuJIM=
X-Google-Smtp-Source: AGHT+IG13a6ecncroinU2vqvFQBBadmDPhYtdK1UZWoU/n9vA+3Pboa6z8WAwc0a6SnJwk68A3zzrOg0RmDHIaFkD7I=
X-Received: by 2002:a17:90b:5790:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-31c4ccf06d1mr28107359a91.24.1752555230224; Mon, 14 Jul 2025
 21:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-13-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-13-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 12:53:36 +0800
X-Gm-Features: Ac12FXwBpf4BInit_x1dzKLocGTtxcJOU9mSygx6AUuM__BSzt1RWFNKQnx5RpI
Message-ID: <CAGXv+5Fz4qBO-nPJu-bq0NEJK+md9XPJPPbd46TFCMS8=LQpAA@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] clk: mediatek: Add MT8196 topckgen clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_215351_212423_795B01AB 
X-CRM114-Status: GOOD (  22.67  )
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

There's a lot of duplication in the driver.

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8196-topckgen.c | 1257 ++++++++++++++++++++
>  2 files changed, 1258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index b1773d2bcb3d..bc0e86e20074 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -160,7 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) +=3D clk-mt819=
5-vdo0.o clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/med=
iatek/clk-mt8196-topckgen.c
> new file mode 100644
> index 000000000000..fc0c1227dd8d
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c
> @@ -0,0 +1,1257 @@

[...]

> +static const char * const p_axi_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d8",
> +       "mainpll_d5_d8",
> +       "osc_d8",
> +       "mainpll_d7_d4",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d7_d2"
> +};

The next two lists are the same as the one above. Please merge them
together.

> +static const char * const ufs_pextp0_axi_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d8",
> +       "mainpll_d5_d8",
> +       "osc_d8",
> +       "mainpll_d7_d4",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d7_d2"
> +};
> +
> +static const char * const pextp1_usb_axi_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d8",
> +       "mainpll_d5_d8",
> +       "osc_d8",
> +       "mainpll_d7_d4",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d7_d2"
> +};
> +
> +static const char * const p_fmem_sub_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4"
> +};
> +
> +static const char * const ufs_pexpt0_mem_sub_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4"
> +};

The next one is the same as the previous one. Please merge together.

> +static const char * const pextp1_usb_mem_sub_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4"
> +};
> +
> +static const char * const p_noc_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4",
> +       "mainpll_d3"
> +};
> +
> +static const char * const emi_n_parents[] =3D {
> +       "clk26m",
> +       "osc_d4",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "emipll1_ck"
> +};

The next one is the same as the previous one.

> +static const char * const emi_s_parents[] =3D {
> +       "clk26m",
> +       "osc_d4",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "emipll1_ck"
> +};

[...]

> +static const char * const spi0_b_parents[] =3D {
> +       "clk26m",
> +       "univpll_d6_d4",
> +       "univpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d6_d2",
> +       "univpll_192m",
> +       "univpll_d6_d2"
> +};

All the SPI clocks have the same set of parents. Please just have
one list.

[...]

> +static const char * const msdc30_1_parents[] =3D {
> +       "clk26m",
> +       "univpll_d6_d4",
> +       "mainpll_d6_d2",
> +       "univpll_d6_d2",
> +       "msdcpll_d2"
> +};

Please merge the two msdc30 parent lists.

> +static const char * const msdc30_2_parents[] =3D {
> +       "clk26m",
> +       "univpll_d6_d4",
> +       "mainpll_d6_d2",
> +       "univpll_d6_d2",
> +       "msdcpll_d2"
> +};
> +
> +static const char * const disp_pwm_parents[] =3D {
> +       "clk26m",
> +       "osc_d32",
> +       "osc_d8",
> +       "univpll_d6_d4",
> +       "univpll_d5_d4",
> +       "osc_d4",
> +       "mainpll_d4_d4"
> +};
> +
> +static const char * const usb_1p_parents[] =3D {
> +       "clk26m",
> +       "univpll_d5_d4"
> +};

The next one is the same as the previous one. Please merge together.

> +static const char * const usb_xhci_1p_parents[] =3D {
> +       "clk26m",
> +       "univpll_d5_d4"
> +};
> +
> +static const char * const usb_fmcnt_p1_parents[] =3D {
> +       "clk26m",
> +       "univpll_192m_d4"
> +};
> +
> +static const char * const i2c_p_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d8",
> +       "univpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "univpll_d5_d2"
> +};

All the I2C clocks have the same set of parents. Please just have
one list.

[...]

> +static const char * const tl_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d5_d2"
> +};

The lists for the tl clocks are the same. Please merge.

[...]

> +static const char * const ssr_pka_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};

This one and the next could be merged.

> +static const char * const ssr_dma_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};
> +
> +static const char * const ssr_kdf_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7"
> +};
> +
> +static const char * const ssr_rng_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2"
> +};
> +
> +static const char * const spu0_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};

This one and the next could be merged.

> +static const char * const spu1_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};
> +
> +static const char * const dxcc_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d8",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2"
> +};
> +
> +static const char * const apll_i2sin0_m_parents[] =3D {
> +       "aud_1",
> +       "aud_2"
> +};

All the audio interface clocks have the same set of parents. Please
have just one list.

[...]


Thanks
ChenYu

