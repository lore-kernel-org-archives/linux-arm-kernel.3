Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE86CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48dMyjQ55OBL9t3gch6Exy+GQ5bsHT83sSrbN3jJOoA=; b=fcYCWnbjo/yhwpHFSprNB1N8OC
	JN+lTWXY0zCJiYCv6zBSre02whamoHAiDLN8307Fw0bxZV63COTZdU7P7GsO6d5Q2rFLDWtEspRoF
	5eGv2eNtRA5bhTZDphbskOfONEm8w2jODqQfsxBsA+DgBPeuGd01otd3A3zaopmKd5mxRyMlzSy44
	tejqaWNxRyge9NTRjhGTqWsVtcUyE8oUTT4JH4yUf0DhoAwQDaW53qMuhNwSIaE1PVg1QZLtX2PPz
	FzRfx10HRVg7pEZrxVhmun04jzq7X2T5BQXK1yor5QlMFQl5B+L6zT3RjxpSSIgcFqlV9NeBmNagh
	DKBzbHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXm5q-0000000A3Lt-34iG;
	Thu, 11 Jun 2026 20:33:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXm5p-0000000A3Ln-2gB8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=48dMyjQ55OBL9t3gch6Exy+GQ5bsHT83sSrbN3jJOoA=; b=OzDDv2X5z4gd3vHGIbe1udkU1C
	Lk3Gep1tKzneCbGMbgetlgFI4gcu4xAEW7K9oJFlOpMa3EUvERBhCQ+3WLxnMoTWUO6wj3/+HBuOJ
	+lgKX+6KWsQIqcN3cZQZqiVglxlkiBOTtQrz8eo01tSIrrB/CDHh+gznZqglHKegkJdUhzt34eYkn
	OC9h8xwr+YkH2NYxaSvCfl1RsHEhhgElUwfXmXuGfypdPwtnTgb22OC9iv5CDAAbe+/vwo6EkWhYP
	1Mpfc5eBTRwaE+xlza1tFJxlxd6+/JNtKE91mc7gVo70Jvmz4HrlHPrtJ5hHSh9h7mA8w63tRDfuq
	p1NqyBfw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXm5k-00000005f3d-3uOY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:33:35 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXm5Y-0004Tb-Hd; Thu, 11 Jun 2026 22:33:20 +0200
Message-ID: <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
Date: Thu, 11 Jun 2026 22:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
 <20260611204341.147f1afb@pumpkin>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20260611204341.147f1afb@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_213333_548395_B03EC3B1 
X-CRM114-Status: GOOD (  24.64  )
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

Hi David,

On 6/11/26 21:43, David Laight wrote:
> On Thu, 11 Jun 2026 20:12:32 +0200
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
>> instead of explicitly specifying a baud rate.
>>
>> This would mean the default of 9600 is used, but it goes unnoticed when
>> booting normally as barebox fixes up a console= line that includes a
>> baud rate.
>>
>> When EFI booting GRUB however, GRUB will not pass along the console=
>> line and thus the board ends up with a 9600 baud Linux console,
>> confusing users.
> 
> Is it possible to determine the current baud rate (by reading the hardware
> register) and default to that value.
> Then if grub has initialised the uart the kernel will use the same
> baud rate.

I think so, yes. In addition to the register divider configuration, one
would need the input clock rate as well, but that's not a problem.

Do you know if any drivers already do this?

Nevertheless, I would like the LXA device trees changed, even if only
to align them with all other existing STM32 device trees.

Cheers,
Ahmad


> 
> 	David
> 
>>
>> This series fixes this. As the device trees were added at different
>> times, they are fixed each in a separate commit with its own Fixes: tag.
>>
>> ---
>> Ahmad Fatoum (3):
>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
>>
>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>> ---
>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
>>
>> Best regards,
>> --  
>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>
>>
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

