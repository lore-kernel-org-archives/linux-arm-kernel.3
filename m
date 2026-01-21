Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71277D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 06:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzOVNeURzn/hBIJKnjKRrA+fpvW6DuQEnUIIkY5csqM=; b=cFf8tdz4IOPvzT9fZlc19RqTdx
	/GTZ1QNgEZ8dnEOGF7YoGR45nPHnU9G5yE5UTTfN98USjSjaY8a/DGpergLBEwIDrOB3JPhue45uq
	RyEysubpTLUEt1AOmjccpZuc6k52tkYaCH+a6lc122Stxeu8PDV5lc1hRI8EGooMW55VdODdMY28/
	oiXYYvW7U0R5hBpKO2IUt/cMRMLcZdB0oPR4WBR/6mm+gFahhF4o1Zta53CpFzzkgku2FeMwrcqwz
	YCzOkgb17YH55HhwG8qt7sDQZ+s72Lf+Q1F1qo9UMzHIBCEm9tfRl0wd7AFjAJOLyTreBMHHV113P
	PQC9d2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viS6y-00000004yEV-02yf;
	Wed, 21 Jan 2026 06:54:40 +0000
Received: from mail-m15598.qiye.163.com ([101.71.155.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viS6u-00000004yDZ-0Jch;
	Wed, 21 Jan 2026 06:54:38 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 316a0a540;
	Wed, 21 Jan 2026 14:54:26 +0800 (GMT+08:00)
Message-ID: <15a3e449-25e5-4387-963d-0dbda7be90f5@rock-chips.com>
Date: Wed, 21 Jan 2026 14:54:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 board
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260121031548.402-1-kernel@airkyi.com> <aXBlBHZIPQ6xhykE@venus>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aXBlBHZIPQ6xhykE@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bdf55465003abkunm4ed7deafb5040a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1DSlZKTBkYTh1NShhMSEJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=e+4/XJNTG3dJj79/1WvOUqrCxW5tV9IdRs2FJ8fKvz7/CpOoAMKcucuuE31+iGLJehiJ/tT17MGbDgtNnOuAQcfgZZFQZk1LXHehCoDQT0kZvbMC8KVRj2Qj5m/dqc2D4uuEoph2HvA7bwF758kD1zoaqHrF+y9hRgk/UGy0pEA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=xzOVNeURzn/hBIJKnjKRrA+fpvW6DuQEnUIIkY5csqM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_225436_750219_9879D328 
X-CRM114-Status: GOOD (  22.90  )
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

Hi Sebastian, Andrew,

On 1/21/2026 1:51 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jan 21, 2026 at 11:15:45AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> According to the description in the net documentation, PHY modes
>> "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
>> to be delayed on the PCB.
>>
>> The Rockchip platform has long used the above mentioned PHY modes and
>> private delay prop to describe the internal IO delay settings of the
>> chip, which is inconsistent with what is described in the documentation.
>>
>> Some background, for RK3576, you can assume that:
>>
>>         tx_delay_time(ns) = 0.0579 * delay_line_count + 0.105
>>
>> For example, tx_delay = <0x20> means:
>>
>>         time = 0.0579 * 0x20 + 0.105 ns = 1.9578 ns
>>
>> Recently, Andrew has often mentioned the problem of phy mode in board
>> level configuration. So let's start with the RK3576 to modify this.
>>
>> Please test this series of patches, thanks.
> 
> The RTL8211F PHY driver does not use the "tx-internal-delay-ps"
> property, which would require using phy_get_internal_delay(). Also
> the hardware only seems to support enabling/disabling a fixed delay
> of 2ns, so it cannot be implemented as far as I can tell. So unless
> I missed something, this series makes no sense as-is.
> 
> My suggestion would be to add support for <rx/tx>-internal-delay-ps
> to the Rockchip GMAC driver by introducing a new rk_gmac_ops
> entry to translate the standard properties into register values:
> 
> int rk3576_delay_conversion(unsigned int delay_ps) {
>     return (delay_ps*10 - 1050) / 579;
> }
> 
> That allows using standard properties in DT instead of vendor
> specific "rx_delay"/"tx_delay". This results in a much better board
> description and shows how far boards derive from the the standard
> 2ns (which can use rgmii-id without any extra delay specification).
> 

Oh, your approach was also my initial thought.

I first asked whether it would be more appropriate to implement this
in the PHY or in the GMAC, and Andrew told me it should preferably be 
done in the PHY. But I'm not sure whether all PHYs support this
operation.

Andrew, would it be possible to implement this in the GMAC for cases
where the PHY does not support it? Thanks.

-- 
Best, 
Chaoyi

