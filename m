Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48B5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsEHByuVKf7DhNGSxXVU2Yry2pwiYY9+v93Hi40HF1w=; b=OYnC7p1ziuGFXQdW9jLTlJRUVY
	tUgEFzGFo+dtThwV7wgrP0gop6dDuqTLcPZapvv9YSX03bfFFl1y3VkYI2BjgtqJQiJJBa8vypq82
	PWzhqvE2LYEIqnc5PYvyMbGZ4n+fGJta5x+KQZ7XEbe7OVRzxVGvCRG0XUo/l3oBWV99edx6dwU7N
	i3v1QRJI2wjLSsXnIN2s72Ts5a/UiVSXYoyF3oiMh073No+sH//4qY++oVc3Jll0pAN+6gyzVMu0u
	N47pF8zOk6OSBG8/OgVmBhXU+OdL8aiLewDi7Bka4X1p3w3w+0A64SPbTPNhla72Sq/5RX7CWnGoU
	dfW4ma7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dJV-00000009xcf-1L3y;
	Mon, 22 Sep 2025 09:58:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dJS-00000009xbo-2dKq;
	Mon, 22 Sep 2025 09:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758535104;
	bh=ZCHyRLM+j9OlCRrd3bKmx78gsMrZ5IafU4Re3JgUqMI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lTQLW89VcBrKHcN6nJF22Ssn434CXDHE5MA2w9+4kD7D2zedW/k4uAS1VNO+MeL0B
	 cl5AAz9agLrZ4jcXIFcXVWCT5Ii13IHsQ1/g7xM4gjtcLGNT+pc/00FBBj7HbvhYIA
	 tP/mR3Ui6dO49jUwu31gir9RhCQJmYNOKGI33Srb1b+cPrJkLR26YiYLruQI9rhZLx
	 7t1f2O5Pfv5kf5+k9LUYDw7ejcDhn4rlYE35mbn79sCFjvQeywOZ4Hqm/ts+a6adOV
	 X6GW2NUyZtsenotXH8dQbF5NiaaYCAOWm9e2cvCliO0Y3pQdpybwv0OvmJ4V/OnT1j
	 XCs6iZcs7jEPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1DFB217E0237;
	Mon, 22 Sep 2025 11:58:24 +0200 (CEST)
Message-ID: <371a8b2a-1e89-4735-b8cd-5c00643e9ab6@collabora.com>
Date: Mon, 22 Sep 2025 11:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clk: mediatek: mt7988-infracfg: SPI0 clocks are
 not critical
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <49fb368b4da6f5ed11812dceb45f174ceca8f10a.1758477397.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <49fb368b4da6f5ed11812dceb45f174ceca8f10a.1758477397.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_025826_814403_6BE16933 
X-CRM114-Status: GOOD (  20.14  )
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

Il 21/09/25 19:58, Daniel Golle ha scritto:
> SPI0 clocks have wrongly been marked as critical while, probably due
> to the SPI driver not requesting them. This can (and should) be addressed
> in device tree instead.
> Remove CLK_IS_CRITICAL flag from clocks related to SPI0.
> 

Eh, technically you're right about the Fixes tag - but if there is a problem in the
devicetree and this patch gets backported to older releases, the device gets broken
in all old kernels.

So - I agree with this change and besides, the SPI clocks are correctly declared in
at least mt7988a.dtsi so I don't see this breaking any device in the current kernel
but please, at this point, drop the Fixes tag so that we avoid backports.

Once the tag is removed, you can add my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Patch originally sent 2024-10-31 but never received any feedback.
> 
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index ef8267319d91..c40e18c27f12 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -196,12 +196,10 @@ static const struct mtk_gate infra_clks[] = {
>   	GATE_INFRA2(CLK_INFRA_SPINFI, "infra_f_fspinfi", "spinfi_sel", 10),
>   	GATE_INFRA2_FLAGS(CLK_INFRA_66M_NFI_HCK, "infra_hf_66m_nfi_hck", "sysaxi_sel", 11,
>   			  CLK_IS_CRITICAL),
> -	GATE_INFRA2_FLAGS(CLK_INFRA_104M_SPI0, "infra_hf_104m_spi0", "infra_mux_spi0_sel", 12,
> -			  CLK_IS_CRITICAL),
> +	GATE_INFRA2(CLK_INFRA_104M_SPI0, "infra_hf_104m_spi0", "infra_mux_spi0_sel", 12),
>   	GATE_INFRA2(CLK_INFRA_104M_SPI1, "infra_hf_104m_spi1", "infra_mux_spi1_sel", 13),
>   	GATE_INFRA2(CLK_INFRA_104M_SPI2_BCK, "infra_hf_104m_spi2_bck", "infra_mux_spi2_sel", 14),
> -	GATE_INFRA2_FLAGS(CLK_INFRA_66M_SPI0_HCK, "infra_hf_66m_spi0_hck", "sysaxi_sel", 15,
> -			  CLK_IS_CRITICAL),
> +	GATE_INFRA2(CLK_INFRA_66M_SPI0_HCK, "infra_hf_66m_spi0_hck", "sysaxi_sel", 15),
>   	GATE_INFRA2(CLK_INFRA_66M_SPI1_HCK, "infra_hf_66m_spi1_hck", "sysaxi_sel", 16),
>   	GATE_INFRA2(CLK_INFRA_66M_SPI2_HCK, "infra_hf_66m_spi2_hck", "sysaxi_sel", 17),
>   	GATE_INFRA2(CLK_INFRA_66M_FLASHIF_AXI, "infra_hf_66m_flashif_axi", "sysaxi_sel", 18),


