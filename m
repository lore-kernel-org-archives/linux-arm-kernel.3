Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0481DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g37Y6fNgG/y+1/VPNRviqmmo3geO3qLh2eJAV1qSjyg=; b=ht6ZhqrWIXR2DUBLTVnP9dOM1/
	TagZLFxoI9joLe5/qdARWQpsSclTi1MvaL6m7tAg4gmWXTvCHPc5sVJIVNgUMMnQHY179ikHQ3vku
	uCIoaEW3Hmm1P7RzvQNQyepI3D8ZIi9JjUeCTNH9KEDdB1PniTidQQVz+l67hG2dNAopCn+xCVtai
	jrQFcO5dgqHUaATNq1RLgXp+BiDyuA+sbhyTkUBxt3s/mpzuE6Oxs1vCJlH0KUWIIjPaHjhqJaqQ9
	gjUKis/1KBqiINpdemBpdi90fYFwBxsbiXt7T/mSr2UvCe78BvESGzT2j/67/VTt5qbtOHhAaIryT
	kbi8xwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiFr-0000000DfHN-30oC;
	Tue, 11 Aug 2026 08:54:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiFq-0000000DfHC-3IHe;
	Tue, 11 Aug 2026 08:54:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41B7343A01;
	Tue, 11 Aug 2026 08:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3C11F00A3A;
	Tue, 11 Aug 2026 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786438478;
	bh=g37Y6fNgG/y+1/VPNRviqmmo3geO3qLh2eJAV1qSjyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n1zmzH0S2tsEexkCvIBORvYjJ6JifsmNIVBI7j7oYS/QpisL1VhYe7MKINDEHptDx
	 yVlzIhsE2A8P/vkLY4ikiQ5BN2JCc7HtmNFLM3m3SSylOEH3oxmiwTS1IJjZXjAcwO
	 u2uhQAB5ldqqYP5GdK9BjU9bx90svSjymMYfL95oTM5Zh1Ux+2K7a5m47/dvJYhAVG
	 3wv5kZXArN/6WB9QP2E0nZCeHErM6xm/D20s8o/oinCFc69Pe22jrwsAM8sz6w4kJJ
	 yZxn+Dm1QFt4eUWlc/AlcVo4MTywMug2qO461vh1we1glx6O9ni1QGQWFMBzTPg4ih
	 OzZTnvsEVYTuw==
Date: Tue, 11 Aug 2026 10:54:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
Message-ID: <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260809160643.33991-2-l.scorcia@gmail.com>
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

On Sun, Aug 09, 2026 at 06:03:25PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt6589 watchdog driver implements the watchdog feature, but

Driver is not really relevant here. If device does not have resets, why
would you add them?


> not the reset controller feature, which is actually supported by the
> hardware.

So binding already has reset-cells or not?

I already asked at v1 to clearly express why you are doing this. You
will get the same comments if you do not improve commits.

> 
> Add the bit definitions for the 12 mt6589 toprgu resets, which will be

We do not take bits, but identifiers of resets.

If these are bits, then not really a binding, so drop entire header.

> used in the following patch to enable the reset controller. Values
> determined from stock Android sources.

Nope, Android does not matter here. We do not add bindings for other,
unreviewed projects with poor quality and poor processes.

> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> new file mode 100644
> index 000000000000..ee08c39df513
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h

Filename must match compatible.

> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT6589

Best regards,
Krzysztof


