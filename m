Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CAC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IwD9MK//CM9Rt8Um/g7d3JPVvOSWALhDcyNnxAUdjk=; b=gWiflB4mh2qOODz0j/LpH9Xe9M
	+8CgGnQ7i5+ErZGcSFVvbHuaUjnWfzETB6G7LBKzbklVKGP8i2arIjM6RSI622+KgkdZLtrPmLqbK
	XBG73pgcao3yGdQLmPp4sKi1/ueP83ojCjHbQqOvjN5xuGihAeLCSazPx2GKVXMKLTG0ynyFA2dLq
	HrutXJRpkrT4UAtsP3PgTZw6rzZphONvyNoiMvZDuKovVRi0wu+E2Vsa20EATGLwxi3PdZxugOo8R
	bUl8Y4WPAZReowoJiKCdGe1zVOYkT57BjOQ1dFh8l+0ukt+LaYo7cGy0s+082ZhqSnFLHXVUCESRo
	dMVD7E7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4cx-0000000CxtA-1VUa;
	Sun, 27 Jul 2025 16:53:35 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4CY-0000000CvOu-29tu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753633578;
 bh=+IwD9MK//CM9Rt8Um/g7d3JPVvOSWALhDcyNnxAUdjk=;
 b=0bAamq0dUfDmDaYhNOrNy6ebxHTjIUQ5YnL6Oovmoi4oIcxnoBn5gfEgKdQGcXE81tTwOTid/
 e1Bsv9uO9xJgrIShIm0XI9as9xxx86AKYSoPJKxPAL7vPwAvmDI/ORk//4uzRUtcD89Kd8t3zAQ
 UVmJ3DJIyKG+14g3fKI8hMLGo9RbxOTWt8Qhkrg3+oJTu41qiTgTNhlf+skdql3en5CP5rH6xZ/
 7+wD20ZOJO+ulWQ4uM6/1FZhPIX6yG78RDPBEXwhBaWA2A1SqnwC2N1+hBpDJgxL8xjDhPxTe2h
 8GG/W1sc5wC672HOYBUz8i61jZfI6sztlptZPwx/4UgQ==
X-Forward-Email-ID: 68865320c752737c6c09a5f9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <91ea1a4e-3b83-4857-a410-38425e4e5de0@kwiboo.se>
Date: Sun, 27 Jul 2025 18:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <20250727144409.327740-4-jonas@kwiboo.se>
 <72d979e8-005a-4d4d-b5d2-3f59e78574de@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <72d979e8-005a-4d4d-b5d2-3f59e78574de@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092618_589470_DABFE8BC 
X-CRM114-Status: GOOD (  13.32  )
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

On 7/27/2025 6:15 PM, Andrew Lunn wrote:
>> +&gmac1 {
>> +	clock_in_out = "output";
>> +	phy-mode = "rgmii-id";
>> +	phy-supply = <&avdd_rtl8367rb>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
>> +		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
>> +	status = "okay";
>> +
>> +	fixed-link {
>> +		speed = <1000>;
>> +		full-duplex;
>> +	};
> 
> A fixed-link without an obvious reason gets me asking questions...
> 
> The schematic indicates there is a realtek 6387 switch on the other
> end. rtl8365mb.c seems to support this. Is there a reason you did not
> include this now?

Sorry, this was mentioned in the cover letter, and patches to enable use
of the switch is incoming in a separate series very shortly.

"""
This also leaves out describing the RTL8367RB-VB switch as support for
the switch requires dt-binding and/or driver changes to make it work,
something that will be handled in a separate follow-up series.
"""

Basically the dt-bindings prevents describing a mdio child node, yet the
driver requires it. I have prepared a patch that relaxes the driver to
make it all work and it should be on the list shortly.

Regards,
Jonas

> 
> 	Andrew


