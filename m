Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ECFD148B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9rWjfplznBvilASYj5bEBiyrUdrnhQnLhBnfs2cv1g=; b=KxKQnXSAMdj+CSKfvryyzvgE0r
	0z5x3ROOo0Afqb27KMD8LmLxffoIuz2BpAmBKKzZBB87PtQiTBch8Mhv4lZ8Nf1EEdss5EFGC/b1f
	ikptVMxY8YCe8ecAs1R0vlKhjKqh0Wfav8AniuI3/NI+BClZJuOL6gvyI3ubby9OxzFxwB0/v6jrY
	PVt/4xTiOTv2VpUDgOsk9ftiYxPEstng09/64SOmEToEf3r9VNdMA0NDaTSej24lc97zhz7eYNK8V
	v6iERqbauUZIqhFmIbBYBA0g5JygkaPfKSyuOw1LsnNBNoCjbPZ6YkIlqbg0tQ1uxDnFr9X1AV0ny
	TPoi7+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkfj-0000000G7gn-4By0;
	Thu, 08 Jan 2026 07:43:08 +0000
Received: from mail-m19731119.qiye.163.com ([220.197.31.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkfe-0000000G7df-3nji;
	Thu, 08 Jan 2026 07:43:06 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fed15929;
	Thu, 8 Jan 2026 15:42:55 +0800 (GMT+08:00)
Message-ID: <a545fec0-cb30-489a-b5e6-4ee87dcab41c@rock-chips.com>
Date: Thu, 8 Jan 2026 15:42:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CABjd4YzsjZXe16XWgrHRG5shNA_DQJF45i1roahvfAfV4xdU0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9c8efda503abkunm2d36d937104d66
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh4dGFZNGU1DGExCHR0dQx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Y8+YIwoHc856GmeEMveVCfqT8KiQX1sselQNiwuq8B+h7JxTb9Q6cm+VsiJNeOGmlbJah+Ts55e0jhCk4PbqtrqwdlQcC0zWYdd+gcWRlE3aMubiYhePGU1YnPFkx4+hkYAussZWBv/V+aPUBgMS0yjHUgQaMbwRhZ2PCMXTLAA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=V9rWjfplznBvilASYj5bEBiyrUdrnhQnLhBnfs2cv1g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_234305_217286_5FE2B896 
X-CRM114-Status: GOOD (  15.62  )
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

Hello Alexey, Andrew,

On 1/8/2026 2:53 PM, Alexey Charkov wrote:
> On Wed, Jan 7, 2026 at 10:18 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>
>>> +&gmac0 {
>>> +     clock_in_out = "output";
>>> +     phy-mode = "rgmii-rxid";
>>
>> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
>> line, but a short RX clock line?
>>
>> Try changing this to rgmii-id, and drop the tx_delay property.
> 
> Actually it would be great if Rockchip could clarify the delay
> duration introduced by a single delay element in GMAC-IOMUX delay
> lines, which are controlled in the GMAC driver by the {tx,rx}_delay
> properties. Maybe we could then switch to using
> {tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC side
> as envisaged in DT bindings [1], and use phy-mode = "rgmii-id"
> throughout. Chaoyi, any chance you could ask around in your hardware
> team?
> 
> Currently though removing the delays at GMAC side altogether causes
> unstable link operation - see [2] for example.
> 
> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L342-L347
> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c

Sorry, this problem has been discussed many times before. It's because 
the gmac on the Rockchip platform currently relies on setting the 
corresponding delay via phy-mode [3].

[3] https://lore.kernel.org/all/mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmcampwiajvj4a@r5zs4d3jdm5p/

The delay introduced by the delay line is not absolute. In reality,
it depends on factors such as the chip's design and process technology.

And for RK3576, you can assume that:
	
	time(ns) = 0.0579 * delay_line_count + 0.105

For example, tx_delay = <0x20> means:

	time = 0.0579 * 0x20 + 0.105 ns = 1.9578 ns

And I believe {tx,rx}_internal_delay_ps is indeed a good idea. 
I'll try to add them in v3. Thanks.

-- 
Best, 
Chaoyi

