Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753CAC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYuD7fR6ip+mX8V23wp9elDHlgpDSMqOrMV6oJH+6ZI=; b=RkGvto3JRSGPjYnXqFWvJgtv/u
	gSUte9rgF/aGr8vRc13eHaArwb951QvMeywE41qOfsvQMb5gR8bOWFDy60NcSifY3K6L6kUH/SSW6
	ufrq8fSrH69VJU4nRYliiUGdp8khwg0ASs4J11xsnFy+2UDq0vlDTZCKc3eX/uE+y645yPGoLSx44
	1s1M5WneiIBKho9nBZ7PaF7C8LI2545bL7OfGYdDZCaUS41t8zmpODeKefJIqGmUNOPvsmjnnb0zt
	x3wc/s01zQkQpSwKRNnlhXmuQSvDT21swc2ZIGXwYVXSNQd3ZLeu6EWQjfozZ+RBjjOV2QoLYqTsk
	kG+fiSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPPo-0000000EkpH-0iVO;
	Mon, 28 Jul 2025 15:05:24 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPJZ-0000000Ek6u-0Jft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753714735;
 bh=rYuD7fR6ip+mX8V23wp9elDHlgpDSMqOrMV6oJH+6ZI=;
 b=fytko3Au1iPKrJa9ybhA/1yYXfri10hF1BiU0QepODZbFXgnIjbt39eI+9jagHDWhaFdCorZD
 Os4TjfSh04/ijVd7SESlxPJDI6TqX/WmtHW//p/5or07AmqOjfzD6R0Wj5edxuB+DqqXBS0o/MD
 QrqNV0Rt1XrzpPYKVNTvRU1jeLCD2Rf9Atp2BgRepSlthRRv/nW65bLvXWbPWvgjy3ki1uHnuOK
 erh7EMJ23nIgYp4lH6vcFdDR13u5KsBHbVxL2TT/v7jcQzcvRj0qXLLrt1ojUO2wBGmwCNDIlY5
 8pyToabcy4K7OfMxyBNs7fI5WC1jnoAaGl9Ac43qPsDA==
X-Forward-Email-ID: 68878ff5351ec66b15a194ff
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <65023e38-0f90-4d12-8615-a595e399b516@kwiboo.se>
Date: Mon, 28 Jul 2025 16:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-4-jonas@kwiboo.se>
 <be508398-9188-4713-800a-4d2cd630d247@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <be508398-9188-4713-800a-4d2cd630d247@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_075857_148325_16823E13 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Andrew,

On 7/27/2025 9:16 PM, Andrew Lunn wrote:
> On Sun, Jul 27, 2025 at 06:03:00PM +0000, Jonas Karlman wrote:
>> The Radxa E24C has a Realtek RTL8367RB-VB switch with four usable ports
>> and is connected using a fixed-link to GMAC1 on the RK3528 SoC.
>>
>> Add an ethernet-switch node to describe the RTL8367RB-VB switch.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Initial testing with iperf3 showed ~930-940 Mbits/sec in one direction
>> and only around ~1-2 Mbits/sec in the other direction.
>>
>> The RK3528 hardware design guide recommends that timing between TXCLK
>> and data is controlled by MAC, and timing between RXCLK and data is
>> controlled by PHY.
>>
>> Any mix of MAC (rx/tx delay) and switch (rx/tx internal delay) did not
>> seem to resolve this speed issue, however dropping snps,tso seems to fix
>> that issue.
> 
> It could well be that the Synopsis TSO code does not understand the
> DSA headers. When it takes a big block to TCP data and segments it,
> you need to have the DSA header on each segment. If it does not do
> that, only the first segment has the DSA header, the switch is going
> to be dropping all the other segments, causes TCP to do a lot of
> retries.

Thanks for your insights!

I can confirm that disable of TSO and RX checksum offload on the conduit
interface help fix any TCP speed issue and reduced UDP packet loss to a
minimum.

Regards,
Jonas

> 
>> Unsure what is best here, should MAC or switch add the delays?
> 
> It should not matter. 2ns is 2ns...
> 
> 	Andrew


