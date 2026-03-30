Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C17FF4959
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzBaiMudorNcsOX/2Os43rB2tbTr5L4t4VZ/OAvw85w=; b=Dcahay+aMUyZJ/NbZLpunWRA7m
	n9LeXXCIB5dRdElzPzfiqPkQgHhhVEj+lUpcbrplcWvMUiHBD5s41LD5z0dC/ym5lcS5VDamRzUoD
	AJLQKfKIwF1hk25i4z0W2qokvqODkvOyjAXDcNQRYBjdDmXPSj0vpgET9YdI17ibF/t9RU1LN3a77
	Fwrywq1re11Gr0fDp1kDGnVa+t451lkIeKkCaUo5tcsjSS20lFtL4t3DWAQi7qKrJG0tlDmOyH8cd
	PM6fxpZIvYg2sj59P/Dr6PbRP/IbUtG/pCIunRBTaRyXlG1esUnRx07q5yeJujaneOBsdNUzXjojc
	UCvguTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77bq-0000000AoBn-1QUM;
	Mon, 30 Mar 2026 08:04:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77bp-0000000AoBa-1VLp;
	Mon, 30 Mar 2026 08:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 808DC60121;
	Mon, 30 Mar 2026 08:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D32C4CEF7;
	Mon, 30 Mar 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857868;
	bh=YiDVacVWTR7QV0Z3LWZZDvKO3j+7kXqpLoj9VeVHTHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AHZiV6Maae+Zyz70DUVCwmRVnqQUUx9YCRgxLOxE6h2gIyVxyzcZsQV4+fdXbe4xo
	 y7jvrSARcS7mDL0ulc1DPa1ZRPXDj8+DqDVxjgO492MIvOFskPKzc6LE2+HE8ANCWS
	 VrA1+6P0RnbuNyj1Fs7bN7nXehni53nFOxXU40tkJdxsQZo9yd+TybC6sSsLcGfIut
	 KT2QzqMQ6Yd1k8Owj96/QWlpWQWflTJke/Ba5Yps9Pw3fl9DxHGJmlKyoiqb4syRhR
	 HfPqz6MWvAqUl6e/DihD01UL427JeOsyfCRMOdTdx/sA9Wi5x5RW3D7oFDmiXbIBRJ
	 sdM5Nu/tcdPQw==
Message-ID: <4525cc8e-cb05-4126-ad91-c2e18b809b84@kernel.org>
Date: Mon, 30 Mar 2026 10:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
To: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@Red54.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 finley.xiao@rock-chips.com, heiko@sntech.de, kever.yang@rock-chips.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org
References: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
 <tencent_723DE3D68C7F44CF67ED583F558130B47208@qq.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <tencent_723DE3D68C7F44CF67ED583F558130B47208@qq.com>
Content-Type: text/plain; charset=UTF-8
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

On 30/03/2026 04:46, 谢致邦 (XIE Zhibang) wrote:
> On Sat, Mar 28, 2026 at 04:08:57PM +0100, Krzysztof Kozlowski wrote:
>> On 28/03/2026 14:05, 谢致邦 (XIE Zhibang) wrote:
>>> This fixes the stdout-path in rk3562-evb2-v10.dts.
>>>
>>> Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
>>> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>> index e4816aa3dae0..14e74e8ac7df 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>> @@ -26,6 +26,16 @@ aliases {
>>>  		gpio2 = &gpio2;
>>>  		gpio3 = &gpio3;
>>>  		gpio4 = &gpio4;
>>> +		serial0 = &uart0;
>>> +		serial1 = &uart1;
>>> +		serial2 = &uart2;
>>> +		serial3 = &uart3;
>>> +		serial4 = &uart4;
>>> +		serial5 = &uart5;
>>> +		serial6 = &uart6;
>>> +		serial7 = &uart7;
>>> +		serial8 = &uart8;
>>> +		serial9 = &uart9;
>>
>> UART aliases are properties of the boards, not SoC.
>>
>> Best regards,
>> Krzysztof
> 
> So are you saying that we need to remove the serial aliases from files
> like rk3308.dtsi, rk3328.dtsi, rk3368.dtsi, rk3399-base.dtsi,
> rk356x-base.dtsi, rk3576.dtsi, rk3588-base.dtsi, and so on?

Well, I tried once but people disagreed because of impact, so probably not.

Best regards,
Krzysztof

