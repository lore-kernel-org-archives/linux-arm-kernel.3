Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130E0C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZTIdA/6vSHu0RdazPPShQ5lrtgQuHNfhrr/whN+ZAg=; b=Okrslzm8VZ3qYZGJRhnui2bTbG
	WhntlFP8LMR0usSbKb1crQyxLSdq4req4slLuwajeMJitvc9SFASVP+NX0TkmHjLb5/uhQet3WMiL
	42gSG+7qzX8+FmWJ7caDXy3hsRNwCkv88gUudKG3/Wb4mN4WZGq/T55sp0Ru/sNAJiJ7l+MmKQyl6
	HNbUR1iZPLPeq3SgMtJdhJf2eS2eChQ3WNR6DmWLXPGAYYCXi1iUbKqQ7SR0IyrE2/6BwqFD8hejp
	oScvzSTGyC9mZFrE1w6bkCtnlXireVFnCm/OVZkl0hgyCoXeAP0/YUUS1G+NJ+lSiwmJcpL9KMR++
	VGKmxksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKIz-0000000CRnv-38PT;
	Thu, 06 Mar 2025 23:07:05 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKHM-0000000CRPy-1HQH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741302323;
 bh=KZTIdA/6vSHu0RdazPPShQ5lrtgQuHNfhrr/whN+ZAg=;
 b=WA/pWionz1F1FHSIz+dfv7jmomL1Y/AkWtp9mh/gaPWC/H40hwFc9SHWJ2NYRDAiSE78r5Sja
 +k5qhHCuW2UUoOiGSzbxOAWymtkA7UQ9mjC3rLzXNZwBHtQEtgUZAb1NQdJd3/qkwqAAm6XoB+5
 b4gr/lkJsOeLm19ckvAMBiaDEBctShvkiW9ih7pkggq+1ycTFlsG9Gyj4D+XC8eJGb9mGA9U/eO
 UrgTH7A1djoAsVHfzmfKkJA7qm7jwnm4mUxPrH4LoFCR7PwzdoRlEIDbb5SIz01N8rF3932nl9o
 Tt67MpJa58qTK6JPVm5Lu5rFBBJPwUgPGwwqzkZlaOfQ==
X-Forward-Email-ID: 67ca2a31c1763851c065cd4d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3d3db030-26e6-4fe1-9158-85f8cebef89c@kwiboo.se>
Date: Fri, 7 Mar 2025 00:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
To: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 detlev.casanova@collabora.com, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250305194612.47171-1-ziyao@disroot.org>
 <20250306140009.384469-1-amadeus@jmu.edu.cn> <Z8nPjjbZvpRJ2R5B@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z8nPjjbZvpRJ2R5B@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_150524_441323_F6CEFB57 
X-CRM114-Status: GOOD (  16.78  )
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

On 2025-03-06 17:43, Yao Zi wrote:
> On Thu, Mar 06, 2025 at 10:00:09PM +0800, Chukun Pan wrote:
>> Hi,
>>
>>> +		sdio0: mmc@ffc10000 {
>>> +			compatible = "rockchip,rk3528-dw-mshc",
>>> +				     "rockchip,rk3288-dw-mshc";
>>> +			reg = <0x0 0xffc10000 0x0 0x4000>;
>>> +			clocks = <&cru HCLK_SDIO0>,
>>> +				 <&cru CCLK_SRC_SDIO0>,
>>> +				 <&cru SCLK_SDIO0_DRV>,
>>> +				 <&cru SCLK_SDIO0_SAMPLE>;
>>> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>>> +			fifo-depth = <0x100>;
>>> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
>>> +			max-frequency = <150000000>;
>>> +			pinctrl-names = "default";
>>> +			pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>,
>>> +				    <&sdio0_det>, <&sdio0_pwren>;
>>
>> The sdio module is usually "non-removable", no need det,
>> and pwren may be other gpio (use mmc-pwrseq). So it should
>> be `pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;`
> 
> This doesn't affect the fact that these two pins are assigned as
> functional pins for SDIO0, as pointed out by the datasheet[1].
> 
> But with more digging, I found the reference design[2] of Rockchip
> actually uses the two pins as normal GPIOs. This is more obvious in
> downstream devicetree of an EVB[3]. Most of the existing boards (Radxa
> 2A, ArmSOM Sige 1) follow the reference design.
> 
> For me, it's kind of surprising that the SDIO IP functions with two
> functional pins assigned as different modes. I'm not sure whether we
> should apply pin configuration for these two pins in the SoC devicetree.
> Jonas, what do you think about it?

I think it make sense to match the pins used by reference boards, i.e.
the pinconf most likely to be used by majority of boards that will use
the sdio interface.

Of my RK3528 boards, only ArmSoM Sige1 use sdio for onboard wifi and
there I currently have following in my work-in-progress board DT [4]:

  pinctrl-names = "default";
  pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>, <&clkm1_32k_out>;

The Radxa ROCK 2A/2F seem to use USB for wifi/bt.

[4] https://github.com/Kwiboo/linux-rockchip/blob/next-20250305-rk3528/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts

Regards,
Jonas

> 
>>> +			resets = <&cru SRST_H_SDIO0>;
>>> +			reset-names = "reset";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		sdio1: mmc@ffc20000 {
>>> +			compatible = "rockchip,rk3528-dw-mshc",
>>> +				     "rockchip,rk3288-dw-mshc";
>>> +			reg = <0x0 0xffc20000 0x0 0x4000>;
>>> +			clocks = <&cru HCLK_SDIO1>,
>>> +				 <&cru CCLK_SRC_SDIO1>,
>>> +				 <&cru SCLK_SDIO1_DRV>,
>>> +				 <&cru SCLK_SDIO1_SAMPLE>;
>>> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>>> +			fifo-depth = <0x100>;
>>> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>>> +			max-frequency = <150000000>;
>>> +			pinctrl-names = "default";
>>> +			pinctrl-0 = <&sdio1_bus4>, <&sdio1_clk>, <&sdio1_cmd>,
>>> +				    <&sdio1_det>, <&sdio1_pwren>;
>>
>> Same here.
>>
>>> +			resets = <&cru SRST_H_SDIO1>;
>>> +			reset-names = "reset";
>>> +			status = "disabled";
>>> +		};
>>
>> Thanks,
>> Chukun
>>
>> -- 
>> 2.25.1
>>
> 
> Best regards,
> Yao Zi
> 
> [1]: https://github.com/DeciHD/rockchip_docs/blob/main/rk3528/Rockchip%C2%A0RK3528%C2%A0Datasheet%C2%A0V1.0-20230522.pdf
> [2]: https://github.com/DeciHD/rockchip_docs/blob/main/rk3528/RK3528_BOX_REF_V10_20230525.pdf
> [3]: https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3528-evb1-ddr4-v10.dtsi#L128


