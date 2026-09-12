Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2692BC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Mh/huTJwam5/F8JzuAR6TpZyhHpFnxSR9MEhdoiU+0=; b=09K6Ta7pPL2T2SH0mJd+KegXFF
	ESmOGSsxPkbkoeVVhmAVTLsaYGxL2CC06zVmLOSNoyde7fbv4gzbY1JyMWnpTAjvNvSwCoW3uyxVP
	Lx7PsvHvpsRD9ovjaGI801y8YFnyR9FAXIaJ5BpKl4AaEoVJ1H87IFEsjfiv7TlJ51ElFK8hvkMNK
	+DzuuryCaZAtFFN80iKbAXIfIC2nXznAvbP+wMgXQZ13JkM2RvqLUdooxTkW4sEegqTf9RDTOyijc
	AKPpIo4emC/WD/cmvKnJCRtw9o3d8iNZ+slXeFsGV8y3YVJ/R6OccrdSWQhlVWAekty+sfRmms+sk
	xjCacRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V4V-00000001DB7-30JH;
	Sat, 12 Sep 2026 21:15:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V4U-00000001DAy-3w6L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 21:15:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A6C24377F;
	Sat, 12 Sep 2026 21:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623541F000FF;
	Sat, 12 Sep 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789247736;
	bh=0Mh/huTJwam5/F8JzuAR6TpZyhHpFnxSR9MEhdoiU+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h/iGEqodz+ovg9AX5QfDUyIbRTfpiPdzaXsEjjsW1gozSPZrHZeAHt9V4OcRJPhBc
	 tvrYef3NRQPv9r2BkcWa7gGEqAMXq/DHNCMzlQIukKaqpQeaWm1Ynck6GzuzPL6dH+
	 BSThwNXYy5XZX9Z/HkLbHkkTBbHBh1xHTAaXTtLyPA7yoIZQg4T42iB2vpTNAQjzsN
	 1QRTQ+CTN2oYVw2r/lW4KYeiG2MT7SUqdexMkadhaIrQok8ajbkJw7JEA4yMoh43ms
	 OOTPwEfLFCCv7U0JuO5p7PhbQbtlw9VWCNLDyakjKIS0RikRczC5tmV5GuVCIo4agK
	 PB2n9SBXeSvCg==
Message-ID: <5fd92f0d-ec79-4e58-9a10-c135f55531aa@kernel.org>
Date: Sat, 12 Sep 2026 23:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] dt-bindings: interrupt-controller: apple,aic2: Add
 t8140 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
 <20260911-apple-a18-pro-initial-devicetrees-v2-4-08d06cf011d4@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-4-08d06cf011d4@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 9/11/26 18:58, Yureka Lilian wrote:
> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
> the M1-M4 SoCs.

AIC3 was introduced with M3, but no need to respin just for this. If I 
end up applying it to the apple-soc tree I'll just fix it then.


Sven

