Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE72C9EC7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6uH84HDnFSrdVdJ26m+FtXVNrVdhC0apU6MQYr/8k0=; b=JQ7R4IotKX5B64QsQQPodLD5tc
	YWWApLKCiHsU1y/U1o3fcMtTzHvUT0VXtKIfDLzEliSybGj9odj3cnh5yOvBJKg/Yj5MDPsU7sVIa
	0Aq3VG/+OvZGgTBHR1im4FcbdP1XsDM9h/NvDU9wfGYnhkEQSJYfEqBQpKELzMbSZSzoTWveiCKBL
	CXByVcrVAPgQp6MjDn0FhegOcLwAzcUAQbptQGho5XwUiycP5IGtg5AnicCvogfZ1b0719WWGKlf5
	+Bq2Rke8xv0DCRr0jxQQTdg3Axqoc2PoboLC0flhC80gC2y2CHQzLH5U1NAKstvFKkPNqHAztJnbW
	ckqok0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfH2r-00000005KVN-1GAB;
	Mon, 12 Jan 2026 12:29:17 +0000
Received: from mail-m1973172.qiye.163.com ([220.197.31.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfH2o-00000005KUk-0yZD;
	Mon, 12 Jan 2026 12:29:16 +0000
Received: from [172.16.12.163] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3056e6249;
	Mon, 12 Jan 2026 20:29:08 +0800 (GMT+08:00)
Message-ID: <1242f7d2-e68c-42ca-a6cc-c56c9e6a496f@rock-chips.com>
Date: Mon, 12 Jan 2026 20:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mfd: rk8xx: Add RK801 support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260112102849.1479-1-chenjh@rock-chips.com>
 <20260112102849.1479-3-chenjh@rock-chips.com> <1980810.GKX7oQKdZx@diego>
From: Joseph Chen <chenjh@rock-chips.com>
In-Reply-To: <1980810.GKX7oQKdZx@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bb22e76c809d2kunm32fd54ab8197
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5LTlYeTklNSx0eS00YH0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VMJnJOxi5ZK4YIQf0Wessd6Nw6/dgGbl5DWcy01gmN7UhPbFw3DOb9Jl5ySJQb+cgIicXAIIzNQKyxC3sawz8pXBuqvYmkkgJbxBq4yvimsNj+L16B03Mg+R76CvOxeSQeJvuFnxmEBd2qTz4VAFXX7w8rTO7lAkL9/D5xwGMYY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=g6uH84HDnFSrdVdJ26m+FtXVNrVdhC0apU6MQYr/8k0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_042914_897337_3C056389 
X-CRM114-Status: GOOD (  18.80  )
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


在 2026/1/12 19:02, Heiko Stübner 写道:
> Hi Joseph,
>
> Am Montag, 12. Januar 2026, 11:28:48 Mitteleuropäische Normalzeit schrieb Joseph Chen:
>> The RK801 is a Power Management IC (PMIC) for multimedia
>> and handheld devices. It contains the following components:
>>
>> - 4 BUCK
>> - 2 LDO
>> - 1 SWITCH
>>
>> Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
>> ---
>>   drivers/mfd/Kconfig                 |    6 +-
>>   drivers/mfd/rk8xx-core.c            |   81 ++
>>   drivers/mfd/rk8xx-i2c.c             |   33 +-
>>   drivers/regulator/rk808-regulator.c | 1963 ---------------------------
>>   include/linux/mfd/rk808.h           |  118 ++
>>   5 files changed, 234 insertions(+), 1967 deletions(-)
>>   delete mode 100644 drivers/regulator/rk808-regulator.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6cec1858947..5405e8633aa 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1355,15 +1355,15 @@ config MFD_RK8XX
>>   	select MFD_CORE
>>   
>>   config MFD_RK8XX_I2C
>> -	tristate "Rockchip RK805/RK808/RK809/RK816/RK817/RK818 Power Management Chip"
>> +	tristate "Rockchip RK801/RK805/RK808/RK809/RK816/RK817/RK818 Power Management Chip"
> nit: I think at some point it'd be time to make that
> 	"Rockchip RX8xx Power Management Chips"
> The config entry is already named that way, and that list of individual
> supported chips gets way too long.
>
> Also the individual supported chips _are_ listed below, so the unwieldy
> entry headline can be shortened.

Thanks, agreed. Will fix in v3.

>>   	depends on I2C && OF
>>   	select MFD_CORE
>>   	select REGMAP_I2C
>>   	select REGMAP_IRQ
>>   	select MFD_RK8XX
>>   	help
>> -	  If you say yes here you get support for the RK805, RK808, RK809,
>> -	  RK816, RK817 and RK818 Power Management chips.
>> +	  If you say yes here you get support for the RK801, RK805, RK808,
>> +	  RK809, RK816, RK817 and RK818 Power Management chips.
>>   	  This driver provides common support for accessing the device
>>   	  through I2C interface. The device supports multiple sub-devices
>>   	  including interrupts, RTC, LDO & DCDC regulators, and onkey.
> [...]
>
>> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
>> deleted file mode 100644
>> index 1e814247965..00000000000
>> --- a/drivers/regulator/rk808-regulator.c
>> +++ /dev/null
> Looks like something did go wrong here, as you're removing the whole
> drivers/regulator/rk808-regulator.c file from the MFD patch.
>
>
> Thanks
> Heiko
>
>
>
Thanks for catching this. It was a silly mistake on my end during local
patch preparation.
I'll send a v3 shortly to fix this issue to avoid wasting reviewers' time.

-- 
Best regards,
Joseph Chen


