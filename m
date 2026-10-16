Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2E4CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOGIRzzzR0vzZdCdgNOPxzBc4k7KuaPHEI2DL4pIPwY=; b=WbNWaGIrjZY/oYSFqrBaN32/GC
	Cy1yz000j8nZRNwVZZkF9+D+4UrP9FvX1DJCoux4xz3fstvl2GJMIwgkFxeeOMuqNpfLo3X0hxEv7
	ot+g4VXIVx/B2sRKBJo1Mw53HUkjIUryrSQiUh0iEjcxfFWM1RShHtg9zLNHhjNRy7aG20PJF1IMK
	lfpPd4hqq+3J62xluL/Ssb7BmlNvVSn4Gj2kZNsWkQoOkfaOEF6zvMy/M7hD+wSvJ1F128JcrUSvr
	WAdiySxeb/6P7v516QLxix4HT3GzS8Gtex8Xh5EH5xapS1UE1CojuLQjDV46IvYpNP8MUOXdWfz86
	/3l4oOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8H6-000000050DY-2jRm;
	Sat, 17 Oct 2026 17:32:52 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8H2-000000050Bt-2Kz1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:32:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F16D8105FB3;
	Sat, 17 Oct 2026 19:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792258360;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gOGIRzzzR0vzZdCdgNOPxzBc4k7KuaPHEI2DL4pIPwY=;
	b=NJe2De6d9yMBsAIyHgnWUF4nKZu9OND0sgMZkUEkHsg5woqC9kyaczQTArtK2tevf2S6tM
	9qn9wzt/NbkmDwrS13Ii2WUGTm3CACAwuYOmutnz6HUCrAF5GaxlDiQrCf3C1D8P3b1sZw
	OPl+JEYCiGVaHUGpeg1OkTzzIWz4BXWs1/U8xJ68XuG+3Q+7qx0joL1hDuTDsrEV7X9CYl
	D80mBi99+Z8KMgxo3mOvl6x7xwk2unBMI3G0jrmny1O2sHtH1BbbBE5vC8SZEl9V6upivH
	3t4xCn7VqbbSnYNmjKUbUuzX1JS+tuppNZUEDxHDuvg/yV+xR7pcxUMJ6DDLpA==
Message-ID: <329d56ac-00ce-4fb6-87fc-eeb14ed78959@nabladev.com>
Date: Sat, 17 Oct 2026 00:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH 2/2] enetc: Make eMDIO MDC rate configurable from
 DT
To: Frank Li <Frank.li@oss.nxp.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 UNGLinuxDriver@microchip.com, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20261016193344.115518-1-marex@nabladev.com>
 <20261016193344.115518-2-marex@nabladev.com> <atKDNdxl0w65s8yQ@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <atKDNdxl0w65s8yQ@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_103248_836109_0FDA2282 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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

On 10/16/26 10:04 PM, Frank Li wrote:

[...]

>> +int enetc_mdio_update_mdc_div(struct mii_bus *bus)
>> +{
>> +	struct enetc_mdio_priv *mdio_priv = bus->priv;
>> +	struct device *dev = bus->parent;
>> +	struct clk *enet_clk;
>> +	u32 div, mdc_freq;
>> +
>> +	if (device_property_read_u32(dev, "clock-frequency", &mdc_freq))
>> +		return 0;
>> +
>> +	enet_clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(enet_clk))
>> +		return dev_err_probe(dev, PTR_ERR(enet_clk),
>> +				     "Input clock unknown, not changing MDC frequency\n");
> 
> binding said clock is optional. If return failure here, it will block
> existing dts, which have not clock property.
> 
> should be devm_clk_get_optional()?
Existing DTs are fine, since they don't define clock-frequency property. 
And whoever wants to define clock-frequency property, they also must 
provide clock property.

