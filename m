Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48797CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 02:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YqASTwYL9cHxC7rY2PdHzRjS6kBVzdXj54JZkAOZIw=; b=l0z12oypss/chR4x/EU7lpbRA4
	nyLkJCYNXYp8G3qPMrVfDkhXzPVS0AsBa6GLSPyZe1AaqmOeGM07BdWaytkM9JfDMICcYzNecEv2O
	V4m/CtX1Gg7CWcw7lV5rLqEuwHOm6Fsias/gqstOGYs07hPMSycUBymGeWqude+sq+izvcmnViufL
	haTOfegVdlY0Mu+PrBxKlKWuApJN5tRM6HybYRPk7rRb417Py1YSDHwhuNiV9RJIDp+mJuwxNFiqz
	JNXP7kvKi/gttDZuIHp48Ohxzh4yHqUHqxxs4sl767Z8NqbKHAl4XZw37d8gZvrlt3Fqm2xmZfDCs
	SqEPVAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBNO-0000000GgSZ-10Gn;
	Thu, 15 Oct 2026 02:39:26 +0000
Received: from mail-m3296.qiye.163.com ([220.197.32.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBNJ-0000000GgRm-2Fwn;
	Thu, 15 Oct 2026 02:39:24 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51193076c;
	Thu, 15 Oct 2026 10:34:17 +0800 (GMT+08:00)
Message-ID: <9ceed0bd-8804-4804-bbce-bb7eb7963fc2@rock-chips.com>
Date: Thu, 15 Oct 2026 10:34:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Diederik de Haas <diederik@cknow-tech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power rail
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-9-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-9-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d690def03a4kunm6ed793153a31a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx4eVhpNTEwYGR5IGR5DS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PABh/Z8NoX637jTmXGRO/Fgdh9rKIMLPAoJmGbAtAa9fPS0KUWrqDgnmnQSKZbIYZQr0qajDAkUQcNTnCPl2wcf/yxzef7/0DwW0NUXH1m9kFjvQHo4FSoue9vC3expHqTH0JAG9SswjNTXg+YG8ftw6f6MWnWxWbvr0X7z+ZUo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1YqASTwYL9cHxC7rY2PdHzRjS6kBVzdXj54JZkAOZIw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_193922_176204_079B0DF4 
X-CRM114-Status: GOOD (  11.99  )
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



在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> vcc3v3_pcie matches the signal name in the schematics, which simplifies
> cross-referencing.
> 

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>


> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> index ca115d8e108a..dd61c61fe7d7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> @@ -36,13 +36,13 @@ user_led: led-1 {
>   		};
>   	};
>   
> -	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
>   		compatible = "regulator-fixed";
>   		enable-active-high;
>   		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pcie20x1_2_con_pwren>;
> -		regulator-name = "vcc_3v3_pcie";
> +		regulator-name = "vcc3v3_pcie";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
>   		vin-supply = <&vcc5v0_sys>;
> @@ -95,7 +95,7 @@ &pcie2x1l1 { /* M.2 E-key 2230 */
>   
>   &pcie2x1l2 { /* M.2 M-key 2280 */
>   	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
> -	vpcie3v3-supply = <&vcc_3v3_pcie>;
> +	vpcie3v3-supply = <&vcc3v3_pcie>;
>   };
>   
>   &pinctrl {
> 


