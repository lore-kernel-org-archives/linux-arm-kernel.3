Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8120DC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/+6XlkgOJfxcd3UMd31vvs5UWZa5byswuou5bXWz4U=; b=c82Nk47wpgKx0ITWWlXtAQ9VC4
	bJX0EXIWAdAPLih/u1C/4S0zrjkpzuIsDoBISqL8tjeS1qCffiVtZ5Wf+2bSdL1o3zV4IqU8LkI9q
	sq7aQmmnQvWO3T1nyqvptKGE/AqhFx/1g23LQcLzdTe/Fmc8kV6uf+86DLdcAkHChS4ZyOkt2qcWz
	sJV0fRFNPmP8yMOFeLDoFQZIaLfOJ0+/QlvYSk+ZzCqjRexlngt6IdRD0Yx0sGDFftKHwBZiiL8ti
	/XA6Wn2/B/lYulbt0dliLa4Ksj6B82rzYWpAt+V5ZsobWH1m5jD9XDbiHKNNkLVfMyf8p6bD3p5hZ
	5DqUDyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYg0Z-00000001dtG-0S7Y;
	Mon, 07 Jul 2025 07:11:23 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfxR-00000001dOR-3HHR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:08:11 +0000
Received: from [89.212.21.243] (port=54560 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYfxQ-00DTvl-0X;
	Mon, 07 Jul 2025 09:08:07 +0200
Message-ID: <1b20cb44-847f-4f64-a367-c3340468713a@norik.com>
Date: Mon, 7 Jul 2025 09:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Initial PHYTEC i.MX93 overlays
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250707061101.1194618-1-primoz.fiser@norik.com>
 <20250707080457.GB11488@nxa18884-linux>
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
In-Reply-To: <20250707080457.GB11488@nxa18884-linux>
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
X-CRM114-CacheID: sfid-20250707_000809_979978_D62CA85A 
X-CRM114-Status: GOOD (  10.86  )
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

Hi Peng,

On 7. 07. 25 10:04, Peng Fan wrote:
> On Mon, Jul 07, 2025 at 08:10:57AM +0200, Primoz Fiser wrote:
>> Add initial overlays for the PHYTEC phyCORE-i.MX93 SoM based boards,
>> that is the phyBOARD-Segin-i.MX93 and phyBOARD-Nash-i.MX93.
>>
>> Overlay #1:
>> - imx93-phycore-rpmsg.dtbo
>> - add support for M33 core RPMsg on phyCORE-i.MX93 based boards
>> - applicable to both phyBOARD-Nash and phyBOARD-Segin boards
>>
>> Overlay #2:
>> - imx93-phyboard-segin-peb-eval-01.dtbo
>> - add support for PHYTEC PEB-EVAL-01 evaluation adapter
>> - applicable to phyBOARD-Segin board
>>
>> Overlay #3:
>> - imx93-phyboard-segin-peb-wlbt-05.dtbo
>> - add support for PHYTEC PEB-WLBT-05 WLAN/BT adapter
>> - applicable to phyBOARD-Segin board
>>
>> Overlay #4: 
>> - imx93-phyboard-nash-peb-wlbt-07.dtbo
>> - add support for PHYTEC PEB-WLBT-07 WLAN/BT adapter
>> - applicable to phyBOARD-Nash board
>>
>>
>> Changes in v2:
>> - reorder reserved memory nodes by address
>>
>> Link to v1: https://lore.kernel.org/all/20250619063954.1730231-1-primoz.fiser@norik.com/
>>
>> Primoz Fiser (4):
>>  arm64: dts: imx93-phycore-som: Add RPMsg overlay
>>  arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
>>  arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
>>  arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay
> 
> 
> I think it would be better to update License to
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> 
> But up to you, I am not sure whether dtso(GPL-2.0) could
> work with dts(GPL-2.0 or MIT).

Good catch!

Yes, this indeed needs fixing. Will send v3 updating to (GPL-2.0+ OR
MIT) as the base dts.

> 
> 
> For the patchset
> Reviewed-by: Peng Fan <peng.fan@nxp.com>>

Thanks for review.

BR,
Primoz


> Regards,
> Peng

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

