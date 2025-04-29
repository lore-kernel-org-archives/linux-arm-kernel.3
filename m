Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EE2C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 02:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkmGwA1JNJSi9vWgEDnuu8pe72dV9P14DRuR/dc+N4Y=; b=V2ySKZskMNPZeGMrRw/h7xcSfO
	qstWJXsVSTaifliBRgs2GsB5kEOSQ50V9joRTLlQ/R5+Q5di3kPKtsmdZoZO4Q5NJQl1ZFf0yh8IL
	s6iuqt7YVOW5RWtLxEjKCBlkUeF+61DAzC+kDGEF3MHrKJ1Sf3i3I7fIn7dfd0lEMRmPUNCfbORLh
	eDzipsYda9mO98E2d4JkZDzXWHRAUWFaLIqAcS49/iwxBVwfWOec7v7wzwurDpY1pBuafqS5KlNB5
	KoyEP9hlRv0BsHBM0zsShRlxph6k87J1oEIyHJNmadc0aAZQUKbiirbrS8kOpEXBdvZYl1sL8MuCZ
	CKJFQJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ayB-000000087Zr-45A0;
	Tue, 29 Apr 2025 02:45:15 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9awG-000000087OG-1Yv1;
	Tue, 29 Apr 2025 02:43:18 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 137882886;
	Tue, 29 Apr 2025 10:42:59 +0800 (GMT+08:00)
Message-ID: <027de192-4227-4010-a759-5283b6af1531@rock-chips.com>
Date: Tue, 29 Apr 2025 10:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chaoyi Chen <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Jimmy Hon <honyuenkwun@gmail.com>, Quentin Schulz
 <quentin.schulz@cherry.de>, FUKAUMI Naoki <naoki@radxa.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
 <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
 <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
 <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpKT1YaHh0ZH05OSEIYTB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a967f6d1f6303abkunm137882886
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhA6Hww5QjJCHSkuOjw5LhUD
	C0lPCg9VSlVKTE9OQ0JPTkNMSEpPVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElCSzcG
DKIM-Signature: a=rsa-sha256;
	b=EpGcqWX9zy7b4aOQJQl3I+h7mRCxOtfrxcfOyZWgCO5Xbg67xbaFmiQOrSj42HnlGh3mT2NSrLAHkxuGFUuURJhC9/XoiI1g47KLJ33keDr/FvfvjP0JhZUJzOwuhpVsunq+3DGBVLesmqCEjhgrA/sFnyq1HT1xtUBZjxkaPhQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gkmGwA1JNJSi9vWgEDnuu8pe72dV9P14DRuR/dc+N4Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_194316_945850_2C3C02FB 
X-CRM114-Status: GOOD (  15.02  )
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

On 2025/4/28 20:45, Andrew Lunn wrote:
> On Mon, Apr 28, 2025 at 09:47:34AM +0800, Chaoyi Chen wrote:
>> Hi Andrew,
>>
>> On 2025/4/28 4:42, Andrew Lunn wrote:
>>>> +&gmac {
>>>> +	assigned-clocks = <&cru SCLK_RMII_SRC>;
>>>> +	assigned-clock-parents = <&clkin_gmac>;
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&rgmii_pins>;
>>>> +	clock_in_out = "input";
>>>> +	phy-supply = <&vcc_phy>;
>>>> +	phy-mode = "rgmii";
>>> Does the PCB have extra long clock lines to implement the RGMII 2ns
>>> delay?
>> The 2ns delay of RGMII is implemented inside the RK3399 chip instead of PCB
>> lines, and there are also additional delayline configurations.
> If the PCB does not implement the delay, rgmii is wrong.
>
> If the MAC/PHY pair is implementing the delay, you need to use
> rgmii-id. You can then use additional properties to fine tune the
> delay the MAC/PHY is adding. And the Linux preference is that the PHY
> adds the delay.

The signal path of RK3399 is as follows:

MAC <---> IO <---> PHY

In fact, the delay is added to the path between the MAC and the IO, 
rather than being implemented in the MAC itself. These delay value is 
controlled by the GRF register[0] . These paths are implemented inside 
the SoC and have not yet reached the board level.

According to the document[1], use "rgmii" when "RX and TX delays are 
added by the MAC when required". In addition, currently we can see that 
all RK3399 boards use "rgmii".  Is there anything I missed? Thank you.


[0]: 
https://lore.kernel.org/netdev/1472752204-8924-2-git-send-email-wxt@rock-chips.com/

[1]: 
https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ethernet-controller.yaml

>
> 	Andrew
>
>

