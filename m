Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F4CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59s5xl47iUIECmsf5jnpdKqma5NgiHbA2ceA9PEBxGI=; b=EZwO8Mv6lNhTQrBgqK+V4gp9uI
	2SebKppPM7KsHzubUqVmGOuI/v3YBs6V07wAlWFFtx5DZjztoG/K18lYjco6inO74OMxzRfdfssW9
	w2BIOAuLzLoovp47mz0wtxDLsjeAcZYtYDGcMLgOTFr1OUdAc9onihjcpipa5+U/FlC/yzMbm2t+e
	QUW8z6r/r9YeldRo1Bb770Xfo0uVUEy6rtt3Y6EjOr49D3p3SHEINrn4ZGlm5+qlGyE73u9/j97os
	6Xk4CxlgPCSjmBIuuYWywHoBLL6Vthtf+7HGKt8YM6M8vy/YVxKJXmiTyep8PRI2DRoBcWrD8Qa1h
	xRtcX94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoub-0000000AzO3-3YEz;
	Tue, 26 Aug 2025 08:20:13 +0000
Received: from mail-m1973191.qiye.163.com ([220.197.31.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqooQ-0000000AyTa-3Ob0;
	Tue, 26 Aug 2025 08:13:52 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 20a3254b0;
	Tue, 26 Aug 2025 16:08:42 +0800 (GMT+08:00)
Message-ID: <8240a3cc-aade-40d8-b2f4-09681f76be68@rock-chips.com>
Date: Tue, 26 Aug 2025 16:08:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: ethernet: stmmac: dwmac-rk: Make the
 clk_phy could be used for external phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250815023515.114-1-kernel@airkyi.com>
 <CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
 <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
 <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
 <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
 <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98e56c163203abkunmeb456a22128a486
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlJTFZJHRpIT0lNTh1KT0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UusjxQNFmrhgPsBeO4BSS3vwfcXBVWMPRqRdZNCreD0Y3L9qO8EqBSlYU2i1ULdp+iyY6GbBaf/00QZeXLzGw3wjtT9ZJo4HN1rR7oYsMs2ha4d9dM+kLxiPLGjbAciiCssQvAVh1ppofzqZbMudcpH4MkQE7IH114QtmiGhntE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=59s5xl47iUIECmsf5jnpdKqma5NgiHbA2ceA9PEBxGI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_011351_293349_BF773768 
X-CRM114-Status: GOOD (  18.65  )
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

Hi Russell,

On 8/25/2025 9:37 PM, Russell King (Oracle) wrote:
> On Mon, Aug 25, 2025 at 12:53:37PM +0200, Marek Szyprowski wrote:
>> On 25.08.2025 11:57, Chaoyi Chen wrote:
>>> On 8/25/2025 3:23 PM, Marek Szyprowski wrote:
>>>> On 15.08.2025 04:35, Chaoyi Chen wrote:
>>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>
>>>>> For external phy, clk_phy should be optional, and some external phy
>>>>> need the clock input from clk_phy. This patch adds support for setting
>>>>> clk_phy for external phy.
>>>>>
>>>>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>> ---
>>>>>
>>>>> Changes in v3:
>>>>> - Link to V2:
>>>>> https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
>>>>> - Rebase to net-next/main
>>>>>
>>>>> Changes in v2:
>>>>> - Link to V1:
>>>>> https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
>>>>> - Remove get clock frequency from DT prop
>>>>>
>>>>>     drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
>>>>>     1 file changed, 7 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>>>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>>>> index ac8288301994..5d921e62c2f5 100644
>>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>>>> @@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct
>>>>> plat_stmmacenet_data *plat)
>>>>>             clk_set_rate(plat->stmmac_clk, 50000000);
>>>>>         }
>>>>>     -    if (plat->phy_node && bsp_priv->integrated_phy) {
>>>>> +    if (plat->phy_node) {
>>>>>             bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>>>>>             ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>>>>> -        if (ret)
>>>>> -            return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
>>>>> -        clk_set_rate(bsp_priv->clk_phy, 50000000);
>>>>> +        /* If it is not integrated_phy, clk_phy is optional */
>>>>> +        if (bsp_priv->integrated_phy) {
>>>>> +            if (ret)
>>>>> +                return dev_err_probe(dev, ret, "Cannot get PHY
>>>>> clock\n");
>>>>> +            clk_set_rate(bsp_priv->clk_phy, 50000000);
>>>>> +        }
>>> I think  we should set bsp_priv->clk_phy to NULL here if we failed to
>>> get the clock.
>>>
>>> Could you try this on your board? Thank you.
>> Right, the following change also fixes this issue:
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> index 9fc41207cc45..2d19d48be01f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>> @@ -1415,6 +1415,8 @@ static int rk_gmac_clk_init(struct
>> plat_stmmacenet_data *plat)
>>           if (plat->phy_node) {
>>                   bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>>                   ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>> +               if (ret)
>> +                       bsp_priv->clk_phy = NULL;
> Or just:
>
> 		clk = of_clk_get(plat->phy_node, 0);
> 		if (clk == ERR_PTR(-EPROBE_DEFER))

Do we actually need this? Maybe other devm_clk_get() before it would fail in advance.


> 			...
> 		else if (!IS_ERR)
> 			bsp_priv->clk_phy = clk;
>
> I don't have a free terminal to work out what "..." should be.
>

