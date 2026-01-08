Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B14D148BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sPvtV6R5fOot1emRO6hT0bqnJhowoQAnBmNF7+RVj0=; b=33e/E7oALTpiWZVJABNDCizQ+3
	o0y1QTr3NaACrLuiiaXku6Z+MgxCozRgaCpojLq6on//nAmjiKt7C0tOhMN2X6ld3xJlxWIVkfjAz
	mgCEjwsSgwf4MaSta0yhv0m/n2Vz/AAX/fnVgy9xicu72FZGUqsHjQImNLcflEYYmS2MSch41XHAC
	ssExL19MfXcINCijTPtlVdNzI0J5IOmjaBwZGGkF9hQVKsWzuJMhDLpumyiZ/2S9bqhlHZdG/QsqV
	BoKMWoJZW7cB9IiU/66tQgk7oC3fm+codEIBJCMceGFX3cLDKNnSbkF4F1AVj9okr+JDd3kl7GEYc
	6a305v/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkyM-0000000GC3p-1LyB;
	Thu, 08 Jan 2026 08:02:22 +0000
Received: from bg1.exmail.qq.com ([114.132.79.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkyI-0000000GBwS-0Yb9;
	Thu, 08 Jan 2026 08:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1767859313;
	bh=8sPvtV6R5fOot1emRO6hT0bqnJhowoQAnBmNF7+RVj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=vNMIOFkcOIGiTQbZfn9/XskYwltKjHkQHn15ZPykmee2zms9ZoxNsPlJ80mDOGfPK
	 v6X4fjFWDNidB7V06WNQuvYztgTs/Xkn00m+Lw236mU8r5PPE9DOytlIBWSuM1WKMI
	 k78p8FHNzsDSy/WfxiY4twrI4MEAxVL7AkYSIShY=
X-QQ-mid: zesmtpgz9t1767859306t749baf49
X-QQ-Originating-IP: WIhSujCjZ4exQ3XJHVOY0FYbufeEWfI1WXKa++9oDCY=
Received: from [172.16.12.51] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:01:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15587685843860407837
EX-QQ-RecipientCnt: 23
Message-ID: <5FFFBA7FAF5745A7+e0381969-800a-4bf6-9aac-81cffa3469a1@airkyi.com>
Date: Thu, 8 Jan 2026 16:01:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
 <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch>
 <CABjd4YzsjZXe16XWgrHRG5shNA_DQJF45i1roahvfAfV4xdU0Q@mail.gmail.com>
 <a545fec0-cb30-489a-b5e6-4ee87dcab41c@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <a545fec0-cb30-489a-b5e6-4ee87dcab41c@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MhC1rXRaWvfnq4Vu+ns3dE6XXbeAdQVBQ0d0eNnfzAi7v1fVk2swrB/h
	1rqyjZyWm7N+HVtn91hGaRttp5InlRRXm5O3rjgl/5m+kCzQe6o78Pevb7+7uepZQEtL0hX
	8j2CnYyqGSYdrhGlAUcm2okbNVPVKVYPZrkHTdvUN+OdB361X0UMB+irpzR77c4++tRNx19
	VG4/WRCxsE7WzrYYCVBIxJ7LeeG7tAbYnG96rQDLUZ7wJUzDk+xsC+31m/aCpSeBlzEaYm3
	4eHtzXbEvUauzzl5DQTksL34evxTr8I/0PwfsAhq7ISDzp6LVQxkmH37n9dh25g8hAV6toT
	XulTVFPT/tveCFyY0pMtkhwHs/a6pT+HDAquvvxOZHNnmxQO1HtG+0bXbr9qCLPZo6MzTym
	U3mHIH9NFTYkr2D0LMLN1qSBNKzpOoPDksjNcJl/dbx/fuAT9TFe3/iQIr9aXDIre84Gyw2
	gKFpD6AD3zHzItzsUKxjINkkvhRj4Q7qZdkz9IdzxhYetfYHDGyn2/LwS6k9z4M1CQVS+98
	Ln59orzbt6Hgu0E6gzT1O75SwFli1AmdOSO6hFG05ZfU9QUnPKSvEMlJikoSncAnDfBw54I
	oBAK3mn4+EQGqurkdFcoAbIYJjOwTea7Vhk/uNWOqjgHYyso1MjfNALoJhtgOQsE0vRKRy8
	zJDrFL8qXOMUC7lrk3WL1UIBnTL4RF5CKsCIL+du7/Xgla8k/mea/6L3jdgK1KSP+j6zABh
	jW8SC1RBJ918xjBcZjASLTFiN8PbJykv6+J7BtM/JfMhjdoBZU3p5C0WrXN7ElG5skrDxSg
	G5z/RhCY6mBQXAdsvW5YOYM1sVmBfxFcbK5/wgN8loYv4ZKuf2PT9p4SED0dzyORjkEe1Up
	tX0du1HR/hutsJs5wh4i6QJ8BvZtsE5Ukzo25zKFbvMz7bZs1t+iTys7kiAYN/uRDykjpm8
	lZ4GyNXyNQ/zOvHANiSTLvLQmnzvUBPQCfoOMvnFu1UEiDKoOQwT6FK+0wWuLrPwSUWzyvZ
	ppkJDEWYz9/p08OQq0yy9YHwxrulA/Kf31LgVPyl+B7AjSCOggw96I8PZhp7h+JRL55nI6M
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000218_562799_B657D27E 
X-CRM114-Status: GOOD (  20.04  )
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

On 1/8/2026 3:42 PM, Chaoyi Chen wrote:
> Hello Alexey, Andrew,
> 
> On 1/8/2026 2:53 PM, Alexey Charkov wrote:
>> On Wed, Jan 7, 2026 at 10:18 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>
>>>> +&gmac0 {
>>>> +     clock_in_out = "output";
>>>> +     phy-mode = "rgmii-rxid";
>>>
>>> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
>>> line, but a short RX clock line?
>>>
>>> Try changing this to rgmii-id, and drop the tx_delay property.
>>
>> Actually it would be great if Rockchip could clarify the delay
>> duration introduced by a single delay element in GMAC-IOMUX delay
>> lines, which are controlled in the GMAC driver by the {tx,rx}_delay
>> properties. Maybe we could then switch to using
>> {tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC side
>> as envisaged in DT bindings [1], and use phy-mode = "rgmii-id"
>> throughout. Chaoyi, any chance you could ask around in your hardware
>> team?
>>
>> Currently though removing the delays at GMAC side altogether causes
>> unstable link operation - see [2] for example.
>>
>> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L342-L347
>> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c
> 
> Sorry, this problem has been discussed many times before. It's because 
> the gmac on the Rockchip platform currently relies on setting the 
> corresponding delay via phy-mode [3].
> 
> [3] https://lore.kernel.org/all/mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmcampwiajvj4a@r5zs4d3jdm5p/
> 
> The delay introduced by the delay line is not absolute. In reality,
> it depends on factors such as the chip's design and process technology.
> 
> And for RK3576, you can assume that:
> 	
> 	time(ns) = 0.0579 * delay_line_count + 0.105
> 
> For example, tx_delay = <0x20> means:
> 
> 	time = 0.0579 * 0x20 + 0.105 ns = 1.9578 ns
> 
> And I believe {tx,rx}_internal_delay_ps is indeed a good idea. 
> I'll try to add them in v3. Thanks.
>

I've also see some dt that use {tx,rx}_internal_delay_ps inside the PHY,
and compared to doing it in the MAC, which one is the better choice?

-- 
Best, 
Chaoyi


