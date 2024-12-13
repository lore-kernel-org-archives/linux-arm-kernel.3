Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC17E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 03:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+sYwNsJPJUz8rFWIUY4qzq/70dIz9Ru6YrTek2NORE=; b=GSMykBbu3oGhq8skgdbOuBaxL5
	Q7+Oy++7uwIz9J2rq+PndtYs7Lft+tmHKFJPuLxPP/wPBuuR+7VFDYZGLuTE/0MZnT1Qbstt82tKk
	NZn6XmPGCxrD/bUNN2k/dV67WSO825BFQckmf7/gVOKKzOESW/hhwFyT9Rn9SKv4IZQYemY585DtQ
	C+cKcbMdd91J42t0A5x4Om6NkkD52ciLuB1tOrfRtrtBjuuhQ6k1Cfg4oakdtMCbXPlLcWom9vFXl
	q+tipzESLZSG0+WMFybGpGLqIjqqz1BiIJgocwdX3suvk5A3bXsrnYLv6iQoJ1SGYQDzz+oD+o5T3
	4dFYrgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLwZx-00000002cPb-1aA0;
	Fri, 13 Dec 2024 03:43:01 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLwYs-00000002cDu-0HSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 03:41:55 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-71e2764aa46so848294a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 19:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734061312; x=1734666112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+sYwNsJPJUz8rFWIUY4qzq/70dIz9Ru6YrTek2NORE=;
        b=a3zlgfrx1/4ktsSJ39q4VXRoF9evhAwekXuv2XYZMoVdAptYtdGIDPbWdxM3k81L1v
         mR+MjD98tAqhY5ys3JHGCyBrLrb+QULX7mOGJpu+LtZ3XGxvWCG6Hk3N/dA/vERGmV2X
         y+howg2r/6Kbdyj+YmHkqQX+RMmjd0ggTYS3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734061312; x=1734666112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+sYwNsJPJUz8rFWIUY4qzq/70dIz9Ru6YrTek2NORE=;
        b=g9Kt5hxP4s30Y+2+wSko4nD41/XeE3tDrgQI8VBnASUD11V1f2gUrWbpswVZuO6S+X
         qhZ4TEH/7CvBlV2CxESOB0HV56AGzggW8zGLKvHMZRuXdAD+06+COYF7zcF3x+/AoshI
         0Gm6Dr76iuHE+ayJ4JzSF/VF0tLoGFtCbw5a9HxbW62dzef0l8kpLgwI02j6517M7He0
         wXuanfCRDKRe9SD9eFyCzu0azr8B5KON+s+e6cUOPB2b9kdAxB8GkE/EYIXTOPoB4e9u
         1zFW1aoLsd0iZPbidUwNrWE/iAO2C3fm8lzyUeiBMXtU00KEYht7+UuPmjTJtmqTNA4X
         APng==
X-Forwarded-Encrypted: i=1; AJvYcCVeKhnFkiutQ/fKmo1H638BNIpmY97hzNcWvfxXq81z3ihkTjITvVn7kBGqK3cRHcu8cMX0lkTHYKVN2rH6p06P@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+tBvXMedTzBidmDIZGamwAmYKroN80ZcBrTnmU+BG/Py0et/Z
	i2OvqFmWZ1jsbIeLlRloWDR3FwfB9HroAkaqA/vHOotZIl0yHv8Gn8VB4K3kXvJ1PAhiWyOzg71
	H/m0HyMahAo/zEb/basLIVCBB2UXiAQQdrG79
X-Gm-Gg: ASbGncuvEnHWAmHHPRurs/tYUQvJcLR6JwIbLSU5dA3/RCAaZ6GFLmlrVCb0IlmPs6r
	j+dPaNyr7Y2TiDZEybd8BkuptyPlhXB+QBEN2zlTYvWbCiDJsC+kh5zMs60ARlmPL
X-Google-Smtp-Source: AGHT+IGb90yBCnvxG+Hi9Pwd10WdldUyRYAIXkWApYl0He7r8e3m4xh8APMlHNhOCG/vLZzWYNxtLLt1WvD3XZbbN2w=
X-Received: by 2002:a05:6830:6619:b0:71d:54cd:5289 with SMTP id
 46e09a7af769-71e3ba9bef9mr613276a34.21.1734061312077; Thu, 12 Dec 2024
 19:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com> <20241212153344.27408-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20241212153344.27408-2-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 11:41:41 +0800
Message-ID: <CAEXTbpfc0ybrvMCuJkKAUwXXTtpZ=vU9MLfU=4CzgdTd-ck4qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_194154_099394_4EE38E0F 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Jason,

On Thu, Dec 12, 2024 at 11:33=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,ovl.yaml           | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 9ea796a033b2..0ace12bbb623 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -36,16 +36,14 @@ properties:
>            - enum:
>                - mediatek,mt6795-disp-ovl
>            - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - enum:
> -              - mediatek,mt8188-disp-ovl
> -              - mediatek,mt8195-disp-ovl
> -          - const: mediatek,mt8183-disp-ovl

This breaks the schema check for mt8195.dtsi, which is currently using
`compatible =3D "mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl";`

IIUC this is supposed to be a RESEND of [1], which actually added a
binding for "mediatek,mt8195-disp-ovl". However [1] still breaks
mt8195.dtsi because it only allows `compatible =3D
"mediatek,mt8195-disp-ovl"` But not `compatible =3D
"mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl"`.

If "mediatek,mt8183-disp-ovl" is a reasonable fallback for
"mediatek,mt8195-disp-ovl", please keep a binding like:

      - items:
          - const: mediatek,mt8195-disp-ovl
          - const: mediatek,mt8183-disp-ovl

Or, fix mt8195.dtsi instead in the same series.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/202312121219=
57.19231-4-shawn.sung@mediatek.com/
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
>                - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
> +      - items:
> +          - const: mediatek,mt8188-disp-ovl
> +          - const: mediatek,mt8195-disp-ovl
>
>    reg:
>      maxItems: 1

Regards,
Pin-yen

