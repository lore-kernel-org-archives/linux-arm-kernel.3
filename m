Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFE1C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raXLI4dRVY7FP9fHctbKE/LhEhyIFpZz+uaQSUe++L8=; b=pdabi/Lg3Qgg4ZKUNhwyJ00KjS
	hsQzD8N2AKo36cITIOxyevApf8IMUKKoplwZGS5Q2C1PoicsTQZ0sT4NA6oIWLslOkUARqzVJ8X1y
	dri0vlX2oQRkTsV7e9WIncuI5k07VT5lfi0uDCByATVsZnRyguMpLp/jJmRVw1wRMri+IwF95qOhc
	tNfqvk0PZn4XqBhC4lLJjLf645Ledi4S8HXm0iVaSwS4wQexBCyFansT3Cqa+Y76VKV5Nl2WhCrez
	8gvcvyjWqPYzTMwkpKOzZ1U90z0dJvFXkLIqqT7CfcKxGUN2Y7dzPlVAUfmoBbUd3jBfzUP/7V86Z
	67KXkRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFeZ-000000026vl-1m3B;
	Mon, 27 Jul 2026 07:21:35 +0000
Received: from mail-m8214.xmail.ntesmail.com ([156.224.82.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFeQ-000000026t5-4B9Q;
	Mon, 27 Jul 2026 07:21:33 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47ae5678e;
	Mon, 27 Jul 2026 15:21:21 +0800 (GMT+08:00)
Message-ID: <a5195a74-9008-405f-9b1e-f88fb47baf03@rock-chips.com>
Date: Mon, 27 Jul 2026 15:21:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-rk: add RK3576 GMAC 25M
 refout support
To: Alexey Charkov <alchark@gmail.com>, Gavin Gao <attinagaoxu@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 nicolas.frattaroli@collabora.com, sebastian.reichel@collabora.com,
 sashal@kernel.org, amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk,
 horms@kernel.org, alok.a.tiwari@oracle.com, david.wu@rock-chips.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
 <CABjd4YyohxfbVufd1pwJGsm8a8f3Cm6rJiz=WLz=jBjAQRLj4A@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CABjd4YyohxfbVufd1pwJGsm8a8f3Cm6rJiz=WLz=jBjAQRLj4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fa2731e6203a7kunmfdf57ff72381e0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEhDVh1IGE5DQ05NHxlCS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kJ++DX5LfiTvcRVhr4D+AmKgnMGCBNhy0VnFX+PIv7PRdJG/AT9qBPR7r4YRP0N/HKJZuG5tvUzxpMLo/JVPrnx1TKhAjdLtgx+LOt/qwMl3y4fN8JUBoVOS5KEGUfuFPlbVHM9ZmGUcouPcrzreA9whPGrorBFQRAitdq3iIzc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=raXLI4dRVY7FP9fHctbKE/LhEhyIFpZz+uaQSUe++L8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_002130_056311_10582F7B 
X-CRM114-Status: GOOD (  19.60  )
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

On 7/27/2026 3:14 PM, Alexey Charkov wrote:
> Hi Gavin,
> 
> On Mon, Jul 27, 2026 at 6:10 AM Gavin Gao <attinagaoxu@gmail.com> wrote:
>>
>> Hi,
>>
>> Some Rockchip GMAC instances can provide a 25 MHz reference clock output
>> for an external RGMII PHY. Boards already describe the MAC clock direction
>> with clock_in_out = "output", but the dwmac-rk driver does not currently
>> request or enable the corresponding 25 MHz reference output clock.
>>
>> On RK3576, this means the REFCLKO25M_GMACx_OUT clock may be disabled by
>> the common clock framework as unused, even though the board expects the
>> GMAC block to provide the PHY reference clock.
>>
>> This series adds an optional "clk_mac_25m_refout" clock name to the
>> Rockchip DWMAC binding, wires it up for RK3576 GMAC0/GMAC1, and enables
>> it from the dwmac-rk driver when the MAC is configured for RGMII output
>> clock mode.
>>
>> The clock remains optional, so existing device trees and SoCs are not
>> affected.
>>
>> Tested on a PicoCOM RK3576 ACP board with a Motorcomm YT8521 PHY.
>> The GMAC 25 MHz reference clock output remains active and Ethernet works.
>>
>> Gavin Gao (3):
>>   dt-bindings: net: rockchip-dwmac: Add 25M refout clock
>>   arm64: dts: rockchip: Add RK3576 GMAC 25M refout clocks
>>   net: stmmac: dwmac-rk: Enable RGMII 25M refout clock
>>
>>  .../bindings/net/rockchip-dwmac.yaml          |  1 +
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  8 ++---
>>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 ++++++++++++++++++-
>>  3 files changed, 37 insertions(+), 5 deletions(-)
> 
> Can you please try something like this [1] instead?
> 
> [1] https://lore.kernel.org/linux-rockchip/20260719034555.3623003-1-gahing@gahingwoo.com/
> 
> The GMAC on RK3576 neither produces nor consumes the clock. CRU is the
> producer, and PHY is the consumer. So the GMAC driver shouldn't be the
> one to enable it, nor should the dwmac binding have anything to do
> with it.
> 
> Have a look at how other boards already upstream handle this. For
> example, the RK3576 EVB1 uses a similar arrangement but with a
> different PHY.

Yep, we had a similar fix, but it was rejected. Please see how RK3576 EVB1 does it:

https://lore.kernel.org/all/20250910-rk3576-evb-network-v1-1-68ed4df272a2@collabora.com/


-- 
Best, 
Chaoyi


