Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5CDC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3gaHJhxYmNnOibwoWf6n+HsBORRNWAm1WBlAvkjJ5c=; b=cC6tivCOzZR/oLlybdxDKQC+4t
	MJuw8LiEHKdwLfnTT78PKHqOJr+ryO9Ks6E+qr9QE727KPT+wl4THC5aQOw286eSAeSWJ8vuSXfI0
	1NLOSOmaFB1efitWMSCMZ7S01x7AVkdisM8TzKiGCzbdWISL/HHG8Iryd2J9lhRkTOnM3tNscNGWw
	TcN3GgfE+fpNMqaH9y2HFuw7eJ6ud3zqsy6t81Edzj0EZrJnyjq0gmPLKUavbv5FzPrO2PypSZNzu
	v1M5nYUydIP8PgFIP2SCpQRTQxL8FZC3mqsir+r6WAQcWlDcj+jXZgIq44Qdg003sA8datmGo1VV+
	+QUv9amQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ561-000000026Nr-2vEr;
	Sat, 18 Jan 2025 09:26:25 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ54j-000000026Ip-1G6X;
	Sat, 18 Jan 2025 09:25:06 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737192301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3gaHJhxYmNnOibwoWf6n+HsBORRNWAm1WBlAvkjJ5c=;
	b=kiwlxS4gR7ebogOG+lpIeJxKepxcvjj1PHy+JhwHYk8NWBxoPtOQM4yqlbIBObWQAOySJJ
	8ISijcucWY1FzlW0ZgF2/U/agqwkB2PIWlQ2Y3TsVgoeLnT47UNaur+W80q+0xclNHhMni
	ivpjhRTmJeV8bQmMCmzjaEAt9zFY/oPP2QwkKdHXtXdBdKbv44rR2btiH34bdo+orUR4zI
	6TFEvtiU5G1OkvCD2HauR/PCyUJiXQyJ36VJGLRa/AMU2YRDq5OTEvzG9X6TUMtYZ/tlCW
	ypPIdzRUp1COdxMAPmyBtsU96eU21WkwVSv6Vvno27R6AP0YBkOI65dqh7CylA==
Date: Sat, 18 Jan 2025 10:25:00 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Diederik de Haas <didi.debian@cknow.org>, Peter Geis
 <pgwipeout@gmail.com>, Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com,
 kever.yang@rock-chips.com, frank.wang@rock-chips.com,
 william.wu@rock-chips.com, wulf@rock-chips.com,
 linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>, Conor
 Dooley <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, Jonas
 Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/6] arm64: dts: rockchip: add rk3328 usb3 phy node
In-Reply-To: <dcfb46e8-f29a-4eee-b8f8-1ff774f272ce@kernel.org>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <20250115012628.1035928-5-pgwipeout@gmail.com>
 <7c7ce820-8a9b-46df-b143-f77835b7e5a0@kernel.org>
 <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
 <1bc91b4214a1099801aaed6b3ef81ef3@manjaro.org>
 <dcfb46e8-f29a-4eee-b8f8-1ff774f272ce@kernel.org>
Message-ID: <60ced7df829e7c10e264627cc0947762@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_012505_666473_F937F1B5 
X-CRM114-Status: GOOD (  23.73  )
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

Hello Krzysztof,

On 2025-01-18 09:46, Krzysztof Kozlowski wrote:
> On 17/01/2025 05:10, Dragan Simic wrote:
>> On 2025-01-16 17:53, Diederik de Haas wrote:
>>> On Thu Jan 16, 2025 at 2:01 PM CET, Krzysztof Kozlowski wrote:
>>>> On 15/01/2025 02:26, Peter Geis wrote:
>>>>> Add the node for the rk3328 usb3 phy. This node provides a combined 
>>>>> usb2
>>>>> and usb3 phy which are permenantly tied to the dwc3 usb3 
>>>>> controller.
>>>>> 
>>>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>>>> ---
>>>>> 
>>>>>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 
>>>>> ++++++++++++++++++++++++
>>>>>  1 file changed, 39 insertions(+)
>>>>> 
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi 
>>>>> b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> index 7d992c3c01ce..181a900d41f9 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> @@ -903,6 +903,43 @@ u2phy_host: host-port {
>>>>>  		};
>>>>>  	};
>>>>> 
>>>>> +	usb3phy: usb3-phy@ff460000 {
>>>>> +		compatible = "rockchip,rk3328-usb3phy";
>>>>> +		reg = <0x0 0xff460000 0x0 0x10000>;
>>>>> +		clocks = <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <&cru 
>>>>> PCLK_USB3PHY_PIPE>;
>>>> 
>>>> Please wrap code according to coding style (checkpatch is not a 
>>>> coding
>>>> style description, but only a tool), so at 80.
>>> 
>>> I'm confused: is it 80 or 100?
>>> 
>>> I always thought it was 80, but then I saw several patches/commits by
>>> Dragan Simic which deliberately changed code to make use of 100.
>>> Being fed up with my own confusion, I submitted a PR to
>>> https://github.com/gregkh/kernel-coding-style/ which got accepted:
>>> https://github.com/gregkh/kernel-coding-style/commit/5c21f99dc79883bd0efeba368193180275c9c77a
>>> 
>>> So now both the vim plugins code and README say 100.
>>> But as noted in my commit message:
>>> 
>>>   Note that the current upstream 'Linux kernel coding style' does NOT
>>>   mention the 100 char limit, but only mentions the preferred max
>>> length
>>>   of 80.
>>> 
>>> Or is it 100 for code, but 80 for DeviceTree files and bindings?
>> 
>> I don't know about the DT files and bindings, but the 100-column limit
>> for the kernel code has been in effect for years.  In this day and 
>> age,
> 
> That's just false. It was never in effect for years. Read kernel coding
> style document.

Perhaps it's about the semantics.

Please see the commit bdc48fa11e46 (checkpatch/coding-style: deprecate
80-column warning, 2020-05-29), which clearly shows that the 80-column
rule is still _preferred_, but no longer _mandatory_.

>> 80 columns is really not much (for the record, I've been around when
>> using 80x25 _physical_ CRT screens was the norm).
> 
> You mistake agreement on dropping strong restriction in 2020 in
> checkpatch, which is "not for years" and even read that commit: "Yes,
> staying withing 80 columns is certainly still _preferred_."
> 
> Checkpatch is not coding style. Since when it would be? It's just a 
> tool.
> 
> And there were more talks and the 80-preference got relaxed yet still
> "not for years" (last talk was 2022?) and sill kernel coding style is
> here specific.

It's perhaps again about the semantics, this time about the meaning
of "for years".  I don't think there's some strict definition of that
term, so perhaps different people see it differently.

To get back to the above-mentioned commit bdc48fa11e46, the 80-column
limit has obviously been lifted, putting the new 100-column limit as
an option for those who prefer having fewer "artificial" line breaks
over adhering strictly to the rules.

Thus, as a maintainer, you're obviously free to enforce the 80-column
limit of you want so.

If my opinion counts, I'd agree with the 80-column limit when it comes
to the device trees and bindings.  Keeping those files at the lower
width usually makes them more readable to me.  However, enforcing the
80-column limit in C and header files very often leads to having line
breaks that do nothing but make the code look a bit silly.

