Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dFfzgLAT79EkKFqJT8YM5dhdAcxg2mTdjPzJjTzA0A=; b=CxgbsJZD5ekzu9qVXZvjqmMRlc
	LVmrpMaezrOVgB8j/xvcQNtbpwHXsHgp8snx3ZaxRwCbcPHIZMVIP5sOGI3xk9/5eU7m/Bo4PcJlQ
	YQYvIbfN8IY/tX9WME8mbZmYnnmP3c5sx4e+KtWLQqhwRlS24I+8wa707jOpKLm4jAGFWAY3AFnb9
	0Sq8tQ+P6tC4z223hFRW0dOpZwET1ydhxCZ7NFCuG/QHI7/dcgXYhybl/RPLvJaIq/saxbDOnHwc8
	CHF5G1hJuodZjKtbSitwJlyI7BY8Ta/MEn9FWErFU9kZ6orKKR8VzBKrhPqPEW59d/R82D+3vrxr/
	XULgXf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nLy-00000009lNA-3ssc;
	Thu, 10 Apr 2025 08:33:42 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mnp-00000009eFJ-0GOI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 07:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744271902; x=1744876702; i=wahrenst@gmx.net;
	bh=9dFfzgLAT79EkKFqJT8YM5dhdAcxg2mTdjPzJjTzA0A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iyKfZ2yct2eN0KxeUtHplj0niIItrILhLk+MqnPrxWuZo6RbpW2Pi7ybi5RaqsXT
	 5AByhclrK8BWSQWHdCL2TuSUASWUZKhQq3Opj6Acrmv+/kNf2gS1/6QQa6TEOD/e1
	 YGtC5MPg6kW+sbKOJzHKx8737nFnxeDqpW2NHlzsSoHKrV/CpTfwAeAeP97vxAl5n
	 BjXxKQ42htCqDdYOwJVKOKBklnAUJlDWIox1HrP3uU6OeNP8nLdT3wtNNMVVq3Sh2
	 PWG/km0JyoqTKHQLLXFRvhM3zUuKz/T2JJuRZn7ModcXhGSmUUz13bXhrjbDWVMio
	 Uo2CIdNRoudjqfPL2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzyuS-1t5zi42o0U-017n8M; Thu, 10
 Apr 2025 09:58:22 +0200
Message-ID: <0afc4cc5-5402-4746-907a-6cd92aa8889a@gmx.net>
Date: Thu, 10 Apr 2025 09:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v4 5/5] ARM: mxs_defconfig: Enable CONFIG_FEC_MTIP_L2SW
 to support MTIP L2 switch
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250407145157.3626463-1-lukma@denx.de>
 <20250407145157.3626463-6-lukma@denx.de>
 <c67ad9fa-6255-48e8-9537-2fceb0510127@gmx.net> <20250410090122.0e4cadef@wsk>
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
In-Reply-To: <20250410090122.0e4cadef@wsk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cPIOw8grf/C+YPYVB8MDkjqrTOJSqTfHkLLXd0a42+rIMJFLyWL
 TvfLgV2JhGqL7LN/cAVnkaGEQMuKcXqzrgNiywILNl42zGI170m2EgIveupA3vfPKIKce8G
 JBkTI0rakl5y6fXhIjZEb6wVDJ2m8sc7xS0e8PXQmc8GpPZyV4RLbWbpeOtlUJS2UbVUw4p
 yFkG0KaGSyGW0K63i3glw==
UI-OutboundReport: notjunk:1;M01:P0:hPwS8a0ZSYA=;zvPcYipWzqPu0hy+T0wjZG4wvaG
 MfIO7xrdoa2RpTMM81GnbbiC6t1dmZNoZ0U+1V6KwocC4dQ9i0JPqJHZ72msZjn4OMJxx+ezo
 1AUL7KKWqaQyufD7L8zjOIbuUmbAx1mo8hLw5qXGMHII1NkxPfeuH3GfajOhuEhaQfguDIyAz
 ywyzuk7Wzq/3L3F0ixSt3CaZfTWHEhizJeD8gVn70B+u2+HP9nCjZts8kNG/olDT4tq9SP1AV
 Jmlc7GVLq+Z45+47PzPsItHgbMNncjwqH+/+2sLmiMB50gyTcfJyL2IdTCkbqZ1VXsfyKUVke
 znXAkJ7zTqjmZUsevc11Xh3CkCNz4re03e9orc9eBEIn6RlRSiUjkDUBy8GK98tXvjTltmhxW
 evh5oBBwza92QwGQ6miLj5s1wW5ofZU1P3WJpP02FYylei9tIwmFYKNWsKpmymspsOzGm/2nv
 7BiDaHtYP/WqHT10LYpYdNDgrlgh/j1jZ41x0yZ8l9i0P3scKmUY0gk5Md0W1x0+8zGp7t0GC
 yP+7pbi2cbjEMV4VhAEBti9iBrErltCxLJOcyjRuChN1blEvPhiyIs43KsaGDP7BMLwYZ3T45
 WaaQuVL0O3mCCAHu4W18NUjaQ9j4mQb9dVfmtRMLHyMBoeKuKbTzqjsTv0nJhiD9avx4jUtK8
 aNFlU4DzYb/tiilasuBOJavC4JGz6spoDKQqEbnASsHQDPtmCa5Qp7hKmsI8FxGMPtKCJoDzA
 dEItTmVL2mUFCD/zSolm4cbXZYO6vI4XisudtlsO8Med9OLPg8wo12OQVGKul0Ac4pgLRDvSi
 1i+7gZ35X92AopJd3w1qxFqeXbKt8OvUnkQJAw5/tuF7HoxzXExvhWM7j8OdHtBOqK40+38pX
 PdpX1JlDI09C+WqpK6DMpgbbmzceW9upMUhmIb0+Ky2wBM2wh3rCgaGdAw1tAefuhxy9qKJeX
 HPrwsVSx0V9IqwUFRsegfC2euAXUvmS1YqeyqiHJsTBAF7xn2atMZvoJ5t5WmMmVF2ylsGBud
 LkZV/DizyGsybThNiqNr2x4vU5tKA1n1/52Zox5DqTWe+Co+nVwrNXeFdoTp9HnY+zaF4IG7v
 TjNNORgJt38qc0l6cQh4kYtO4drg+tq542qxFI/b9qmqnqhwTAeJssBWuSJCX3bAUlMhu9/5p
 iUFo8wjr9d73uYykac742/BvGq0J1biPzQz1pOfKQH9IqqgnL2vgN33VaSvJrks9k3lly+pcq
 IIxGV4L1eECpkOWFBu5dTffTG+ZD5+rbbTQpZpI+AbSZAfTyYLLlKIFhO+uS7oq/ehYvNCner
 BoXmiLR7wPKPSpfbj3LXF/btbzxtUPjRUj86RON92rmbFGAmqnmyLnFjMlqZnvaBI3cYv9BKi
 2G6rrUXlgVlmfhQpSqaIK3dAIBixAowPp7XVugPNuLUOn8lhqZBVwKxDCm6cTV2QUODpGqgdZ
 iOpZRH8oM9ZXh1ywgd1TAAkzBrot84IMlCzmu4RzLJ0NNTKpZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_005825_406432_CBA1E435 
X-CRM114-Status: GOOD (  29.92  )
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

Am 10.04.25 um 09:01 schrieb Lukasz Majewski:
> Hi Stefan,
>
>> Hi Lukasz,
>>
>> Am 07.04.25 um 16:51 schrieb Lukasz Majewski:
>>> This patch enables support for More Than IP switch available on some
>>> imx28[7] devices.
>>>
>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>> thanks adding the driver to mxs_defconfig. Unfortunately it's not
>> possible for reviewers to identify the relevant changes,
> Could you be more specific here?
> As fair as I see - there is only 14 LOCs changed for review.
Yes, this is exactly the problem. The subject suggests enable one
driver, but the changes are not self-explaining.
> Please also be aware that MTIP L2 switch driver has some dependencies -
> on e.g. SWITCHDEV and BRIDGE, which had to be enabled to allow the
> former one to be active.
This should be part of the commit message.
>
>> also the
>> commit messages doesn't provide further information.
>>
> What kind of extra information shall I provide? IMHO the patch is
> self-explaining.
No, it is not. How should a reviewer know that

CONFIG_MTD_M25P80=3Dy

should be dropped? This is completely unrelated to the change.
>
>> In general there are two approaches to solves this:
>> 1) prepend an additional patch which synchronizes mxs_defconfig with
>> current mainline
>> 2) manually create the relevant changes against mxs_defconfig
>>
>> The decision about the approaches is up to the maintainer.
> I took the linux-next's (or net-next) mxs defconfig (cp it to be
> .config)
>
> Then run CROSS_COMPILE=3D ... make ARCH=3Darm menuconfig
> Enabled all the relevant Kconfig options and run
>
> CROSS_COMPILE=3D ... make ARCH=3Darm savedefconfig
> and copy defconfig to mxs_defconfig.
> Then I used git to prepare the patch.
>
> Isn't the above procedure correct?
The problem here is that you send a patch for two steps. First is to
synchronize mxs_defconfig against current tree and the second is to
enable the driver.

Regards
>
>
>> Btw driver review will follow ...
>>
>> Regards
>>> ---
>>> Changes for v4:
>>> - New patch
>>> ---
>>>    arch/arm/configs/mxs_defconfig | 14 +++-----------
>>>    1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/arm/configs/mxs_defconfig
>>> b/arch/arm/configs/mxs_defconfig index d8a6e43c401e..4dc4306c035f
>>> 100644 --- a/arch/arm/configs/mxs_defconfig
>>> +++ b/arch/arm/configs/mxs_defconfig
>>> @@ -32,11 +32,10 @@ CONFIG_INET=3Dy
>>>    CONFIG_IP_PNP=3Dy
>>>    CONFIG_IP_PNP_DHCP=3Dy
>>>    CONFIG_SYN_COOKIES=3Dy
>>> -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>>> -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
>>> -# CONFIG_INET_XFRM_MODE_BEET is not set
>>>    # CONFIG_INET_DIAG is not set
>>>    # CONFIG_IPV6 is not set
>>> +CONFIG_BRIDGE=3Dy
>>> +CONFIG_NET_SWITCHDEV=3Dy
>>>    CONFIG_CAN=3Dm
>>>    # CONFIG_WIRELESS is not set
>>>    CONFIG_DEVTMPFS=3Dy
>>> @@ -45,7 +44,6 @@ CONFIG_MTD=3Dy
>>>    CONFIG_MTD_CMDLINE_PARTS=3Dy
>>>    CONFIG_MTD_BLOCK=3Dy
>>>    CONFIG_MTD_DATAFLASH=3Dy
>>> -CONFIG_MTD_M25P80=3Dy
>>>    CONFIG_MTD_SST25L=3Dy
>>>    CONFIG_MTD_RAW_NAND=3Dy
>>>    CONFIG_MTD_NAND_GPMI_NAND=3Dy
>>> @@ -56,11 +54,11 @@ CONFIG_EEPROM_AT24=3Dy
>>>    CONFIG_SCSI=3Dy
>>>    CONFIG_BLK_DEV_SD=3Dy
>>>    CONFIG_NETDEVICES=3Dy
>>> +CONFIG_FEC_MTIP_L2SW=3Dy
>>>    CONFIG_ENC28J60=3Dy
>>>    CONFIG_ICPLUS_PHY=3Dy
>>>    CONFIG_MICREL_PHY=3Dy
>>>    CONFIG_REALTEK_PHY=3Dy
>>> -CONFIG_SMSC_PHY=3Dy
>>>    CONFIG_CAN_FLEXCAN=3Dm
>>>    CONFIG_USB_USBNET=3Dy
>>>    CONFIG_USB_NET_SMSC95XX=3Dy
>>> @@ -77,13 +75,11 @@ CONFIG_SERIAL_AMBA_PL011=3Dy
>>>    CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
>>>    CONFIG_SERIAL_MXS_AUART=3Dy
>>>    # CONFIG_HW_RANDOM is not set
>>> -# CONFIG_I2C_COMPAT is not set
>>>    CONFIG_I2C_CHARDEV=3Dy
>>>    CONFIG_I2C_MXS=3Dy
>>>    CONFIG_SPI=3Dy
>>>    CONFIG_SPI_GPIO=3Dm
>>>    CONFIG_SPI_MXS=3Dy
>>> -CONFIG_GPIO_SYSFS=3Dy
>>>    # CONFIG_HWMON is not set
>>>    CONFIG_WATCHDOG=3Dy
>>>    CONFIG_STMP3XXX_RTC_WATCHDOG=3Dy
>>> @@ -138,10 +134,6 @@ CONFIG_PWM_MXS=3Dy
>>>    CONFIG_NVMEM_MXS_OCOTP=3Dy
>>>    CONFIG_EXT4_FS=3Dy
>>>    # CONFIG_DNOTIFY is not set
>>> -CONFIG_NETFS_SUPPORT=3Dm
>>> -CONFIG_FSCACHE=3Dy
>>> -CONFIG_FSCACHE_STATS=3Dy
>>> -CONFIG_CACHEFILES=3Dm
>>>    CONFIG_VFAT_FS=3Dy
>>>    CONFIG_TMPFS=3Dy
>>>    CONFIG_TMPFS_POSIX_ACL=3Dy
>
>
>
> Best regards,
>
> Lukasz Majewski
>
> --
>
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de


