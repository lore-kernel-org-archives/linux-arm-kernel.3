Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB2CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mdYgBt2LqB3LVgkJYeY1oIFFwKjz6NX1BHb65C9Dec=; b=zsrkylk7ZmHkNPWmgSWWESSi3+
	iOnnDC9GYrPhm9Bp47lzRQebR9BO0IN+gEWR0n1hMyusQdqTbWk1gGkf1QJ2R9+MJ/L6eVUMSeKOk
	nI8O958C9wBQbvklEJ1AKaoc1Gb+/aouySa1THBDhqXXbCkZCO/oP+j+nIl7ZdL4wcE6ejYcq2ZUR
	/8r+Cu6/OlriYzwQuhfr0jpq8/eMHRTyKcCbMLy802ug09qDRaKd0Mb2mhfIzuqRuYPVerJSBZQkx
	XhJad9PSgG6qg8F19PFo3NgVA5p4USBbfSXAA1XkCWLSeA5Ufl98TsmY1+xhziAQZoafJwML8q+ON
	+L3TxUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHk3-0000000HGZ2-3rXs;
	Thu, 15 Oct 2026 09:27:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHk3-0000000HGYc-2VMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:27:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0299D41A71;
	Thu, 15 Oct 2026 09:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DA21F000C4;
	Thu, 15 Oct 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056434;
	bh=3mdYgBt2LqB3LVgkJYeY1oIFFwKjz6NX1BHb65C9Dec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mNY6mvVDi+W8sqfBDlBi7cPIoJAzc8uAef8ObVwlpSneTh99bFmMBX9TRgxZz5ZqB
	 NBPiDoTpMbgcTnO3t+hm9mGv9Hp2BxR1zVmnzcskjGkZQmCmWZzF7bhDb+xkufDJ9P
	 32XYSa5/QcZMdnOJsyPDXOx3E9yTDhx1B9SACs1t37GPnTkWUSKUOpaX4mktQa8kiR
	 il57qggWOoLv7su9BU6SidpTFFob8F3bFk2gY3NhH1+I7zjp587grslsoqseq420rb
	 Ia/KmN8fQl7WvLuqVbkkd0azvZHQ0POrZazUde45SMaGjpcvVnejnasbpnH3SvIuDn
	 1j/GQvXbYKgbw==
Date: Thu, 15 Oct 2026 11:27:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset
 controller bindings
Message-ID: <20261015-noble-sloppy-chamois-c71dd2@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-6-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-6-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:45AM +0100, Navid Ghahremani wrote:
> Define logical reset indices (0, 1, 2...) for the topcrm and crm2
> reset controllers on ZTE ZX279128S SoCs.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../dt-bindings/reset/zte,zx279128s-reset.h   | 26 +++++++++++++++++++

This belongs to the patch with bindings/schema.

>  1 file changed, 26 insertions(+)
>  create mode 100644 include/dt-bindings/reset/zte,zx279128s-reset.h
> 
> diff --git a/include/dt-bindings/reset/zte,zx279128s-reset.h b/include/dt-bindings/reset/zte,zx279128s-reset.h
> new file mode 100644
> index 0000000000..5b580bcda8
> --- /dev/null
> +++ b/include/dt-bindings/reset/zte,zx279128s-reset.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
> +#define _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
> +
> +/*
> + * Top CRM logical reset lines. Mapped by drivers/clk/zte/clk-zx279128s.c
> + * to hardware register offsets and bit shifts.
> + */
> +#define ZX279128S_RESET_USB_B9		0
> +#define ZX279128S_RESET_USB_B10		1
> +#define ZX279128S_RESET_USB_B11		2
> +#define ZX279128S_RESET_USB_B14		3

> +#define ZX279128S_RESET_COUNT		4

Drop, not a binding.

> +
> +/*
> + * Top CRM 2 logical reset lines.
> + */
> +#define ZX279128S_CRM2_RESET_PCIE0	0
> +#define ZX279128S_CRM2_RESET_PCIE1	1

> +#define ZX279128S_CRM2_RESET_COUNT	2

Drop.

Best regards,
Krzysztof


