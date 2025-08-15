Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0524BCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=; b=U+GTMR9eJw941mF354EYuVSJzO
	Eei23SJn2IkF1DtFeYKKVt4KoZwUL8Uny5vTMyf534cDUCIB7VSPj2/nSs40+Nhy7VFf7K3oEVKB0
	56zvVo4f/qc1GV17idmDSXuUFa2izLGvdI/2JWTWmr4FuDJGRZKJlgFbkhwF2lEpRCLk3UV1KJlg6
	FXuM7DE0Tbo+TqathwSpdMCu2O3sScyWE8rQcPjASG4XFIi2A0ccpOm5xruQAX7UFwT0gvWtCiqNF
	RPOosb4saD2ysd1UOCu2DHfw/4H79eu7n5qBLU39Qoa3k5xbqkEI+iVjqPkvn9AlpuK0L8ZeDayGu
	0OyqOWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlU7-00000001LLB-17T6;
	Fri, 15 Aug 2025 03:52:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlKd-00000001Jre-0E4B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:42:21 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55ce4d3b746so1993585e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229337; x=1755834137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=;
        b=XRpPgWzo19P5ADLts7nPtazUyPi2mwigs5T12TNiEpfkcYpPWR0oiB1lNzTnrfnxfJ
         9FzCe/IXVblWKqWDmgtsLBUMXy2xj3gROolco7N3aClHMRv/1i6GKiDu8K4x7mhXA3aC
         Rh6p0HZ8+UeoBS3UBOrNpHpDmEzzEAMaq3eEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229337; x=1755834137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=;
        b=Gm2CHUZz72pRM7A7EIgkh5vI3bov9yry5iG+/NULO2TqwIHR0K3TTs1Z2kGZCXXgDI
         M5n0G77OFT1ZG6KL8DzlBMRnUWn0Wo/sgf65h4zC3yBFFR+JP7F7EuFNv7x1EDud0PnD
         IwGiy1MIyuivCLLL9lmYtTzpXIAqJ0U6WcElOcUKN76kh2bpuMXNnHrQzRnVrXi2Dbbq
         OrwD5K56Hzw6vex34ZnSqypvvICTVDvUJTB89k8HFN4C9bN9NKKjxs4ytOhldXyqPkfZ
         KBUv53Rr4h5LuIk3FDtMaSrtXRyEZTz68BZsxv3APuRWB7lMjV8d6NrYivGO1Tv7wvJX
         aHZw==
X-Forwarded-Encrypted: i=1; AJvYcCWlmzrBP+kUzT5JrOGXa6RuyWzsbI/eHCf5aS96KOsqjV1KSY/0/6NTJ4eQW6nGQbu9JAkMvoj68058jDRA/Pik@lists.infradead.org
X-Gm-Message-State: AOJu0Yweeq3pEd89r7Cz857OLqBlsmlEUWB2K9FwRy97ssaCTuFnPsqb
	AqfQO+t2a6Jr554RIHSllZdFLms6nT9Op1KStjxVzRw0a29JwJhzQkDamXT9oyvzBqSC7dwu8pd
	u/sOnnDi4KncSnke+itMFG6vYiD/C+AnCvfVVmK1l
X-Gm-Gg: ASbGncv9naGPg3egEaVM8ivDHBXgaJXB6Mz9AVxs6Yr9jcrco+KwagyolpuVFOpaAEL
	ufsUcN9tbsZNjmmQiFgnRgIoxkVrAlyx2B2N2LOxC9hPmsGNpWsfAYK5D0b86BgU/Hji8Ukghyw
	RzsMDeUKttNlCAc9NM/CBX8QZgDbjcpRaeaiI7NmZxcSZXeQCSElPMeGGuLxfeGldODsz29yryd
	0m93redbKWx+klneCyKB+p4Z5qF9XL3I4/elw==
X-Google-Smtp-Source: AGHT+IG4MHT9xlQA8q+aRzeI2TOWcXJ3eWM4zAEjXRmpGzb6++EC3UVO4G2WwSWQHvNm7WXOwl7nEj1UnHJTPSq8Yys=
X-Received: by 2002:a05:6512:230a:b0:55c:d6c9:38df with SMTP id
 2adb3069b0e04-55ce62cd258mr1499674e87.21.1755229337315; Thu, 14 Aug 2025
 20:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-7-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:42:06 +0900
X-Gm-Features: Ac12FXy2dCuPlbnz3eN56WS0B1sITUha0hiPx6j9G95oILsqMsxPgE4MrEBU4UM
Message-ID: <CAGXv+5GxJs03EcMt0jm-x_fDuy_RtCrnOmyJvVVgAP9O9R6E2Q@mail.gmail.com>
Subject: Re: [PATCH v4 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_204219_101238_A24E60A3 
X-CRM114-Status: GOOD (  18.61  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate instead of individual
> parameters, avoiding the need to add three extra arguments to support
> HW voter register offsets.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++---------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-g=
ate.c
> index 67d9e741c5e7..0375ccad4be3 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -152,12 +152,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv =
=3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>
> -static struct clk_hw *mtk_clk_register_gate(struct device *dev, const ch=
ar *name,
> -                                        const char *parent_name,
> -                                        struct regmap *regmap, int set_o=
fs,
> -                                        int clr_ofs, int sta_ofs, u8 bit=
,
> -                                        const struct clk_ops *ops,
> -                                        unsigned long flags)
> +static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> +                                               const struct mtk_gate *ga=
te,
> +                                               struct regmap *regmap)
>  {
>         struct mtk_clk_gate *cg;
>         int ret;
> @@ -167,17 +164,17 @@ static struct clk_hw *mtk_clk_register_gate(struct =
device *dev, const char *name
>         if (!cg)
>                 return ERR_PTR(-ENOMEM);
>
> -       init.name =3D name;
> -       init.flags =3D flags | CLK_SET_RATE_PARENT;
> -       init.parent_names =3D parent_name ? &parent_name : NULL;
> -       init.num_parents =3D parent_name ? 1 : 0;
> -       init.ops =3D ops;
> +       init.name =3D gate->name;
> +       init.flags =3D gate->flags | CLK_SET_RATE_PARENT;
> +       init.parent_names =3D gate->parent_name ? &gate->parent_name : NU=
LL;
> +       init.num_parents =3D gate->parent_name ? 1 : 0;
> +       init.ops =3D gate->ops;
>
>         cg->regmap =3D regmap;
> -       cg->set_ofs =3D set_ofs;
> -       cg->clr_ofs =3D clr_ofs;
> -       cg->sta_ofs =3D sta_ofs;
> -       cg->bit =3D bit;
> +       cg->set_ofs =3D gate->regs->set_ofs;
> +       cg->clr_ofs =3D gate->regs->clr_ofs;
> +       cg->sta_ofs =3D gate->regs->sta_ofs;
> +       cg->bit =3D gate->shift;

I'd rather see |struct mtk_clk_gate| (the runtime data) gain a pointer
to the static data |struct mtk_gate| instead of doing all the copying.
This is just needless duplication.

ChenYu

>         cg->hw.init =3D &init;
>
> @@ -228,13 +225,7 @@ int mtk_clk_register_gates(struct device *dev, struc=
t device_node *node,
>                         continue;
>                 }
>
> -               hw =3D mtk_clk_register_gate(dev, gate->name, gate->paren=
t_name,
> -                                           regmap,
> -                                           gate->regs->set_ofs,
> -                                           gate->regs->clr_ofs,
> -                                           gate->regs->sta_ofs,
> -                                           gate->shift, gate->ops,
> -                                           gate->flags);
> +               hw =3D mtk_clk_register_gate(dev, gate, regmap);
>
>                 if (IS_ERR(hw)) {
>                         pr_err("Failed to register clk %s: %pe\n", gate->=
name,
> --
> 2.39.5
>

