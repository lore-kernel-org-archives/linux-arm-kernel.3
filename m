Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCF6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVLmiUVwLhBElmfmfrG97lSASocUhgv+wrJHYKp1MJc=; b=ClvhHCSxFUkkS5T4YXDZEQX71C
	0FEZQx9XROrvjczvXIwK/0PD9ImfBPE2NpdTrsi/YPorztoSWT9WvCg+XlY9l4HVk9GZggo2hBYhT
	MBJdVJAD359yI4gZPo7PbiSXD9G6OYWA4sUu6EekwzmP2TQywAUv9lEKJdSPmJW70hGS6Gzlq83NY
	+8GKh1MWQP4cx2HmIoU/Dv63GkERDCAeRQL8ZdXXC1T65LLGi/UUY/cd37uxlg3zqVJ5waNyTFB8c
	dCgWYQfLxp7Ow4mgSmFV1gmu0wgvANBCvQv5Txuw8njs5WWQ4N4sXizDWrs79J7fcrHBq0TV91MAh
	PuNKJGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoxf-00000002Uec-25m3;
	Fri, 14 Aug 2026 10:16:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoxe-00000002UeM-2TgF;
	Fri, 14 Aug 2026 10:16:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACC3F600C3;
	Fri, 14 Aug 2026 10:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3D91F000E9;
	Fri, 14 Aug 2026 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702585;
	bh=KVLmiUVwLhBElmfmfrG97lSASocUhgv+wrJHYKp1MJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lyai1pzSyh6s9n0wv9Z1fJOJ/hgHiWa4xosn5hJSODAL/GoFlNJvLjJEw/XLH7jXE
	 +HzS2CjzcW1tIrdzjUZ0GhIZWL9LhqAGNQeQX/I/JxYNWSpiEzveJyMT09a7ikexm+
	 HLKcXmT77XtuDsNVlnTxazunMITSKwG2wUPE43z8Z19W/FGYKJU6IWWq5T2m0Lep6A
	 LyirC0DSADskhKflQY3oimPzVeYDFWXDC1MG88aI7bG8kC7+OPi1t2p1fC4mJVovoy
	 Cur6Mk1tBF+CRzloY1xrQeprOhsSr67OZFLGFVVXuUuTgatfVaTNvbdS93lQjerpoq
	 9a1toyz4/o0RA==
Date: Fri, 14 Aug 2026 12:16:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/25] ARM: dts: rockchip: Add reset bindings to RV1106
Message-ID: <20260814-dexterous-immortal-sponge-ec5d2f@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-4-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-4-vlad@zlab.su>
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

On Mon, Aug 10, 2026 at 03:10:54PM +0300, Vladislav Leonov wrote:
> Include the RV1106 CRU reset-ID header so device tree nodes can
> reference reset lines by name, matching the reset controller support
> added in the previous commit.
> 
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
> 
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index 70d3da6bd03e..fa5d0d7f4dcb 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/rockchip,rv1106-cru.h>
> +#include <dt-bindings/reset/rockchip,rv1106-cru.h>

Dead code, why adding it?

IWYU.

Best regards,
Krzysztof


