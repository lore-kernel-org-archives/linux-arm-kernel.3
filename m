Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDF9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov0fONSpayVHwQ6jSzoajrZju77Qrn6jIk0Ptu1/rrE=; b=o9vH7irVSLAKZxEMuHYMJgsXTS
	D1va0z0d9z+SV60Ild1Pvp/soEqe2x++zPmaw8o9gLhWs0jC/IcTgvQEs6U0S3lJaMs8+swB6G5po
	3S2vSV/NYD1sd8p/5Vg5TVaWh+3jrz2e3b8CSfXEK9Y2NFcX0Nn/sKuCSWWkCELjZw69B2MWLbVn2
	5CHVuzjlQ9Qyeadho3rbVSgd1r8TfhutAhMfB11bir29XyG5YADM0uBfL3Aj18CmoNzfY2UxR9+eb
	NNk4ykQkqWwIbyoatBJrw2YuSJ4z8x298Wk0nTZtge15tNmrzv3MfALS5rQ0ap5jBI0F960XWYpHW
	7vvi9UPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsH8O-00000007n3Z-249g;
	Wed, 12 Mar 2025 08:08:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGqE-00000007kS0-3oFi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06576A4533D;
	Wed, 12 Mar 2025 07:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA4FC4CEE3;
	Wed, 12 Mar 2025 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741765765;
	bh=1OUgy1SKRvO1iDshS78QTSNzbpvJr1KyphHwa0nzMCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mROqzmIlUBN82sBxeHnw6zvf6fYn5KVJ3MdADKa+tTWZT1uwZykUKVjQC65kOQ6HB
	 QhZlXdXiptmDO+e438/JQK+AL0HdEPU8Gw+jBz5LdRXosXfFgs4zOXNU+4TovGq3oF
	 vKge6cB8r5W/7ZDTsVOH6UOL+BvwRevETJUeRo0A9PYjkjR2hkpJEdGAsFpHsV/u/w
	 G3Oi+5wKJT4tcd+Hodp8uPqb7WjQ+10PICaoMpdRSP2xpcXhq/MV0JIXsBCGkzPwNu
	 CCbD9A9HucjAHL7hiLNwrDTgNA+U6RrrtaJPb979YIM1LvX0SszDSjeEiOeX78nERZ
	 HMWM3N4V0f1HQ==
Message-ID: <93bb3092-7f49-4a7f-ac97-3cf1a62ac39d@kernel.org>
Date: Wed, 12 Mar 2025 08:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200NVL BMC
To: Willie Thai <wthai@nvidia.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com,
 maryang@nvidia.com, pmenzel@molgen.mpg.de, Andrew Lunn <andrew@lunn.ch>
References: <20250312045802.4115029-1-wthai@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250312045802.4115029-1-wthai@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004927_089144_CDF0EFF3 
X-CRM114-Status: GOOD (  20.41  )
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

On 12/03/2025 05:58, Willie Thai wrote:
> The GB200NVL BMC is an Aspeed Ast2600 based BMC
> for Nvidia Blackwell GB200NVL platform.
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].

Missing blank line

> Co-developed-by: Mars Yang <maryang@nvidia.com>
> Signed-off-by: Mars Yang <maryang@nvidia.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> Link: Reference to Ast2600 SOC: https://www.aspeedtech.com/server_ast2600/ [1]
> Link: Reference to Blackwell GB200NVL Platform: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]

Links do not have text, I think. Just link.

> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> Changes in v2:
>   - Fix the SOB name [Krzysztof]
>   - Fix warnings from scripts/checkpatch.pl run [Krzysztof]
>   - Fix DTS coding style [Krzysztof]
>   - Move pinctrl override to the bottom [Krzysztof]
>   - Drop bootargs [Krzysztof]
>   - Follow DTS coding style and change naming for leds node [Krzysztof]
>   - Change flash 0 status property [Krzysztof]
>   - Change the phy-mode to rgmii [Andrew]
>   - Remove the max-speed in mac0 [Andrew]
> ---
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |    1 +
>  .../aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 1229 +++++++++++++++++
>  2 files changed, 1230 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 2e5f4833a073..20fd357a1ee9 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -50,6 +50,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-lenovo-hr630.dtb \
>  	aspeed-bmc-lenovo-hr855xg2.dtb \
>  	aspeed-bmc-microsoft-olympus.dtb \
> +	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-mowgli.dtb \
>  	aspeed-bmc-opp-nicole.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
> new file mode 100644
> index 000000000000..eeec3704a43b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
> @@ -0,0 +1,1229 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "AST2600 GB200NVL BMC";
> +	compatible = "nvidia,gb200nvl-bmc", "aspeed,ast2600";

Missing bindings.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also `scripts/checkpatch.pl --strict` and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.


...

> +	leds {
> +		compatible = "gpio-leds";
> +		led-0{

Missing space befre {

This applies everywhere.

> +			label = "uid_led";
> +			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
> +		};
> +		led-1{
> +			label = "fault_led";
> +			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
> +		};
> +		led-2{
> +			label = "power_led";
> +			gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
> +		};
> +
> +	};
> +
> +	buttons {
> +		button-power {
> +			label = "power-btn";
> +			gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
> +		};
> +		button-uid {
> +			label = "uid-btn";
> +			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +};
> +
> +// Enable Primary flash on FMC for bring up activity
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";

Nothing improved.

Respond to comment instead of ignoring it.



...


> +
> +		imux33: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +			pca9555@21 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

You already got this comment. You must apply such feedback to entire
file instead of fixing only one issue and relying on us to find all
instances. It's your task to find all of the instances.


Best regards,
Krzysztof

