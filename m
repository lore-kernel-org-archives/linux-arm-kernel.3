Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2BBE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIOHRxQZmCdkDN0AlUxYT7UUjwaAG8Q9P0eN6chuUKY=; b=S07N5r7MaSkYSup6PsArDy/gUg
	MifcQ0FERztpu+hvHnAK+7tPS9yvwZr2GZBbbfOJK1CcI6g1LHYxWaz7Wz7wlxawHHmYnNKIfFCyl
	EkJRCuB+UMObWHGnXKyy1+Z8+G93m1almWHM7a+GY+HEwrE94eoRBchktk9+c1T65Ngl6t2pZ7n12
	P6nmAkG03go0fEd/4FQqTJx7tSd2Rvk0hZe+rqQVrq4XY+bmHxJNB1o09+WbfWOdnlCNO9Lw1Wnig
	V0YhoFGnrFIUREMTnWIshCwBphY/CpmHTpaPqCqgWcJpLr44cMdLC1LG/59cmAH/98KGIhBo8Yhmd
	I6h8rDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKrO-00000002g1Y-3VFg;
	Thu, 19 Dec 2024 18:02:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKeJ-00000002chu-2qi5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:49:24 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKe9-00033q-Bt; Thu, 19 Dec 2024 18:49:13 +0100
Message-ID: <ab896c6a-49a2-4eda-bee3-c429fe8cef1b@pengutronix.de>
Date: Thu, 19 Dec 2024 18:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] arm64: dts: imx8mp-skov: fix phy-mode
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-9-38bf80dc22df@pengutronix.de>
 <Z2RbwCt2zX2GyK8O@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RbwCt2zX2GyK8O@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_094923_718002_798E07CD 
X-CRM114-Status: GOOD (  20.14  )
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

On 19.12.24 18:45, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:33AM +0100, Ahmad Fatoum wrote:
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> Use rgmii-rxid instead of rgmii-txid. It should have no effect here,
>> but rxid is the correct value in our case.
> 
> Use rgmii-rxid instead of rgmii-txid because ...

I consider it useful information to note that it should introduce no
functional change.

Thanks,
Ahmad

> 
> Frank
> 
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> index 80d212acc0c3..a683f46fcbab 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> @@ -215,7 +215,7 @@ adc: adc@0 {
>>  &eqos {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_eqos>;
>> -	phy-mode = "rgmii-txid";
>> +	phy-mode = "rgmii-rxid";
>>  	status = "okay";
>>
>>  	fixed-link {
>>
>> --
>> 2.39.5
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

