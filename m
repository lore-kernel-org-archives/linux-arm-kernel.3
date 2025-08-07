Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB869C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVf9LbLojcCuAhT+ga1Vyf947M38uWa9Hm3uYLCKQ/w=; b=jkZqWst5EjpAzQc0b3no77iqCf
	lK7nVfNxIyHehd3ap1CavAiP5J1bEuvgZSL866Fjo4cflbi9kdskODmYO8JQ+eQvLutT+JaLxQlv/
	fwrMsxzZ4WARbg3q0Bu4OjsPIIUfiuJJaRUDfuqMm0Tle7eu3gVLFwp0pabAS+WwdnDv0PXT5iO73
	mwj7mhRwO0A1ASRWyK5mYi/BdPXHJmTmaL3hPdgiGIRhAQE+NVvIH2cUCZDu3YFsHVtjDYvCgCNtG
	jhSSm9VeWhF3RsaZubNOVnnTy6cOKEdOul/GeUzeSNXPjqLcjHD2fbu20MmC7YYmp19roO1D+siNL
	63pSWZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujwKY-000000002Bc-1bho;
	Thu, 07 Aug 2025 08:50:34 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujwI0-000000001sW-2go7;
	Thu, 07 Aug 2025 08:47:57 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-71b691a40a8so6902697b3.2;
        Thu, 07 Aug 2025 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754556476; x=1755161276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVf9LbLojcCuAhT+ga1Vyf947M38uWa9Hm3uYLCKQ/w=;
        b=eupE4LtudL+h5JZFmdFvSqkbgIFikMEyIp+nH7b5NIvDO6HNsYZSNnnSaDj0p0G6F8
         rJYV5pMyQSvsJi0qp/lQPIcFXGUBAYwjrl6BS40hOUum9yUw8YzIQPmTmzgXQdwfudCy
         WVZaHyvtmEn//V5+1G86GrHiZSOJ7241YcBuoE/0uqudsK2uNFfX51lfSyFueXg5Abbw
         UKhzV72bq4BeZIAwrYgBZAJy53kITqg1Q2LSMFe8y0BcXozRf4UKNCJ+srQAZTvTgc7w
         7kH72q5BLM5QIbeoKtCg6yQS9t3izO6AEyHnP+hUFtz+ElalkZallqyQGdNi7hjaO0Wc
         v6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754556476; x=1755161276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVf9LbLojcCuAhT+ga1Vyf947M38uWa9Hm3uYLCKQ/w=;
        b=HDKl4s7OLHdVGt6GZp4r3o9RJi1IPaDaF4z3MuoYKay4QgJI5eZLvhQyfjrh5s6jCR
         9eX6tbS7iKzo526YR1k3oIZyY8l5fUobWm4hfY6NJYaj/JukI6n4LMnIfuUfvMlk1g3S
         CpLrDstOWlSQixzj0TaGF+YtvQuOrOqftJ8lko3zRbrWtMPyGpG4/ekSEttLhpnXuudS
         4StbEqbEqvNro3bugVurxLfI4xKN8otnvKca8kymHcdyexzn8QqRBgsLZYeQ+MFJi+7p
         2TOD8osOMR+uaIBc01NcILImW3TZv7brrlnTeQBiVaWwGGbVE71ux/+MAu903xej55I9
         Bhiw==
X-Forwarded-Encrypted: i=1; AJvYcCV8bS/FWRasVZ3gqYpYdo0FaAJoQs3Nl/k/8ZhXYhQ4lG8Q7n4LdK74Zpm4loLjrDyidrxBLbFLmxoz+rCO8zo=@lists.infradead.org, AJvYcCWc3e3FCyoVKvtgXwqVy1Vcy2ul/dr1oGcWFvm7t8TErqyker/uvnzW8PnyhqtT3KBXJAjXJ/RJKeqB@lists.infradead.org, AJvYcCXqachBc6JKh+ZJ1n5fxdvMxTN7GAjnQqv/Z1qJlsbKMCKMAucddx9x7x+IJ8kyGA1Mshz87Q1rPscIYEgFMJRF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6A3GZu7Z/ENZ8Ko+q8hRDGQdeL+9Ksjp71aAVg0hLBFtCasO6
	ZBpGdWwdVo7kfBeZ3lYJTSjn37NC/531KbOIouAzBXMn3iJsqQ2zwIXF4+b1BtbPR9xgn/QlgvO
	ytMwZPVi0a1+IPSHFkyEY9Z0beDDFSzrReXxOBgI=
X-Gm-Gg: ASbGnctWrrJ8+yS9LJElXIeF4R2X8NeHekNIgLYCpKprLV+B9m4fKALcFnRPyngkg4Q
	fSmCIsOv9NdYIfEc2bML/6j+l/7WagoePLmfVmDGoBfUQZWkGOSxf1pAtTMc0Ahbtaly+oMLP3u
	UXvUiaL3Bs8pmGc2MFfoGFJTZzqDfiH39YkJqXtQJJX1sK3ewgqaoAYGW4u+IiF1vGMOiXtG4BG
	1KQuQtVdQY5Mly+121582VKUvn0MTFr68LPGNE=
X-Google-Smtp-Source: AGHT+IEF1Rgl4ol8b1AK0WWialQnOn9GOQ4H+uDN0nCUOKmheNAVCVpOijMHFOdF8iQRgP3klAdSVLKEPQEyQTej/FU=
X-Received: by 2002:a05:690c:9692:b0:71a:22e1:b351 with SMTP id
 00721157ae682-71bcc7fdfb5mr76969767b3.24.1754556475564; Thu, 07 Aug 2025
 01:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
 <20250806133824.525871-4-rick.wertenbroek@gmail.com> <20250807-inquisitive-speedy-rooster-0a8488@kuoka>
 <c86bcdf0-f692-4263-a597-f8e36a53e8d9@kernel.org>
In-Reply-To: <c86bcdf0-f692-4263-a597-f8e36a53e8d9@kernel.org>
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
Date: Thu, 7 Aug 2025 10:47:18 +0200
X-Gm-Features: Ac12FXxEzSnPsqcq49lE9KwQoWiI6TiOhTQgKrxWtGYG3DN0QkxgVCWP6jlC5UM
Message-ID: <CAAEEuhpHmW9hji91tbQ3MMhBZELCYc_vA+Ra3oC2W+Rf8LLC6w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: phy: rockchip,pcie3-phy: add rockchip,phy-ref-use-pad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rick.wertenbroek@heig-vd.ch, dlemoal@kernel.org, 
	alberto.dassatti@heig-vd.ch, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_014756_682181_CB328EEA 
X-CRM114-Status: GOOD (  28.64  )
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

On Thu, Aug 7, 2025 at 9:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/08/2025 09:54, Krzysztof Kozlowski wrote:
> > On Wed, Aug 06, 2025 at 03:38:23PM +0200, Rick Wertenbroek wrote:
> >> >From the RK3588 Technical Reference Manual, Part1,
> >> section 6.19 PCIe3PHY_GRF Register Description: "ref_use_pad"
> >>
> >> "Select reference clock connected to ref_pad_clk_p/ref_pad_clk_m.
> >> Selects the external ref_pad_clk_p and ref_pad_clk_m inputs as the
> >> reference clock source when asserted. When de-asserted, ref_alt_clk_p
> >> and ref_alt_clk_m are the sources of the reference clock."
> >>
> >> The hardware reset value for this field is 0x1 (enabled).
> >> Note that this register field is only available on RK3588, not on RK35=
68.
> >
> > Then you miss restricting it (:false) in one of if:then: blocks.
> >
> > Also, binding cannot be after the user. You need to reorder patches.
> >
> > ...
> >
> >>
> >> +  rockchip,phy-ref-use-pad:
> >> +    description: which PHY should use the external pad as PCIe refere=
nce clock.
> >> +      1 means use pad (default), 0 means use internal clock (PLL_PPLL=
).
> >
> > Can't you deduce it from the presence of clock inputs? IOW, if the
> > clocks are physically connected, is it even reasonable or possible to
> > use internal clock?

Thank you Krzysztof,
But no, if there is no clock, the driver deadlocks, it needs a clock
to probe correctly.

When there is a clock physically connected on the pad, you can still
choose to use it or use the internal clock, this is no problem.
The problem is when you have no clock on the pad (as it defaults to
using the pad) and the loading the driver deadlocks the system...

> >
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 2
> >> +    maxItems: 2
> >> +    items:
> >> +      minimum: 0
> >> +      maximum: 1
> >
> > More precise:
> >
> > items:
> >   - description: PHY0 reference clock config
> >   - description: PHY1 reference clock config
> >   enum: [ 0, 1 ]
>
> Eh, no, rather if this stays as int:
>
>     items:
>       - description: PHY0 reference clock config
>         enum: [ 0, 1 ]
>       - description: PHY1 reference clock config
>         enum: [ 0, 1 ]
>     default: [ 1, 1 ]
>
>
> > default: [ 1, 1 ]
> >
> > Anyway, default 1, 1 is pretty non-obvious, so this should be just
> > non-unique-string-array (and property should be like
> > rockchip,phy-ref-clk-source/sel).
> >
> >
> > Best regards,
> > Krzysztof
> >
>
>
> Best regards,
> Krzysztof

I based my patch on patch :
46492d10067660785a09db4ce9244545126a17b8
dt-bindings: phy: rockchip,pcie3-phy: add rockchip,rx-common-refclk-mode

As the option I add is extremely similar, it sets a feature in one of
the PHY registers and only applies to RK3588.
That is why I used the same style as rockchip,rx-common-refclk-mode.

Wouldn't it be confusing or at least incoherent to use enum for
rockchip,phy-ref-use-pad but not for rx-common-refclk-mode ?

As for the name, I used phy-ref-use-pad as it is the name used in the
RK3588 technical reference manual.
(Similarly done on rx-common-refclk-mode).

Best regards,
Rick

