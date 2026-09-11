Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32325C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 03:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCNmEzL/xZ/SzQ+Aa70CFkgEL/dKJ18aAMwiSI6jrj0=; b=bDiQ+Js3z9QBztPkk9hR4uueUn
	MAxm3xyPWrVcXz0QsjM57klaYgHfcU22URYvcmJ0RM2MlzK2dtqy8wOI39cfD8ajuDrFsFCkpzIFV
	wT38JJS11wBnAi4NJu51M/nRY1CFnkcQ/vQCtR/XEZcXD6qm2jd8hyL0EveV5v015CJZCupe7iHSH
	mO0QFpd3FZMFUQ7KOdhj3Un3fuBnja3ZeZjw5WO6u4B272450cUZEbbH8F+lXWMdSE+3bPqtJgEO5
	yXw/k9G0xtNEZw9y3nfMd/vhBayJfayLPz36QHu9nkAA46ROzrlp683iRz53LOmAJKvG2iHTgBdSv
	8rMiTTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5aW3-00000001KHT-2SeL;
	Sun, 13 Sep 2026 03:04:27 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5aW1-00000001KGK-05nF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 03:04:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87DCC10384A;
	Sun, 13 Sep 2026 05:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789268658;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sCNmEzL/xZ/SzQ+Aa70CFkgEL/dKJ18aAMwiSI6jrj0=;
	b=TxEh3WcnbGRkrMci5uDLASOJB6+sAJIHYde7RdwEmM4YFz5nK7go3JNNInc0meD8lNVjJ9
	ZAwGS0jcPdqqB+EAEAhYt15ob0SmQ9TYSvtUD2+wgjmrp6FWwYKP4xjIN28oNVJfXy8g2H
	+rhIYbzFiwnyld1xTFEgJlPahbyQSjbelzLll9zR3GOCmGjiX8qgdIx0GRpVEO5t2AcpxB
	jnN+rFE++MO2tdQiCexW7OxOty0Bdq6punm3tXvntX8sr8tgngmtiN8mN2wQM2XU1Hck7b
	teZ+lapROQ8eLVxce1S1wxnnWuwMOJ5Ma1fAx6VVjiarKPdmcKULYXytk6qGNQ==
Message-ID: <8cf82848-116f-4bd4-b0c6-137a295c832a@nabladev.com>
Date: Fri, 11 Sep 2026 16:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
 <20260911-sweet-industrious-stallion-b7a727@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260911-sweet-industrious-stallion-b7a727@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_200425_321641_ACDDD256 
X-CRM114-Status: UNSURE (   9.80  )
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

On 9/11/26 9:32 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:26:05PM +0200, Marek Vasut wrote:
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/phy/phy.h>
>> +
>> +#include "zynqmp.dtsi"
>> +#include "zynqmp-clk-ccf.dtsi"
>> +
>> +/ {
>> +	model = "ifm ZynqMP VHIP6 Evaluation Board";
>> +	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
>> +
>> +	aliases {
>> +		ethernet0 = &gem0;
>> +		ethernet1 = &gem1;
>> +		ethernet2 = &gem2;
>> +		ethernet3 = &gem3;
>> +		gpio0 = &gpio;
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		rtc0 = &i2crtc;
>> +		serial0 = &uart0;
>> +		spi0 = &qspi;
>> +		usb0 = &usb0;
>> +		usb1 = &usb1;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "clk_ignore_unused";
> 
> You should not have such bootargs in mainline DTS. It ties DTS to
> currecnt Linux driver implementation, not mentioning that it is
> subjective choice. And once such bootargs appear, then they are tricky
> to remove because users of DTS might rely on them.
This can be dropped, thanks.

