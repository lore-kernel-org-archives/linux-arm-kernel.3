Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09553D6ACCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCchfRPnPvdIlAUJpnCmh5JGYcjVKwhRqKye5WpW+lk=; b=cDGPzirdoaruxS7W/vo9FkcHJ+
	N72gjA2iKAZZfbGs4UWPZFDNuH6cLXQ5k7OnDEGiQk24Vc897d2r3nSLI/M+FS9eAmIdJZWagHKmy
	rZjlSVt24WAAUjiPJsdJzcokgP3Bw0ivU1CwE4hzDC7O6tWRiw2yYS0d1CEgiHTB155MIBa1GNizG
	2pn7bo5wOct4Ksbkb7b0Eu7t8NcHQaObXsCfMNM13g9rgvMu1R4f/O8y9ZQRN00xdGeE3/hvEv1gG
	3OgDYtFKoHIYgWqNeSMFXEGXml8FxOuzK+oMBWf3tgbNxJZV0D6Vfa678yu6xQliOJzzGlub566Lk
	rsQzeldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9xk-0000000872K-49oD;
	Thu, 18 Dec 2025 09:06:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9xc-0000000871g-3jyq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766048773; x=1797584773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XX7b7q9Edhc0k6MzMJrFi4FJw/WKh29AyKl9J8y+gVc=;
  b=Ls3zpWDIKGG3GsHOxOYG1al/kofAhda6JYzjeW5VAEVT+DiZJlvjJuiM
   YDioPoFdg4CRBv7ZDgP94L/5PvSb2SFls2AeD0pSaMV2fLcH/zbPo/gY+
   820ieDwAF6utuYtRuiPIC3WaSml/MbhlWEZXJNgfz9lCxn92HW8VyNso3
   Z5V3iuRM/zP7p2pvlHFYDJlAZTXzZwSpTAQYFXvE0iOTQXveXINPnILVe
   BeCIX+xPUmSzC8JlTwFAHb0GwL1yXtkLKoY3Vj5tcGTaP6PUJT978lqtS
   PE8N5ScqvXHcEnOFFDuAfPl9Ldws/E+UmQuttTq+4dCJ5GaV5aOPl3XZX
   A==;
X-CSE-ConnectionGUID: Ve+L4/dBQ2anPaGCYtCixQ==
X-CSE-MsgGUID: Vc5HPdrpQn2pxdPLCq9osw==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="282091071"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:06:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 02:05:29 -0700
Received: from [10.171.248.75] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 02:05:24 -0700
Message-ID: <66b2bbd4-a758-4a20-981f-07fcdb116412@microchip.com>
Date: Thu, 18 Dec 2025 10:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mfd: atmel-hlcdc: Add compatible for sama7d65 XLCD
 controller
To: Manikandan Muralidharan <manikandan.m@microchip.com>, <lee@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<dharma.b@microchip.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
 <20251218040521.463937-2-manikandan.m@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251218040521.463937-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010612_939252_387DB12C 
X-CRM114-Status: GOOD (  14.09  )
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
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add compatible for sama7d65 XLCD controller.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
> changes in v2:
> - isolate this change into a dedicated patch
> ---
>   drivers/mfd/atmel-hlcdc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 4c4e35d404f3..c3f3d39bf584 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -140,6 +140,7 @@ static const struct of_device_id atmel_hlcdc_match[] = {
>   	{ .compatible = "atmel,sama5d4-hlcdc" },
>   	{ .compatible = "microchip,sam9x60-hlcdc" },
>   	{ .compatible = "microchip,sam9x75-xlcdc" },
> +	{ .compatible = "microchip,sama7d65-xlcdc" },
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, atmel_hlcdc_match);


