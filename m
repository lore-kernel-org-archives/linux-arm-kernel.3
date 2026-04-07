Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B151AEDB7C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 07:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul0a8Gh+m7Miix3rJ72Qx10XkrEXaGS4AIkRhU8J2WA=; b=CHWpX2FPEHwLmnDK0OBZKRkfFe
	CuYsdoBaKykq8NT1nndax1WaWubH/5iGLpneqyUrPWhMOsca6USbHKFQF+37dt1HvDsviXV392EHt
	Yp7h9i477mGXmnVXGj/JtIMSgBEVIJVrxFXeCX9tTpRigOnxzN6hhLUMf31z331p18PXVVsleCtoQ
	zgdMTBB+oEoRwrJ4GcD8cenpXb68i8WzcQZxkXaqVyvVWdRJBuzSrudMAAPEywlEsP0NQzjTFj35y
	fZSrHndVj3abmkBw5n3S+UxpXopICJBQFCb4nTlzeHHhPC+M1UtQwEMqmoJgqQXKomInzV8lZZw6B
	vDR5IPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA18L-0000000665W-04H3;
	Tue, 07 Apr 2026 07:46:01 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA185-000000065zJ-3h69
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 07:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ul0a8Gh+m7Miix3rJ72Qx10XkrEXaGS4AIkRhU8J2WA=; b=F0CV3/lIG1w+xlrn2EtobCm9Eb
	S3YkQyanWCKbFNDT8O/4zTcxJ5uaSjhVGo5IMW/egNou+Ti3CiCO8eMfdzdWazcfEKzdUSiY565mT
	XFjUtf+PKxf8iWCgzJIfThkoU44USVrzUrYir5bHxJ9oJKEakkaD7CVcWfsjLLHw5ruQ1EIcuMPYq
	Ntv1/DmBEHBBogl0tpAPQT65C1wInGcucvZYtYscnhzvkq+xC5f1gx59rk7XXo3rlmcfaLVqtCDiF
	99w1ef7j+OZRpKWpyU3nz9wU5ftSpNe6kO/Xpp77fF/nIocyD87BUAbF362v5P8tasIik2SPSJ4dg
	6rdQJNBw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40998 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1w9zhV-0000000Des7-2CRH;
	Tue, 07 Apr 2026 08:14:12 +0200
Message-ID: <707e106b-f444-4c26-9816-c53c8eda8cbb@norik.com>
Date: Tue, 7 Apr 2026 08:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] Re: [PATCH] arm64: dts: imx{91,93}-phyboard-segin: Add
 peb-av-18 overlay
To: Frank Li <Frank.li@nxp.com>, Florijan Plohl <florijan.plohl@norik.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260402070826.970012-1-florijan.plohl@norik.com>
 <ac50OHuEApM3tRHq@lizhi-Precision-Tower-5810>
 <56b9e133-74b9-4e59-a40c-c7637c080fd8@norik.com>
 <adMg762HH4gcuWyq@lizhi-Precision-Tower-5810>
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
In-Reply-To: <adMg762HH4gcuWyq@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_004558_089276_ABE7E7A8 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Frank, Florijan,

On 4/6/26 04:56, Frank Li wrote:
> On Fri, Apr 03, 2026 at 10:29:00AM +0200, Florijan Plohl wrote:
>> Hello,
>>
>> On 4/2/26 15:50, Frank Li wrote:
>>> On Thu, Apr 02, 2026 at 09:08:26AM +0200, Florijan Plohl wrote:
>>>> Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.
>>> what's means PEB-AV-18? Is it random board name?
>> The PEB-AV-18 is PHYTEC designation for Audio/Video adapter modules that can
>> be used to connect displays on their boards.
>>
>> I will improve commit message to add more such information in v2.
>>
>>>
>>>
>>>> The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).
>>>>
>>>> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
>>>> ---
>>>>   arch/arm64/boot/dts/freescale/Makefile        |   4 +
>>>>   .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
>>>>   .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
>>> Any difference between 91 and 93, can use one overlay file?
>>>
>>> Frank
>>
>> Can you suggest how to do so?
>>
>> There are imx93-pinfunc.h and imx91-pinfunc.h which are not unified
>> between imx91 and imx93.
> 
> I suggest move pinmux setting to mainboard's dts files, which provide
> plug adaptor header, signal should be descripted in mainboard's dts file,
> which provide an unified label to overlay file.

Yeah, that would be one way of doing it.

However, the phycore dtsi and phyboard dts are kept simple by design
choice. This way, all optional pinctrls and peripherals are kept
separate from the board device-tree to maintain clutter low.

For v2 I would prefer to keep as is (current downstream implementation)
or at least use this approach:

imx91-93-phyboard-segin-peb-av-18.dtsi
|
 -> imx91-phyboard-segin-peb-av-18.dtso
|
 -> imx93-phyboard-segin-peb-av-18.dtso

BR,
Primoz

> 
> Frank
> 
>>
>> So we can only create common dtsi like so:
>>
>> imx91-93-phyboard-segin-peb-av-18.dtsi
>>
>> and still use separate dtsos:
>>
>> imx91-phyboard-segin-peb-av-18.dtso
>> imx93-phyboard-segin-peb-av-18.dtso
>>
>> Is that your idea?
>>
>> BR,
>>
>> Florijan Plohl
>>
>>>> --
>>>> 2.43.0
>>>>
> _______________________________________________
> upstream mailing list -- upstream@lists.phytec.de
> To unsubscribe send an email to upstream-leave@lists.phytec.de

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


