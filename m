Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B011C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3aEbi3vbvtvRY+uN9WWZd+0zMgBkgvraJ9LrR9SE5c=; b=cNqG9cH9//Yc6+qQHCfPTlPwFe
	r78bCsM4LCo2M2gEpgG/enqgMniWGJyW4+WhbwBp2uD1hNxjTpsVRYi/NjNBLMt5cJDAskPbz2wLW
	NryCXwAtURKDSd29n21xe7V5h5V+QD/OGy0MMU4AkxY1yFY7Yl1CmvjxDeWY1rlVRqt19Vxtqnzmh
	VOOSQYECU2SuVjytR89spv9GbXpfn2JnkZ8Bc1zAY/nJSr/703wONNe+21AhdhHGdZPMCKJjBTgbl
	rzPhI7WPzuij/XhYfn+WiGHe5Hnxp0auc96pD1DKTNQX2rHUlHIyW1nfZPl/6H5IBwsvD7YZMfUDN
	VnWo7igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCyz-0000000BIDW-33Sq;
	Thu, 06 Mar 2025 15:17:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCxO-0000000BI5v-1VsN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741274176;
 bh=v3aEbi3vbvtvRY+uN9WWZd+0zMgBkgvraJ9LrR9SE5c=;
 b=sCnMgo2xx8FAVt7UTYtQP74jNhGUNvtPg1IsmBUQ/q6f7D3CyhlwBaJ6nW+oIqZGf8gHdsvL/
 haRx4svJQ1aHZs/6uaByehicEmuZ5IBrInzGcB+7VGlFidDxs0ePdNNizmJenvoBaXJE53yce/i
 MhBBf1wJbV7ZFQkSu+PwztsQ2hJdezYu3tn82idLqlsrOS7v6cShLR9au+Jlu7hYCKsH/pDgES9
 xaad1yENhayoGJeU5LIKN8mGAMqNJwgYtDAjUCZSI2kGAX/wFTI0FOPypq++2rpyprtoYnM9omr
 AdlXPG5KE4KrEhb2vXETlpqsUZdc7CZAWsfeFqoRJKZQ==
X-Forward-Email-ID: 67c9bc3e7d53aa09926028af
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <281b8025-8288-4274-b863-f091c05cbabe@kwiboo.se>
Date: Thu, 6 Mar 2025 16:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528
 SoC
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250306150017.488975-1-amadeus@jmu.edu.cn>
 <20250306150017.488975-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250306150017.488975-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_071618_500895_B84D572C 
X-CRM114-Status: GOOD (  13.10  )
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

Hi Chukun,

On 2025-03-06 16:00, Chukun Pan wrote:
> Same as RK3568, RK3528 uses SCMI clk instead of ARMCLK.
> Add SCMI clk for CPU, GPU and RNG will also use it.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 33 ++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index b1713ed4d7e2..476b83f98834 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -59,6 +59,9 @@ cpu0: cpu@0 {
>  			reg = <0x0>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> +			clocks = <&scmi_clk SCMI_CLK_CPU>;
> +			assigned-clocks = <&scmi_clk SCMI_CLK_CPU>;
> +			assigned-clock-rates = <1200000000>;

This is new compared to v1, please add operating-points instead.
cpu_pvtpll is already initialized to 1.2 GHz by firmware, see e.g. [1].

[1] https://lore.kernel.org/u-boot/20250123224844.3104592-5-jonas@kwiboo.se/

Regards,
Jonas

>  		};
>  
>  		cpu1: cpu@1 {
> @@ -66,6 +69,7 @@ cpu1: cpu@1 {
>  			reg = <0x1>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> +			clocks = <&scmi_clk SCMI_CLK_CPU>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -73,6 +77,7 @@ cpu2: cpu@2 {
>  			reg = <0x2>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> +			clocks = <&scmi_clk SCMI_CLK_CPU>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -80,6 +85,22 @@ cpu3: cpu@3 {
>  			reg = <0x3>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> +			clocks = <&scmi_clk SCMI_CLK_CPU>;
> +		};
> +	};
> +
> +	firmware {
> +		scmi: scmi {
> +			compatible = "arm,scmi-smc";
> +			arm,smc-id = <0x82000010>;
> +			shmem = <&scmi_shmem>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
>  		};
>  	};
>  
> @@ -88,6 +109,18 @@ psci {
>  		method = "smc";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scmi_shmem: shmem@10f000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x0010f000 0x0 0x100>;
> +			no-map;
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,


