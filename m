Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3B1C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUqzUmCd5C8LaJR7q3XMrWlHVSAMJDyXvnpn53blVaI=; b=EMwBay/Ltzw75Ydad5Pzssp1Q5
	ULVVsmFAJaeAlk2OkiXDr7NTK6H5OWsxDNroJvN70hqe5wTW/bnLooXhn8LAPq4EB0Y6Ij2qkB4UX
	KYzFzPd+xzGQTBEO/+x0YgqJvvbPbrN/IXirmM5ePJkV1jcxaJGtnw8D1ZGji4DcjtKQZU/CLeuX0
	VL/5Y9pcAs9sMVxvjv00fAc1TqtW+VXs5eSHHil57I06C8J1z0oJRGFIkc6Ud0lYANnprtPEopSLg
	gdLVCcfGXPhqQsyB5RfZ/yTEdCPf7y12iPPvJe8YwxkayEpN7hT8Bv1us0g8KICL+On+tddCvYnYj
	e69Kdieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj6v-0000000D9wf-2JZB;
	Tue, 14 Jul 2026 19:48:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj6t-0000000D9wR-35eW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:48:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF1D960103;
	Tue, 14 Jul 2026 19:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CA91F000E9;
	Tue, 14 Jul 2026 19:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058486;
	bh=oUqzUmCd5C8LaJR7q3XMrWlHVSAMJDyXvnpn53blVaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hJjbRkjodStNV3aFkSroSh3RyI1uRsygLQn7A7gDs39Y2nFzt9uMuVciIxK1tCwid
	 66Zsi7OXdiuAxDKyEIZCZr3Y9I8GCiLF/6JSPmQZtGTO8IhFtkj+duE81iHc26IQn2
	 sGcHzOYVs7sqGGWXhxqTLkkpdp94MM5U3iMnjO88g90e1AK0JU0DxA1vT9yJ/oIBbD
	 K6F0yyuRNESCDE6QhmYjyn5BKZVDrwP3/e/WhQLW4pw6uiJDgBOq28fGTs/p01Oh+b
	 Hyzzf9nPwI6aCkawKUD5Q+mQgyttB7YY8h5gKwGVoQ4zWjrPBvu3GeScAb0VXeMkTr
	 MNslCVmGm6Uqg==
Message-ID: <6c3a01f7-957d-4dc4-a892-3af2826928af@kernel.org>
Date: Tue, 14 Jul 2026 21:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: apple: Add minimal t8132 (M4) device
 trees
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Hector Martin <marcan@marcan.st>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linus Walleij <linusw@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-pwm@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-10-e5655ee56523@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-10-e5655ee56523@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 7/5/26 15:17, Yureka Lilian wrote:
> Added device trees for the following devices:
> - apple,j604 - MacBook Pro (14-inch, M4, 2024)
> - apple,j623 - iMac (24-inch, 2x USB-C, M4, 2024)
> - apple,j624 - iMac (24-inch, 4x USB-C, M4, 2024)
> - apple,j713 - MacBook Air (13-inch, M4, 2025)
> - apple,j715 - MacBook Air (15-inch, M4, 2025)
> - apple,j773g - Mac mini (M4, 2024)
>
> The device trees have a minimal set of devices limited to CPU cores,
> interrupt controller, power states, watchdog, serial, pin controller,
> i2c and framebuffer.
> The device trees for the notebooks add a PWM controller for the keyboard
> LED illumination.
>
> Using the macOS 26.6b3 iBoot/firmware, the Mac mini reliably boots on a
> single core using the stock kernel.
> Booting with smp requires avoiding the wfi and wfit instructions
> in the idle loop and `delay()` respectively, since those instructions
> cause a loss of architectural state on the secondary cores, and even
> then boot is unreliable.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>   arch/arm64/boot/dts/apple/Makefile        |    6 +
>   arch/arm64/boot/dts/apple/t8132-j604.dts  |   35 +
>   arch/arm64/boot/dts/apple/t8132-j623.dts  |   18 +
>   arch/arm64/boot/dts/apple/t8132-j624.dts  |   18 +
>   arch/arm64/boot/dts/apple/t8132-j713.dts  |   35 +
>   arch/arm64/boot/dts/apple/t8132-j715.dts  |   35 +
>   arch/arm64/boot/dts/apple/t8132-j773g.dts |   25 +
>   arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |   48 ++
>   arch/arm64/boot/dts/apple/t8132-pmgr.dtsi | 1125 +++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8132.dtsi      |  440 +++++++++++
>   10 files changed, 1785 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
> index 6fc3349a5842..181bd0e28965 100644
> --- a/arch/arm64/boot/dts/apple/Makefile
> +++ b/arch/arm64/boot/dts/apple/Makefile
> @@ -1,4 +1,10 @@
>   # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_APPLE) += t8132-j604.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t8132-j623.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t8132-j624.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t8132-j713.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t8132-j715.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t8132-j773g.dtb
Please put these at the correct position in the Makefile and not at the 
very top.

>   dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j71.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j73.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j85m.dtb
> diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/dts/apple/t8132-j604.dts
> new file mode 100644
> index 000000000000..c4be915cb33a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Apple MacBook Pro (14-inch, M4, 2024)
> + *
> + * target-type: J604
> + *

[...]

> +
> +		pmgr: power-management@380700000 {
> +			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x3 0x80700000 0 0x14000>;
> +			/* child nodes are added in t8132-pmgr.dtsi */
> +		};
> +
> +		aic: interrupt-controller@381180000 {
> +			compatible = "apple,t8132-aic3", "apple,t8122-aic3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x00000003 0x81000000 0x00000000 0x1cc000>,

You have 381180000 in the node name but 381000000 here, I guess the node 
name is a copy paste error. W=1 flags this fwiw.


Sven


