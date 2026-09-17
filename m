Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EA2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqWR7hYROWy/62+C7c2MOHPyBP86rK/9sHBnklMxuv4=; b=Fm6dIEZdPHm62sdVWp5Yc0jCoA
	Ke1vpsW9tHPNHlbiWUy49XgdxnjkXykJTDxjqx+BatBHQBVIqh1NtdFas6h4ARU0yjsH8f2AlkGXD
	CQ3N/qGQQLyJpuXIz2gIzL8RV4sRmtzhUcQgq+KMOBzR65gS6CS/Jl4pu0DJF2o/fJjhYMyfXopgX
	/M9G5FZrbdbdyM0g8LiYPdkQ4Aa8234TnR4VZ3MtX6TSYbCERDoH5+MfJO+NwKS9s9oA11QCn+Nde
	1yISBfJAVkdzzjN4pKOcxXs02MGhZsycm4RWp+VgYCaySoH1I716f2OOa6NHkteXNKOu7VsisT1mT
	vPQ32Qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DmZ-0000000Be8S-1twr;
	Thu, 17 Sep 2026 15:12:15 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DmX-0000000Be7t-2yVY;
	Thu, 17 Sep 2026 15:12:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 802EF4C301B;
	Thu, 17 Sep 2026 17:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789657928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DqWR7hYROWy/62+C7c2MOHPyBP86rK/9sHBnklMxuv4=;
	b=Av195hmAG2se1bBc2mVvC49xtmKl9Yp5Oas2Ym7ZMeqIeDJJuFVeOSOCrZHVqDsaPpd1Pq
	NmlAu0x+lthIV2wgWo5QoIh82AnoABImmODhDYqZURjLUaK9+EVnxzZmOIMBCujizfLdIB
	T9m8U+jHAq7FNAWnwq109d2A2LJw8ix6SLBZ1McjkUbZUurQLlmRVmgaNVPCUDpWVFIUJI
	Z9D6p6MuuchHb7bYL17q5HzeEIEwaf7y69GXZrnH+336B6l32ERRNoBhSRZ2ki1/Atm84x
	ub/ATHK8HrNGbtju02el2Y9T0e65+6qBlqv/Dd7QydfFkqlo/k5Jl6n9NDKjIA==
Message-ID: <95202df5-fdbb-4325-b77b-5f45ac8b1732@cjdns.fr>
Date: Thu, 17 Sep 2026 17:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260915113427.113296-1-cjd@cjdns.fr>
 <aqkwYd5dTmHDCIW9@makrotopia.org>
 <2a7edfd0-b784-4b60-b9f9-769fe00286b7@cjdns.fr>
 <aqv92pZsobVEdipZ@makrotopia.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aqv92pZsobVEdipZ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_081213_935617_E7AC7410 
X-CRM114-Status: GOOD (  13.10  )
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


On 17/09/2026 16:48, Daniel Golle wrote:
> On Tue, Sep 15, 2026 at 02:01:29PM +0200, Caleb James DeLisle wrote:
>> On 15/09/2026 13:47, Daniel Golle wrote:
>>> On Tue, Sep 15, 2026 at 11:34:27AM +0000, Caleb James DeLisle wrote:
>>>> @@ -135,6 +199,23 @@ static struct phy_driver mtk_gephy_driver[] = {
>>>>    		 */
>>>>    		.config_intr	= genphy_no_config_intr,
>>>>    		.handle_interrupt = genphy_handle_interrupt_no_ack,
>>>> +		.match_phy_device = mt7530_phy_match,
>>>> +		.suspend	= genphy_suspend,
>>>> +		.resume		= genphy_resume,
>>>> +		.read_page	= mtk_phy_read_page,
>>>> +		.write_page	= mtk_phy_write_page,
>>>> +	},
>>>> +	{
>>>> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
>>> I'd suggest to actually use phy_id and phy_id_mask assigned by the
>>> PHY_ID_MATCH_EXACT macro by calling genphy_match_phy_device() in your
>>> match functions above instead of open-coding the ID match.
>>> Or drop PHY_ID_MATCH_EXACT from *both* drivers.
>> I suppose the latter is easier because then I don't have to re-think
>> mt7530_is_gphy() which would be lying if it wasn't actually checking ID is
>> MTK_GPHY_ID_MT7530.
>>
> I would have preferred to call genphy_match_phy_device() in your match
> functions instead of open-coding phy_id_compare() which is best
> reached via genphy_match_phy_device() in this situation -- that would
> express the code intent in the most obvious way imho.


I did it this way because the name mt7530_is_gphy() implies "Is this an 
MT7530 gigabit PHY?" which if it doesn't match on MTK_GPHY_ID_MT7530 
then that's not what it does so there's a little bit more thought involved.


If I'd have known this was really your preference I'd have done that, 
but I already just sent v6 so I guess I can send v7 tomorrow.


Thanks,

Caleb



