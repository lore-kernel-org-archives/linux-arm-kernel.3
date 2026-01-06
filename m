Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1D3C79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqzY4iNsINolRoiuSHq4WTtx5oWDWFvmNdTLgX48a8Q=; b=WMYThZJnXJ+0B5sVfjKihCJW8l
	BAB0XZqZi+VkhjskHFpoVfF3xL5nyzHWTrQUiC+OuQ2sA0xNxJFgWYbHY2mcFfC2SFr++WGrdzhhK
	CcxMpxYjfRoahWyGWOZCIin6oJSvbRc3BFgUTRwjcRz6QYaWhYUHEUhIr57rZP1Pw67mCCLBDL7cr
	vdCmHQTX41cvT51o0NLkTEX8yJUawgacAJu+1qvt5WddcwqbUWz4lL2JhSIXFrWu7IwoCx6pT28hV
	w+byauzfd0TRxR6fn7DahgWxtAIiBav20A1RDJbKBp0tOwuov3L4gFrfpkKvOysl29DZO7/eNTW7n
	ydIlMQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Yv-0000000CWG9-00nH;
	Tue, 06 Jan 2026 07:33:05 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Ys-0000000CWFG-0r2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:33:03 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-595819064cdso1098273e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 23:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767684779; x=1768289579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqzY4iNsINolRoiuSHq4WTtx5oWDWFvmNdTLgX48a8Q=;
        b=H8wJxEVkNPGICTw062yV83Un/vUWEn1iGfWO8UL106Icir5NRsPDrrbeJz0mONdUIL
         8HJkTE2vBUKlfKvBq0XgoeBquXm75Anq0jPSqZC98USe4+6RoB8HLTi0DWgu78sC8NU6
         U4gfj0urGIC9dHlvn43X5SF6joJgcra9rT3YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684779; x=1768289579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqzY4iNsINolRoiuSHq4WTtx5oWDWFvmNdTLgX48a8Q=;
        b=igEmJmyLQt6O93v19fYJdCJX6h53BjWs4YynY1lNDmza08Mq2wg+Zw5HEpNleGNM1+
         QO9Fv7YXkD8D4Zql+m77k2KsqW2/sGnj3hxs/JrUdKQq60zGdq0sNM1JYp0VD4gLIhmZ
         HBadihKcNMqDjWLe+2NH7BN479WQRQC32nnZahLuSICCwil+SaxCPavBQTn50BzYxjRv
         4KBiUCdynUfo5hzPF4gVOHOGPVzTeE24g1ZNhvH+ZA8vMjCQhOH6YSkl/ClyF3IRlA8O
         5oU7e9aLGcfY2FE4HuNxw/acKoTHgnj/72yeMDg4DZQlJRRtyE0jlusvVJjgvs7o/Ejr
         Yi8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2w4G/14SrMeT5PAkCtaTyvbpjSQE0shsO2io8lohmESq4XNm8y96Atjpa8lux/Ws28H8j20akGFEjG6GlyTUU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Drdm3X9XboSslt/RgLxEJWqyfuIfsx0nZt4joFh6yN5R1B73
	otDkcNeMykopkSju44YmOe4Rqp/72b0RhUqkWV7yIrxgoCpPfm+YEjwR73LFhhih5eAduC5x0hq
	wGSXETCVDtTcg19L3jqkWAwijEkLtlpJCg/CVYYKA
X-Gm-Gg: AY/fxX6JN1BdcgNlUEeQXqbkfTcjKyK8GVVXqANOiX5gPrllwYt7XDm4kTB588u3OZv
	4ENqWhpPWBrlfsqM05h6+A/1TBSnWtBC4KEhXreWlkS82fwj/5lPBWHjTCr8/CZjJ4ZuqfpC3sZ
	j+ibzuED9iq48g2JHnx8kntVMkvf/9bHd0twxz0z1JSHspUBwKCkvL7ydolom6J4a0T9JC7zUjl
	NIg/ml3lewEOhhvEyQ1YBkdONz28rACq+YQ9kqKuQOcjfUKL16wMwS1UBznHXDKgE0QxkbDTzNn
	xoYCHbxRWJ9HdYgGfcc+ns0Pbg==
X-Google-Smtp-Source: AGHT+IEAoJiu1UH67YXklgc9uvuOf1qJleDiwyIXSrIHeshyOtNKWRsImtZQBp/VYi3lIcNm+2tmz26j0NyKZvubb0Y=
X-Received: by 2002:a05:6512:3e08:b0:59b:67cf:ac0c with SMTP id
 2adb3069b0e04-59b67cfac63mr326251e87.17.1767684779427; Mon, 05 Jan 2026
 23:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20251206-mt8183-display-graph-v1-1-a30e54481f28@abscue.de>
In-Reply-To: <20251206-mt8183-display-graph-v1-1-a30e54481f28@abscue.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jan 2026 15:32:48 +0800
X-Gm-Features: AQt7F2oScs1nPo40H3ZrV8FDmqy_y-OidGavDVEUMs49HzaB-TFtZc3H2BO4VmE
Message-ID: <CAGXv+5EXA5GF6+-_+SnqU1=Rq3Cv4_Uq+xHD55TO2CBtYans_A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Add missing endpoint IDs to
 display graph
To: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Evans Jahja <evansjahja13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_233302_320019_46D6A4C8 
X-CRM114-Status: GOOD (  16.83  )
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

On Sun, Dec 7, 2025 at 1:54=E2=80=AFAM Otto Pfl=C3=BCger <otto.pflueger@abs=
cue.de> wrote:
>
> The endpoint IDs in the display graph are expected to match the
> associated display path number, i.e. all endpoints connected to
> mmsys_ep_main must have reg =3D <0> and all endpoints connected to
> mmsys_ep_ext must have reg =3D <1>.
>
> Add the missing ID to all endpoints in the display graph, based on
> mt8365.dtsi as an existing example that does this correctly.
>
> Fixes: e72d63fa0563 ("arm64: dts: mediatek: mt8183: Migrate to display co=
ntroller OF graph")
> Reported-by: Evans Jahja <evansjahja13@gmail.com>
> Closes: https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ=
_XoqXUpB=3DcuJ_7e3-H11zKd5Q@mail.gmail.com/
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Restores the display on my MT8183 Juniper device to normal.

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 122 +++++++++++++++++++++++++=
------
>  1 file changed, 98 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8183.dtsi
> index 4e20a8f2eb25803057955401a7737c7f029a1424..0c73043c67fd01147179e8f9b=
065684f67749ec2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1754,15 +1754,21 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
>                                         reg =3D <0>;

"reg" (and "compatible") properties should come before all other ones,
as documented in the device tree coding style. This applies to all the
additions in this patch.


ChenYu

