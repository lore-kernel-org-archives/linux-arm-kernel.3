Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D9C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4wB1QYwi0iuakONjjW3MYAY6XW1sNub4WuonJ/8I3E=; b=4SrIRBrLP+5JCFGZbRaH5mG9ZQ
	ZaC2IDv1hRTwkFTxjhjw9XlSLK/wmfXpwaGMqvB2qDs3ixKmRcTb7RK+bTEPKPy7dwjxRmKsYijBy
	H0ZgNLp+mCpFr5R2/eSAIDk4OMNGnDy7WMi2gN2hDqnM3C06YV9KcCxJZissgn7+VUawg7KfTOAob
	p+DuP+GQn6AsQZHEipLS6wU/uX5wqOQRXiLZCeRU8QjLZ6aJOvfZkWHcC3/UuWsG78BSufcO3w6KG
	tOnQG1qqVjIABNwrsesYxBYbP9RpDM8hHLGPI6m9PM7SmGYrqGePLOu6uZTMfM35rf9AxnmKw3rjJ
	JegsrGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Y1w-0000000DUpL-1uKm;
	Thu, 10 Sep 2026 06:13:04 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Y1t-0000000DUoh-3Rq7;
	Thu, 10 Sep 2026 06:13:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87A5B3FD91A;
	Thu, 10 Sep 2026 08:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789020777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=L4wB1QYwi0iuakONjjW3MYAY6XW1sNub4WuonJ/8I3E=;
	b=AXjx859fYzPXthIfMssQwNFMKK2QBvjDlX7RstLkZivfKuuyKQYsvAzQdCDHm+pIx2wOIK
	vd3yHuXAJfQIftacSw5No4K4DGL3iHlVawNh3oNl9IUJ6ufyUMkFqUXEcFav9LJE0CS8df
	GH1h7Qmm9a4FoVe+cTakY1NvBRaMsNevhyHXCROaPkQ/dLdyuxJfGbspEJas+TuOOonvqn
	+NAXS35BzNH7KJr32GSdJNwvXYiAQQOsfDtoGgM4FgwfuGfO01FckfvUwJ0+3h39m3hOqX
	USGFyFoaNlpPM44D/1h9w8+AJ0x1Mxf2U/YjTvFXpSkdjTVM7ig5G7wiNadQFQ==
Message-ID: <f1c898c4-2a84-41e8-ad8d-8c79df3feb47@cjdns.fr>
Date: Thu, 10 Sep 2026 08:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
 <aqHlfmYa249e3HRM@makrotopia.org>
 <7a3479c8-45cc-4b88-b111-c35d59f370e1@cjdns.fr>
 <aqIOGgVujIKT7H2H@makrotopia.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aqIOGgVujIKT7H2H@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_231302_067856_742425D2 
X-CRM114-Status: GOOD (  22.01  )
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


On 10/09/2026 03:55, Daniel Golle wrote:
> On Thu, Sep 10, 2026 at 01:26:14AM +0200, Caleb James DeLisle wrote:
>> On 10/09/2026 01:02, Daniel Golle wrote:
>>> On Wed, Sep 09, 2026 at 09:32:50PM +0000, Caleb James DeLisle wrote:
>>>> The EcoNet EN751221 multi-chip module implementation of the MT7530
>>>> requires some additional configuration of the PHYs on startup.
>>>> The reason for this is not known, but it is possible that it has
>>>> to do with the fact that the EN751221 MCM implementation of the
>>>> MT7530 runs at an abnormal PLL frequency (362.5Mhz).
>>>>
>>>> Detect whether the MT7530 PHY is attached to the MDIO bus of an
>>>> EcoNet EN751221 switch and if so, apply the necessary register
>>>> updates.
>>>>
>>>> Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
>>>> Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>>> ---
>>>>    drivers/net/phy/mediatek/mtk-ge.c | 61 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 61 insertions(+)
>>>>
>>>> diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
>>>> index 73d9b72f9d9e..42b06c40d703 100644
>>>> --- a/drivers/net/phy/mediatek/mtk-ge.c
>>>> +++ b/drivers/net/phy/mediatek/mtk-ge.c
>>>> [...]
>>>>    static int mt7530_phy_config_init(struct phy_device *phydev)
>>>>    {
>>>> +	int ret;
>>>> +
>>>> +	if (mt7530_phy_is_en751221_companion(phydev)) {
>>> Please introduce a `.match_phy_device` operation for both, actual
>>> MT7530 and EN751221, similar eg. to `ksz8051_match_phy_device` in
>>> micrel.c.
>> Sounds good, since this will certainly collide with
>> https://lore.kernel.org/netdev/20260827065930.2618729-2-cjd@cjdns.fr/ would
>> you prefer them in the same patch, or as a patch set? If you'd like I can do
>> this and the FE phy as a common patch set. Let me know what you prefer.
> I'd do it one driver at a time, starting with mtk-ge.c, already adding
> the .match_phy_device logic so it would also avoid binding the MT7530
> driver to an ECONET_FEPHY.
>
> The econet-fe-soc.c driver is much larger and may require more rounds
> to make all bots and humans happy, so I'd not have the independently
> useful mtk-ge.c changes depend on that.
Good point, so I can make mtk-ge so it won't interfere with "any future 
FE PHY with the same ID" with the understanding that this PHY is moving 
along at it's own pace.
>
> Dumping the PHY register space and comparing it with MT7530 could also
> help to indentify any better way than relying on the parent DT
> compatible which *is* a bit of a stretch (but could well be
> unavoidable, of course).

I'll give it a shot but I have low confidence in it because AFAIK this 
is actually a real MT7530 MCM just like MT7621 but it just happens to be 
clocked to a weird PLL frequency.


Thanks,

Caleb

>

