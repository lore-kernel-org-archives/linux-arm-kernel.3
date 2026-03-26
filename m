Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A20109E557
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=; b=n/gVAP8KH2VvWfm7eYfkQYoNt7
	FKE0dmI/EE3AbpT6gesCyPc0mAMNS0oD9pm2mSlU7VRhm1VS7hp1XZf7fd8leSMMPE1Hy06j0huVF
	+BAmOLO4S7xeeT5rvbkLxiPrbqXkXINuo4sNJfSxd3gESOCk5Qyvk/tN6zKTvvGg2Z+iqZxdS8y/f
	Fv9kp1fbIxbDIDGgvIq1jps0Rm5zhmMtRuRdmBcFZS/vIqZi8NTVPpWGO0V+ilvA9E+G1lNZpTABD
	VTFb1VkxznJb6J8Z5+GkLIeeKlgDL6wvqn4fTTnQKn9cN4/liPbkP7XFzqE0vTD9NUWarH9X0hpFq
	E48/ZeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dV9-00000004kz8-30SN;
	Thu, 26 Mar 2026 05:43:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dV6-00000004kyC-2Lj3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:43:26 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82418b0178cso291975b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 22:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503804; x=1775108604; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=m6jDIV9wNxnWkLUTXDlaGXwgep9BqBNvLq5Kq5ZKrEtZfX/c3GtW6xkL6rM9fPXEh9
         URWlbjGNw41gID1gTw8yUq/5o2/5olt6PQS74+SxR7o8VlDc5f7BLNq8gpZexf+QaPI5
         f4OCakYlLUa3fBbRconGrYKt0jyVL2b4iLNKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503804; x=1775108604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=W1vxo8f/BsqwZ6Imq+i4LkK8hkTgQBbwwO9g8AeXFGA7CXIYqPls8jHwMQmoPxQnG3
         SQ0Nhv1l1J8lE0xIcoBTwpq9eKN348Vx9IXfu723JWSD9r9P6lVCcZHIwKIjIaR0WnDT
         qbnahNROskWgOkmHQwAkB2ZLGAv6eEjuYC09y0qKPkUiR5Dx8egxUI/7yeinFHuPYEsc
         9W/5EqslSdE1HZ+ZNQSRmQyQEtTnxJQW+DO9B3gzSrwU0/bz6yC6hPZiqrB0WHOa/hpX
         oWi1pGl9TAqaE9b8GtsWfqMZZzbBkc1lj9qkl8X0dxEiHpOk7wz3CjFPDvowbSfHabQD
         Y3fg==
X-Forwarded-Encrypted: i=1; AJvYcCWVEOlYaYMJRNRKanDdXGjd0QJJmjztQ2UtIzxpa9j6lGZtkiV6sgqXB3wEYWZKC1i648rxUVtIUr7Zg9fxD8Lj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6tLcJgndK2PFz29XgmnA03xvXbRhS7UjkdoLDWaGksed0ceMI
	EGkMO3iVUV/NJbx3226RGe0Ofx0D/PRz1JOeTWR7JKO6lkIJQrV/Va3Ys1AYVM7C2g==
X-Gm-Gg: ATEYQzw2xDNsc/ShVjj0Xeu5VYaP+S+rd6BfbCEQRl1BYDBEg2oyDX4QJiVNZ7E8Bc9
	32hxtSP4olCPVaRDPp+JxXFh8qejR3jZQCI60lGQjGy7J0R6HWPAVDmEKalpel//TKH0JBzlvpV
	jAbTRK2yj52b9NRgRNoAI/XV16xx5NzaECTh1c6VX4MKubfjcjs7Ix6sBxmVUl31RfvxrSAS+1i
	JoyXeEi2ikgDKpmXpZ0BvePQ1TUUyFuqVnmcidVvtD4p8WDzSnxKXO4XXgsCFNiJeCfSXghLy9A
	v0EM0CrePeNuz9aC+VUFC+Vk/dBpNVi+A/NUmg+sFDGwpiDBp3vP57wC+RPs7IGWk1aMxxvIZeM
	4NjEp9GjnqhAVmyr7zaxHoxRYBLGvc3vwk2zqUV3109bPzOgQcU6CLZn6KW43O68tR6PzrSqV55
	ilArKbJiuO0GYdpjbo2D1XSKbx7qAxhPXrzE+8xrg/aLEDFQHDtti4pBs=
X-Received: by 2002:a05:6a00:1ac7:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82c6dfb1e09mr6141757b3a.30.1774503803653;
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d5d89b5sm1411849b3a.41.2026.03.25.22.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:43:16 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Message-ID: <20260326054316.GB910813@google.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
 <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
 <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_224324_639464_5C5AF041 
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

On Wed, Mar 18, 2026 at 06:22:42PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/26 14:54, Chen-Yu Tsai ha scritto:
> > On Wed, Mar 18, 2026 at 8:39 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> > > > From: Val Packett <val@packett.cool>
> > > > 
> > > > Add the dts to be included by all boards using the MT6392 PMIC.
> > > > 
> > > > Signed-off-by: Val Packett <val@packett.cool>
> > > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > > ---
> > > >    arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
> > > >    1 file changed, 141 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > new file mode 100644
> > > > index 000000000000..fbf6f671524c
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > @@ -0,0 +1,141 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2019 MediaTek Inc.
> > > > + * Copyright (c) 2024 Val Packett <val@packett.cool>
> > > > + */
> > > > +
> > > > +#include <dt-bindings/input/input.h>
> > > > +
> > > > +&pwrap {
> > > > +     pmic: pmic {
> > > > +             compatible = "mediatek,mt6392", "mediatek,mt6323";
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells = <2>;
> > > > +
> > > > +             keys {
> > > > +                     compatible = "mediatek,mt6392-keys";
> > > > +
> > > > +                     key-power {
> > > > +                             linux,keycodes = <KEY_POWER>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +
> > > > +                     key-home {
> > > > +                             linux,keycodes = <KEY_HOME>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             pio6392: pinctrl {
> > > > +                     compatible = "mediatek,mt6392-pinctrl";
> > > > +
> > > > +                     gpio-controller;
> > > > +                     #gpio-cells = <2>;
> > > > +             };
> > > > +
> > > > +             rtc {
> > > > +                     compatible = "mediatek,mt6392-rtc",
> > > > +                             "mediatek,mt6323-rtc";
> > > > +             };
> > > > +
> > > > +             regulators {
> > > > +                     compatible = "mediatek,mt6392-regulator";
> > > > +
> > > > +                     mt6392_vproc_reg: buck_vproc {
> > > 
> > > s/buck//g
> > > 
> > > Also, no min/max voltages?!
> > 
> > We really shouldn't set min/max voltages in the PMIC dtsi file.
> > 
> > The min/max voltages are supposed to be the intersection of the
> > consumers acceptable operating ranges. The min/max of the regulator
> > itself is already implied by the model / compatible.
> > 
> 
> Your point is fair, but it's also true that some of the regulators are not
> really meant to ever output anything different than what they are supposed
> to, though, with slight variations being possible... I guess the best option
> here is to leave declaring voltages to board DTs instead, which is sensible
> in the end.
> 
> Okay, agreed. Let's go with no voltages.
> 
> Reminder for myself: there's a bunch of PMIC devicetrees to cleanup in here...

And to be honest, even the default names are not needed. They are again
implied by the compatible, and even the regulator's own node name.

So either we could have a whole bunch of empty regulator nodes with
labels for easy reference, or just have the upper level "regulators"
wrapper node with a "mt63??_regulators" label for board dts files
to reference and add the _used_ regulators to.

If you agree, I can do the cleanup work.

ChenYu

