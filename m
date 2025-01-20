Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B63C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGzVX7k2FmqUfYRLqS7vwiYQh14m9/YvFN4qiCwdhQg=; b=boeBX3Goaxo26PXxgTxdKgaWG5
	vaaNLFMvp03sQiirhwz0ejca0hcDxo55tUil7TjK0N7fBdWZRB+IEmQdgEUX7StoRMuwy+AXv94Bh
	Z6sQko9Eu1UFSn+OXs47BCKEQbtldD805PmyjxrA+jX2fw8dmP+Ah7lTe5S/hfVX413UrcZJmpqjy
	hDXVRS4NhXhIgmob5+8Bqs2iwoeHA6P1EIwAIJttQQztkCs/qXMTjpbnSfzqsDCzGIIkYfnaz0aeB
	zFjyJRQB090/7pzmLaneA1+S6HuPxEp7bx4L8N8gYDepPrqtiIT8e6vFxl+uYMMSTGgRwO8tkM6Pw
	A2WJMYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZm7K-00000004ucF-0j1X;
	Mon, 20 Jan 2025 07:22:38 +0000
Received: from mail-m3284.qiye.163.com ([220.197.32.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZm3B-00000004tx6-2nPJ;
	Mon, 20 Jan 2025 07:18:23 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92b0fd19;
	Mon, 20 Jan 2025 15:18:15 +0800 (GMT+08:00)
Message-ID: <938a27aa-74dd-4fe2-8cdb-35e70aeba7f9@rock-chips.com>
Date: Mon, 20 Jan 2025 15:18:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] Add eDP mode support for Rockchip Samsung HDPTX
 PHY
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250112090714.1564158-1-damon.ding@rock-chips.com>
 <ezoduel3qz5ihlhekry26cb7ace3bm4xmzsfrsqvbodtcl3gjq@xxo75h7uozei>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ezoduel3qz5ihlhekry26cb7ace3bm4xmzsfrsqvbodtcl3gjq@xxo75h7uozei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhofSVZIQ0tIHx1IQkpMGBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9482938cc103a3kunm92b0fd19
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6CTo*QjILGjc0Ei1KIQtW
	T0pPCzlVSlVKTEhMSE5MT0JMSE5OVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSEhLNwY+
DKIM-Signature: a=rsa-sha256;
	b=YlMVqCemoJ5IuGFcjnoZpmTM+woLwFi2wcAc4vBGThor+N1qtfA0YzV3z3iB62D4/0lEir2z/RSlG6qZu78nUvKHmCE7MY1tLK3ql+K4BzVU5YzuM9SKIlIYPOimiJMYFRsZ8FfrfjRSPfKNVynCqgXMukhM4D8CSqMl+w3Snhg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LGzVX7k2FmqUfYRLqS7vwiYQh14m9/YvFN4qiCwdhQg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_231822_223241_6A840D8D 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Dmitry,

On 2025/1/13 17:10, Dmitry Baryshkov wrote:
> On Sun, Jan 12, 2025 at 05:07:08PM +0800, Damon Ding wrote:
>> Picked from:
>> https://patchwork.kernel.org/project/linux-rockchip/list/?series=923593
> 
> Then it should have been v6, not v1.
> 

I will update a patch series to fix it.

>>
>> These patchs have been tested with a 1536x2048p60 eDP panel on
>> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
>> on RK3588 EVB1 board.
>>
>> Damon Ding (6):
>>    phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and
>>      ROPLL_REF
>>    phy: phy-rockchip-samsung-hdptx: Supplement some register names with
>>      their full version
>>    phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all
>>      registers
>>    phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588
>>    dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>>      HDMI TX Controller
>>    arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>>
>>   .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   4 +-
>>   .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>>   .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>>   .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>>   .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>>   .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>>   .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>>   .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>>   .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>>   .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>>   .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>>   .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>>   .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>>   .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>>   .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>>   .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 971 +++++++++++++++++-
>>   19 files changed, 934 insertions(+), 75 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> 

Best regards
Damon


