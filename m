Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C4C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 04:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brnJg11gY8+iDgarbUMDrxiIcriAfY4KKGVOIVFhhR0=; b=1sAqQJHiYPScHR8v8wUMJmYXit
	U5JxHGuoDf5fUk1ytej1pyFk9ofFHHgUAM2mIQkexEBG2rWHYLq+jo6bOB83fbELR/wRUgNzvAZgS
	CT20ifp92jHgFBx7T54RZ65FZ5115aaKyHqGjaA41h+91/Rk4dkKaQSs13mI4M9u8psVuXnwTlDxe
	wngzosMNthLmTmiQSooYOIaGYBBBSeGxFqE9JxLyeZ2ICjXRT3tXvH7431Mlky0icu1Jfwgp0VhDw
	R9xwh9T0/mNSDmOl91s5lo1vKdWmBtjf5FQOeZ7FBe9SW5S3dI+rthRjxlS9zpysk+qKcvPpYqz4s
	EObSItaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYdmI-00000001OVx-3jTW;
	Mon, 07 Jul 2025 04:48:30 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYdjx-00000001OJ4-2NED
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 04:46:07 +0000
Received: from [89.212.21.243] (port=40646 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYdjt-00DAtb-28;
	Mon, 07 Jul 2025 06:46:00 +0200
Message-ID: <5842ba39-23e0-4dcc-856a-dcd0d30d446e@norik.com>
Date: Mon, 7 Jul 2025 06:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: imx93-phycore-som: Add RPMsg overlay
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250619063954.1730231-1-primoz.fiser@norik.com>
 <20250619063954.1730231-2-primoz.fiser@norik.com> <aGtAqi7JWbF5F-31@dragon>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <aGtAqi7JWbF5F-31@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_214605_769626_42EDD0F9 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Shawn,

On 7. 07. 25 05:36, Shawn Guo wrote:
> On Thu, Jun 19, 2025 at 08:39:51AM +0200, Primoz Fiser wrote:
>> Add an overlay used for remote processor inter-core communication
>> between A55 and M33 cores on the phyCORE-i.MX93 SoM based boards.
>>
>> Overlay adds the required reserved memory regions and enables the
>> mailbox unit and the M33 core for RPMsg (Remote Processor Messaging
>> Framework).
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>>  .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 +++++++++++++++++++
>>  2 files changed, 64 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 0b473a23d120..08a1de299538 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>> +
>> +imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>> +dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
>> +
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
>> new file mode 100644
>> index 000000000000..9200113c9ec3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
>> + * Author: Primoz Fiser <primoz.fiser@norik.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +
>> +		vdev0vring0: vdev0vring0@a4000000 {
>> +			reg = <0 0xa4000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: vdev0vring1@a4008000 {
>> +			reg = <0 0xa4008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring0: vdev1vring0@a4010000 {
>> +			reg = <0 0xa4010000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring1: vdev1vring1@a4018000 {
>> +			reg = <0 0xa4018000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		rsc_table: rsc-table@2021e000 {
> 
> Can we sort the node in order of unit-address?

Sure. I will move rsc_table to the top in v2.

BR,
Primoz

> 
> Shawn
> 
>> +			reg = <0 0x2021e000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: vdevbuffer@a4020000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0xa4020000 0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +};
>> +
>> +&cm33 {
>> +	mbox-names = "tx", "rx", "rxdb";
>> +	mboxes = <&mu1 0 1>,
>> +		 <&mu1 1 1>,
>> +		 <&mu1 3 1>;
>> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +		 <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
>> +	status = "okay";
>> +};
>> +
>> +&mu1 {
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1
>>
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

