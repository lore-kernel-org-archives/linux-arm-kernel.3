Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A147C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqY8TIEpfI+mUQTezjGiLhk+rxtWguZl8ImoBYlcr+A=; b=OvEujfr+ulXugAeZypHutzJU+Y
	2vLyy0QajBtm+dTbuC16ktAFTJxDOwb5dJUwf9+lT2hTVZRLCvW+KLQnfrT0CMjjphOU76J7nnhID
	AAlA4PO0XrzhToW3LertAYXO+urM+OeoJzUb+8/DxC6nX4o37hF1q6ySrSzq8A6MzulmsC7PMARQm
	jkqk1/EpQxOjPflXA90xXujWOhaT1iqxJdjq7QaREI9I9BdqL6fjQiH6TggJpkD8MPx05LPKCzyoG
	e7NBsjVagZf04wbqLdidC35FwrBc3WvL9KCP4n34uwouc+5edUA4rMyAi7fgJUuhU3RgeHcmYxLwA
	WHzbIxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQbu-0000000EXFs-17A9;
	Fri, 20 Jun 2025 01:32:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQXp-0000000EWx1-04wg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 01:27:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7AB9113E;
	Thu, 19 Jun 2025 18:27:29 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92CF33F673;
	Thu, 19 Jun 2025 18:27:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 02:26:30 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0
 reset
Message-ID: <20250620022548.2f589c26@minigeek.lan>
In-Reply-To: <20250619171025.3359384-3-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
	<20250619171025.3359384-3-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_182753_109592_A4243F81 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, 20 Jun 2025 01:10:25 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
> 
> Add a reset entry for it at the end of the existing ones.

Right, just this one bit is not mentioned in the manuals (both A523 and
T527), even though the PPU1 reset bit and the PPU0 clock gate bit are,
so it's clearly a manual bug. I can also confirm that both bit 16 and 17
(and none above that) are writable, and both bit 16 (reset) and bit 0
(clock gate) are required to access the PCK-600 PPU (as per: sunxi-fel
readl 0x7060fc8).
 
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for spotting this!

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> index b5464d8083c8..70ce0ca0cb7d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -204,6 +204,7 @@ static struct ccu_reset_map sun55i_a523_r_ccu_resets[] = {
>  	[RST_BUS_R_IR_RX]	= { 0x1cc, BIT(16) },
>  	[RST_BUS_R_RTC]		= { 0x20c, BIT(16) },
>  	[RST_BUS_R_CPUCFG]	= { 0x22c, BIT(16) },
> +	[RST_BUS_R_PPU0]	= { 0x1ac, BIT(16) },
>  };
>  
>  static const struct sunxi_ccu_desc sun55i_a523_r_ccu_desc = {


