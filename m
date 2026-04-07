Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EF2F3D5E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siFdnuAWVNxhYtYtVCTVw3Oculh2MDtC0DuQW/kTfWM=; b=kmev2U+tDR5G/r9Kcxi93H3zuq
	igGU8h6tofDk7S7+xzKAdsm5Kf6K29Wxq0lITuOP4uCqnLemNTT2lGwYYmRdwh8ZEbqURHhXgkaqW
	k6gDq44o4rkSyD+pL27oRM718CkxBEQuMsRvpRBdz2ayALC7hEPQbL0THxywQntbWSp0vOkVuhVLl
	o9ET8vi1l09JPOoEgZbJ1adOSU0oX945b/Qkh4bKpAuL6bwlyXm3gciaP9sf4KeLYC8DK1+YSswju
	TuGQdPzuUc3zfkacxRRsjbVFYs1D1WKNGlXPaz59GiQv6h3TjUleYVQtYQw2fHZxRF/MCxQcx7RGY
	JlgmjK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADVa-00000007tKX-1bmo;
	Tue, 07 Apr 2026 20:58:50 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADVY-00000007tIi-0hAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 20:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1775595525; bh=UwJUOGjr3wF6gP3UKq3tPA0H8IjhbtQZEg5uOq1j9W0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hHuYgiE5ISRXBkqFp3zAZepkjMVBT9j/eUuxTMlzZSQrCNGb1y0CpY8S3XyvUa4ev
	 yBgICoY72dnoGvmZm1/K6Jv5pqm5nywZhhVfJ9EG5UXViC+lIZZHSEIRiwzG0lBw5S
	 gvLZ+ecPEZ0PmyZ0gIgcCVfvm6nK+/TuIHpWFIlJnr8YsPdf3y9fm1kF9mab3sAyp3
	 w5vGPWK9hjlGWcer8TXMZyUBAmbbDU+FmIYMbpsiehRK88F7RytCBC/oZfEE3ko/Zr
	 i69k4J8cYkfP/q9sbXT31L9sQCKLPCticWr4fr3a6HP3QjCDQirfW2LWFdLP1G9Yku
	 oo5ls0QWvE2sQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9DD913829B6;
	Tue,  7 Apr 2026 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1775595525; bh=UwJUOGjr3wF6gP3UKq3tPA0H8IjhbtQZEg5uOq1j9W0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hHuYgiE5ISRXBkqFp3zAZepkjMVBT9j/eUuxTMlzZSQrCNGb1y0CpY8S3XyvUa4ev
	 yBgICoY72dnoGvmZm1/K6Jv5pqm5nywZhhVfJ9EG5UXViC+lIZZHSEIRiwzG0lBw5S
	 gvLZ+ecPEZ0PmyZ0gIgcCVfvm6nK+/TuIHpWFIlJnr8YsPdf3y9fm1kF9mab3sAyp3
	 w5vGPWK9hjlGWcer8TXMZyUBAmbbDU+FmIYMbpsiehRK88F7RytCBC/oZfEE3ko/Zr
	 i69k4J8cYkfP/q9sbXT31L9sQCKLPCticWr4fr3a6HP3QjCDQirfW2LWFdLP1G9Yku
	 oo5ls0QWvE2sQ==
Message-ID: <60dea9e5-9890-49ab-b806-713c388d6e08@mleia.com>
Date: Tue, 7 Apr 2026 23:58:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: lpc_eth: Fix a possible memory leak in
 lpc_mii_probe()
To: Ma Ke <make24@iscas.ac.cn>
Cc: alexandre.belloni@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, piotr.wojtaszczyk@timesys.com,
 stable@vger.kernel.org
References: <b44db9e6-f820-439d-a7ed-c1e2514579a8@mleia.com>
 <20260401131813.139167-1-make24@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260401131813.139167-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260407_205845_664179_DEA539B3 
X-CRM114-Status: GOOD (  23.93  )
/bin/ln: failed to access 'reaver_cache/texts/20260407_205845_664179_DEA539B3': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_205845_664179_DEA539B3 
X-CRM114-Status: GOOD (  29.27  )
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

Hello Ma Ke.

On 4/1/26 16:18, Ma Ke wrote:
> On 3/30/26 13:04, Vladimir Zapolskiy wrote:
>> On 3/30/26 11:16, Ma Ke wrote:
>>> lpc_mii_probe() calls of_phy_find_device() to obtain a phy_device
>>> pointer. of_phy_find_device() increments the refcount of the device.
>>> The current implementation does not decrement the refcount after using
>>> the pointer, which leads to a memory leak.
>>
>> this is correct, there is an actual detected bug.
>>
>>>
>>> Add phy_device_free() to balance the refcount.
>>
>> But this does not sound right, you shoud use of_node_put(pldat->phy_node).
>>
>>>
>>> Found by code review.
>>>
>>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
>>> ---
>>>    drivers/net/ethernet/nxp/lpc_eth.c | 11 ++++++-----
>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
>>> index 8b9a3e3bba30..8ce7c9bb6dd6 100644
>>> --- a/drivers/net/ethernet/nxp/lpc_eth.c
>>> +++ b/drivers/net/ethernet/nxp/lpc_eth.c
>>> @@ -751,7 +751,7 @@ static void lpc_handle_link_change(struct net_device *ndev)
>>>    static int lpc_mii_probe(struct net_device *ndev)
>>>    {
>>>    	struct netdata_local *pldat = netdev_priv(ndev);
>>> -	struct phy_device *phydev;
>>> +	struct phy_device *phydev, *phydev_tmp;
>>>    
>>>    	/* Attach to the PHY */
>>>    	if (lpc_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_MII)
>>> @@ -760,17 +760,18 @@ static int lpc_mii_probe(struct net_device *ndev)
>>>    		netdev_info(ndev, "using RMII interface\n");
>>>    
>>>    	if (pldat->phy_node)
>>> -		phydev =  of_phy_find_device(pldat->phy_node);
>>> +		phydev_tmp =  of_phy_find_device(pldat->phy_node);
>>>    	else
>>> -		phydev = phy_find_first(pldat->mii_bus);
>>> -	if (!phydev) {
>>> +		phydev_tmp = phy_find_first(pldat->mii_bus);
>>> +	if (!phydev_tmp) {
>>
>> I didn't get it, why the new phydev_tmp is needed above, please
>> restore the original code above.
>>
>>>    		netdev_err(ndev, "no PHY found\n");
>>>    		return -ENODEV;
>>>    	}
>>>    
>>> -	phydev = phy_connect(ndev, phydev_name(phydev),
>>> +	phydev = phy_connect(ndev, phydev_name(phydev_tmp),
>>>    			     &lpc_handle_link_change,
>>>    			     lpc_phy_interface_mode(&pldat->pdev->dev));
>>> +	phy_device_free(phydev_tmp);
>>
>> This is plainly wrong and has to be dropped or changed to
>>
>> 	if (pldat->phy_node)
>> 		of_node_put(pldat->phy_node);
>>
>>>    	if (IS_ERR(phydev)) {
>>>    		netdev_err(ndev, "Could not attach to PHY\n");
>>>    		return PTR_ERR(phydev);
>>
>> Is it AI generated fix or what?.. The change looks bad, it introduces
>> more severe issues than it fixes.
>>
>> If you think you cannot create a proper change, let me know.
>>
> Thank you very much for your detailed review and guidance.
> 
> Now I think your point probably is: you are saying that the real leak
> is not from of_phy_find_device(), but from the device node

I was pretty indelicate in my comment, let's split the change into parts.

1) I still do not understand, why phydev_tmp is introduced, please explain
or remove this part of the change;

2) phydev = of_phy_find_device() requires phy_device_free(phydev), but
I do not see why phy_find_first() requires it, while it was added in your
change.

Let's start from resolving these two points.

> pldat->phy_node which was obtained earlier (probably by
> of_parse_phandle()) and never freed by of_node_put(). And you suggest
> to add of_node_put(pldat->phy_node) instead of my wrong
> phy_device_free().
> 
> However, I am still a little confused. In lpc_mii_probe(),
> of_phy_find_device() is called. From my understanding, this function
> increases the reference count of the device. To balance it, I thought
> phy_device_free() (which calls put_device()) should be used.
> 
> Could you please kindly advise the correct patch? I will follow your
> guidance and submit a proper fix.
> 
> I apologize again for my previous wrong patch. Thank you very much for
> your help.

-- 
Best wishes,
Vladimir

