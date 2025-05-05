Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F11C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWcMhUUAD341x1j4p0TzxNBabdUQcp6F1O3NT2s7Z9I=; b=JA2iHPMYLJQUGtYPdiJM75wnaV
	Sga1VAKlAoRyrMTxyvATHfFg/bXZnffVmOOADb1D73zD3Cv5kE/205MM8CHeEWWuPz6QpujiihmvA
	xLUHrmjNgK0gON5OebHLWht8nKqyd2tNAMYP4/RihfpgybhrJ5z8FDA4QXDa98ixRq8l+5Zsov5/9
	CxsPR+NW8o7GRK6X67bx9slnXPiryFk8cepY+A0QdIfgtIMRdOPN4Ior9o/SBkKwUbhwy6Q+DzhbN
	+oAoRly+Ywc7jOa3t+W22FvzPeTykCnbXN8hrGAJjd9pCgvrw+a28Gzp8V0K3GwkGHWn2bdJtJXQs
	4JYdidYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpuH-00000006bFG-0Hpg;
	Mon, 05 May 2025 07:06:29 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpsF-00000006aZJ-1ctx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FWcMhUUAD341x1j4p0TzxNBabdUQcp6F1O3NT2s7Z9I=; b=cK9noqLnLdYH8B5aHwnOVCr3N8
	aFx1PhEY/AeDmgx30074nqdwSaV2O3JlovBwN6qZ/ncicaMyCEmmS5VH5ez+VuFKd6PT0O1dadn2r
	wSLeCT/LpfhW2+tGGAd1OHXe6ZHyqa/nGbiRAfRLHCReM+BqRN7kELFx9302k1TmN7zG74MGAjvQS
	fTQElveeg8b8N6vHKjQVnWT6esJW1+jbbFhJiNuPJfxizo4WtlSeFARU7XnwbnNBrZ7HXJbQArCez
	rVvQHu/zsoCp0KQ0De/EW7oY711Av6tuCj9lf5vm3d9s6HYfNWrpdq+WpN9MUeeC+mTEiWxp/EEzO
	zNzibs3g==;
Received: from [89.212.21.243] (port=58904 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uBpsB-00BenA-24;
	Mon, 05 May 2025 09:04:18 +0200
Message-ID: <282a7e41-97f8-4fd4-9f03-29f70acc4df2@norik.com>
Date: Mon, 5 May 2025 09:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH 2/2] arm64: dts: freescale: Add PHYTEC
 phyBOARD-Nash-i.MX93 support
To: Wadim Egorov <w.egorov@phytec.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20250425064107.174548-1-primoz.fiser@norik.com>
 <20250425064107.174548-2-primoz.fiser@norik.com>
 <000c1117-81d1-4a74-9d36-f83a2b0fedd3@phytec.de>
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
In-Reply-To: <000c1117-81d1-4a74-9d36-f83a2b0fedd3@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-CRM114-CacheID: sfid-20250505_000423_895909_8D8BD06C 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

Hi Wadim,

On 28. 04. 25 16:31, Wadim Egorov wrote:
> Hi Primoz,
> 
> a few of the node references you are adding are out of alphabetical order.

Only &mdio node is out of alphabetical order.

But this is done by choice to keep it together with &eqos node since
both nodes are related to the 2nd Ethernet interface (&ethphy2) and thus
kept logically with each other.

We did the same for phyBOARD-Segin-i.MX93.

> 
> Am 25.04.25 um 09:41 schrieb Primoz Fiser:
>> Add initial support for PHYTEC phyBOARD-Nash-i.MX93 board [1] based on
>> the PHYTEC phyCORE-i.MX93 SoM (System-on-Module) [2].
>>
>> Supported board features:
>>   * ADC
>>   * CAN
>>   * Ethernet 2x
>>   * EEPROM
>>   * eMMC
>>   * Heartbeat LED
>>   * RTC
> 
> eMMC and Hearbeat LED are not board features but SoM features.

That's true.

I will remove those from the list in v2 and only list carrier-board
features.

BR,
Primoz

> 
>>   * RS-232/RS-485
>>   * SD-card
>>   * TPM 2.0
>>   * USB
>>
>> For more details see the product pages for the development kit and the
>> SoM:
>>
>> [1] https://www.phytec.eu/en/produkte/development-kits/phyboard-nash/
>> [2]
>> https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-91-93/
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> 
> With that changed,
> 
> Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
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

