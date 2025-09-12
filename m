Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E4DCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDyH5E9yt2KIlNyz+7EVC5IwRslVr8Slgb7f8Q70L2o=; b=urbClpBg1ufu3NX5WXRSSlO/Pv
	vBUzYMQeUqnCyBGuh+RwTOS1vP5CR0DyL1JjRIV8JZd+h8H9mp4bqLpMHANFIwjWeOZoH97D2hWqp
	7zwvdGVRSqLaT/ln+MJflSJDRAUmYNmbEdkKYejEKaKrv7KmWjhmfq4aiTvzMG4xO98+KX+U2EsGY
	c//ZSeHrnWOJlr18UVHjJzRWLTfayQf5pt1BilYUfDO7fdj76ytgtF8HkkRhIGB6tkXYdRRssumFg
	qKbww5s8zCU7ww+r3uYyxaYi/yU/AfNfsMI7SJ5fGtJiGfFl0MAO0+upZI3li8r/OhXEsO5SLnerl
	QyT3eg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4fl-00000009qgt-0UiR;
	Fri, 12 Sep 2025 14:22:45 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4fi-00000009qdn-0ZLo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1757686958;
 bh=MDyH5E9yt2KIlNyz+7EVC5IwRslVr8Slgb7f8Q70L2o=;
 b=vVKQWkq9z42zFKBgZAArn5RG9d5B9plzslM3+SVZvsmkwcxm6lhAylLxhmK4Jpr2XmElIQQhq
 FRCMmDLtUm/MK+MDhm8XS/jUU5kT8OfeYfPhpCVcbLnxqr4dop/murzz3AhSFhOhabSsrLExGao
 EesdnnFMJg71gYZAxPnqjwmCt/XMooOibNQukv/w5s9Yg3i+zZ6W7Cpah9EGflDQUQ7QR3IcdZq
 pg7WsnR2jzbaDAcXqeojPIU8VpoyGqDafHyh2npMv+TYe2ZwTEzBawBQYkDBAMpt3HY9QoZcz2a
 K17yHDAm9MYwHl6HlxK9yRa3NuEFWXtY4C5KQNnGwdUQ==
X-Forward-Email-ID: 68c42c9edab860ac3968c5ee
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <6bd28aaf-aafd-436e-8799-fcdb07082660@kwiboo.se>
Date: Fri, 12 Sep 2025 16:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: dts: rockchip: RK356x: Add OTP description.
To: Andrey Leonchikov <andreil499@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heiko@sntech.de, dsimic@manjaro.org, dmitry.osipenko@collabora.com,
 tglx@linutronix.de, amadeus@jmu.edu.cn, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250912135542.2304150-1-andreil499@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250912135542.2304150-1-andreil499@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072242_260222_48099E3B 
X-CRM114-Status: GOOD (  13.98  )
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

Hi Andrey,

On 9/12/2025 3:55 PM, Andrey Leonchikov wrote:
> Add OTP mapping, can be used on future by drivers.
> Contain a factory-programmed values for a various peripheral.
> U-Boot already use "CPU-ID" OTP value ("otp_id" on this patch).
> All values from original Rockchip sources tree on github.

Please do not blindly copy values from vendor tree, they do not always
match what is expected for mainline Linux.

There is also a series that adds the required dt-bindings and driver
support for OTP on RK3566, RK3568 and RK3562 pending at [1]. The
dt-bindings for rockchip,rk3568-otp is required before we can add any
otp node to the device tree.

Also we should place any nvmem cells inside a nvmem-layout node.

[1] https://lore.kernel.org/all/20250415103203.82972-1-kever.yang@rock-chips.com/

Regards,
Jonas

> 
> Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> index fd2214b6fad4..74523efa8ecf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -1057,6 +1057,111 @@ rng: rng@fe388000 {
>  		status = "disabled";
>  	};
>  
> +	otp_ns: otp@fe38c000 {
> +		compatible = "rockchip,rk3568-otp";
> +		reg = <0x00 0xfe38c000 0x00 0x4000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		clocks = <&cru CLK_OTPC_NS_USR>,
> +			<&cru CLK_OTPC_NS_SBPI>,
> +			<&cru PCLK_OTPC_NS>,
> +			<&cru PCLK_OTPPHY>;
> +		clock-names = "usr", "sbpi", "apb", "phy";
> +		resets = <&cru SRST_OTPPHY>;
> +		reset-names = "otp_phy";
> +
> +		cpu_code: cpu-code@2 {
> +			reg = <0x02 0x02>;
> +		};
> +
> +		specification_serial_number: specification-serial-number@7 {
> +			reg = <0x07 0x01>;
> +			bits = <0x00 0x05>;
> +		};
> +
> +		otp_cpu_version: cpu-version@8 {
> +			reg = <0x08 0x01>;
> +			bits = <0x03 0x03>;
> +		};
> +
> +		mbist_vmin: mbist-vmin@9 {
> +			reg = <0x09 0x01>;
> +			bits = <0x00 0x04>;
> +		};
> +
> +		otp_id: id@a {
> +			reg = <0x0a 0x10>;
> +		};
> +
> +		cpu_leakage: cpu-leakage@1a {
> +			reg = <0x1a 0x01>;
> +		};
> +
> +		log_leakage: log-leakage@1b {
> +			reg = <0x1b 0x01>;
> +		};
> +
> +		npu_leakage: npu-leakage@1c {
> +			reg = <0x1c 0x01>;
> +		};
> +
> +		gpu_leakage: gpu-leakage@1d {
> +			reg = <0x1d 0x01>;
> +		};
> +
> +		core_pvtm: core-pvtm@2a {
> +			reg = <0x2a 0x02>;
> +		};
> +
> +		cpu_tsadc_trim_l: cpu-tsadc-trim-l@2e {
> +			reg = <0x2e 0x01>;
> +		};
> +
> +		cpu_tsadc_trim_h: cpu-tsadc-trim-h@2f {
> +			reg = <0x2f 0x01>;
> +			bits = <0x00 0x04>;
> +		};
> +
> +		gpu_tsadc_trim_l: npu-tsadc-trim-l@30 {
> +			reg = <0x30 0x01>;
> +		};
> +
> +		gpu_tsadc_trim_h: npu-tsadc-trim-h@31 {
> +			reg = <0x31 0x01>;
> +			bits = <0x00 0x04>;
> +		};
> +
> +		tsadc_trim_base_frac: tsadc-trim-base-frac@31 {
> +			reg = <0x31 0x01>;
> +			bits = <0x04 0x04>;
> +		};
> +
> +		tsadc_trim_base: tsadc-trim-base@32 {
> +			reg = <0x32 0x01>;
> +		};
> +
> +		cpu_opp_info: cpu-opp-info@36 {
> +			reg = <0x36 0x06>;
> +		};
> +
> +		gpu_opp_info: gpu-opp-info@3c {
> +			reg = <0x3c 0x06>;
> +		};
> +
> +		npu_opp_info: npu-opp-info@42 {
> +			reg = <0x42 0x06>;
> +		};
> +
> +		dmc_opp_info: dmc-opp-info@48 {
> +			reg = <0x48 0x06>;
> +		};
> +
> +		remark_spec_serial_number: remark-spec-serial-number@56 {
> +			reg = <0x56 1>;
> +			bits = <0 5>;
> +		};
> +	};
> +
>  	i2s0_8ch: i2s@fe400000 {
>  		compatible = "rockchip,rk3568-i2s-tdm";
>  		reg = <0x0 0xfe400000 0x0 0x1000>;


