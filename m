Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F45C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywlnlRGZ0Kdlw+99ZDcpRUHN/MXyl9e/75luEMxwyak=; b=j40tkHGCveGHT2o3aGiLMPiZYX
	saHkXIWYeEe84+K0gcM+UQj4OVCrNP02Y0iWqpUc68i940R/146/6ehbiaDjhU0Hiewq5pXsiaImj
	l8RM9qRzHyHSk/WsXii0jM1Ili8gJ3gXV9mX9p7NQqWwmdRDDu9TR3yYp6EkDNHUtSXEq1GVNuLwh
	CyHFA0z8YEUwWyorZCniyu/d6FLOoSt6WSiupkHz0y8N7TPRo72Iz8NnKveQudTBx29CTWhxjsWmm
	9aQA7/JCEzcbPiRMznUsQ8s1I6i1fPD0MoTJOdnlW112ZPyHlG9GC2bSHwM0g6f/SCnX8bKiixX2e
	3wOGNwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcAt-00000001FuC-3S4f;
	Mon, 07 Jul 2025 03:05:47 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYc8X-00000001Fl7-0P9I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 03:03:22 +0000
Message-ID: <ef56c834-0e8c-410c-ada0-dc2b8be34cab@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751857387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywlnlRGZ0Kdlw+99ZDcpRUHN/MXyl9e/75luEMxwyak=;
	b=LjXN5o+YS0pU591RwbFe58yEnnr9sjYfhpJjLC8fZnQj9Ofh3OWmnzE0IqQBuO3IRWpSPU
	6Kp5Nj7bgM90OatBXy1Ly5YEvixDo6QnXJ/CpsnyNVsF7Yd3AC2CQB3lBEzoHDrgMRqGko
	BVjA8hj7yH8eCrJ9zeazg1Oxo5ZSVbo=
Date: Mon, 7 Jul 2025 11:02:59 +0800
MIME-Version: 1.0
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: wens@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>
References: <20250701165756.258356-1-wens@kernel.org>
 <20250701165756.258356-3-wens@kernel.org>
 <15ba0933-b0c1-40eb-9d3c-d8837d6ee12a@linux.dev>
 <CAGb2v646pxuT-nrwtDD-wvrA0eoxaee6sq2-mb0WoqUCPzpRjg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAGb2v646pxuT-nrwtDD-wvrA0eoxaee6sq2-mb0WoqUCPzpRjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_200321_345464_22A7EAD0 
X-CRM114-Status: GOOD (  12.76  )
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

在 7/2/25 10:09 AM, Chen-Yu Tsai 写道:
>>> +/* EMAC PHY Interface Type */
>>> +#define SYSCON_EPIT                  BIT(2) /* 1: RGMII, 0: MII */
>>> +#define SYSCON_ETCS_MASK             GENMASK(1, 0)
>>> +#define SYSCON_ETCS_MII              0x0
>>> +#define SYSCON_ETCS_EXT_GMII 0x1
>>> +#define SYSCON_ETCS_INT_GMII 0x2
>>> +
>>> +#define MASK_TO_VAL(mask)   ((mask) >> (__builtin_ffsll(mask) - 1))
>>> +
>>> +static int sun55i_gmac200_set_syscon(struct device *dev,
>>> +                                  struct plat_stmmacenet_data *plat)
>>> +{
>>> +     struct device_node *node = dev->of_node;
>>> +     struct regmap *regmap;
>>> +     u32 val, reg = 0;
>>> +
>>> +     regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
>>> +     if (IS_ERR(regmap))
>>> +             return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
>>> +
>> -----------
>>> +     if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
>>> +             if (val % 100) {
>>> +                     dev_err(dev, "tx-delay must be a multiple of 100\n");
>>> +                     return -EINVAL;
>>> +             }
>>> +             val /= 100;
>>> +             dev_dbg(dev, "set tx-delay to %x\n", val);
>>> +             if (val > MASK_TO_VAL(SYSCON_ETXDC_MASK))
>>> +                     return dev_err_probe(dev, -EINVAL,
>>> +                                          "Invalid TX clock delay: %d\n",
>>> +                                          val);
>>> +
>>> +             reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
>>> +     }
>>> +
>>> +     if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
>>> +             if (val % 100) {
>>> +                     dev_err(dev, "rx-delay must be a multiple of 100\n");
>>> +                     return -EINVAL;
>>> +             }
>>> +             val /= 100;
>>> +             dev_dbg(dev, "set rx-delay to %x\n", val);
>>> +             if (val > MASK_TO_VAL(SYSCON_ERXDC_MASK))
>>> +                     return dev_err_probe(dev, -EINVAL,
>>> +                                          "Invalid RX clock delay: %d\n",
>>> +                                          val);
>>> +
>>> +             reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
>>> +     }
>> ------------
>> These two parts of the code are highly similar.
>> Can you construct a separate function?
> As in, have a function that sets up either TX or RX delay based on
> a parameter? That also means constructing the property name on the
> fly or using ternary ops. And chopping up the log messages.
> 
> I don't think this makes it easier to read. And chopping up the log
> message makes it harder to grep.
I've looked through other driver codes, and it seems they
are all written this way, so let's keep it as it is for now.

Thanks,
Yanteng


