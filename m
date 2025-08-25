Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44513CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fa4+ZI2ynYvAnmTSBhg899GLSJbeJtzYjuSjpeEGlo=; b=CpbhBP3D3+0RAgo+mt2E8DRtjJ
	WeW9IJqdqjDZ3izAvK7rQZ/qBqe/ThOm8DBym8YA9Xo6HviPwN6R8qPhl9nrL0QaJnPmrmZk9SoUo
	M4HGjY4BrI0RCc3B5xfc8UT8i9ZudAa+93TRUIxeS2tx6QTVBxXyh40kAKztuCSkRe0Zsd/tdyqkn
	afzS5eLtW6G/dA26+vbgI+XJC8UFGk9erukaOzlHXYW3z+WYM7T9rh8trEqkmk/dPi7bQgDa9Vut7
	dHo7f26dz6VjG55XOyYIJ4IcFdWy8ZTfCa0DhPqBJIws+YuyvIcanHVEMNPBNzG6TJIIzkUZ/Dh5y
	9QSjE7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgW-00000007yHw-1XK3;
	Mon, 25 Aug 2025 12:52:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqUpc-00000007gQU-3zPI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 10:53:47 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250825105340euoutp015322d13668cb6b9bb9bd2f59449f8ab3~e-SBbcf0A0149201492euoutp01l
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 10:53:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250825105340euoutp015322d13668cb6b9bb9bd2f59449f8ab3~e-SBbcf0A0149201492euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756119220;
	bh=/fa4+ZI2ynYvAnmTSBhg899GLSJbeJtzYjuSjpeEGlo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=O7Cv3imsFNC7IeAXaIsQOTVSs76RWqKfhuY1jXd2FZM3Ej/vljQpDs3xEZkUN5oVS
	 yD3dDR5BV5Iy+WZgQeEsmHuWRu5jXr5enJzwDjpRONP0YLo+IUG8+2kMY+tteupH4e
	 6arTUTVUhfF3zVlfow0G8gUAI3YCMMvTsmHj+HwI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250825105339eucas1p13cf980f9b7f4ba4f465f5953b97f149c~e-SA9vcu40800108001eucas1p1m;
	Mon, 25 Aug 2025 10:53:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250825105337eusmtip19068233323fe8c45892597caf271a2e6~e-R-X77KD1201812018eusmtip19;
	Mon, 25 Aug 2025 10:53:37 +0000 (GMT)
Message-ID: <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
Date: Mon, 25 Aug 2025 12:53:37 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH net-next v3] net: ethernet: stmmac: dwmac-rk: Make the
 clk_phy could be used for external phy
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Chaoyi Chen
	<kernel@airkyi.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Jonas Karlman <jonas@kwiboo.se>, David Wu
	<david.wu@rock-chips.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825105339eucas1p13cf980f9b7f4ba4f465f5953b97f149c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
X-EPHeader: CA
X-CMS-RootMailID: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
References: <20250815023515.114-1-kernel@airkyi.com>
	<CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
	<a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
	<d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_035345_590166_C9AD976C 
X-CRM114-Status: GOOD (  20.63  )
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

On 25.08.2025 11:57, Chaoyi Chen wrote:
> On 8/25/2025 3:23 PM, Marek Szyprowski wrote:
>> On 15.08.2025 04:35, Chaoyi Chen wrote:
>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>
>>> For external phy, clk_phy should be optional, and some external phy
>>> need the clock input from clk_phy. This patch adds support for setting
>>> clk_phy for external phy.
>>>
>>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>> ---
>>>
>>> Changes in v3:
>>> - Link to V2: 
>>> https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
>>> - Rebase to net-next/main
>>>
>>> Changes in v2:
>>> - Link to V1: 
>>> https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
>>> - Remove get clock frequency from DT prop
>>>
>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
>>>    1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c 
>>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>> index ac8288301994..5d921e62c2f5 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>> @@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct 
>>> plat_stmmacenet_data *plat)
>>>            clk_set_rate(plat->stmmac_clk, 50000000);
>>>        }
>>>    -    if (plat->phy_node && bsp_priv->integrated_phy) {
>>> +    if (plat->phy_node) {
>>>            bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>>>            ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>>> -        if (ret)
>>> -            return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
>>> -        clk_set_rate(bsp_priv->clk_phy, 50000000);
>>> +        /* If it is not integrated_phy, clk_phy is optional */
>>> +        if (bsp_priv->integrated_phy) {
>>> +            if (ret)
>>> +                return dev_err_probe(dev, ret, "Cannot get PHY 
>>> clock\n");
>>> +            clk_set_rate(bsp_priv->clk_phy, 50000000);
>>> +        }
>
> I think  we should set bsp_priv->clk_phy to NULL here if we failed to 
> get the clock.
>
> Could you try this on your board? Thank you.

Right, the following change also fixes this issue:

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c 
b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 9fc41207cc45..2d19d48be01f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1415,6 +1415,8 @@ static int rk_gmac_clk_init(struct 
plat_stmmacenet_data *plat)
         if (plat->phy_node) {
                 bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
                 ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
+               if (ret)
+                       bsp_priv->clk_phy = NULL;
                 /* If it is not integrated_phy, clk_phy is optional */
                 if (bsp_priv->integrated_phy) {
                         if (ret)


 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


