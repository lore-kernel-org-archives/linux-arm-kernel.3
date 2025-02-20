Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1206C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj7ytsnbant7AQal2MJqRPTY52l29Np/6crP9TfZEBc=; b=TjzilfmscE+tRrdIo+za/RcpUX
	dm+3Kr9LK5uc8XbPQhd85kmtTW2FIPhgloWksJhDhLfE56wP3tXnrL9Shsh8WYFppbEAvpPbm0FCw
	5GdgFQ44pzNAckiKqovBsxrmqFm5uVJ1TBfhcUcei5Qkel2lcpIfM9pygNmAtJgc2bg1Fhg7ix9Qg
	+KfU+wPxxJjLC1FycAzb/37J1tfX0u1LmgFESlYBtNMqwRQxB6ngS0P8lNreDS4kg5pphlvsq1Qbb
	lqA6IkAeI2qk4ddMUSHP1ZzrmAklUy/JIvjFHNPX7aSeXnEMTFGFU4OeVWp601HiL3x6b+g5qkAcq
	wV/c71eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7az-00000001KRG-1VFj;
	Thu, 20 Feb 2025 14:32:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7QV-00000001HMW-07hh;
	Thu, 20 Feb 2025 14:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45A095C5B9B;
	Thu, 20 Feb 2025 14:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1685BC4CED1;
	Thu, 20 Feb 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061278;
	bh=t1YRfXHSR0r4DzbqO4O5hCHBJK6Wk9U+htitk02MAB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pTQJE6OD2Wd1RK/TY96gGa7OLrWKjlapSJ9+hEKgspSGa7NMMEswTg4pLgf5PhESR
	 01sOIB5OdAY2Ax5kGfuICyeMuo20X0kiE7bDMJxqsMWGrj3ZL/AWVoUWu2cFWi8hVJ
	 a5XN0lV5TJiAtfsgShNAePZ/esyekVbL+rn/3tsFVIX1JVbfefTa6rKK1Qq1fuWcXJ
	 N9sXWpJfhUWq1b8mc8pFPrdKogm1UTYmVYfJuSyKs6a+nyEg9M4nnpw9MwGappcGH/
	 hXfj3IVJUVXI9OCIY3wo/BkTwBKDJjU44bCQD8iFNEDV8NRpflFHMkT6Dyu2OmVl2e
	 wIaT4/Y4tTJvA==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa48404207so2059356a91.1;
        Thu, 20 Feb 2025 06:21:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUefj9CL2cIQR+mNJwGttQYsEbT2Yyatomjt6z38f10HmMSn8rY3BBd6+SnTtJihBnXvaWoUvFMAs2yICvrqyc=@lists.infradead.org, AJvYcCXSPNKNbutLYCLqEU9wr19nmvQ7VA1VQr0j5NTATTCwWzdg5A7+6PFR5/f4cwVlLNZorcSe9HWUnPZLzSmlPlu6@lists.infradead.org
X-Gm-Message-State: AOJu0YyORpAsqnscbtTedjAtYemvW0vH0BxWcbzJpKiMCJ1CdGDNTvhy
	e5XB2O0RszGWA19nGyYr51KmuTYMqB49Jl10a3gkkUaKwkETezPa+iKWKN53k6VGyBXNHkuau9H
	4oR/kjvW/CM18/ji8vcsxkxaJAA==
X-Google-Smtp-Source: AGHT+IEM7TeLueuZHPQaOMtrQ+jefGLGWiXk9sVHtvUBeiE5X3S4o44Ic7KtorBRdm5c8t14xyWBYmEyM00igBUqouk=
X-Received: by 2002:a17:90b:2250:b0:2fa:b84:b31f with SMTP id
 98e67ed59e1d1-2fc41040fcemr33893917a91.25.1740061277661; Thu, 20 Feb 2025
 06:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-32-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:22:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8JLpoF4isgm-F7Z6W-tSxkdqACSaHvyARgaPo8PNdWsg@mail.gmail.com>
X-Gm-Features: AWEUYZkuEEgZl0b7vlV6l42zcGpmz08ZpO3TrJPmfidMvCivGVZgPuOu7_J_xKI
Message-ID: <CAAOTY_8JLpoF4isgm-F7Z6W-tSxkdqACSaHvyARgaPo8PNdWsg@mail.gmail.com>
Subject: Re: [PATCH v7 31/43] drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_062119_151280_2C6E3D19 
X-CRM114-Status: GOOD (  16.39  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> If the clk_prepare_enable() call for the SPDIF clock fails, just
> disable and unprepare the clock in the error check branch and
> return immediately instead of jumping to the end with a goto,
> slightly reducing code size.
>
> This commit brings no functional changes.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index bf8cf7fc8c07..2e98a8ed6cbe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1095,13 +1095,12 @@ static int mtk_hdmi_clk_enable_audio(struct mtk_h=
dmi *hdmi)
>                 return ret;
>
>         ret =3D clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
> -       if (ret)
> -               goto err;
> +       if (ret) {
> +               clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
> +               return ret;
> +       }
>
>         return 0;
> -err:
> -       clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
> -       return ret;
>  }
>
>  static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
> --
> 2.48.1
>

