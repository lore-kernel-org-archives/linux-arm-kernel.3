Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1477FC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDJmvAX7nAqa4Vhl4U1zjfFrd0jhOQ7wzffB0eGRfkE=; b=TbyEtF4FPpWeYSJft8xLuCC5d1
	zbbWXva5c5Yo9IkNA99RjPfFd9Rp37bXpk5MMohosOCP6vr3OhC9+p3d5d9Mr+BXync3Dw6lZQFOL
	JiPUnw9jkY651D+1DBHiOqeqZTj/wDTnxm+Sb8oOlDG3LVyMkbyC1zpA2Sxtlu+YCHUvLJlaaIlpx
	v/LwGqhbyZzdsvespqDYJdb2STZ1fI0mD/D2668M46/NPXHDZ5ypA5MhhzK8suV7hLC1hok1QS5uY
	wdHjRDIf2WBfHGlKvpXZ97WOGs3pSZtEs1a1aSiVhI0zgbA7FVUu77k3K46u5emLCZ9iK0QnPO3YR
	9rg9n9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKzz-0000000CXcg-2PXf;
	Thu, 06 Mar 2025 23:51:31 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKyM-0000000CXFo-0ZNE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741304988;
 bh=oDJmvAX7nAqa4Vhl4U1zjfFrd0jhOQ7wzffB0eGRfkE=;
 b=GpgPu2AUbNHWX+mccsHZrxMS9C0kNVY/jogO8MGd7AU16uNQp1F2ta7r2T0DUxb7T+PeDDll2
 ZhFMpb7A8SJgrQAfzUIlYRzT7O7vqWAvJmEDEE8BvZdFRmwJgxtkaw8JghJESJam7daGsqJzb7B
 itd8zx5mo/o1lupzrdlLlbdUNNp0DCBEM82XvhTmd6v2n11R27aTnLQ3rsSf3m8S/Qw38SFaRHf
 mmylCyhyGnqqWXXwDP+ppOZ4bR06jiWHE13mBRAEhKPpVGdEJx4ec3350Kt4dj1oe5NsHFnPMy5
 TxuWYmGucI9HRylCH870G9CPRGm3R0DIPJUxFzEKeZSQ==
X-Forward-Email-ID: 67ca3498c1763851c065d4e9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
Date: Fri, 7 Mar 2025 00:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and
 php-grf during probe
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
 <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_154950_269392_EB3C0461 
X-CRM114-Status: GOOD (  13.36  )
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

On 2025-03-06 23:37, Andrew Lunn wrote:
> On Thu, Mar 06, 2025 at 09:09:46PM +0000, Jonas Karlman wrote:
>> All Rockchip GMAC variants require writing to GRF to configure e.g.
>> interface mode and MAC rx/tx delay. The GRF syscon regmap is located
>> with help of a rockchip,grf and rockchip,php-grf phandle.
> 
>> @@ -1813,8 +1564,24 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>>  
>>  	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>>  							"rockchip,grf");
>> -	bsp_priv->php_grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>> -							    "rockchip,php-grf");
>> +	if (IS_ERR(bsp_priv->grf)) {
>> +		ret = PTR_ERR(bsp_priv->grf);
>> +		dev_err_probe(dev, ret, "failed to lookup rockchip,grf\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	bsp_priv->php_grf =
>> +		syscon_regmap_lookup_by_phandle_optional(dev->of_node,
>> +							 "rockchip,php-grf");
>> +	if ((of_device_is_compatible(dev->of_node, "rockchip,rk3588-gmac") ||
>> +	     of_device_is_compatible(dev->of_node, "rockchip,rk3576-gmac")) &&
>> +	    !bsp_priv->php_grf)
>> +		bsp_priv->php_grf = ERR_PTR(-ENODEV);
> 
> It seems odd you say all variants need this property, and then you
> look for two specific variants here and do something different? Why
> are these two special?

rockchip,grf is required for all GMACs, rockchip,php-grf is also needed
on rk3576 and rk3588 (+rk3562 that has been posted on ML) :-S

Above use of of_device_is_compatible() was my attempt at requiring the
syscon regmap for those variants that make use of php_grf. And still not
break rk3562 depending on the order these would land.

Should probably clarify a little bit with a code comment in a v2.

Regards,
Jonas

> 
> 	Andrew


