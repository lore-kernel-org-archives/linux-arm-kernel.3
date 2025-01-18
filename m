Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673F1C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzcoBWAmZuk+L6ZYrQyhx0+ZNUjnzZUyHD63eA/BBT0=; b=WbK8NyLzrdRWLmxb67jGWz+syl
	UgorVuCZh6UmI2vYrP9c/hO5uUbGNEiN+B/GSZgV8+W1v8oJLPHrCCY93RnEgjhkNgmY7EBdBObE2
	2WXqEUtN4T0shV/dkaIXshiF9qB7zgNiKirhTSdQcRyTdelHOrIAvzD2vEpsY2aTPu9wkCkUw1hjm
	vKxuQ23OsyiYQp8QzF1YztfI9bRv3g9LuP1yN8IHGAcXYMyMTw7RTc9myc+Fjq0CrkUn4bK04eSF1
	GbRBYh+fyDRCDFpfMpJZ2ieKkt7RrlqLkmx2lGLVxVGNGIgnC/moCD+IZp9IjFZ6OAlCArCNk5SIX
	iMOxTkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8dL-00000002RzY-2EAf;
	Sat, 18 Jan 2025 13:13:03 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8PJ-00000002Q1i-2HAD;
	Sat, 18 Jan 2025 12:58:35 +0000
Received: from [192.168.0.160] (unknown [222.77.7.241])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 923A778841;
	Sat, 18 Jan 2025 20:58:26 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 923A778841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1737205108;
	bh=WzcoBWAmZuk+L6ZYrQyhx0+ZNUjnzZUyHD63eA/BBT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q+9tTc4iXeejAsSSeHoDDuZcTc3pU16vwQ3OECd3EfUkzOCdr9eu+1o53K+L8gp70
	 drVi/Th0WzKB8esVfHkjVP6DmIyfsnhGf+Ay5nxzVG6Exg367bfRysgBsGQy9xD4DK
	 vqUs+8YpdQ+F18HAy14V0B16c8Y+DfASxTAcjOiE=
Message-ID: <000e447d-a1bc-4118-865c-8c0b70146ab6@classfun.cn>
Date: Sat, 18 Jan 2025 20:58:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Junhao Xie <bigfoot@classfun.cn>
References: <20250114001411.1848529-4-bigfoot@classfun.cn>
 <20250115023018.15353-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <20250115023018.15353-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_045833_972007_968E562E 
X-CRM114-Status: GOOD (  12.23  )
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

On 2025/1/15 10:30, Chukun Pan wrote:
> Hi,
>> [1] https://github.com/photonicat/rockchip_rk3568_kernel/blob/novotech-5.10/arch/arm64/boot/dts/rockchip/rk3568-photonicat-base.dtsi
> 
> I don't think this link has reference value. I was misled
> by this several times when I wrote dts before.

It really helped me, I wrote first dts with reference to it and other devices
in mainline.
Could there be a better reference link here?

> 
>> +&pcie3x2 {
>> +	max-link-speed = <1>;
>> +	num-lanes = <1>;
> 
> I'm not sure about this.
> This PCIe3.0 x2 is not split.

In the schematics for that slot I saw that it only has a PCIe3.0 x1 connected.
I think maybe max-link-speed = <1> is wrong.
Now modify it to the following, it should look correct?

/* M.2 E-Key for PCIe WLAN */
&pcie3x2 {
	max-link-speed = <3>;
	num-lanes = <1>;
	pinctrl-names = "default";
	pinctrl-0 = <&pcie30x1m0_pins>;
	reset-gpios = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
	vpcie3v3-supply = <&vcc3v3_pcie>;
	status = "okay";
};

> 
>> +&sdmmc1 {
>> ...
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_cmd &sdmmc1_clk>;
> 
> pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_clk &sdmmc1_cmd>;

I will correct it.

> 
>> +	wifi: wifi@1 {
>> +		reg = <1>;
> 
> No aliases needed.

I will remove it.

> Other parts LGTM.
> 

Thanks for your review, I will fix all problems in next version!

Best regards,
Junhao


