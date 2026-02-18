Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2175FE9A04E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKsYIBP1nS9baNuNPf0y7xcvIP54RWOTm98i27xusoI=; b=Qg1oS7f8kPM89LE4Hs3ooo9RF5
	vPNNFnnWhOM2LfNO+xE3Y+c+gKKYjehz4pHrBLrZ1Kupr/uNQPLHVLWfXveykyU+kAImC/wSG2stS
	Ah19cIMAMP09UdWh+JdaW4dpFraQb0Tu0Oo23rszSBKqnv73eHo9XIpe9OYRozO7Ezg2A4nJRdH7L
	glKq9kjRLiwVi0wbdPoDk4iApGnKQ8sm0TmCFME3oJqoNgW3IcPfJE6Or3XWR7nFsUGSafQ/q1/Wi
	ryM0eiSsMp6SOoXyIN/5xq5oGa2UoaN7toQhXlolRNsrO3ZJ0g/kMsVkXUEtAJNNEYPh6Mjl7L9kw
	pqhrTFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsqP3-0000000AYHc-3FNs;
	Wed, 18 Feb 2026 22:52:17 +0000
Received: from forward502a.mail.yandex.net ([178.154.239.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsqP0-0000000AYGU-0cDF;
	Wed, 18 Feb 2026 22:52:17 +0000
Received: from mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:290e:0:640:f317:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 8729889CF4;
	Thu, 19 Feb 2026 01:52:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 1qjcVXSGC4Y0-8pHEunKh;
	Thu, 19 Feb 2026 01:52:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1771455124; bh=CKsYIBP1nS9baNuNPf0y7xcvIP54RWOTm98i27xusoI=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=O66KIAXFmfXw8rz4pI+7zzue0DPxJrPIy0aeyjkO+U5tkkEkgxOltbJc9noMwz41e
	 3f9Up+VtsxkvBYrT3f+TEddoOWmDlbun1b1OcoveKDg3YfFMn5/gAYkLLgE9rUkEba
	 fu98ukhOnyvr9PBN86WEp1TJGPNRinIP2W3AmBaw=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <bd10ba64-2e56-4f1b-ba82-73ef59c87e2a@yandex.com>
Date: Wed, 18 Feb 2026 23:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Add USB2.0 PHY for RK3368
To: Vladimir Oltean <olteanv@gmail.com>, WeiHao Li <cn.liweihao@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
 <20250909132958.26423-3-cn.liweihao@gmail.com>
 <20260212165550.mju3377fvphdsqoe@skbuf>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <20260212165550.mju3377fvphdsqoe@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_145214_738081_93112A09 
X-CRM114-Status: GOOD (  17.40  )
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



On 2/12/26 17:55, Vladimir Oltean wrote:
> On Tue, Sep 09, 2025 at 09:29:56PM +0800, WeiHao Li wrote:
>> RK3368 has one USB2.0 PHY with two ports, This adds device tree node for
>> it.
>>
>> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 29 ++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
>> index 1b21787269..b09e431a64 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
>> @@ -766,11 +766,40 @@ cru: clock-controller@ff760000 {
>>  	grf: syscon@ff770000 {
>>  		compatible = "rockchip,rk3368-grf", "syscon", "simple-mfd";
>>  		reg = <0x0 0xff770000 0x0 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
> 

> This introduces a device tree warning. You cannot mix nodes with no unit
> address (io-domains) with nodes with a unit address (usb2-phy@700) on
> the same hierarchical level. You have to pick a format and stick to it.

nope

Please add rockchip,rk3368-usb2phy to the list in grf.yaml in the same patch that you change rockchip,inno-usb2phy.yaml
Requires a bit of SOC and PHY maintainers coordination.

Place dt-binding compatible change patches before the patch that uses it. (patch 3 before patch 1)
due to: ./scripts/checkpatch.pl --strict 

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/soc/rockchip/grf.yaml#n244

> 
>>  
>>  		io_domains: io-domains {
>>  			compatible = "rockchip,rk3368-io-voltage-domain";
>>  			status = "disabled";
>>  		};
>> +
>> +		u2phy: usb2-phy@700 {
>> +			compatible = "rockchip,rk3368-usb2phy";
>> +			reg = <0x700 0x2c>;
>> +			clocks = <&cru SCLK_OTGPHY0>;
>> +			clock-names = "phyclk";
>> +			clock-output-names = "usb480m_phy";
>> +			#clock-cells = <0>;
>> +			status = "disabled";
>> +
>> +			u2phy_otg: otg-port {
>> +				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>> +					     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
>> +					     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +				interrupt-names = "otg-bvalid", "otg-id",
>> +						  "linestate";
>> +				#phy-cells = <0>;
>> +				status = "disabled";
>> +			};
>> +
>> +			u2phy_host: host-port {
>> +				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +				interrupt-names = "linestate";
>> +				#phy-cells = <0>;
>> +				status = "disabled";
>> +			};
>> +		};
>>  	};
>>  
>>  	wdt: watchdog@ff800000 {
>> -- 
>> 2.47.2
>>
>>
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


