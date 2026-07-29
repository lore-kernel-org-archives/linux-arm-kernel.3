Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC2AC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1Vg6BlOZ9ZGipKyOXTO4yGk1nIk6WX8XUetJBU5miM=; b=mYA9Vq6lckqCL/JjHmBP2zjwjg
	xH0pyHwj1EFGiISG4fQQ3Ad9WCaG3wL+EouO7+lZCQmYE3eYvKETYxOVESQTzK5hvEunJ+jLaq41W
	WOubJsiqmh/8ec5mtwr+yW77G/JLqXmBd7+Hmy56jIKrLsmIH8PVbu0ksKKtl07JxUrf48Hflf1vO
	ck1FW2MJRDicXnmJBXCqTM/GSpa9CC6cz+D7rffQcHLCkpu/O7mT56xZRitSgOC6ebfkaPH4lQ5sh
	Pw5OdSm5nM4rCX5Lx6W/l+GsDbvEvIyLC6kJnt8W95sDlKtaaJdqaKFxSrWeCqx+9bJhHtt5DuZVD
	sW6amAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5th-00000008Lqy-1BTM;
	Wed, 29 Jul 2026 15:08:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5te-00000008Lmn-0BJ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:08:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C20721A1300;
	Wed, 29 Jul 2026 15:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84BDC6039A;
	Wed, 29 Jul 2026 15:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A05C211C14FB5;
	Wed, 29 Jul 2026 17:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785337709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=J1Vg6BlOZ9ZGipKyOXTO4yGk1nIk6WX8XUetJBU5miM=;
	b=hEYICALnesdXVzcVYgnzSxl3wLM6zu0i8AACNW1rRLecEaH/SvGzI5ZOeuECX3qbWixjc+
	2QLlxf6FlOq/yn00vJ30eGejmWV092BjFwaf2u1JaZmkcEbVeB+7XkaQnfRVsu3wru0H2j
	UnlnyT3F1iSGn4iPpZWobyJZ5+p1xysX8yW1GnF3DVATb10GDHhl6yjqFmTkAgnO6o7P++
	W/DB43IUEyyEtuAP59cQ9X3qhL10Aj8ZO5mM0XB2XernAFEZ3QSqsyNquZQ5/IFHi0jFZP
	kBdqhXI+whrE1y4lSO58ntGXzAMrrZdxYJum87IX1yPGo6L/zmCUEeSgUBlIzA==
Message-ID: <fe1b129c-0a9a-4874-a7f9-9b277678a159@bootlin.com>
Date: Wed, 29 Jul 2026 17:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/5] net: stmmac: Remove VLAN perfect matching dead
 code
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "jun.ann.lai@intel.com" <jun.ann.lai@intel.com>,
 "yi.fang.gan@intel.com" <yi.fang.gan@intel.com>,
 "boon.khai.ng@altera.com" <boon.khai.ng@altera.com>,
 "matthew.gerlach@altera.com" <matthew.gerlach@altera.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
 <20260729095110.164157-2-ovidiu.panait.rb@renesas.com>
 <dfe9ee00-6a8a-418d-9440-339631b31e52@bootlin.com>
 <OSCPR01MB12769620094BA8C4DFA8DE361D3CA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <OSCPR01MB12769620094BA8C4DFA8DE361D3CA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_080838_240589_8827C0EF 
X-CRM114-Status: GOOD (  19.05  )
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

Hi,

On 7/29/26 17:02, Ovidiu Panait wrote:
> Hi Maxime,
> 
>>
>> Hi Ovidiu,
>>
>> On 7/29/26 11:51, Ovidiu Panait wrote:
>>> stmmac_vlan_update() falls back to "perfect matching" when the VLAN hash
>>> filter is unavailable (!priv->dma_cap.vlhash). This fallback has been
>>> unreachable in normal operation since its introduction in
>>> commit c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if
>>> HASH is not available") because the NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
>>> features are advertised only when priv->dma_cap.vlhash is true.
>>>
>>> The fallback is also duplicating the code in vlan_add_hw_rx_fltr(),
>> which
>>> is always available since stmmac_get_num_vlan() returns at least 1.
>>
>> It's not exactly dead code, there's an stmmac selftest for that, see :
>>
>> https://elixir.bootlin.com/linux/v7.2-
>> rc4/source/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c#L973
>>
>> It does exactly what you say, it fakes the fact that we don't support
>> vlhash,
>> then exercise the perfect matching path.
>>
>> But is it correct to drop that feature altogether ? Or should we just
>> relax the conditions for NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER to be
>> advertised ?
>>
> 
> We are not dropping the perfect matching feature by removing this code.
> Basically, there are two perfect matching code paths that duplicate the
> same logic and which diverged over time:
> 
> - vlan_update_hash() has the "if (perfect_match)" path that has never run on real
>   hardware (unless running the selftest) because NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
>   is only advertised if the core supports VLAN hash filtering.
> 
> - vlan_add_hw_rx_fltr() also has a perfect matching codepath, which calls into
>   vlan_write_single(). This runs unconditionally and overwrites what
>   vlan_update_hash() did anyway, as it runs after stmmac_vlan_update():
> 
> stmmac_vlan_rx_add_vid():
> ...
> 	ret = stmmac_vlan_update(priv, num_double_vlans);
> 	if (ret) {
> 		clear_bit(vid, priv->active_vlans);
> 		goto err_pm_put;
> 	}
> 
> 	if (priv->hw->num_vlan) {
> 		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
> 		if (ret) {
> 			clear_bit(vid, priv->active_vlans);
> 			stmmac_vlan_update(priv, priv->num_double_vlans);
> 			goto err_pm_put;
> 		}
> 	}
> 
> This path is also more correct because it takes into account cores that support
> extended VLAN filters.
> 
> Therefore, I think removing the perfect matching code in vlan_update_hash() is
> the right choice here.

OK makes sense. Then the sensible followup (not necessarily for -net) would be to
update the selftests, as there's no point messing with the vlhash cap then, if I'm
getting this right.

Thanks :)

Maxime

