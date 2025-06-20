Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqHxHMHpiSBOonmYwgcaVrOJs53oqASO9DQlRt3Vqko=; b=QH9k5y+hU5SSxlmK9np7GETjbh
	41x1aAEz1jd/xDLiRbYyi56CKPDJFvSYKTRiSm1BlTKwflS8sMVDvacuS9mkZrhSssGLDePROOBWM
	/OkqNX37SRp9ajOivkQzfR2ds2I0Ayqb0NVZNlcc0Jxb/Bin3gqPX11YSgRCxjM+pUu/nOOFziAkh
	RWlr0Cx6yDc8856hQ2huzoiuzpZf0bvwuyNUSUTn3tR3+J7HEJ1HycpuxHA5dtF6VGnwGfgo1IQiN
	/XOp+fwgPjv5jFk3p/qBraEyMOyV813+/yJ0YR7c1IeN8wo69T1VGSfOBqthLhQEb0Qiab+A7ACGb
	dRmL99rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQe5-0000000EXQg-4871;
	Fri, 20 Jun 2025 01:34:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQZB-0000000EX2X-3qSM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 01:29:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80045113E;
	Thu, 19 Jun 2025 18:28:57 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7620F3F673;
	Thu, 19 Jun 2025 18:29:15 -0700 (PDT)
Date: Fri, 20 Jun 2025 02:28:03 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing
 PPU0 reset
Message-ID: <20250620022803.13e7c34c@minigeek.lan>
In-Reply-To: <20250619171025.3359384-2-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
	<20250619171025.3359384-2-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_182918_011124_F5B3F551 
X-CRM114-Status: GOOD (  17.31  )
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

On Fri, 20 Jun 2025 01:10:24 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.

Confirmed by experiment.

> Add a reset entry for it at the end of the existing ones.
> 
> Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  include/dt-bindings/reset/sun55i-a523-r-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/reset/sun55i-a523-r-ccu.h b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
> index dd6fbb372e19..eb31ae9958d6 100644
> --- a/include/dt-bindings/reset/sun55i-a523-r-ccu.h
> +++ b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
> @@ -21,5 +21,6 @@
>  #define RST_BUS_R_IR_RX		12
>  #define RST_BUS_R_RTC		13
>  #define RST_BUS_R_CPUCFG	14
> +#define RST_BUS_R_PPU0		15
>  
>  #endif /* _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_ */


