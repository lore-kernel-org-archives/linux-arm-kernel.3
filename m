Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C9D3A697
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn5lD9J3j5+AZdfAEJzAs1/dAWi+pE/NcRBAu2leaYo=; b=KeDniuZwhWC1h8qiTz5UiQjA74
	2vHr7AX5itbyv+NuE93yfpoCDiIl8uqemHX/LoYoFz+etyAq+OriisZGT+Nvf3mMWq7kPBHf9JrQL
	0uuh01kOaGbCf4hW8tnybA+pA/dxXZxCFI+3dDjKnkR4G3aDLx7H8QMxgSWqyp1JxLcEt+GA/YCol
	XoTbzuvAnTvTMCBenb2J6UfXEGw+2Glw8E3Lv/HQ8l8u+vB9g/LHXP9Kg1QxFOAJlJGiNM8nsr4Iu
	5An3fMkOdlLkCTSlBG+CGy5l+KlOvsza+HZ9lQnQMh2guB7aAs7KxmNJ7Pd4bTscr+SlTtcAqaa9H
	ZQPi9A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5skn-0000000Fl2f-0DsJ;
	Tue, 29 Oct 2024 20:23:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sjA-0000000FkuO-0HZU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:22:09 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPV6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1t5sis-0003Bv-TC; Tue, 29 Oct 2024 21:21:50 +0100
Message-ID: <7fad22ef-3403-46de-bd48-b551619fe237@pengutronix.de>
Date: Tue, 29 Oct 2024 21:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
To: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
 shawnguo@kernel.org
Cc: andreas@kemnade.info, kernel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
References: <20241029191640.379315-1-festevam@gmail.com>
 <20241029191640.379315-2-festevam@gmail.com>
 <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132208_130004_1EE4E615 
X-CRM114-Status: GOOD (  20.89  )
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

On 29.10.24 21:16, Marek Vasut wrote:
> On 10/29/24 8:16 PM, Fabio Estevam wrote:
>> From: Fabio Estevam <festevam@denx.de>
>>
>> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
>>
>> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
>>
>> This causes dt-schema warnings as the current binding only
>> allow 'fsl,imx6sx-lcdif' as fallback.
>>
>> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
>> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
>>
>> The imx6sx-lcdif programming model has more advanced features, such
>> as overlay plane and the CRC32 support than the imx28-lcdif IP.
>>
>> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
>> fsl,imx28-lcdif fallback:
>>
>> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
>>
>> This helps keeping DT compatibility as well as using the more advanced
>> lcdif features found on imx6sl and imx6sll.
>>
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>> ---
>> Changes since v2:
>> - Make the three compatible entres the only valid combination
>> for imx6sl and imx6sll (Andreas).
>>
>>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>> index ad0cca562463..72e509bc975b 100644
>> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>> @@ -23,14 +23,18 @@ properties:
>>             - fsl,imx93-lcdif
>>         - items:
>>             - enum:
>> -              - fsl,imx6sl-lcdif
>> -              - fsl,imx6sll-lcdif
>>                 - fsl,imx6ul-lcdif
>>                 - fsl,imx7d-lcdif
>>                 - fsl,imx8mm-lcdif
>>                 - fsl,imx8mn-lcdif
>>                 - fsl,imx8mq-lcdif
>>             - const: fsl,imx6sx-lcdif
>> +      - items:
>> +          - enum:
>> +              - fsl,imx6sl-lcdif
>> +              - fsl,imx6sll-lcdif
>> +          - const: fsl,imx6sx-lcdif
>> +          - const: fsl,imx28-lcdif
> Shouldn't this be
> 
> - enum:
>   - fsl,imx6sl-lcdif
>   - fsl,imx6sll-lcdif
>   - fsl,imx6sx-lcdif
> - const: fsl,imx28-lcdif
> 
> So you wouldn't have to write three compatible strings for the 6sl/sll , but only two ? I.e. this:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This would necessitate changing the Linux driver to match against the
fsl,imx6sl-lcdif & fsl,imx6sll-lcdif compatible as well, otherwise new features
like e.g. the overlay plane won't be available.

Cheers,
Ahmad

> 
> ?
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

