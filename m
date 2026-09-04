Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BD9C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByVGAz+j9xe5MWNa9XTv6mxh8KuFnEa40VZnZO+yeb0=; b=EFu+2bpzrwtTUGDNKHQ3AF086c
	0yZ0rDqRg5QoKdgXGmodp+in0Vo/b5qNRJ5v/jy+NjRsZHnDp7K2GAD6K4XONvw1FAkWD0DSk+k21
	d51tOkhVr3X28ts7ORY8K9nidN8b8CldBDY7CGUGHw1znXWNhClb/VshjcGsjPMDIMlhZrAafdQWq
	0h3FWPAR7RoHx2b+HLqU36uJtrW2Zns9hvb9JeucOzvTaF3KazrlvObAWXO+oN3W+Bske+IFjXUNZ
	1mDqU9mI/qBWoOk4E/z1KuzdWjxilPRrjfoI/21YKhS7JmhvBgDHXit5Q0O9bq+MHeoWnjbzjRD3w
	ilXIL4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2acm-00000003H1i-3nnA;
	Fri, 04 Sep 2026 20:35:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2acl-00000003H17-25zs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 20:34:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED341600C8;
	Fri,  4 Sep 2026 20:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B6F1F00A3D;
	Fri,  4 Sep 2026 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788554098;
	bh=ByVGAz+j9xe5MWNa9XTv6mxh8KuFnEa40VZnZO+yeb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gGdhCXql4CzLkGf9OGoZbMxcYFfsZbs1FWEpe6J7eEwlo6Jd+U+0Zn7RhNeiGQLIM
	 kR+fGiBDjUED7n84d69bzyFTkU8roW2La5EMgTaMUY5XxZ7klVql8BPsJlfrwRL45L
	 er9JvOoWzJOw4hKz8mF+cELxhlwAomMHUAR3MzNz+mo3M93OtHNZz0YHtidNa56wsJ
	 pnBr0H76J6rDe1pJ2FTrsLzgtcYZhAHCuXwqdrPrDlzOwkZgVES1BHF5fOq7yZ9Alq
	 LFazWdo5EsMriw9DWZwRYYEpQP6WoTd0IvAEcM1Z7Qz+/nL1IfCjTSHRITXzGvu0eY
	 9YX0DgpVqi2Pg==
Message-ID: <027b6019-9a2c-4f3a-8c64-c9836857b471@kernel.org>
Date: Fri, 4 Sep 2026 22:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: apple: Add minimal MacBook Neo device
 tree
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-6-0c25401d165d@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-6-0c25401d165d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,


On 04.09.26 21:49, Yureka Lilian wrote:
> Added a device tree for the MacBook Neo, which uses the t8140 SoC
> (A18 Pro) also found in the iPhone 16 Pro.
> 
> The device tree has a minimal set of devices limited to CPU cores,
> interrupt controller, watchdog, serial and framebuffer.
> 
> Using the macOS 26.6.2 iBoot/firmware, the machine reliably boots
> on a single core using the stock kernel.
> Booting with smp requires avoiding the wfi and wfit instructions
> in the idle loop and `delay()` respectively, since those instructions
> cause a loss of architectural state on the secondary cores.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

[...]

> +
> +	memory@800000000 {

this doesn't fit the reg you use below.

> +		device_type = "memory";
> +		reg = <0x100 0 0x2 0>; /* To be filled by loader */
> +	};

[....]

> +
> +		aic: interrupt-controller@301000000 {
> +			compatible = "apple,t8140-aic3", "apple,t8122-aic3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x00000003 0x01000000 0x00000000 0x1cc000>,
> +			      <0x00000003 0x01040000 0x00000000 0x4000>;

please be consistent and use 0x3 and 0x0 here like for the rest.



Sven


