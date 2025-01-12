Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C498E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 22:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Gbp/iAkE0WvSs9YPY1BfcKbb4Jn7r1/Bj7q1lILlsI=; b=edsNUtB+kh5VXw00fyz8/7I/ol
	ZRx4jK5FQpZ+yWRtbs4U93hpLNDwZEH6FwOhyoSpks7DKotLW+6zKD1mxO2OIm91gdgymPa7s7IG7
	0JblgE0xCVmBnG9WdYeHaC/HLE5v5FOjoDDeEqVEHlQu9Vi/N5cXPJWnAFycEygFYyIMwwnx9mIJp
	5ZgncuNFGaSI1OfrHvwkZiNq19uVw7qvYt2pzmIJOEXyzmp3TRGn+QuRqsweA/4lOj51ok5c2qp6l
	TZRdGEWivoucFOdmNdj0xcQwHGJoTAzXu+YJFy9c86je71D+CUujfKIHNv+/YQ8yUD4N3vD6v3+b7
	0SkCfxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6Rk-00000003XUi-2EA5;
	Sun, 12 Jan 2025 22:28:40 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6QT-00000003XMx-3rWI;
	Sun, 12 Jan 2025 22:27:23 +0000
Received: from [192.168.0.160] (unknown [222.77.7.241])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 04B107817F;
	Mon, 13 Jan 2025 06:27:17 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 04B107817F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736720839;
	bh=6Gbp/iAkE0WvSs9YPY1BfcKbb4Jn7r1/Bj7q1lILlsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xov2FoAnMFPjBO2RmvVEdjjBXfTo4+WUl9V01wGOrMlaIKOnGaFFV+hpGtifwy5EW
	 5X9GK3c7nkxYj0C/Pcp9BO5Jrod2ComUxDR47q66NvVsuEU5h9WBk1wfwUQB08s/lB
	 zSHbhN5dwz9HHKXEfz+Z7dx56wF+Dt3WgLr0XmyA=
Message-ID: <526e0c19-6495-4dcf-bf6b-b5bd62a7a631@classfun.cn>
Date: Mon, 13 Jan 2025 06:27:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add support for Ariaboard Photonicat RK3568
To: Dragan Simic <dsimic@manjaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>,
 FUKAUMI Naoki <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junhao Xie <bigfoot@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
 <c520a0d829bbe26b9802f57f94f3957c@manjaro.org>
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <c520a0d829bbe26b9802f57f94f3957c@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_142722_258665_B6CE6BB8 
X-CRM114-Status: GOOD (  17.37  )
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

On 2025/1/12 16:50, Dragan Simic wrote:
> Hello Junhao,
> 
> On 2025-01-12 08:33, Junhao Xie wrote:
>> Add dts for Ariaboard Photonicat RK3568.
>>
>> This series bring support for:
>> * Debug UART
>> * SDIO QCA9377 WiFi and Bluetooth
>> * M.2 E-Key PCIe WiFi and Bluetooth
>> * M.2 B-Key USB Modem WWAN
>> * Ethernet WAN Port
>> * MicroSD Card slot
>> * eMMC
>> * HDMI Output
>> * Mali GPU
>> * USB Type-A
>>
>> Changed from v1:
>> - move some general nodes (firmware, ramoops, reboot-mode) to rk356x.dtsi
> 
> This entry from the changelog caught my attention, so I tried
> to find out what exactly happened back then.  Though, after going
> through the mailing list archive, I still don't see where the
> as-described change took place, so perhaps this changelog entry
> needs adjusting.

Chukun Pan suggested moving these nodes to rk356x.dtsi, but I have not done
that yet and simply deleted them. I will fix the changelog.
https://lore.kernel.org/lkml/20240905034009.28124-1-amadeus@jmu.edu.cn/

- remove some general nodes (firmware, ramoops, reboot-mode)

> 
>> - gmac1 change to phy-mode rgmii-id
>> - corrected some regulator to be closer to schematics
>> - rename rk3568-ariaboard-photonicat.dts to rk3568-photonicat.dts
>> https://lore.kernel.org/lkml/20240904111456.87089-1-bigfoot@classfun.cn/
>>
>> Changed from v2:
>> - remove unused headers
>> - corrected some regulator to be closer to schematics
>> - remove usb_host1_ohci, usb_host1_ehci, usb2phy1_host that have no connection
>> https://lore.kernel.org/lkml/20240906045706.1004813-1-bigfoot@classfun.cn/
>>
>> Changed from v3:
>> - corrected some regulator to be closer to schematics
>> - changed to using clk32k_out1 in xin32k
>> https://lore.kernel.org/lkml/20240911122809.1789778-2-bigfoot@classfun.cn/
>>
>> Changed from v4:
>> - corrected some regulator to be closer to schematics
>> - corrected some label to match node name
>> - use resets props in phy node instead deprecated snps,reset-gpio
>> https://lore.kernel.org/lkml/20240914145549.879936-1-bigfoot@classfun.cn/
>>
>> Changed from v5:
>> - resort regulator nodes
>> - remove dr_mode from usb_host1_xhci
>> https://lore.kernel.org/lkml/20241108031847.700606-1-bigfoot@classfun.cn/
>>
>> Junhao Xie (3):
>>   dt-bindings: vendor-prefixes: Add prefix for Ariaboard
>>   dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
>>   arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
>>
>>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>  .../boot/dts/rockchip/rk3568-photonicat.dts   | 599 ++++++++++++++++++
>>  4 files changed, 607 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

Thanks for your review, I will fix all problems in next version!

Best regards,
Junhao


