Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470B2C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDcVaVVMzrXp9l580+Ibh1Pcrfg4xdal5MP+F108Ii4=; b=mA+I96aLn21vifFbBi+lrMI9Hb
	FtZ9u4DYwCCmreT0eEDh46JlHWd7THMxdFT4I6ynJ2ivPL0zSwWDRuQ/Lut9MxO1/1AAL0Euip+I2
	4awLPsLR3MBzy3QVAvo5ZYKPTeHnOwr2ZAAOZVFGArpIB/1n/sZUQuOomXLnDlJtKg9nizUnJjQnE
	0Fow/l5etUmfasWYC5KqbFkrI2HDelAPjWNkVm/uhuKrcw1vyOyawSKQf3hEOpbJFkRknORRAHgOh
	hITF5Q25nzTYi3HBtW2ANHQ9RZeAHD1SqzCLXWSEU+89/fSwFkaDW/+FY6HsS9+CVS2NW3b8wWrvp
	lkDm+tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDJf-0000000E13L-1EXg;
	Fri, 24 Jan 2025 06:37:19 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDIJ-0000000E0uk-1rG5;
	Fri, 24 Jan 2025 06:35:56 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737700551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDcVaVVMzrXp9l580+Ibh1Pcrfg4xdal5MP+F108Ii4=;
	b=V7rZp0U47HCH4FUtf6IyKFL7rtDgum7Ud4Vaha/e1ppJBCu+Rkeo6qkO/da+tnAvVu5Oln
	vAy3Uuxq7HvTq9OsNkRaoIQJbdcYQXun/CDw5H8ivsu0PAtAuf2YBwsKGhB91FLiBIaTVJ
	VLCsJXbS196nQF5idKZ/Io+zLZDdDvTs9nrIkBnsSq0v436BKJSpMbEt0PARPWn5ClCenE
	r2SMOEBy2/RAbJvGsRSERPjqKzjGzwYL0u90eGnNFDskz8LIv8eE+tZonUmJtVKNQgUI6J
	QLghRufuU70FSaRfLVD22ZJ0BhxYCC6chXxW/nUmTtM+sas+WrFbA/T9H6mNvA==
Date: Fri, 24 Jan 2025 07:35:50 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Tianling Shen <cnsztl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas
 Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Peter Geis
 <pgwipeout@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
In-Reply-To: <98387508-10de-4c2e-80ad-05d0d86b7006@gmail.com>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
 <59893a67-18c7-4ab3-9b2a-5a17091d4b6c@gmail.com>
 <dffd06a341b58e9689f578c3456cc11d@manjaro.org>
 <65f4e27f-3dc4-4eaf-be4d-265ce0325ade@gmail.com>
 <98387508-10de-4c2e-80ad-05d0d86b7006@gmail.com>
Message-ID: <59e46b34e1c8f9197565fea917335d3f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_223555_773777_4FEC05E9 
X-CRM114-Status: GOOD (  18.16  )
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

Hello Tianling,

On 2025-01-24 07:28, Tianling Shen wrote:
> On 2025/1/19 23:48, Tianling Shen wrote:
>> On 2025/1/19 19:36, Dragan Simic wrote:
>>> On 2025-01-19 12:15, Tianling Shen wrote:
>>>> On 2025/1/19 17:54, Dragan Simic wrote:
>>>>> Thanks for the patch.  Please, see a comment below.
>>>>> 
>>>>> On 2025-01-19 10:11, Tianling Shen wrote:
>>>>>> In general the delay should be added by the PHY instead of the 
>>>>>> MAC,
>>>>>> and this improves network stability on some boards which seem to
>>>>>> need different delay.
>>>>>> 
>>>>>> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi 
>>>>>> R1 Plus LTS")
>>>>>> Cc: stable@vger.kernel.org # 6.6+
>>>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 
>>>>>> +--
>>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 
>>>>>> +
>>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 
>>>>>> -
>>>>>>  3 files changed, 2 insertions(+), 3 deletions(-)
>>>>>> 
>>>>>> diff --git
>>>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>>> index 67c246ad8b8c..ec2ce894da1f 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>>> @@ -17,8 +17,7 @@ / {
>>>>>> 
>>>>>>  &gmac2io {
>>>>>>      phy-handle = <&yt8531c>;
>>>>>> -    tx_delay = <0x19>;
>>>>>> -    rx_delay = <0x05>;
>>>>>> +    phy-mode = "rgmii-id";
>>>>> 
>>>>> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
>>>>> into the "tx-internal-delay-ps" and "rx-internal-delay-ps" 
>>>>> parameters,
>>>>> respectively, so the Motorcomm PHY driver can pick them up and
>>>>> actually configure the internal PHY delays?
>>>> 
>>>> The documentation[1] says "{t,r}x-internal-delay-ps" default to 1950
>>>> and that value already works fine on my board.
>>>> 
>>>> 1. https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ 
>>>> motorcomm%2Cyt8xxx.yaml
>>> 
>>> I see, but those values differ from the values found in the
>>> "tx_delay" and "rx_delay" DT parameters, so I think this patch
>>> should be tested with at least one more Orange Pi R1 Plus LTS
>>> board, to make sure it's all still fine.
>> 
>> This patch has been tested on 2 boards, and we will do more tests in 
>> next week.
>> 
> 
> Managed to test on another board and looks so far so good.
> (Working network connection, no packet drop)

Sounds good to me, thanks for the additional testing.

>>>>>>      status = "okay";
>>>>>> 
>>>>>>      mdio {
>>>>>> diff --git 
>>>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>>> index 324a8e951f7e..846b931e16d2 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>>> @@ -15,6 +15,7 @@ / {
>>>>>> 
>>>>>>  &gmac2io {
>>>>>>      phy-handle = <&rtl8211e>;
>>>>>> +    phy-mode = "rgmii";
>>>>>>      tx_delay = <0x24>;
>>>>>>      rx_delay = <0x18>;
>>>>>>      status = "okay";
>>>>>> diff --git 
>>>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>>> index 4f193704e5dc..09508e324a28 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>>> @@ -109,7 +109,6 @@ &gmac2io {
>>>>>>      assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>>>>>>      assigned-clock-parents = <&gmac_clk>, <&gmac_clk>;
>>>>>>      clock_in_out = "input";
>>>>>> -    phy-mode = "rgmii";
>>>>>>      phy-supply = <&vcc_io>;
>>>>>>      pinctrl-0 = <&rgmiim1_pins>;
>>>>>>      pinctrl-names = "default";

