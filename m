Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E36C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bci8p3IZMtUnGVV/yGdgCwUbxn3sfGQwj0xpFyR4dSU=; b=s21DPy9pFtMOyYOMRGz0uOrTcE
	XHunOUu+Y+GZM+KXe1yxnqSDZzLpcKx4ocupnatLpPh18dH943PwjkTvwq7ysmrZV7YlcaDLnJfk/
	/9Ka4hkhTj2Yp5PjbPwJ5oeZi+LmGYok7PMqyOIUZ2FYYD46st8O9qSpp74x31vcGrylJQLRyHsAE
	+21O/JhZk/75gX3Kj+BJcIbyx/boDnaROmXAJhO7QF9j/rRrR4wok+zmZo80xxGB7QbvnUhaSaj+J
	e42fEvb46NtZsYGrWzBTKzmqVbJ5U8rCfSgSWUtyasUYxdwhkhO7HTmT6uEwX4Luzd2IrM3rEFtIr
	B4aac8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh0d-00000002q4V-0XRi;
	Mon, 23 Jun 2025 13:14:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfRy-00000002WDB-31Ka;
	Mon, 23 Jun 2025 11:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750678497;
	bh=T5SUbISDYE0U3ndj/fUfEJmuuEiLHNdsAPnultnjOuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jOvyQqig1PXeIOkhqzTJgc7CWTlzPM9KLhSl2nLshTqwFckdzO+82Np+/okVsuEaX
	 5kkdlePa/8gq1xcYhx+xs0XRxM9TBlpYMfTmHGgC4QVU5il9u35gKo8H3+XHY2dGQH
	 nRfSi33UNd/LdXQfyNrhinj0JYL6FlfqbrjH0qM37dOvlEjx7/HlbSXPLZQvadz3r8
	 Pf2ZRjUCWnjjEZSLL+ML+7Qlo+OpizSOXDkNpCA2b16A3gqSogfQNiRdxmD7oHjcRh
	 p8TwbTE1zl8jbXlb3WdhPMul2g/UpyNCqEK3rTC8bjXtzE0Xx/yTaPBJ4kjl9x1zf3
	 kmW+TX9FPCPTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2598217E0184;
	Mon, 23 Jun 2025 13:34:56 +0200 (CEST)
Message-ID: <88a04bcc-b287-432c-b309-5c76259ceda3@collabora.com>
Date: Mon, 23 Jun 2025 13:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/30] Add support for MT8196 clock controllers
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250623102940.214269-1-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250623102940.214269-1-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_043458_913664_4B6C7194 
X-CRM114-Status: GOOD (  13.31  )
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

Il 23/06/25 12:29, Laura Nao ha scritto:
> This patch series introduces support for the clock controllers on the
> MediaTek MT8196 platform, following up on an earlier submission[1].
> 
> MT8196 uses a hardware voting mechanism to control some of the clock muxes
> and gates, along with a fence register responsible for tracking PLL and mux
> gate readiness. The series introduces support for these voting and fence
> mechanisms, and includes drivers for all clock controllers on the platform.
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

(as I reviewed this entire thing internally and before submission anyway :-D)

Cheers,
Angelo


> [1] https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
>    clk: mediatek: mt8196: Add UFS and PEXTP0/1 reset controllers
> 
> Laura Nao (28):
>    clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable control
>    clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
>    clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and
>      FENC
>    clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
>    clk: mediatek: clk-mux: Add ops for mux gates with HW voter and FENC
>    clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use
>      mtk_gate struct
>    clk: mediatek: clk-gate: Add ops for gates with HW voter
>    clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
>    dt-bindings: clock: mediatek: Describe MT8196 peripheral clock
>      controllers
>    clk: mediatek: Add MT8196 apmixedsys clock support
>    clk: mediatek: Add MT8196 topckgen clock support
>    clk: mediatek: Add MT8196 topckgen2 clock support
>    clk: mediatek: Add MT8196 vlpckgen clock support
>    clk: mediatek: Add MT8196 peripheral clock support
>    clk: mediatek: Add MT8196 ufssys clock support
>    clk: mediatek: Add MT8196 pextpsys clock support
>    clk: mediatek: Add MT8196 adsp clock support
>    clk: mediatek: Add MT8196 I2C clock support
>    clk: mediatek: Add MT8196 mcu clock support
>    clk: mediatek: Add MT8196 mdpsys clock support
>    clk: mediatek: Add MT8196 mfg clock support
>    clk: mediatek: Add MT8196 disp0 clock support
>    clk: mediatek: Add MT8196 disp1 clock support
>    clk: mediatek: Add MT8196 disp-ao clock support
>    clk: mediatek: Add MT8196 ovl0 clock support
>    clk: mediatek: Add MT8196 ovl1 clock support
>    clk: mediatek: Add MT8196 vdecsys clock support
>    clk: mediatek: Add MT8196 vencsys clock support
> 
>   .../bindings/clock/mediatek,mt8196-clock.yaml |   79 ++
>   .../clock/mediatek,mt8196-sys-clock.yaml      |   76 +
>   drivers/clk/mediatek/Kconfig                  |   78 +
>   drivers/clk/mediatek/Makefile                 |   14 +
>   drivers/clk/mediatek/clk-gate.c               |  106 +-
>   drivers/clk/mediatek/clk-gate.h               |    3 +
>   drivers/clk/mediatek/clk-mt8196-adsp.c        |  193 +++
>   drivers/clk/mediatek/clk-mt8196-apmixedsys.c  |  203 +++
>   drivers/clk/mediatek/clk-mt8196-disp0.c       |  169 +++
>   drivers/clk/mediatek/clk-mt8196-disp1.c       |  170 +++
>   .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    |  117 ++
>   drivers/clk/mediatek/clk-mt8196-mcu.c         |  166 +++
>   drivers/clk/mediatek/clk-mt8196-mdpsys.c      |  187 +++
>   drivers/clk/mediatek/clk-mt8196-mfg.c         |  150 ++
>   drivers/clk/mediatek/clk-mt8196-ovl0.c        |  154 ++
>   drivers/clk/mediatek/clk-mt8196-ovl1.c        |  153 ++
>   drivers/clk/mediatek/clk-mt8196-peri_ao.c     |  144 ++
>   drivers/clk/mediatek/clk-mt8196-pextp.c       |  131 ++
>   drivers/clk/mediatek/clk-mt8196-topckgen.c    | 1257 +++++++++++++++++
>   drivers/clk/mediatek/clk-mt8196-topckgen2.c   |  662 +++++++++
>   drivers/clk/mediatek/clk-mt8196-ufs_ao.c      |  109 ++
>   drivers/clk/mediatek/clk-mt8196-vdec.c        |  253 ++++
>   drivers/clk/mediatek/clk-mt8196-vdisp_ao.c    |   78 +
>   drivers/clk/mediatek/clk-mt8196-venc.c        |  235 +++
>   drivers/clk/mediatek/clk-mt8196-vlpckgen.c    |  769 ++++++++++
>   drivers/clk/mediatek/clk-mtk.c                |   16 +
>   drivers/clk/mediatek/clk-mtk.h                |   23 +
>   drivers/clk/mediatek/clk-mux.c                |  119 +-
>   drivers/clk/mediatek/clk-mux.h                |   76 +
>   drivers/clk/mediatek/clk-pll.c                |   46 +-
>   drivers/clk/mediatek/clk-pll.h                |    9 +
>   .../dt-bindings/clock/mediatek,mt8196-clock.h |  867 ++++++++++++
>   .../reset/mediatek,mt8196-resets.h            |   26 +
>   33 files changed, 6814 insertions(+), 24 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-adsp.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-disp0.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-disp1.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-mcu.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-mfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl0.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl1.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-peri_ao.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-pextp.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen2.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-vdec.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-venc.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>   create mode 100644 include/dt-bindings/clock/mediatek,mt8196-clock.h
>   create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h
> 


