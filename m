Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37ABC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5WILUrCTKzYArkuwswoRgt+Drxihio3oCEYXIFXnlA=; b=3U4wi6DFstXtxKPk+19JnbTInA
	oxgm65MWNPMnV5zyTooWDx/0THLUcAdBVEle9B4jlbxz9SRWlpa9D2WRRvja/gs9YRhwYfC4zYIG3
	xZsdahiwn3qQ/I49YouqcA6QXfd9JraGXuiWrc6dVd1e5GsiRbMDT4UJpxGTtnPYX+JybrM5rfreE
	pRHk3hGZoztjc9Chf0dhQXlGmA36naPvrQZcp2aY9FxfaysJe7HL6wHRDxbUcH62w/Xsa1409dXwU
	SmY/pWgHX34XTgmmZdhpYXjL/ANNUC+36spdy5VDlrsevmX2ObBTBrmkyrJLQq2MgNJHxSVPg7HbN
	Ba5LStTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5FV-000000027Lw-0muQ;
	Sat, 18 Jan 2025 09:36:13 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5EC-000000027HV-3PZE;
	Sat, 18 Jan 2025 09:34:54 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737192890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5WILUrCTKzYArkuwswoRgt+Drxihio3oCEYXIFXnlA=;
	b=jHj65vwla4jlXMcDUqZAyqztdC+v+ibhVUwyOU3OYAwQj+h8/XTMh17rdnUYnGh6nx7NB5
	LGvVgA0r5k+d5EZb9+t4RDF5QAm5EUBnye6Z9DhWcN3h3WEc7b/vijUK3QGIXdrZnF8Olk
	6MF3oc4DhKcZONIdsLpLMHW1ugJELGJZfiGhNlVyaom9lKcyh5SQN2MftKfw0sVpq5WSUJ
	wHybHt/aPFVqfxMWpRMpT2ivuEAb7NMySPtj9xCsTBVH8ivIE3c0RlnczVYgUuS/OKjM8+
	ex10AkYIFYvpbxkDBIvuNVdDoPzYj4pO+0i77dbPGSAr4qQnqqqR/U/LNdYc/g==
Date: Sat, 18 Jan 2025 10:34:50 +0100
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
In-Reply-To: <ea651368-bcfc-4f24-8ed6-1c558707ffda@kernel.org>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <20250115012628.1035928-5-pgwipeout@gmail.com>
 <7c7ce820-8a9b-46df-b143-f77835b7e5a0@kernel.org>
 <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
 <e1097f84-e40f-45ff-8b8d-125f7159ec1e@kernel.org>
 <ea651368-bcfc-4f24-8ed6-1c558707ffda@kernel.org>
Message-ID: <dab318496a04572d2d770eea29b1f0f0@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_013453_139319_B84839AA 
X-CRM114-Status: GOOD (  24.11  )
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

On 2025-01-18 10:19, Krzysztof Kozlowski wrote:
> On 18/01/2025 09:41, Krzysztof Kozlowski wrote:
>> On 16/01/2025 17:53, Diederik de Haas wrote:
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
>> 
>> Coding style is clear: it is 80. It also has caveat about code
>> readability and several maintainers have their own preference.
>> 
>>> Dragan Simic which deliberately changed code to make use of 100.
>>> Being fed up with my own confusion, I submitted a PR to
>>> https://github.com/gregkh/kernel-coding-style/ which got accepted:
>>> https://github.com/gregkh/kernel-coding-style/commit/5c21f99dc79883bd0efeba368193180275c9c77a
>> 
>> That's not kernel. That's Greg...
>> 
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
>> From where did you get 100? Checkpatch, right? Kernel coding style is
>> clear, there is no discussion, no mentioning 100:
>> 
>> "The preferred limit on the length of a single line is 80 columns. "
>> 
>> So to be clear: all DTS, all DT bindings, all code maintained by me 
>> and
>> some maintainers follows above (and further - there is caveat)
>> instruction from coding style. Some maintainers follow other rules and
>> that's fine.
> 
> 
> Although let me add here caveat, after looking at some other code: DTS
> due to its nature of a lot of parent-child relationships combined with
> long constants ("GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>") has the strongest
> exception or the strongest second part of the coding style:
> "...unless exceeding 80 columns significantly increases readability..."
> 
> And again: that's from official coding style document (so something
> which have been for years), no matter what other people tell you they
> think exists since years as coding style.
> 
> Splitting line, I commented here in this patch, did not improve 
> readability.
> 
> Quite opposite: the line there was less readable in current format thus
> it is not even about coding style anymore, but just readability style.
> Any list with more than two short entries (by number of characters in
> list item) or any list with more than one long entry should be split 
> for
> readability. However actual ITEMS in list should not be split - but
> again coding style is here very precise since years. 80 unless
> significantly increases readability.

I fully agree with the readability being the most important factor when
it comes to deciding on the column width.  That's very well illustrated
by the example above, i.e. the list items in device trees, which are 
much
more readable when the items are placed in separate lines.

Though, as I wrote in my earlier response, enforcing the 80-column limit
in C and headers files rather often leads to line breaks that are 
obviously
"artificial" and do nothing but make the code less readable.  That's 
where
the 100-column with limit often improves the readability.

