Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD4DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KG4fUCDLB9B6n/kj3zL/Wg8Xo2rnAPFIoEj566OdWMY=; b=2dN+OvCjCQ5hNjv8Adv6Qy6rqA
	hVp8ZnqcmJtsB2XpW5mBfcbRS0XwdGqH258ixYxkWzqiLzn3uFeUzJS3ByFXB0elE6Mn8lJwF6ETi
	aihnp4GYWtYmpw0IA+3/G0/CglI0VS6GsuPaGdYtVUeFwoFdHvLBu5mHGT/yzpiE1D1lfPTfaSw6n
	LZ4R1jfDan5XWkeneNV3xkDBu78W5Uwu+EmcxLaZ8ZyS9Bp2dHNfaoaokiXlX1SnOBQm/eCKWFMqL
	IZdIWETrV4/ZdW72KK01M5XAAsESlDznGfGvgrTIrYlobhSFwp1zYYVPEdH3Iy9uP4PS7lw1P0/3H
	mC3/yAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU3UG-0000000EzKe-0dxh;
	Sat, 04 Jan 2025 12:42:40 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU3T5-0000000EzFf-2bL4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 12:41:29 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735994475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KG4fUCDLB9B6n/kj3zL/Wg8Xo2rnAPFIoEj566OdWMY=;
	b=vjBvlbG1nD7E0M5p3USHuQaGE4mr5D+BJMikzEwLmgmQILIYNR0L2Pmx4Xqp6rQmssdLsU
	zgNQ/IdjjjYC++qt95Pawo20CyW6NaidWdbMhq18BoMDTmJ1LvJV++155Xgcj2y3sI8HWB
	nieDGmvF1vPkRzeKm9c+fFfcCAM0JBJ+Mc87ry99r1g+PjleCWHopRsNYfe13MKc1z5zuf
	mX73/Q/uQ8uNyhsWYmOyExgA63zt8OGVYWv5txpJoJsn3n4XhKsVH0ZPBov1afhyMSoruz
	lhzpIu7aZW5h55GkSJ7Wz35BXOe/ka02NOim4B5mK7xLJB5YmofoCdG917YbEw==
Date: Sat, 04 Jan 2025 13:41:12 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org, Vasily Khoruzhick
 <anarsoul@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>, Stuart
 Gathman <stuart@gathman.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
In-Reply-To: <20250104120256.65511a28@minigeek.lan>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
 <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org>
 <20250104120256.65511a28@minigeek.lan>
Message-ID: <65dfd7fd87fd2cd0a03f59fa23999830@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_044127_963586_3C8CADF2 
X-CRM114-Status: GOOD (  17.92  )
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

Hello all,

On 2025-01-04 13:02, Andre Przywara wrote:
> On Sat, 4 Jan 2025 11:33:23 +0100 Krzysztof Kozlowski <krzk@kernel.org> 
> wrote:
>> On 04/01/2025 11:23, Chen-Yu Tsai wrote:
>> > On Sat, Jan 4, 2025 at 3:40 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> >>
>> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
>> >> select TCON0 clock parent in dts
>> >>
>> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
>> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
>> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
>> >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> >> ---
>> >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
>> >> index 175892189e9d..4f220ea7a23c 100644
>> >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
>> >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
>> >> @@ -44,7 +44,9 @@
>> >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
>> >>
>> >>  #define CLK_PLL_VIDEO0         7
>> >> +#define CLK_PLL_VIDEO0_2X      8
>> >>  #define CLK_PLL_PERIPH0                11
>> >> +#define CLK_PLL_MIPI           17
>> >
>> > You can't really split code movement into two patches.
>> >
>> > With this patch applied the clk driver will fail to build because
>> > the macros are now redefined in both header files.
>> 
>> Are you sure? The values seem the same to me... I don't see how this
>> could fail.
> 
> Yes, IIRC the C standard allows repeated definitions with the same
> value. And I definitely tested this before (and hence recommended this
> approach to Vasily) and it compiled without any warnings here.

FWIW, I also tested that approach when it was recommended, to make
sure that the C compiler(s) are fine with that.  And it worked. :)

>> > Barring recombining the patches, please add a patch before this
>> > adding #ifndef's around the two macros that are moved.
>> 
>> No, not necessary, just churn,

