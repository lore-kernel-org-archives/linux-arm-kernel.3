Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D14E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 22:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEPOAcNs906aUJ+b8CTcLrheXhGyiJcFCUN6p22264g=; b=mpR9i6yoFQcObkSytfJLGDs5f6
	UMrgyFQe1KG4YcrtrHoxaGPHUQ24dI/HbhgczParHKjEqlSXjuMo/ubWMaQdKo4lgeUlFSGXPUpfa
	5oG56tNbGKI7My2uYnfgmccibyqDzH9SstyOePMRkyJfcf0XOFVhLFFHBc0uOns0259ZoEYiLoTmt
	C9a7jTnOcNmRqIe5yIzitqVRtDRsBKD9qVOUl4g9a6RLhP8cjjdqGbvjuomGFIOPyw7uz4+3OKFKJ
	lFTQzQa8D0pIt5oYYNCCuVvwsjHzuPd/eTmdGxtR08LEs60D7G0Pq1ik+eEB/egwEHcfYaHTXOPJZ
	+txGdGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6hz-00000003Yxz-13yI;
	Sun, 12 Jan 2025 22:45:27 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6gi-00000003Yok-3xfk;
	Sun, 12 Jan 2025 22:44:10 +0000
Received: from [192.168.0.160] (unknown [222.77.7.241])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 46D9A7817F;
	Mon, 13 Jan 2025 06:44:06 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 46D9A7817F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736721846;
	bh=jEPOAcNs906aUJ+b8CTcLrheXhGyiJcFCUN6p22264g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oru766WfWGH5XN6eqNNkbvUu9lYUCvdL3pjOhugR8Iyv4zmuLrepk3Ci0Uv+wdjfx
	 f5rsXluJ8lu2hB79XNiiNMrX5YDWofxVArSzdUFj1LeeTEJnv7NKG9xJ3zq7rIeBOG
	 iQ0iHhMR8/YcQ396LmYiMoO2narHOeizLMqUlRVk=
Message-ID: <9a8237c4-1ca2-4cce-b836-a3394692a144@classfun.cn>
Date: Mon, 13 Jan 2025 06:44:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Junhao Xie <bigfoot@classfun.cn>
References: <20250112073344.1976411-4-bigfoot@classfun.cn>
 <20250112082036.19922-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <20250112082036.19922-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_144409_266529_BB985D41 
X-CRM114-Status: GOOD (  13.14  )
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

On 2025/1/12 16:20, Chukun Pan wrote:
> Hi,
>> +	/* pi6c pcie clock generator */
>> +	vcc3v3_pi6c: regulator-vcc3v3-pi6c {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
> 
> Although both gpio and gpios can be used here, I tend 
> to use gpio to keep it consistent with other parts.
> (vcc3v3_sd, vcc3v4_rf, vcc5v0_usb30_otg0 ...)

Yes, I overlooked it, I will change it to this:
gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;

> 
>> +&mdio1 {
>> +	rgmii_phy1: ethernet-phy@0 {
> 
> Only one rgmii phy I think '1' is not needed?
> Or `phy@address: ethernet-phy@address {`

I used sgmii_phy0 rgmii_phy1 to name them, they are
indeed redundant, and sgmii is not in mainline yet,
I will change rgmii_phy1 to rgmii_phy.

> 
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0x0>;
> 
> The phy address should be 3. Can you try it?

It seems to work fine when using address 0x3, I will modify it.

> 
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&eth1_phy_rst>;
> 
> Is pinctrl necessary here?

I will remove it.

The node now looks like this:
&mdio1 {
	rgmii_phy: ethernet-phy@3 {
		compatible = "ethernet-phy-ieee802.3-c22";
		reg = <0x3>;
		reset-assert-us = <20000>;
		reset-deassert-us = <100000>;
		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
		rx-internal-delay-ps = <1500>;
		tx-internal-delay-ps = <1500>;
	};
};

> 
>> +&sdmmc1 {
>> +   ...
>> +	wifi: wifi@1 {
>> +   ...
>> +&uart1 {
>> +   ...
>> +	bluetooth: bluetooth {
> 
> No aliases needed.

I will remove it.

> 

Thanks for your review, I will fix all problems in next version!

Best regards,
Junhao


