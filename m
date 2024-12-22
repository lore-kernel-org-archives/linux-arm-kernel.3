Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D512E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L2ijTzXbg/vLZheTfRi/fUxvMVwR9SRC+HFCAYk098=; b=Qk35Pv69s28zvsaTWRVBhitg/Z
	Tm1FhuNj1aH20hAq5DecSMWIYteofj9YftK8wnZdxsPgsJGBWlW87KDb8lDgxY37zv11pC0T6I9eJ
	Q2+SKb+MpxLXbnTuDeW/NaDYzOsBm7RWIswqlrq4tKt2qawR2Vzh9H6/zoU+1N/jcwUJBiBOpVPhh
	sN13mvv0/KsVVm2Vw8dbAIpxuNpYcpw/RCt5clXhMAmaBRD851rFmOI7kOF1koI07WHoFBjyPUAnP
	tSxWebdTC/DEjhpK57BOJPIML3T6MDe8aFlPTCdpR8F6/sLvA6rmOw2+tGk6vXorMtmLy3RLUgKex
	jhuJv91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPFcv-00000007ui3-44gh;
	Sun, 22 Dec 2024 06:39:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPFbf-00000007uXi-3W7v;
	Sun, 22 Dec 2024 06:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0B86A405B8;
	Sun, 22 Dec 2024 06:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9A2C4CEDC;
	Sun, 22 Dec 2024 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734849506;
	bh=m92kMbMIGZ8ojgXMDxE1mIEmPbxrkQehi0RQi1blXTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETQExCuc1M1yrvKZDgB+Elyvetv0TQO+K5otx0ZbP1F2s3U8jZquFtDXQAt0oBqjL
	 bQpFUNLkK58bC9Z8VkB1Hl9uc9p0T2V5IxjIClZtb7HDtedkCQnE9C1J3vPntj1EDm
	 6Um2rIJyubB9m18Dev6GTBvD9l/vGbltBNfYKqqPOu+xmHs3U5rriOOKZfj35rm1oO
	 TvMaKOIdIAKqh4c1EhiX/YRs8aDWERmj8YMtoBcXw0H5XlrLCgYdDTB246TmlObN+/
	 yhsKVgat6zqVUXahPPxoaaZEj0B0OvPG3F8AfbmiciHzeopBjsA/KlG5HGGHxS22V+
	 Kb3JwhqIiqzrA==
Date: Sun, 22 Dec 2024 07:38:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Finley Xiao <finley.xiao@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	Rob Herring <robh@kernel.org>, Liang Chen <cl@rock-chips.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dts: arm64: rockchip: Add rk3576 pcie nodes
Message-ID: <i54jjqt7uaxrurdapsyxwmb5iokiwzgm5cvlaamlggycrpyd3v@azhmfwgetrzm>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
 <20241220101551.3505917-4-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220101551.3505917-4-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_223827_944776_F405BF01 
X-CRM114-Status: GOOD (  13.26  )
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

On Fri, Dec 20, 2024 at 06:15:47PM +0800, Kever Yang wrote:
> rk3576 has two pcie controller, both are pcie2x1 used with
> naneng-combphy.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> 
> Changes in v2:
> - Update clock and reset names and sequence to pass DTB check
> 
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 109 +++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index a147879da501..df7dfe702221 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1016,6 +1016,115 @@ qos_npu_m1ro: qos@27f22100 {
>  			reg = <0x0 0x27f22100 0x0 0x20>;
>  		};
>  
> +		pcie0: pcie@2a200000 {
> +			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
> +			bus-range = <0x0 0xf>;

Follow DTS coding style in properties order and everything around here.

Best regards,
Krzysztof


