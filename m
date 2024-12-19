Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F28AE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlbH6NtXHwCWMrgggpxipuZ4nNMG3+h4OoWM7LUucZY=; b=IMSwa5+FJ9BUBb6fuJhRZ3U0F1
	PCxoMWwK0Z498AOUJZ7650KYk7tsvRNCBETXIh2e9/4dTYy271FHLrzXQluxbEy3NaSPl69SAUWfj
	RBAdKQWcbDByLEDKpYa5g2/sMK2VJxURY7xpMGCQV6cTqyG636/UlngDlblILRecrgDwHRdLIzI20
	8oBczeUop7+6wdAUSaZ6Mvppvl/eosMpAndSYxAhZq1mdrbTEB7AwKTupN1KKCk8EJdRLbG37EuB4
	4aJnGhqRUNeaat4yOBfCPSy+jK5PcK1yyR5gO7l0cnfFcvSq72XC3b2wiZXZxMWlZgr+KZZqztZYP
	kpe924sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKqK-00000002fox-0ZPq;
	Thu, 19 Dec 2024 18:01:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKcl-00000002cSr-4A9H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:47:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKcb-0002fS-4M; Thu, 19 Dec 2024 18:47:37 +0100
Message-ID: <1ced1da5-ae70-4dba-a5cc-e1e05d67b2f3@pengutronix.de>
Date: Thu, 19 Dec 2024 18:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: dts: imx8mp-skov: configure uart1 for RS485
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-7-38bf80dc22df@pengutronix.de>
 <Z2RbINlmO9UL+MPH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RbINlmO9UL+MPH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_094748_030626_C8086634 
X-CRM114-Status: GOOD (  19.01  )
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

On 19.12.24 18:42, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:31AM +0100, Ahmad Fatoum wrote:
>> uart1 TX, RX and RTS signals go off the base board and to a RS485
>> transceiver. Describe this in the device tree.
> 
> Look like it is not related what your did in this patch.
> 
> Add uart-has-rtscts in uart1 to ... (because ....)

because they go off to the base board to a RS485 transceiver?

>> +	/*
>> +	 * While there is no CTS line, the property "uart-has-rtscts" is still
>> +	 * the right thing to do to enable the UART to do RS485. In RS485-Mode
>> +	 * CTS isn't used anyhow and there is no dedicated property
>> +	 * "uart-has-rts-but-no-cts".
>> +	 */
>> +	uart-has-rtscts;
>>  };
>>
>>  &uart2 {
>> @@ -618,6 +625,8 @@ pinctrl_uart1: uart1grp {
>>  			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX			0x140
>>  			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX			0x140
>>  			MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS			0x140
>> +			/* CTS pin is not connected, but needed as workaround */
> 
> what' means here! what's problem to be workaround?

See the more descriptive comment above. We don't actually have CTS connected in hardware,
but we mux it anyway, so the i.MX UART is cleared to send always.

Thanks,
Ahmad

> 
>> +			MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS			0x140
>>  		>;
>>  	};
>>
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

