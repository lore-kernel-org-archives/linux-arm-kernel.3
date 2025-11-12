Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A947CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTnbgSuE6RgEYpYQF2xhT+pvJdvD6WChCNxRoxD+Pr4=; b=ghp4jjlPTvBeSX5z7fUoomCfx7
	kTX0s/vJnegG2gOW/4hyrvwgNqQkUtxmuy0mBLCHzXuxxLIne770EQrF8nAq4w0IphiQBeo/3zC55
	5jrDYiNo18rY1BMuZDRKqThvEa8wU9E9xrkFYO550DUoWiZk28grbLbPUxcuk99Q0Zqir2uJgT+EN
	1EX7hzlNY7LetVl+hgeCk6FXRWKYRBQ8xCQl80Y2fEhf0QK0USL1jCyR0wUHCdqk+8iEd4puujbYT
	tWk2Nx5UGhIvf1wmHWX1gnzOuwh2EVBfIW00K+MhXk3QkBoet+oqO0GyOXhYRKnPSfUnm3LwP+ZkJ
	3gbalm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ68c-00000008KhR-4BXC;
	Wed, 12 Nov 2025 08:23:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ68a-00000008Kh3-2rT2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:23:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58F7FC0F55A;
	Wed, 12 Nov 2025 08:23:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7F976070B;
	Wed, 12 Nov 2025 08:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3728B1037196F;
	Wed, 12 Nov 2025 09:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762935807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rTnbgSuE6RgEYpYQF2xhT+pvJdvD6WChCNxRoxD+Pr4=;
	b=g3Mg4xdXi7Vo0r1FgrG9Rjot6Ej08ydVfBPOwi8fdXDBWr5eT9S6lnTvA26SsxaTHQ9gx4
	BFaeeJOaIuWS80K+dWG1DJtjToCM74e59oy4iMKORNxT5ehTm7Aw9jIW0q9OjQ9292A7Ki
	Pl4MUmnLn79fRrj9sFOmIkberIWtNCbPlj/sdUydxvgUsd4/XwUV0H7E6dX/B/6Wo104bM
	io/Vmu5l+cCK2zU8bMrnt2Dk6RgfCqQLBohwNnbyt4blColBHfqaVsWwmnjjzL1MpUdx3f
	qyVc/l0tHLVm+gq7dX2oL4rdXTWFHjYKftqfCgZms2gUK2eK9bvvnK5rb734Dg==
Message-ID: <33bad77f-8468-4e4a-a60d-adf9e1145816@bootlin.com>
Date: Wed, 12 Nov 2025 09:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 03/15] net: phy: Introduce PHY ports
 representation
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-4-maxime.chevallier@bootlin.com>
 <fc89e17f-c6f5-4a84-8780-737969ed2e22@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <fc89e17f-c6f5-4a84-8780-737969ed2e22@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002332_895935_13519AF4 
X-CRM114-Status: GOOD (  15.38  )
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



On 11/11/2025 04:53, Andrew Lunn wrote:
>> +/**
>> + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
>> + * @supported: After this call, contains all possible linkmodes on a given medium,
>> + *	       and with the given number of lanes, or less.
> 
> lanes -> pairs?

indeed :(

> 
>> +	/* The PHY driver might have added, removed or set medium/lanes info,
>> +	 * so update the port supported accordingly.
> 
> lanes -> pairs?

yes true :(
> 
>> +struct phy_port *phy_of_parse_port(struct device_node *dn)
>> +{
>> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
>> +	enum ethtool_link_medium medium;
>> +	struct phy_port *port;
>> +	const char *med_str;
>> +	u32 pairs = 0, mediums = 0;
>> +	int ret;
>> +
>> +	ret = fwnode_property_read_u32(fwnode, "pairs", &pairs);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
> 
> I think this needs to come later. It is not critical now, but when we
> come to add other medium, it will need moving. If we add say -K, and
> need lanes, we don't want to error out here because pairs is missing.

Ack, I'll relax the check

> 
>> +	ret = fwnode_property_read_string(fwnode, "media", &med_str);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	medium = ethtool_str_to_medium(med_str);
>> +	if (medium == ETHTOOL_LINK_MEDIUM_NONE)
>> +		return ERR_PTR(-EINVAL);
> 
>> +	if (pairs && medium != ETHTOOL_LINK_MEDIUM_BASET) {
>> +		pr_err("pairs property is only compatible with BaseT medium\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
> 
> This i think needs changing, if medium == ETHTOOL_LINK_MEDIUM_BASET
> then get pairs, and validate it. I would probably also test it is 1,
> 2, or 4.

That's fine by me :) I'll update the binding as well then, as having 3
pairs will never be correct.

Thanks a lot for looking at this !

Maxime

> 
> 	Andrew


