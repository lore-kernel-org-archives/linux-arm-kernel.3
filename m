Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2DDE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipDDNMkukKlEYrehBDoXLTzZWlrd4kc96or45NAs9GA=; b=w+IdqBmrS2OP58K1XOpAZ0NYo2
	t2I5oqlj4vOp8oHUB8JjU9hp5vvUsyHS1/dVO6y8RaIoM7zqn4XWS8mlgZyVCV2s8WpveUPva02aG
	p305YAT9KW2ixqvvA0qM+4vqvoBivqXwsaBxPpZIUeyTOHtpqw5t334l+ds0Fap4uBrUxED16BAFh
	dJJ9/9OEuwHoFHT7Uv69r3e67zMbVboWDd2kJ4Wn8+AEBGQrDMg8gx6Z7BEtgc5tudPcV/iayhJYc
	O2zwmIWtrOBqLq4JWEInnXMdfZulmgOSp9vk1UzNRqCLf6REpdjXqHilUoSTaK4j4Qe3HSFVxhQw+
	xM5WdZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM45-00000002pe6-0ywl;
	Thu, 19 Dec 2024 19:20:05 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM2w-00000002pKn-45qL;
	Thu, 19 Dec 2024 19:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1734635921; bh=ePqid386Kw0s0U8dD6CHm5o3ERJZxHjExxMl2I2S+uA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lIogWcGIG+pjsUbAY/EcEX04nRe7jtAwZzi3OC/A1F2Wj+Q19sLhjWnrlkrI6Heam
	 vQ3XfW9KX1BBO5NK1YSVWgaXH2yhnItbEJYkXyWhysjMJmK05XfnQS7Lq19lkrQDSd
	 tbF0Pww4MUh8j8Uq41rfLboOrm7nHybzPJH6EC9wsCfk0svST3lfzzyWuwIdEvFHvI
	 8bz1L9ulYOLVntgDYqEGheJAegSW9TevRU4dJaQFrGEhhDsKqp4cd9jjVViEHtBvgp
	 1Cb+Gdq84z4kRPdbzh3uZoCB1UOeofBRfR47C7jPys+0f+6NOol1q2Z4qS839cy1yH
	 uzL8/wivb5tGjU1IajBpLZmpMLwPVaWXZmw7U20KW4HtGdAZvyl15Xu8Fl1GJ6Obb6
	 4O1cAHukrEq82a6TkzVsl7rKRNCYnPeOVzVwOSYRTkpWK87s5GXqjEoT2ttdhMaSei
	 ndv3zU5EllCcLxaMtxgvn8P5hQqCdJ3nHixwAh8VJshJQTNj1wi3x10UnZL1+MaEvA
	 tanO3naAd8tvzPQRyA6DypW8zcjud5R+h2nlC7nBouKxHYITKgUAjjs41x8rEWbkRV
	 vXKL9DneRi9aHD9wm1FqCgVlqFpIzAyOeT8orELDRVz6BdttjIxzQ3+gAxE2WY3DFZ
	 EMPaJ1YoWkHWB9MgcfbTP8HM=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 899FD18010B;
	Thu, 19 Dec 2024 20:18:40 +0100 (CET)
Message-ID: <5d1ddf7e-2df5-4563-81e5-e0cfa7ef58da@ijzerbout.nl>
Date: Thu, 19 Dec 2024 20:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/9] mfd: add base driver for qnap-mcu devices
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org, jikos@kernel.org,
 jic23@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jdelvare@suse.com, linux@roeck-us.net, srinivas.pandruvada@linux.intel.com,
 bentiss@kernel.org, dmitry.torokhov@gmail.com, pavel@ucw.cz,
 ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20241107114712.538976-1-heiko@sntech.de>
 <20241107114712.538976-5-heiko@sntech.de>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241107114712.538976-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_111855_155756_CD7F94CA 
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

Op 07-11-2024 om 12:47 schreef Heiko Stuebner:
> These microcontroller units are used in network-attached-storage devices
> made by QNAP and provide additional functionality to the system.
>
> This adds the base driver that implements the serial protocol via
> serdev and additionally hooks into the poweroff handlers to turn
> off the parts of the system not supplied by the general PMIC.
>
> Turning off (at least the TSx33 devices using Rockchip SoCs) consists of
> two separate actions. Turning off the MCU alone does not turn off the main
> SoC and turning off only the SoC/PMIC does not turn off the hard-drives.
> Also if the MCU is not turned off, the system also won't start again until
> it is unplugged from power.
>
> So on shutdown the MCU needs to be turned off separately before the
> main PMIC.
>
> The protocol spoken by the MCU is sadly not documented, but was
> obtained by listening to the chatter on the serial port, as thankfully
> the "hal_app" program from QNAPs firmware allows triggering all/most
> MCU actions from the command line.
>
> The implementation of how to talk to the serial device got some
> inspiration from the rave-sp servdev driver.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   MAINTAINERS                  |   6 +
>   drivers/mfd/Kconfig          |  13 ++
>   drivers/mfd/Makefile         |   2 +
>   drivers/mfd/qnap-mcu.c       | 338 +++++++++++++++++++++++++++++++++++
>   include/linux/mfd/qnap-mcu.h |  26 +++
>   5 files changed, 385 insertions(+)
>   create mode 100644 drivers/mfd/qnap-mcu.c
>   create mode 100644 include/linux/mfd/qnap-mcu.h
>
> [...]
> diff --git a/drivers/mfd/qnap-mcu.c b/drivers/mfd/qnap-mcu.c
> new file mode 100644
> index 000000000000..4be39d8b2905
> --- /dev/null
> +++ b/drivers/mfd/qnap-mcu.c
> [...]
> +int qnap_mcu_exec(struct qnap_mcu *mcu,
> +		  const u8 *cmd_data, size_t cmd_data_size,
> +		  u8 *reply_data, size_t reply_data_size)
> +{
> +	unsigned char rx[QNAP_MCU_RX_BUFFER_SIZE];
> +	size_t length = reply_data_size + QNAP_MCU_CHECKSUM_SIZE;
> +	struct qnap_mcu_reply *reply = &mcu->reply;
> +	int ret = 0;
> +
> +	if (length > sizeof(rx)) {
> +		dev_err(&mcu->serdev->dev, "expected data too big for receive buffer");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&mcu->bus_lock);
> +
> +	reply->data = rx,
> +	reply->length = length,
> +	reply->received = 0,
> +	reinit_completion(&reply->done);
> +
> +	qnap_mcu_write(mcu, cmd_data, cmd_data_size);
> +
> +	serdev_device_wait_until_sent(mcu->serdev, msecs_to_jiffies(QNAP_MCU_TIMEOUT_MS));
> +
> +	if (!wait_for_completion_timeout(&reply->done, msecs_to_jiffies(QNAP_MCU_TIMEOUT_MS))) {
> +		dev_err(&mcu->serdev->dev, "Command timeout\n");
> +		ret = -ETIMEDOUT;
> +	} else {
> +		u8 crc = qnap_mcu_csum(rx, reply_data_size);
Here `rx` is still not initialized.
> +
> +		if (crc != rx[reply_data_size]) {
> +			dev_err(&mcu->serdev->dev,
> +				"Invalid Checksum received\n");
> +			ret = -EIO;
> +		} else {
> +			memcpy(reply_data, rx, reply_data_size);
> +		}
> +	}
> +
> +	mutex_unlock(&mcu->bus_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qnap_mcu_exec);
>

