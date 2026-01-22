Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5F7C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p+5EO72Ojt9mRPeEJmjl74hE5HSAcptIkeWj3LbPlU=; b=sDQiFJaNXki+bosoypEae+OPxG
	eDUACBcxhQxy4GH2zjD0X/VkLcqMGa0pMTiVx55z+GRmiXqqM3yUVytnJXIu/6sX9qqbydYdf/2ab
	fb2ayIkY60pyIe9ftPISViq2M6Tc/JVEr1+mudUV0T3bBtj4lrkaWllGcY7Cl/3FNpAeuGAJ0to1m
	Wc1twbkQyCdHsnDf37WBnAo7IOW+aZiLfdMM7Urwo6t56ne8qclfbfF8tJ4aDPi4MGdOSGOM5fm4B
	4a6gqE3vyT4yrcSRHzO5aWQ6OKyCJhCoZvr5lUf5TJ3KPLuLo5Sjh3XDuAxX4VNVOfZ1AR7npyWhZ
	LKdjJIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijhW-00000006HNY-2zhs;
	Thu, 22 Jan 2026 01:41:34 +0000
Received: from mail-m82213631.xmail.ntesmail.com ([8.221.36.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijhS-00000006HN7-0qzH;
	Thu, 22 Jan 2026 01:41:32 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31841d5d8;
	Thu, 22 Jan 2026 09:41:20 +0800 (GMT+08:00)
Message-ID: <305c6ceb-2b4d-496a-95c1-e6a0454347a5@rock-chips.com>
Date: Thu, 22 Jan 2026 09:41:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Andrew Lunn <andrew@lunn.ch>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>,
 Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260121015357.291-1-kernel@airkyi.com>
 <20260121015357.291-3-kernel@airkyi.com>
 <aec69818-9fd0-4e50-bab9-f5e36304a4a2@lunn.ch>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aec69818-9fd0-4e50-bab9-f5e36304a4a2@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9be35cfc3103abkunm7eef6e13aa5f0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pNQlYaSBgaGEwaTk9KTxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=T70pmH8qdY78cYAYdl82YbPmk4K91SnFMl9oclLWdXtZU7Zt+XfMFTPAVjDy5RMFZlhbwmWA10hHkQBr0V0F1B5ZVfkjjNRwjo1FpCyn6tLJ2G+IJGah+n/oxK6QfY1pkOqfDazhNqn6/Ui+cX/1eppDAi70PfSusZB6v+aSrcw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7p+5EO72Ojt9mRPeEJmjl74hE5HSAcptIkeWj3LbPlU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_174131_325201_9B1B8382 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On 1/21/2026 9:15 PM, Andrew Lunn wrote:
>> +&mdio0 {
>> +	rgmii_phy0: ethernet-phy@1 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0x1>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&rgmii_phy0_rst>;
>> +		reset-assert-us = <20000>;
>> +		reset-deassert-us = <100000>;
>> +		reset-gpios = <&gpio3 RK_PD3 GPIO_ACTIVE_LOW>;
>> +		tx-internal-delay-ps = <1900>;
> 
> What PHY is this? Does it actually implement this property?
> 
> It is also close to the 2000ps default. Have you put the board in an
> environment chamber and run tests at -20C to +70C to see if it will
> work with the default 2000ps?
>

It is MotorComm yt8xxx PHY. I chose 1950 here because I find that
the MotorComm PHY binding only offer the options of 1950 or 2100. 

-- 
Best, 
Chaoyi

