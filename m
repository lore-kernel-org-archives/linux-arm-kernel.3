Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37B8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AWb7YLeJe5+C/4F1Bk4jemXtsfusURUHJDogWVy5cU=; b=SeVUJ08mGJxWrh1OyjeURfP9mF
	KnBqhuCbSHrWuaMAHIeL1QJPRrBwtsJjvrHOQBuwghTeeG0my/oov6EF6zu6ngcN+s5tLEmNvd+hk
	8jq/kupy3re3KBwj8a6ffY0RQuqYnglN5jKtnro1neGCrDWNPN9g5XadrwawU9xNGE+CyXp1bt5CG
	UmLNixCv5SOKM3yUl3eBtMXQYKJ5R1CTb8kZr6+00I2oNaBS8PaWDUvgaYMxsDvvoqXPZccYezLLF
	zzJmzUWhTVIweGnvstZakXqe223jLZD2D6tot42/Zg5X9hx5Y6WVSf6TdlU4ulHJJCUaFHJQarH8X
	8L/koZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLj45-00000000TIZ-2Alt;
	Thu, 12 Dec 2024 13:17:13 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLj31-00000000TCS-0ln1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1734009358; x=1734614158; i=wahrenst@gmx.net;
	bh=1AWb7YLeJe5+C/4F1Bk4jemXtsfusURUHJDogWVy5cU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kBS3yBrlYJj08rh7AkGJ/ioOALsWlOaYysVNsPNSmQkeRWbN33CtpLseRdr+MDfT
	 jkD76hXb3QbPg6ft0vFh75GSZH0LCx/1CBRuzFeiEKXWSHst5ka7RGRE0LtyfUtFh
	 43qYUF1G2pfHbvAPlu5IRnSrPRH+zKFjtnbYc35/nZmMHwhyezN284YWE4tx+JnwG
	 DDGGG3dCjeIHxmE1euGE/SZzhOfiytO9JdAn/dWfpcTemrE8DG6BG4dfhFmZu7FR8
	 jvxz48sKYGNKET/5Pn7x+OLv/BgawrJige6ypuKfUyaSG7temFQhSZ/1RJcdtTSC2
	 /Dn1kzP2fHN4PdOnzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHAB-1tnw7p1ajj-00hclI; Thu, 12
 Dec 2024 14:15:58 +0100
Message-ID: <d02a7143-43e7-4851-a06e-d57981362a5a@gmx.net>
Date: Thu, 12 Dec 2024 14:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Raspberry Pi 3B: Failed to create device link with
 soc:firmware:gpio
To: Martin Wetterwald <martin@wetterwald.eu>, f.fainelli@gmail.com,
 saravanak@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <CAFERDQ2hLHek+0ViVqbqgOD+4xwC2ZwK1KhgGdLP_zGnonEs4w@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <CAFERDQ2hLHek+0ViVqbqgOD+4xwC2ZwK1KhgGdLP_zGnonEs4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:SP1Et2MOblk8TWQMSD5J6XKWLkdBzveND32HfW+gdPeEMDev4DF
 1OHG1yp5hGHbz7YuEqAtGXn0VPZEcux59MKzMzuRRMsSEVdndKmw2f4N0QM66bAEcNhwn0g
 PJiLaWhJUedm+wh5eUTTJwwackSPmv/nuyv2OlsRoSs/MP6V6c8qSEQ8EU9Rh3Riu7GgV+3
 K4PG/iWaOHUu/hqG4m02A==
UI-OutboundReport: notjunk:1;M01:P0:BmGY9g3x1kg=;NoYWneLQh28GXLFVeNexOhoZLeF
 Jp7X4menD4QDunRo9+6q2IMJAKmp/PQlN6QrYno1Ne07G7jquwyY7t4hSr20Aol5IC57OEzP2
 AB1vBWugLz0d5OAetaSz+RYdm+fMQnP8KVscVvllQYZowpk0cGvBetLoBxcYy2bkZtTXCMSsP
 ctme+W5Y3K99xdAOlygFyDHzPWrDwAdmJPo0CcCbqLlTv667tyA/X0Gy+IKUUEQnxk94/ZiS3
 PASChrSPZM0cPWZNP6lMqezYiQNwOD6y8umA214TVFQh52nfO0fKUkGLP6oqf357m946urznS
 wMMBCHGyHR8UIXPrZ9rfqazTx22I0h9QrM4xhryBzzC/WIxMm5Q1Uwi99BS9RAzpQDjcE3leB
 vnQugJDL+/cT9yRojyDpWfooUV4jQmB4mTxiaRKZzr3TC1VimDsKhhdFiiNaRHNpuGYONqa21
 VJoTBhGCqzKXoOat857Um/gSAi+pnm+72C4eS1s8F18zKH5NhncBITkaeR4asetB7HboPrgEM
 VhvY+2QJp3yh4H2qLl+C3PmO+sp45C3+L3APboUKYs+JCrHKwKJSfHyCDiGk4PCqgyTBGV5lq
 RczfQRRt6GAcaxXQaepFuZIyNG6tkx7Glo3TQRkf5rnG5lzImjyVTaKSA6YfpliUwZYVo/saX
 0RalAU3JcYSVQma/zc6OCXXuP7znrvYqo6XOXAg3rYccZwVrJ50CS/0B80E4pJgfX5sGp0Mco
 VgcMTDU9cprxj12cEgcT072yOONGdrc4K8ZUExZKf+6v7a/fEFUiXOHflYcadQZEXbZaPm/Ml
 eqGieJDvr+EBdrLDcbN2MW4dlOxpkmdWuJ8BzDSO2PW7j0n7A7beRuLPcS6CWZv1YTn97xt14
 aS/4S0wFWU3RmJlM2E5VDY9zGn4LBcOcKEbe8ak//9+UPHvmCXV85SEVoQK9ZIwO/I78+ulim
 KMtqX6YXzW6syF0iAFzxxQapNuBLLlX+lUKlio4T6qCpJm133MPfqPoCPkU8JxsijBO5EIgBe
 ZUZyk9FN+dlZz+aAkIeTqyh1zhtW8J3dM6FWXEalaQxrDXb7VEyMsJboEsjCsqYCy3wP/pWuj
 ngPQqrmzwg8IgdvPdH/0aqFQwBhl70jipmUES8wirwwDUxSEQodx+dB4zoLIvd4JR25LAau/g
 =
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_051607_518716_2D217DCD 
X-CRM114-Status: GOOD (  20.51  )
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

Am 12.12.24 um 11:13 schrieb Martin Wetterwald:
> Hello Saravana and Florian,
>
> Back in 2023, you discussed about an issue concerning the Raspberry Pi 4, that
> you fixed in commit 1a5ecc73b2bfeffe036212d4a6bfacee053ab0a1:
> https://lore.kernel.org/lkml/03b70a8a-0591-f28b-a567-9d2f736f17e5@gmail.com/
> https://lore.kernel.org/all/20230302023509.319903-1-saravanak@google.com/
>
> Today, I notice I see the same issue, but it's with the Raspberry Pi 3B (V1.2).
> I'm using the upstream kernel 6.12.3, with the upstream DTB.
>
> You can find my kernel miniconfig (basis being allnoconfig) here:
> https://gist.github.com/mwetterw/299bb1317fccf9e68125cb0f5da7384c
What happens if you replace your custom config with arm64/defconfig?
Does the issue still occurs?
>
> During boot, I see following messages:
>> Bluetooth: HCI UART driver ver 2.3
>> Bluetooth: HCI UART protocol H4 registered
>> Bluetooth: HCI UART protocol Broadcom registered
>> bcm2835-mbox 3f00b880.mailbox: mailbox enabled
>> 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq = 99, base_baud = 0) is a PL011 rev2
>> raspberrypi-firmware soc:firmware: Attached to firmware from 2024-09-13T16:00:14
>> uart-pl011 3f201000.serial: Failed to create device link (0x180) with soc:firmware:gpio
> Here is an extract of the relevant FDT nodes.
> Because my setup involves first the proprietary GPU firmware, then the U-Boot
> bootloader before finally launching the kernel, I used following command in
> order to make sure I see the same FDT as Linux:
>
>> ssh rpi 'cat /sys/firmware/fdt' | fdtdump -
>> firmware {
>>      compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
>>      mboxes = <0x0000001b>;
>>      phandle = <0x0000001c>;
>>      clocks {
>>          compatible = "raspberrypi,firmware-clocks";
>>          #clock-cells = <0x00000001>;
>>          phandle = <0x00000015>;
>>      };
>>      gpio {
>>          compatible = "raspberrypi,firmware-gpio";
>>          gpio-controller;
>>          #gpio-cells = <0x00000002>;
>>          gpio-line-names = "BT_ON", "WL_ON", "STATUS_LED", "LAN_RUN", "HDMI_HPD_N", "CAM_GPIO0", "CAM_GPIO1", "PWR_LOW_N";
>>          status = "okay";
>>          phandle = <0x0000000a>;
>>      };
>> };
>> serial@7e201000 {
>>      compatible = "arm,pl011", "arm,primecell";
>>      reg = <0x7e201000 0x00000200>;
>>      interrupts = <0x00000002 0x00000019>;
>>      clocks = <0x00000007 0x00000013 0x00000007 0x00000014>;
>>      clock-names = "uartclk", "apb_pclk";
>>      arm,primecell-periphid = <0x00241011>;
>>      status = "okay";
>>      pinctrl-names = "default";
>>      pinctrl-0 = <0x00000008 0x00000009>;
>>      phandle = <0x00000048>;
>>      bluetooth {
>>          compatible = "brcm,bcm43438-bt";
>>          max-speed = <0x001e8480>;
>>          shutdown-gpios = <0x0000000a 0x00000000 0x00000000>;
>>          phandle = <0x00000049>;
>>      };
>> };
> If I understand correctly, the serial dev bus, together with
> CONFIG_BT_HCI_UART, CONFIG_BT_HCI_UART_BCM, and if associated to the correct
> DTB nodes describing the bluetooth chip, should allow the kernel to handle the
> serial Bluetooth HCI himself, without the userspace needing to launch user
> space tools like hciattach or btattach?
>
> Is the log
>
>> uart-pl011 3f201000.serial: Failed to create device link (0x180) with soc:firmware:gpio
> a hint to the reason why the kernel doesn't automatically handle my Bluetooth
> HCI over serial?
>
> How to solve this log error, and how to let the kernel handle the HCI himself?
> Am I missing kernel configuration flags?
>
> Thanks!
> Martin
>


