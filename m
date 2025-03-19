Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4CFC36001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyTLNPs087w5BxM7OveqzCRi5hUy7RVtutepUjFchbA=; b=H68QZ4tRn8VVOCXPA6Qvh+jlVu
	yU6mFcqo6hg2mfejntTQ26y/xHxQJbVr8lSm9NtT5xsHkhWJV8EeaxNoH0QyZGIZfKlTbzKmWE1Sj
	p0I8HoktrL1JH7//0BhevK0RmTjjn1rzPhqRA3w683puUVgpzA0FDgp5CQuvqNL92/KPKBAEFhjl4
	Ui8njlea4sB/3NPIwH41VYtLkfaxFI8yGHN2LUBzxN8FQmsP+F4W6Pj7oJPizu7P9jrQDxc6Z+QHO
	3AIGNYnDhnHYlBr/a1ZRuSGL9X0XfXhT4pnq1BO55V25FwY5b4xetCRwSy/ml4E8c5FGHwf6UKlri
	uTLr8Vsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Qn-0000000AMBh-1qbn;
	Wed, 19 Mar 2025 23:02:37 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2P5-0000000ALm0-2Xuv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742425250;
 bh=jyTLNPs087w5BxM7OveqzCRi5hUy7RVtutepUjFchbA=;
 b=KBvm7vl+P9UHgWtunSHZj0E32GLEalv95X4IpHJYkD1G8v5tOFpKMnrZNpj2mswZzx1a5YjBO
 f95vASz9dTK4WQbNdB8Vm1vUykZqSeD/yf/uj/RlDMiDbmxlUdpF16ri3TgA/G/6DVU/SkNRFIR
 YRJru9OUkzaMn6mrUt/jnU+rPjrIk9FiKbMRBlUfttZA2BGHH6eR6hB2GHDuwndmNHy3XuvbeRK
 RlqbS/mBT/fEZ8EMVPWO4Yk0KkL3LMPqaGZCojzWMeH6K/mRV2fBEppyXtbTCquZ4T1yW8ywcQP
 POR47rw+ZBeLk6TliejYSDhkb8YO8ow5lvtYmQqSQclA==
X-Forward-Email-ID: 67db4c9027ee59b783a86bdf
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e766eb6d-618a-43a0-b1e1-954c2c3fbf0e@kwiboo.se>
Date: Thu, 20 Mar 2025 00:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: dwmac-rk: Move
 integrated_phy_powerup/down functions
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Wu <david.wu@rock-chips.com>,
 Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-4-jonas@kwiboo.se>
 <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_160051_693202_46246CCC 
X-CRM114-Status: GOOD (  13.01  )
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

On 2025-03-19 23:39, Andrew Lunn wrote:
> On Wed, Mar 19, 2025 at 09:44:07PM +0000, Jonas Karlman wrote:
>> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
>> the integrated PHY on RK3228/RK3328. Current powerup/down operation is
>> not compatible with the integrated PHY found in these SoCs.
>>
>> Move the rk_gmac_integrated_phy_powerup/down functions to top of the
>> file to prepare for them to be called directly by a GMAC variant
>> specific powerup/down operation.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>> +#define RK_GRF_CON2_MACPHY_ID		HIWORD_UPDATE(0x1234, 0xffff, 0)
>> +#define RK_GRF_CON3_MACPHY_ID		HIWORD_UPDATE(0x35, 0x3f, 0)
>> +
>> +static void rk_gmac_integrated_phy_powerup(struct rk_priv_data *priv)
>> +{
>> +	if (priv->ops->integrated_phy_powerup)
>> +		priv->ops->integrated_phy_powerup(priv);
>> +
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_MACPHY_CFG_CLK_50M);
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON0, RK_GMAC2PHY_RMII_MODE);
>> +
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON2, RK_GRF_CON2_MACPHY_ID);
>> +	regmap_write(priv->grf, RK_GRF_MACPHY_CON3, RK_GRF_CON3_MACPHY_ID);
> 
> I know you are just moving code around....
> 
> Do you know what these MACPHY_ID are? I hope it is not what you get
> when you read PHY registers 2 and 3?

I think it may be:

  GRF_MACPHY_CON2
  15:0   macphy_id / PHY ID Number, macphy_cfg_phy_id[15:0]

  GRF_MACPHY_CON3
  15:12  macphy_cfg_rev_nr / Manufacturer's Revision Number
  11:6   macphy_model_nr / Manufacturer's Model Number
  5:0    macphy_id / PHY ID Number, macphy_cfg_phy_id[21:16]

and

  MACPHY_PHY_IDENTIFIER1 - Address: 02
  15:0   PHY ID number / default:cfg_phy_id[15:0]

  MACPHY_PHY_IDENTIFIER2 - Address: 03
  15:10  PHY ID number / default:cfg_phy_id[21:16]
  9:4    Model number / default:cfg_model_nr[5:0]
  3:0    Revision number / default:cfg_rev_nr[3:0]

So likely what you get when you read PHY registers 2 and 3.

Regards,
Jonas

> 
> 	Andrew


