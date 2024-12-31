Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC246E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 07:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wcei/jjicgVQNialufWSNCo6fuHs9KyY0+NSZYlZuBo=; b=I27cH14eTo4x8FAC/tSt4VNXgP
	/B0Co7SCME3Yn+t8Cj8G9yUkS+alX0b7GMvB4kLpDRzKxukC1FZiulzsLffcE3U1hRbVFQZeekwq9
	edIYp2YqVzpxqkQqoHqTvBDP4sHVmoVbXEoaljRpzwUBcgXmB4EBUnThf6OB98hbZ/gne/oIDPYTX
	63+ANUlE73GHFh8Ozc6qqxWaJSzKI7rIE0iXc34FaErP4HIRzhXqb6bzVyChGbFeyL4+sqm95idqu
	VHIFT76kvCaGdvrWJvvZV+RJHmbjOJX75Jw7XGeSqzL23WuwGS5sImOJRIAhfeR/EtXG6sJ1mAfRC
	XnB/Dh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWnD-00000006jfr-1N1x;
	Tue, 31 Dec 2024 07:35:55 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWm2-00000006jal-2Zei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 07:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wcei/jjicgVQNialufWSNCo6fuHs9KyY0+NSZYlZuBo=; b=VgIqJ8o32PpjO0vBjSWxN1B62s
	N5fj/Yq13iQy4mMUNz+KjGEdiKkgPouC8BB2Cu3TOcm/EHLlKpJ/g+OqTUgGTmNTLm1kT2eEayQ7d
	lsJvasH3gU2sgVWk0j0Lb8DLA/aigKQj9UHIZtFjlV9eIEzTrI/jelK2k9/yshIcZcPVztUAsnbko
	dPilFZmk19V9s4gGeFqjLyao85IqOTmE2DHQcv1BNFMdVY1wM63uvr2JqaGyXlCwtBf7g6shPa7+0
	nVind6eELLK/L68C4/rthi1ZdTYvvuxI38BuGvzWw5A+R2jBQ2hfdTcEfKPXuJD2AjAHy91OudepP
	Nqcr8h5w==;
Received: from 77-38-14-103.dynamic.telemach.net ([77.38.14.103]:53894 helo=[192.168.0.15])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tSWlx-004GS5-2G;
	Tue, 31 Dec 2024 08:34:37 +0100
Message-ID: <221c8216-ce71-4ba2-9981-8612ff33ec2a@norik.com>
Date: Tue, 31 Dec 2024 08:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: imx8mm-phycore-som: Add overlay for
 rproc
To: Shawn Guo <shawnguo2@yeah.net>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20241202072052.2195283-1-andrej.picej@norik.com>
 <20241202072052.2195283-14-andrej.picej@norik.com> <Z3Ie8GO/GtoSkIr3@dragon>
Content-Language: en-GB
From: Andrej Picej <andrej.picej@norik.com>
In-Reply-To: <Z3Ie8GO/GtoSkIr3@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_233443_206603_C6BF6A4E 
X-CRM114-Status: GOOD (  16.19  )
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

On 30. 12. 24 05:17, Shawn Guo wrote:
> On Mon, Dec 02, 2024 at 08:20:50AM +0100, Andrej Picej wrote:
>> From: Dominik Haller <d.haller@phytec.de>
>>
>> Adds a devicetree overlay containing reserved memory regions used
>> for intercore communication between A53 and M4 cores.
>>
>> Signed-off-by: Dominik Haller <d.haller@phytec.de>
>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>> ---
>> Changes in v2:
>>   - no change.
>> ---
>>   arch/arm64/boot/dts/freescale/Makefile        |  2 +
>>   .../dts/freescale/imx8mm-phycore-rpmsg.dtso   | 55 +++++++++++++++++++
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 99be36a04db9..5bc083a7b778 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -125,9 +125,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
>>   
>>   imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
>>   imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
>> +imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.dtbo
>>   
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-rpmsg.dtb
>>   
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l.dtb
>>   dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>> new file mode 100644
>> index 000000000000..0c61946f0cf8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024 PHYTEC Messtechnik GmbH
>> + * Author: Dominik Haller <d.haller@phytec.de>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/imx8mm-clock.h>
>> +
>> +&{/} {
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> I'm getting this:
> 
> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:16.3-10: Warning (ranges_format): /fragment@0/__overlay__/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /fragment@0/__overlay__ (1)
> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #address-cells value
> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #size-cells value
> 

I see, missed this before, sorry. But I have some problems fixing it.
I think the problem is that this is overlay, the same node put in the 
imx8mm-phycore-som.dtsi doesn't trigger a warning.
The only solution that I found is that I specify the default 
address-cells and size-cells in root node:


&{/} {
	#address-cells = <2>;
	#size-cells = <2>;

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;
	...
	};
};

The same values are used in imx8mm.dtsi, but the checker fails to find 
these default values.
Not sure if this is the right solution, though. Your input would be 
helpful, thanks.

Best regards,
Andrej


> Shawn
> 
>> +
>> +		m4_reserved: m4@80000000 {
>> +			reg = <0 0x80000000 0 0x1000000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring0: vdev0vring0@b8000000 {
>> +			reg = <0 0xb8000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: vdev0vring1@b8008000 {
>> +			reg = <0 0xb8008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		rsc_table: rsc_table@b80ff000 {
>> +			reg = <0 0xb80ff000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: vdevbuffer@b8400000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0xb8400000 0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	core-m4 {
>> +		compatible = "fsl,imx8mm-cm4";
>> +		clocks = <&clk IMX8MM_CLK_M4_DIV>;
>> +		mboxes = <&mu 0 1
>> +			&mu 1 1
>> +			&mu 3 1>;
>> +		mbox-names = "tx", "rx", "rxdb";
>> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>> +		syscon = <&src>;
>> +	};
>> +};
>> -- 
>> 2.34.1
>>
> 

