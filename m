Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42415E8537A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hl48le5DZuaTctUw9+zvwnFRvdxei1nlvRwJsvIOXWs=; b=X5gnLZ4qEugwNbP0nyPjM1Q+GV
	+gWvTsUzdrPSD89uBwBIbIaOAOmKRvUvXBr6xCIjEzTSo/EozdlRVNMIcx2OMcgs5Wk5qI1iErQau
	abuzVsQCqJioXMKmXmQU1z7wCItxU8DIbwd2B5M3CW928yTcZZTcXxa8Od1z8HPY3i5RMnr6/3hU9
	Z/Dr1aoKd1DbDbEkC9PQZ+SWKnrJ6q8/WZ4zNMH09l6Lbb3WoFoHlJ0kYTz9SayJCK/UWH0L1isYr
	/q4LkwwqBFtOgBPkGBaAR8KrvwxPeYlwEMDKcwAba2rz9x1y8O9aW7NjnLRwORtpAxnH3Rt2t0nlh
	mWoPg4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hPm-00000002KJJ-3SnH;
	Fri, 03 Apr 2026 16:30:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hPk-00000002KIY-1VTE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775233832; x=1806769832;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hnXbTiCURWkWhcJukdVHDLVwJkYC/OiQhhQ6AqQbxkw=;
  b=exD5dii/xUIPongdKWdnaM1VVn9zkmh6u4elrKJd2OBWZ3FODW4VkDS8
   4uqU4Qxf1M2j7i4zuzgOI4kJRiYRFV1kboq8mBEF4NmkbyTpc4WNP8BPM
   BSZUdsOm9pohRymvB8pJ2kaHmcJd1gJaC+USiHA0VlQokH/b+NyHM1Nqa
   PUTtLqsJ4N74QzixQzDZrrFRiYyIwNSTexfBxYCObvJolhTs5VxCL3I9O
   LKLwCb5FFOiZWktHcJT+9RlJ3iQ/WRGqMEuBlwHesgWARF3vgvR/s/mlT
   5MdY3BOGylFrBrDcVXK3xJRUTttlIlszTLdSLxgtwQ1GTp/bdkVv4tgsW
   Q==;
X-CSE-ConnectionGUID: dUDUSQJ+T8aeZQq9X6+uCg==
X-CSE-MsgGUID: iUmQc9GxQcS1JvNTZT1BOQ==
X-IronPort-AV: E=Sophos;i="6.23,158,1770620400"; 
   d="scan'208";a="222904307"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Apr 2026 09:30:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 3 Apr 2026 09:30:13 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 09:30:11 -0700
Message-ID: <29b697cf-90ae-4239-898b-2026dbf368dc@microchip.com>
Date: Fri, 3 Apr 2026 18:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] crypto: atmel-sha204a - add Thorsten Blum as
 maintainer
To: Thorsten Blum <thorsten.blum@linux.dev>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260403112135.903162-5-thorsten.blum@linux.dev>
 <20260403112135.903162-7-thorsten.blum@linux.dev>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260403112135.903162-7-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_093032_482202_27C40B94 
X-CRM114-Status: GOOD (  13.00  )
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

On 03/04/2026 at 13:21, Thorsten Blum wrote:
> Add a MAINTAINERS entry for the atmel-sha204a driver and Thorsten Blum
> as maintainer.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Thorsten for taking care of those components.

Best regards,
   Nicolas

> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c23110384b91..7317d80592cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17197,6 +17197,12 @@ S:     Supported
>   F:     Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
>   F:     drivers/spi/spi-at91-usart.c
> 
> +MICROCHIP ATSHA204A DRIVER
> +M:     Thorsten Blum <thorsten.blum@linux.dev>
> +L:     linux-crypto@vger.kernel.org
> +S:     Maintained
> +F:     drivers/crypto/atmel-sha204a.c
> +
>   MICROCHIP AUDIO ASOC DRIVERS
>   M:     Claudiu Beznea <claudiu.beznea@tuxon.dev>
>   M:     Andrei Simion <andrei.simion@microchip.com>


