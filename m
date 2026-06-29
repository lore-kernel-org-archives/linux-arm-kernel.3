Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rsMIqeUo7w/8HQ084SMthYLAbPCuimMFz6Hr3QOyaE=; b=AQMOw0TEyUeiQuN5WQ9h5EB2Mu
	5hSeBuW/7Bx5AMpXLCRvROJtk8wAbmj9ljZWFEkCBco4RM2YqaY2jwWQLdoKfdBN3r2s5dXukPgKN
	MgiGwQS+s218l1dAjOXqm13PLGIBm2HWI1P/wUvkfcjZpEwYDVcIgc1VwDaowV3ZjZ4alwKO+loEk
	Xk0WiSWscCRZRHHdVOsxJmf8y/2bnQRYdWVmIesLB67zSJh6oSHvDqxNsp7jTF7qTSK73RkRTthnc
	Yc1KS0ADRiiGQcu5P/D8WoFwXpQ67272j3l/QoA/AIo2Y8r2l1dLfj60s3vvZqLiAX2rwo7loz7Mz
	ZO8IdgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we63L-0000000DqZJ-2Vhb;
	Mon, 29 Jun 2026 07:05:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we63I-0000000DqUz-37X2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:05:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5600B4E40B45;
	Mon, 29 Jun 2026 07:05:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2419A5FF96;
	Mon, 29 Jun 2026 07:05:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AF9B106F14DB;
	Mon, 29 Jun 2026 09:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782716701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1rsMIqeUo7w/8HQ084SMthYLAbPCuimMFz6Hr3QOyaE=;
	b=of/X3b2pqHw09oeoNd1OvSXDh4fwfA+/kKLRQreFdmzEqIgfhOA1Qr/ndrgAS+GDHD1foq
	YVUwy2UDChvK8VCKa8bl8WHPu/RGbgHx65vTU8qf5QhD+0SjO+EkaJQD+PiMQRKealgon9
	TuDtgKRkFFgrshWTzAVAX0UEKPDekcNslGvvWEwSaHcY0QSWF9ruFjP5u+SRAQ0XeASqZc
	cYPYWionzUmVuXiJgbsoK9MfyrKHSIylnjEV4Hxv2eg1bnCcvScdtVZk2m50nfz7Mpw8Ir
	N/mi42ewOEIx03TM2HzKhOkVMoYeeWZgwbOT1qao8LyiML3z7WV7A+3DF6KRQw==
Message-ID: <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>
Date: Mon, 29 Jun 2026 09:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
 <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
 <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000509_083868_6625B26A 
X-CRM114-Status: GOOD (  44.44  )
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

Hi Christian,

On 6/27/26 14:33, Christian Marangi wrote:
> On Thu, Jun 25, 2026 at 04:13:14PM +0200, Maxime Chevallier wrote:
>> Hello Christian,
>>
>> On 6/18/26 14:57, Christian Marangi wrote:
>>> Add phylink_release_pcs() to externally release a PCS from a phylink
>>> instance. This can be used to handle case when a single PCS needs to be
>>> removed and the phylink instance needs to be refreshed.
>>>
>>> On calling phylink_release_pcs(), the PCS will be removed from the
>>> phylink internal PCS list and the phylink supported_interfaces value is
>>> reparsed with the remaining PCS interfaces.
>>>
>>> Also a phylink resolve is triggered to handle the PCS removal.
>>>
>>> The flag force_major_config is set to make phylink resolve reconfigure
>>> the interface (even if it didn't change).
>>> This is needed to handle the special case when the current PCS used
>>> by phylink is removed and a major_config is needed to propagae the
>>> configuration change. With this option enabled we also force mac_config
>>> even if the PHY link is not up for the in-band case.
>>>
>>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>>> ---
>>>  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
>>>  include/linux/phylink.h   |  2 ++
>>>  2 files changed, 58 insertions(+)
>>>
>>> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
>>> index c38bcd43b8c8..064d6f5a06da 100644
>>> --- a/drivers/net/phy/phylink.c
>>> +++ b/drivers/net/phy/phylink.c
>>> @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
>>>  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
>>>  
>>>  static void phylink_run_resolve(struct phylink *pl);
>>> +static void phylink_link_down(struct phylink *pl);
>>> +static void phylink_pcs_disable(struct phylink_pcs *pcs);
>>>  
>>>  /**
>>>   * phylink_set_port_modes() - set the port type modes in the ethtool mask
>>> @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
>>>  	}
>>>  }
>>>  
>>> +/**
>>> + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
>>> + * @pcs: a pointer to the phylink_pcs struct to be released
>>> + *
>>> + * This function release a PCS from the phylink PCS available list if
>>> + * actually in use. It also refreshes the supported interfaces of the
>>> + * phylink instance by copying the supported interfaces from the phylink
>>> + * conf and merging the supported interfaces of the remaining available PCS
>>> + * in the list and trigger a resolve.
>>> + */
>>> +void phylink_release_pcs(struct phylink_pcs *pcs)
>>> +{
>>> +	struct phylink *pl;
>>> +
>>> +	ASSERT_RTNL();
>>> +
>>> +	pl = pcs->phylink;
>>> +	if (!pl)
>>> +		return;
>>> +
>>> +	mutex_lock(&pl->state_mutex);
>>> +
>>> +	list_del(&pcs->list);
>>> +	pcs->phylink = NULL;
>>> +
>>> +	/*
>>> +	 * Check if we are removing the PCS currently
>>> +	 * in use by phylink. If this is the case, tear down
>>> +	 * the link, force phylink resolve to reconfigure the
>>> +	 * interface mode, disable the current PCS and set the
>>> +	 * phylink PCS to NULL.
>>> +	 */
>>> +	if (pl->pcs == pcs) {
>>> +		phylink_link_down(pl);
>>> +		phylink_pcs_disable(pl->pcs);
>>> +
>>> +		pl->force_major_config = true;
>>> +		pl->pcs = NULL;
>>> +	}
>>> +
>>> +	mutex_unlock(&pl->state_mutex);
>>> +
>>> +	/* Refresh supported interfaces */
>>> +	phy_interface_copy(pl->supported_interfaces,
>>> +			   pl->config->supported_interfaces);
>>> +	list_for_each_entry(pcs, &pl->pcs_list, list)
>>> +		phy_interface_or(pl->supported_interfaces,
>>> +				 pl->supported_interfaces,
>>> +				 pcs->supported_interfaces);
>>
>> I've given more thought to that 'supported_interfaces' thing. This
>> patchset redefines the meaning of
>>
>>   pl->config->supported_interfaces
>>
>> Currently, it's filled by the MAC driver and means "Every interface
>> we can support, including the ones provided by PCSs that we can use
>> with this MAC".
>>
>> It now becomes "Every interface we support without needing a PCS", at
>> least the way I understand that.
>>
> 
> Wait but with the current code using the OR logic, it still follows
> "Every interface we can support...". The modes that needs a PCS are
> specificed with the pcs_interfaces mask in phylink_config.

you current code is correct, I was mostly concerned about the doc
that goes along with it :)

So in the end, we'd have something like (simplified):

pl->config.supported_interfaces = RGMII_xx | SGMII | 1000BaseX
pl->config.pcs_interfaces = SGMII | 1000BaseX

pcs->supported_interface = SGMII| 1000BaseX

correct ?

> 
> The late add and release operates on the phylink supported_interfaces ONLY
> when the MAC didn't specify support for it (by removing it as only the PCS
> will declare support for it)
> 
> The confusion is present because everything is validated later on
> major_config so those supported_interfaces are just an HINT that are later
> verified with get_caps and with the pcs_validate OPs.
> 
> Adding the supported_interfaces to phylink is really to keep an original
> reference of the value. This is to address a pattern I have notice where
> the MAC driver always OR the interfaces with the one supported by the PCS.
> (I remember it was pointed out by Russell)
> 
> But I'm more than open to discussion as this is something marginal to the
> whole implementation, I'm also questioning if this OR is actually useful to
> anything on the nth tought on this.
> 
> One thing that I notice is that parsing this early with AND might be
> problematic at phylink_create, but I still have to evaluate that.
> 
> My take is that would be good to have some review also on the other logic
> as I think I reached a point where Sashiko starts to comments on more or
> less unreal problem.

True, TBH all the fwnode part is something I'm a bit less familiar with though
so maybe someone else can browse through that.

FWIW, I've tested that whole series on a board that has "legacy" PCS board
that has mvpp2 and 2 possible PCSs, and it seems to work fine so no regressions
there :)

A side note with the "legacy" naming, I'd rather have it called "built-in" or
something like that, I don't see a clear path to porting the existing code to
fwnode without breaking DT compat, as it's likely we'll have to remove the PCS
register ranges out of the MAC's range. 

Thanks for this work anyway, this is great !

Maxime

