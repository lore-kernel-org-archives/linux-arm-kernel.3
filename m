Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A459C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXitATJsY8BgpfJq75nn2osjYyBgvb24SDjAaK1q/mo=; b=jnD2N0sg3ldTrFQh9seU4QZr2C
	bFNlguHM7nqYmyrQEE4P14no2diVB6fwolgTSrt4qBeH2W0LixQZ4FbPAlBTQSD/Azg2qmSs7fBBT
	+0na7FGHmihyplmVw1HYD4X0tnsWADXJLtuYV1b1YeaKS3eku5ZO29MxQNnn5cLZgu2QI42p7lu4r
	Z0Ob65HOMm3E8SU4wXPIs5JU6b/rISxEluz1c/+HLKQcQOCY2vtMN+Xm1YOy13BQxebjMwy35oJzp
	92fZN4556yqkyFPXphVgoCCwgaIwVVzUBTMdaFaBW/AE/5L4AiX4yr2rokD8lV0S/zuS5726H21N3
	TkHOmFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhWP-00000005yA7-1e2o;
	Mon, 20 Jul 2026 06:30:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhWO-00000005y9q-0uVZ;
	Mon, 20 Jul 2026 06:30:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C619404FC;
	Mon, 20 Jul 2026 06:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDDE1F00A3F;
	Mon, 20 Jul 2026 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529035;
	bh=OXitATJsY8BgpfJq75nn2osjYyBgvb24SDjAaK1q/mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AN/hPycRKmYYZ4fB3Ovk1WuhT+00HOSwbACoLd+io1ObBH6pzFJoyA6LF4Lx/shZS
	 oHFIqdIUgqKdQuRYEoBgGskZrt/Xr2XUr510kF4fOnFKmCWU7vsJrg6nbMcpRINhCH
	 CA8YmePU5HVhv4n9W8WAh/mTIEmyUKrldsxjl8Q706pQf2WteX7OXLV/yvxq+69NNA
	 DNKISipFLm5IU2CzC+4yueIdxX5VQ8i+SyHxXqjojdLKDVp8wtKNX5VXkxUtZ1mvPW
	 ceQG+paOL1RuRlEhIQHrfZv+/hwBLvMS+z8Pq2wERYmSt3X0H7UwWON7w0eZAdV5Pw
	 5GCi2EjX7gosA==
Date: Mon, 20 Jul 2026 08:30:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Message-ID: <20260720-elegant-flawless-vole-aa3c1f@quoll>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
 <20260717163959.714561-8-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717163959.714561-8-l.scorcia@gmail.com>
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

On Fri, Jul 17, 2026 at 06:39:18PM +0200, Luca Leonardo Scorcia wrote:
> The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
> registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
> also stated in the downstream kernel for the Lenovo Smart Clock
> in the ddp_reg.h header.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/soc/mediatek/mt8167-mmsys.h | 41 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    |  3 +++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
> index eef14083c47b..dc3e882a9893 100644
> --- a/drivers/soc/mediatek/mt8167-mmsys.h
> +++ b/drivers/soc/mediatek/mt8167-mmsys.h
> @@ -3,6 +3,47 @@
>  #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
>  #define __SOC_MEDIATEK_MT8167_MMSYS_H
>  
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <dt-bindings/reset/mediatek,mt8167-resets.h>
> +
> +#define MT8167_MMSYS_SW0_RST_B				0x140
> +#define MT8167_MMSYS_SW1_RST_B				0x144
> +
> +/* MMSYS resets */
> +static const u8 mmsys_mt8167_rst_tb[] = {

No, data structures NEVER go to the headers because it leads easily to
duplicated data.

Best regards,
Krzysztof


