Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444E0CFA751
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=; b=nMBYlCD/42CJO/Ygxy24KS9eYF
	uP1AR3tQnQRH9fWTSmivVVEEkmAif1mCEFVwqdPWMZsq9xkgSAfsbCDsd3TU5WxA3acJ/lT3XIXpP
	eYNP/TF2ayersfo5GZmsjnoCmFkorMxzja+9TXN67bo5oHwCj0rg3aSagwVypkltKbP0KzipYKTrM
	oM+65tOjNNUSL5tXCGmZykFe9Gbo8oxe9j1jJ/k3gJ70nfOdgVKWnkqhJHfE4A5n5P3gc9Azpf7yT
	AmRt8y6L9wEep1MKD2Jp4okVBXzcdQQDTUGU/sXpiAwnhb71o2hmQh6+azuic4tr2N7MDL2rtkDUq
	vdWiv2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMea-000000085JY-1J5P;
	Fri, 21 Nov 2025 08:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMeY-000000085Iz-3MsP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Nov 2025 08:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=; b=S5cva67oS95vUtmfhUSVuUITx9
	aH+mdU6szD/6HI7TS8FD5a8oASLT8ZJHJhvLlRdyjek19XzPNoRKN0HdDn3I5Fsn+IJSRJnRYND4J
	uWRtxACo3T7rCdTeLm5rHbWP1wSnnun4n9l63UN7Xn85pO30y+oOiuq3JkfRJOGKsu0aQ2/t2BnJF
	mtDo7OY23UnSNEqFbJHSOt/XiMavomlpS3W7GikYgTMOTuD0vC0G1UFLbGX4GZggXSx6umDMyZnVE
	7BoDWoKk9wW7H944R2teYLgRnkpW9M75mXzi7hgGQCf30lMZPY/7c7DaBzfUY2P8d0RnipZAD+v48
	ELhapAwg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLmr-0000000GKL0-27fy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 07:42:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a1c28778so19869955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714276; x=1764319076; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=;
        b=MjR/WIJqdfIYgUvkVNPr3zuUFscGmonjdV5wHNW6GSTKth4untqkawU1LiHBJa9LX0
         jbjNo/oKOJtUOMU97fJ2cenYhtmdQyP65zd+2WgYjzZuHmifG+B3fI+zVYDJd9HXaJBS
         bQE++2KVoxK0Sd0HDOlrX6ZYCG/Im6iJe4zdtL1SApc56fj7ujTHeQeGHbQjpoyKd0JE
         7awbO+Ii4/J3uT3OYgptT+hYApmFhibyCmMk19ISNTbdxmBCOaogg+5ChCsegEGMm1lq
         d17qI9E4a8fMDIVJy/stOIIjxzIQamyu6JwUtAZIx7xl82sqm6xsY4rP4+DpA1bwNjTG
         UCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714276; x=1764319076;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=;
        b=wSxFiGrKSAQ+zd7xta4FJzJJHRJU1hPBvRyA0Ob+ub8uoreDWzNgjpPJ+BQbDPIBEo
         +mh6aZva5nG/Vwd6J41V3K2KTEtPuikab6EF3KRGBVTjr1e6ZRHb6JvHp+YmlkvENt7X
         j0bv2wvrmCcV5uc5xH2CBavxzd/m5ku+zkCcjEJ5KLG4TtHIptzIQ3mKe7Ldfi4Rll7w
         VqqYuc92JccQu3lqC/TRIY1gMzYILnbs0uYVHRRs/DPbJPaQzavq2MtD+RDmR+5XtHBT
         GXUq2OCZJfBZD4hrhc/LECk4QT2TlNN1NHyYRcgGxQvFZ/NES4YsFZvbr36SMZxTLhAX
         PrIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmCzkWfNSamaHh5sSW6OHJlbOn3thFimHCuO1ta0V01jOrbVINWQZVvaB1zvknY0izFYOi3i8hzATKIAUDQ3E9@lists.infradead.org
X-Gm-Message-State: AOJu0YyLiji2frH30M+yJACo6lg3MG9t+40NkTl4Qe5/75zbxHUETMYF
	NAPIodmXXRoQ+l6QBAf6j0i5NJ3dr97LmRkwu10qtZpLoS8tF0r/4qT2
X-Gm-Gg: ASbGncvjtFSQ5bJm8Xs6StP2XIwiuFcZz+ss/PqWE/7t2N1NJTYnewmsySwDutIckyV
	PC65AUDF5pRqAMJjdTUv48EK7IcuGFnFidZd0lJxrd0elGHRuVTwSiomI2fS9WWtxMuqzCbzI31
	gebGWCzXrX2v0iI35FTBb5lpx1QLazwZiC6s5IUSlfGM0eUd+qcEOQI6q0qH71KgzMr6TvsRarT
	UAjpZ+efvFeqcaaC9MSAvLAtUIST1i2JRpTrliY7P9cYwtieLLljsLCzKWB7Z6rUYuLPPi36bnl
	Ibudx6GlRAIHvxfz1dBZIDi0bT1tjH99/vB9eWNK4wtm0DEtP12hfgHC8G1CwUmkJZml6KN2m/N
	GBQwYOoH5GihoMvWdXzI91k2uKZjsm4hsXa6YQD5WG509QMXjavrUiJB/NtndDAive0hfsNWq1n
	5bwWNEaWXkD8cCsnyzsNYQGUkVAL3oTmPDVQ2Z2FM=
X-Google-Smtp-Source: AGHT+IEA+dyN8n6gI9VghYdVrCVyA5Lkx+Pi/7Qw0bW1qYcQrv+1D9Mt2waBz7nsc6tPHypUcxzIAw==
X-Received: by 2002:a05:600c:35ce:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-477c016c071mr18413245e9.7.1763714275447;
        Fri, 21 Nov 2025 00:37:55 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deeb96sm82356155e9.4.2025.11.21.00.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:37:55 -0800 (PST)
Message-ID: <692024e3.050a0220.183811.f1dc@mx.google.com>
X-Google-Original-Message-ID: <aSAk4XQ-S6d7iXUs@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:37:53 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-3-ansuelsmth@gmail.com>
 <20251121-daft-secret-collie-629a2c@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-daft-secret-collie-629a2c@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_074233_578541_228AFF89 
X-CRM114-Status: GOOD (  21.30  )
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

On Fri, Nov 21, 2025 at 09:36:10AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:45:00AM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 AFE YAML schema.
> 
> Drop YAML and YAML schema from subbect and commit description. See also
> submitting-patches in DT dir. You cannot add documentation for YAML
> schema. It's like adding a Linux driver for C code.
> 
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > new file mode 100644
> > index 000000000000..ebeda0876280
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7581 sound card with WM8960 codec
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +allOf:
> > +  - $ref: sound-card-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-wm8960-sound
> > +
> > +  platform:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      sound-dai:
> > +        description: The phandle of AN7581 platform.
> > +        maxItems: 1
> > +    required:
> > +      - sound-dai
> > +
> > +  codec:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      sound-dai:
> > +        description: The phandle of wm8960 codec.
> > +        maxItems: 1
> > +    required:
> > +      - sound-dai
> > +
> > +unevaluatedProperties: false
> 
> Please place it after 'required:' block.
>

Thanks for the review. Will do!

> > +
> > +required:
> > +  - compatible
> > +  - audio-routing
> > +  - platform
> > +  - codec
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel

