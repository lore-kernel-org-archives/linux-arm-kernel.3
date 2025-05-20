Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8579C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKHEwnYvk3DoQnbDm76DtOrSSIM/yuksJQK3RjrtSzY=; b=xTPXaV5XA5lF5Jx28tfEvZpg4t
	86ZpAjeOgAAqSFdifVkAs1qno+MROhMXTSNXDu8we8Q8j4DbMiZJOxg0d0j3dUShIVL9/MECBNf8V
	JidKpc5Jlrwjx39WnNBlnkGeuogyXr8qObrUcnYSfPLnw6peNGYC4xTLfmHhQJbw5BuqzzWIOr9M5
	oTkNNx1zl33QJtQX0W7AGOEEFV4Sqos1V7SWyvq0f0z2WOhWG2ONlsxfSycuAyzedjdIqF5becRui
	Jrou9nRNdujmduHnqS3NI+qPvt3xiXnxAg5iPq19OqU+mNwK99qYnBwQ/kgPepeBnX3yAtr0RrXpL
	IMHkFq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHRKU-0000000DkaM-2plZ;
	Tue, 20 May 2025 18:04:42 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR8Y-0000000DjUu-16g8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1747763542;
 bh=uKHEwnYvk3DoQnbDm76DtOrSSIM/yuksJQK3RjrtSzY=;
 b=O9hLSaHsY1/3i9keUjq6d9wcRnagqNzaTIlzdkxn/OmBmqPc1/EZtUblLjFTKMMPZrr7HLIAV
 mhT7FfnQAuNySMMHLpqLjo/7FuFOSAKq4/4v1HRSdtpptZw9g66lVf/NnjRaYTfx3sS+qG3fmWu
 hk+FSMca5bqhQQF749ujDNbsNsQv78eDbprdJUkUm0hlyNrXRMYEqblcCdfHrCfzQx11NmriPAX
 Ay02kpvf4am148C55JnaKJw3A561MQKsrn5jWBnlcrb30jEOCIC6oDKf1g5yknhdRlQcyD5SotR
 UCzfMorxizx62wyzB6T/Xp2UTM1XDgRe+Jx2m+4De4vQ==
X-Forward-Email-ID: 682cc1437730016263d49d6d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <079c08bc-e8cc-4ed6-a71e-7ef103f635c0@kwiboo.se>
Date: Tue, 20 May 2025 19:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: Add naneng-combphy for
 RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-6-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250519161612.14261-6-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_105222_429391_F2D56BD5 
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

On 2025-05-19 18:16, Yao Zi wrote:
> Rockchip RK3528 ships a naneng-combphy that is shared by PCIe and USB
> 3.0 controllers. Describe it and the pipe-phy grf which it depends on.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index b2724c969a76..314afb94e19b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -318,6 +318,11 @@ vpu_grf: syscon@ff340000 {
>  			reg = <0x0 0xff340000 0x0 0x8000>;
>  		};
>  
> +		pipe_phy_grf: syscon@ff348000 {
> +			compatible = "rockchip,rk3528-pipe-phy-grf", "syscon";
> +			reg = <0x0 0xff348000 0x0 0x8000>;
> +		};
> +
>  		vo_grf: syscon@ff360000 {
>  			compatible = "rockchip,rk3528-vo-grf", "syscon";
>  			reg = <0x0 0xff360000 0x0 0x10000>;
> @@ -867,6 +872,23 @@ dmac: dma-controller@ffd60000 {
>  			arm,pl330-periph-burst;
>  		};
>  
> +		combphy: phy@ffdc0000 {
> +			compatible = "rockchip,rk3528-naneng-combphy";
> +			reg = <0x0 0xffdc0000 0x0 0x10000>;
> +			#phy-cells = <1>;

Should probably be sorted at end or before resets prop.

> +			clocks = <&cru CLK_REF_PCIE_INNER_PHY>, <&cru PCLK_PCIE_PHY>,

This break the ~80 line length limit mostly kept in this file.

> +				 <&cru PCLK_PIPE_GRF>;
> +			clock-names = "ref", "apb",
> +				      "pipe";

Could be kept on a single line.

> +			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
> +			assigned-clock-rates = <100000000>;

Other assigned-clock props are sorted before clocks props in this file.

This is also missing power-domains information (also missing from
dt-bindings patch):

	power-domains = <&power RK3528_PD_VPU>;

> +			resets = <&cru SRST_PCIE_PIPE_PHY>, <&cru SRST_P_PCIE_PHY>;

This also break the ~80 line length limit mostly kept in this file.

Regards,
Jonas

> +			reset-names = "phy", "apb";
> +			rockchip,pipe-grf = <&vpu_grf>;
> +			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
> +			status = "disabled";
> +		};
> +
>  		pinctrl: pinctrl {
>  			compatible = "rockchip,rk3528-pinctrl";
>  			rockchip,grf = <&ioc_grf>;


