Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0541AC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOPB5s1AVVEESZAsbtL0NPJBawQgvnyA8F7vvZJJ3SY=; b=llwzhzPxFL/bmC87gmztoX5i9N
	LN5kFVCQowJrMbHTsEZR1r7eFhjEzrY/xd+PyFZcQ7Xz8CmUrSTS1l9LdvYwUs9YaxgTgqkxFVpDc
	82bZ01Ovpp5SomFJeIyutpSC6FCXdGU3GZv5NjExnRBtW7VJ9CMIxUsEaQQcCEtqgI4NXz4qDWBMg
	UYtIgEUOAL8ulcO8UamvkzjkKkdWtMB3ZDK/pU7jSdvi1oH4teCLWp8QmdQTs5fQYQGtyAeFmOxa4
	ecve/DDig4SFUD3wcjRk1Ek9WYoTbgZrDwVL2Bqjr2En6/TfG74ZBmRfDNGgfTYctGMf797aiaHlK
	p2RvOVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiHC-0000000DfOi-3zwp;
	Tue, 11 Aug 2026 08:56:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiH9-0000000DfOL-1vFl;
	Tue, 11 Aug 2026 08:56:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82505600AD;
	Tue, 11 Aug 2026 08:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392D81F000E9;
	Tue, 11 Aug 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786438558;
	bh=aOPB5s1AVVEESZAsbtL0NPJBawQgvnyA8F7vvZJJ3SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BInhLC3A9EzYUaIcBOGFb/4Zc7qX4oBcukJnnBBuerT8zvQHOdCgMRb5oIMruRkEr
	 5uesCaUdNbkWekEA1yxrUoorWZ+Yx4GF6BtF0Xg74JxfGJ7u0s6hE8nk5ER3B4S9fE
	 140EPNujt84y8LwVfVWrhURIXrWohLWGhP2IEu2kXNEmyLT6CnnBisL0VvTX7zlyK7
	 gWB6JBabTcFRLIGb/5h+s2X28XhXs90IC/PSxg2vUDq1N18YcIZIrYI046itSObl7s
	 Olr1JoR345kNMqwnQg2ZwGHzKXOTd1YBkbd/3bP9PaUOJFH+5LAYiqEheiVypyUh33
	 TkVsNIDz8TPlQ==
Date: Tue, 11 Aug 2026 10:55:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/8] dt-bindings: reset: Add reset controller
 constants for mt8167
Message-ID: <20260811-roaring-bat-of-blizzard-63ffee@quoll>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-6-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260809160643.33991-6-l.scorcia@gmail.com>
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

On Sun, Aug 09, 2026 at 06:03:29PM +0200, Luca Leonardo Scorcia wrote:
> Add the various bits that identify watchdog and mmsys resets. IDs for
> mmsys resets restart from zero as they are used in a different device.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt8167-resets.h b/include/dt-bindings/reset/mediatek,mt8167-resets.h
> new file mode 100644
> index 000000000000..af8a3e499f8b
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt8167-resets.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +
> +/* TOPRGU resets, these are actual bits in the register */

Not a binding, drop these.

> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
> +#define MT8167_TOPRGU_AUD_PAD_RST		1
> +#define MT8167_TOPRGU_MM_RST			2
> +#define MT8167_TOPRGU_MFG_RST			3
> +#define MT8167_TOPRGU_MDSYS_RST			4
> +#define MT8167_TOPRGU_CONN_RST			5
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
> +/* The data sheet describes bit 9 as "reserved, unused" */

ID cannot be unused. If it is unused, then just use next one here, so MT8167_TOPRGU_APMIXED_RST=9.

Best regards,
Krzysztof


