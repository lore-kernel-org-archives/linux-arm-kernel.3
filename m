Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B20D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=; b=wGiLe59vtMPeVTGNuaIJcRZZWp
	ducuSOQ7PZXAtWQZFWXR9Zf5R3n5LFHnrdPry1lu5L3DculAbKpNicoxrflDCPgED36kt08PHyZOr
	deQpr+L+nuqEy8kR3ynOBdk4VlbyI3OHIsZetKpBBznDmK96exWGYeKeBgcZvbf2D72IUOqSWiY4J
	8Ji4EKcIA1+nH5f7bPHj6J/ooXrOD5Sj6bCrkPd4zfjQ6nmTuFPWFopm2vU+GeoD2N76/tuGad804
	Yq/4jmZEuHDzMRh/R2niu/xw9CZLHqtCWz06paECc/7929eJp2Dix65JeRyfEs+wkrIDHB6ETVKT3
	4dksIhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Nqx-0000000AZMF-35KE;
	Mon, 28 Oct 2024 11:24:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Nov-0000000AZ1F-2FKR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 11:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=; b=LIdU6E0+Mm207QZOqNhNeHp7Mi
	iEgN70uY2c3yZu7cIrX0SPmey1OpfxeUXR35nZe0W104PD+6Io/kX107VnTXHGkQ9lrY9kgQq8EVk
	hWbarYsnXWU4Eaqo1W+UmMocOBjSgxE1D6uGIvILZQSAJFpb+VWPF6dGXQyMfPTRKJZcrTjBS2yiB
	sedZQLfnvbnWjhUwbaaZQ5uGtQVBAAmwteQ5DlAmp8qYI+oGVmt1bE4VmxbO8jNGKH/yKCKKTK5jN
	Cgc6jGB/29hnpsYN3OW3Ni4FCaZCLaNJ36LD6KVv9FRQaPpWlt1kuNRARDtt6ow26ItTTuPUnsjJF
	Mnmj2YaA==;
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Nor-00000009f8v-1b8t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:22:00 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5ebc52deca0so2053257eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114514; x=1730719314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=;
        b=kRxgJBsrfPbSyuO1xg2OntPkeCf2Kt0SpjqgOxK8HuHaKPmKigUXbVMGH17piUG4sP
         LQZgia9w5YKYowUM5z5Lm70EUiShYsyTgcJQg3u2ECMQtDPEXJTg66KMrIRzGjshIUso
         TcJb37ssMM1kVvTLJuBDD9Xd4UDp5/sM1v33I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114514; x=1730719314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=;
        b=mnLgq0jInMYi6j+RHTjm128ornk3pBEmP4sVE2Zd1lnDaXXUfsMIlyj5ViJ6q95aIC
         o9E6gm5L8kjfc4JXhTbt/DkPDGaQwSx53yVC36MCcUAmS6oVOfvipf4hxT+ZKDJ90Zx1
         QZPH+VO6I6Ev/5bpnTnghpuvRHjGJZUIWRtmyRRtqvvJk7dM+a2J1jUAufrIw/VJ/0Po
         q8OaDupOmpUGsR9WSr5TJNEJdaru8aE/jJx+LET7K/YGOrIVeUy/XcHZajnLFOC3edJA
         zxzg7D4Gf1hwu7BRxco6ZTfxD+rMZXjtnR8exotY8TypDsqoJk9UpB1CiXIWZP9XyCJr
         8TdA==
X-Forwarded-Encrypted: i=1; AJvYcCViqT1khX0brf8LYm8o0dCRRgUTZn6hYUDsZvR5WwbVyCUL517YIqqeB0esSNCTBOZBJAg/VLWi9N68I4BNB+7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwRsye0XErTdd5rIQJKV07AWa+/x9jAA8bBK8qWMWDWIAu2JUOn
	c24bzAltkx1RyzbQEdrvRgfunOENzQnvIobj1JuOgXLUhWY57VHvMCJBNF6Sp7JxPXHVUITL/gY
	=
X-Google-Smtp-Source: AGHT+IEk/EfV/omedMxyXsl6Ri0QcxVTQiuRtBadTENQDBlxZ4MF7fXn3HjLZoF3OJBZmK93Rd9r9w==
X-Received: by 2002:a05:6870:64ab:b0:288:60d6:f183 with SMTP id 586e51a60fabf-29051d6a2f2mr5518479fac.38.1730114513720;
        Mon, 28 Oct 2024 04:21:53 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2903517701dsm1936625fac.0.2024.10.28.04.21.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:21:53 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e60825aa26so2466732b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMhHk3CkcMpH2RAOYoR7MaY0auKwaSWcpOxzdLZa53QL45l8f51v8P/0rbsnKKm68b084XVTN0nuqwapt36MBy@lists.infradead.org
X-Received: by 2002:a05:6122:1786:b0:509:e278:c28a with SMTP id
 71dfb90a1353d-5101504d301mr4253732e0c.7.1730114015383; Mon, 28 Oct 2024
 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-3-fshao@chromium.org>
 <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
In-Reply-To: <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:12:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni-F_oudNyskSbxS1s2gZG7m4U4+nLxt0=dt5+DDkhV4Q@mail.gmail.com>
Message-ID: <CAC=S1ni-F_oudNyskSbxS1s2gZG7m4U4+nLxt0=dt5+DDkhV4Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI
 link node pattern
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_112158_615941_1551D9FD 
X-CRM114-Status: GOOD (  32.43  )
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

On Mon, Oct 28, 2024 at 4:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:42PM +0800, Fei Shao wrote:
> > The associated machine driver is not dependent on the format of DAI lin=
k
> > node names. This means we are allowed to use more descriptive names
> > instead of indices without impacting functionality.
> >
> > Update the binding to accept arbitrary DAI link names with a "-dai-link=
"
> > suffix. This is the common pattern used by the target (MT8188) and othe=
r
> > (MT8195, MT8186 etc.) MediaTek-based Chromebooks.
>
> We do not want arbitrary names. Why for example green-batman-dai-link
> should be correct? The existing pattern looks wrong. Please read DT spec
> and chapter about recommended names.

At first I was thinking about regex like
`^[a-z-]+(-[a-z]+)*-dai-link$` based on the DTS coding style guide,
but your example is not suggesting that.
and the name like "hs-capture-dai-link" was rejected, so it's not just
about enumerating the names either.
Or "^dai-link@[0-9a-f]+$"? But they don't tie to particular register
addresses... or just for some pseudo indices?
I could miss something about DAI links under the sound documentation.
Still trying to figure it out.

>
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt=
6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.=
yaml
> > index 701cedfa38d2..2da34b66818f 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > @@ -40,7 +40,7 @@ properties:
> >        name defined in the machine driver.
> >
> >  patternProperties:
> > -  "^dai-link-[0-9]+$":
> > +  ".*-dai-link$":
>
> This breaks existing users.

There's no existing users in upstream, and the only downstream user is
the MT8188 Chromebook DT that I'm trying to upstream, which I can fix.
This binding was upstreamed exclusively for that DT.
Even if we take a step back and assume someone has another DT already
following this pattern (and that would be a surprise), this wouldn't
break anything except a dtbs_check error, which would be trivial if
they don't run that or attempt upstreaming. The driver doesn't use
node names to distinguish DAI links.
I want to fix this pattern before any actual users are in the tree if
possible, but I'm also fine to stick with dai-link-0 to dai-link-10 in
the case that nothing is changed and the DT has to follow the existing
patterns.

Regards,
Fei

>
> >      type: object
> >      description:
> >        Container for dai-link level properties and CODEC sub-nodes.
> > @@ -112,7 +112,7 @@ examples:
> >              "Headphone", "Headphone L",
> >              "Headphone", "Headphone R",
> >              "AIN1", "Headset Mic";
> > -        dai-link-0 {
> > +        hdmi-dai-link {
>
> No. Not really justified.
>
> Best regards,
> Krzysztof
>

