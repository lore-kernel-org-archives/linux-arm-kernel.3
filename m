Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE77C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eku5ycW01SB1Bip77Yrqf5L2fvTCHkyIrDvdKL8Djik=; b=4IafLOdpKu20I2SAm6OefxNYBC
	GCIH7lTdMUVaS3FNmAgkDFDBmrtVU4kizsDXJL5OMnIFO84KkrboL6EOZY1xOtF9cSSOOXH2vBTib
	XBfSjFh2Xgti9NkWaAAv3qQLMHLAbq9J1mxxjD/+OJxs9SG5IZsM0WmKEcwQqL87yv4MRfeW9qLso
	wsUHay/Ln5lg6o89/MpJMGWz+NYmrWwn9+gL0fFIUjyJMbkr9u2QDUypo04R6ktc38cJdC/jv+LCe
	E1uGydW+Zgc3a9MBU/nvbsqaWNPzJVkDY0vb68gB7zgmJW4iy7XUZo5tRivsqQlkgDrm4TUb4Mvpq
	VNKZE7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39fw-0000000D08v-42qP;
	Fri, 11 Apr 2025 08:23:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39e7-0000000CzzW-3xHc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:21:57 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u39dm-0007rF-5N; Fri, 11 Apr 2025 10:21:34 +0200
Message-ID: <f11dd5bc-1753-4685-8385-397ab9c28475@pengutronix.de>
Date: Fri, 11 Apr 2025 10:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 USB support
To: Frank Li <Frank.li@nxp.com>, Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-12-primoz.fiser@norik.com>
 <Z/fi2W9UdFkwKpSa@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z/fi2W9UdFkwKpSa@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_012155_981428_5751CD0E 
X-CRM114-Status: GOOD (  17.63  )
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

On 10.04.25 17:25, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:49AM +0200, Primoz Fiser wrote:
>> Add support for both USB controllers. Set first controller in OTG mode
>> (USB micro-AB connector X8) and the second one in host mode (USB type A
>> connector X7) by default. Note, the second controller is not OTG capable
>> due to HW design choice.
> 
> I think note is reduntant. USB type A connector means host only.

It's not uncommon for flashing to happen via a USB-A to USB-A cable, even
if it's against the spec. I'd say the note is useful.

Thanks,
Ahmad

> Frank
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 027a34dbaf04..faad3c3e627c 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -82,6 +82,19 @@ &lpuart1 {
>>  	status = "okay";
>>  };
>>
>> +/* USB  */
>> +&usbotg1 {
>> +	disable-over-current;
>> +	dr_mode = "otg";
>> +	status = "okay";
>> +};
>> +
>> +&usbotg2 {
>> +	disable-over-current;
>> +	dr_mode = "host";
>> +	status = "okay";
>> +};
>> +
>>  /* SD-Card */
>>  &usdhc2 {
>>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>> --
>> 2.34.1
>>
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

