Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B26DD6ACC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/dWshaC6Lc3Od9qQ6+73Wp8qbrfV2SUxQFMyoOsYnY=; b=HpzJEImjTimAHIrG6MjEj3kLaf
	tXD8QE6inaH4WPF4xliw6NLv40W4kE07e/x4qlx2kDKYJ+xRRAG9jKFxyCpiaHZ3z8YBxTdgHvC1g
	ZHhmCbZYut+k+u8ytahNO+H1loW7ODH3vrDksVZCRMD3h3LIlPVBOkFzH7HIlKTbqUHT642vRgvxh
	E/Y7gdgbTNr4QrmyaRfnIJjnJWlo2Fbvl+Y2GFhIR/EXqffeBA/Wq+eIUmzz05fRmX5c1q7Bfkkci
	XYEOc1/oV+NCUH1rbreW7BZ9eKWE15EBwzCBDVr6hmaqg5fCQtlR56h9RxcgfupXWBZ4cQxTZdS7G
	CsZ+ewWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9xN-000000086zd-2oXh;
	Thu, 18 Dec 2025 09:05:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9xG-000000086yo-0TMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766048748; x=1797584748;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZSfKuyhknbDckhEuDJksiGTYSdFPIDWNu7knsS8JTrw=;
  b=VKv/JGEysDcNWUsRs2mGAjLQ+68AT+2RQjavqcXK9xuZUumChbzn5+t1
   Z6BmKvAj4oUnS7PjJTVQRl+6Y8GCW2PHIcxQXwDwCxkJiTMJY9quC23Yz
   6hg2WvlmY0YlZUdJ5Fv0dBymxv2ayUQonreiOKV1Q6WCEGxY2j77DLrA3
   KLCtbiqCm/7zv9+BtYIlPJk0OEpQZtOpoxQEKsxAplI2Cr7kjr4Nj/Ewp
   NgpM626pFT2IguLaRYqHb8RT+ofRjb5NFnQHKZShKlXOknekgIfOZP3Rx
   iBewNe2nwaDlzZWJz0lfgnCEO1i81bXFKgc46T397yECpZaKluidSxRmY
   A==;
X-CSE-ConnectionGUID: 6Eh0cHflS2uiAW2+IC6f/A==
X-CSE-MsgGUID: KOwhJPFpTp2RUlyqCRGyKQ==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="50039434"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2025 02:05:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Dec 2025 02:05:17 -0700
Received: from [10.171.248.75] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 02:05:12 -0700
Message-ID: <c60323c4-a938-4ceb-b0f4-82166ebfb2ad@microchip.com>
Date: Thu, 18 Dec 2025 10:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: atmel,hlcdc: Add sama7d65
 compatible string
To: Manikandan Muralidharan <manikandan.m@microchip.com>, <lee@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<dharma.b@microchip.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251218040521.463937-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010550_412524_F7CF8138 
X-CRM114-Status: GOOD (  10.68  )
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

On 18/12/2025 at 05:05, Manikandan Muralidharan wrote:
> Add LCD compatible string for sama7d65.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>   Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> index 4aa36903e755..dfee8707bac2 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> @@ -25,6 +25,7 @@ properties:
>         - atmel,sama5d4-hlcdc
>         - microchip,sam9x60-hlcdc
>         - microchip,sam9x75-xlcdc
> +      - microchip,sama7d65-xlcdc
>   
>     reg:
>       maxItems: 1
> 
> base-commit: e8c28e16c3ebd142938aee296032c6b802a5a1d4


