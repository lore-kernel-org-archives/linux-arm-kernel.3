Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68526C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 08:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpQSiQvy1hnifDQxt9SKOFDxpRliEXMBm8AYZHweb8Q=; b=sF+mV2B4+F7pc/qRRie+4TK0kL
	qv/O45JSjU7rX4qRHr3BnoSuul7g0P078sAh1teThgvLG5Dvm1MAiiCESm7aD+bFZvH12F8sY5sZH
	K7Md10kcueScTrRjeTGJwlPESSsayUbhrQhKXDdMv3PkohTbTCu+vr3BtcUwU3e5Vw+A0/2GT/DRH
	eH6cLHNio/qFF8yW/CFDnXt0rZpFLEPPaB7I3c4BIYpq4UiKXsI2mu4bQnCeN959iHSIxivINC4jg
	O8JcvcP8UU77VlO2qF0L34WCUSR+1zN2MN8LdBkttPB0vYsJeUr6O/McoNhNL6AESlsdFvp2Los0Y
	+WkyQyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Eo6-000000011MH-3TFW;
	Mon, 14 Apr 2025 08:04:42 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EmC-0000000115s-2Vwc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 08:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YpQSiQvy1hnifDQxt9SKOFDxpRliEXMBm8AYZHweb8Q=; b=ROakJ9Y+q0ECieFlwrTFMktMUn
	XLNOr33NXrnIQeB14gm0uUCA6yzpUweg29px4LkdTzZ4qWXJWTM2MFRD9OQYgiGIiHAoPsaOTzgRO
	sEGBACSi06vZsRTX2sZeDdutQyIwOCGke1qG03xmWu2wgZ5cTtxEVO3yJHNtCcdCKqZ2E5reJHCdk
	FWn2sdFUvpI5rVisCRgrJTT4wxaN1CwSSuGBFnwuyzhHgdfW4UE5lUTctgEW80PLBC3w3GtnvGv0l
	/AbJS9f8ZA+U0S3WsINIzpenutc/rqRf/LXlcEcXsT08fisRL87BwLJCJK7POFeLsC0ra3dngUu/l
	bgmvZDbQ==;
Received: from [89.212.21.243] (port=49436 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Em7-00DMch-1a;
	Mon, 14 Apr 2025 10:02:38 +0200
Message-ID: <1571414e-5e7d-4c9e-b69d-11a6fdf454e2@norik.com>
Date: Mon, 14 Apr 2025 10:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
 <ef74e49d-c413-4719-a174-42df91384469@norik.com>
 <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
 <20250412-tentacled-rugged-bee-fd7e9c-mkl@pengutronix.de>
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
In-Reply-To: <20250412-tentacled-rugged-bee-fd7e9c-mkl@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250414_010245_114561_C3146364 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Marc and Frank,

On 12. 04. 25 15:41, Marc Kleine-Budde wrote:
> On 11.04.2025 10:30:18, Frank Li wrote:
>> On Fri, Apr 11, 2025 at 10:08:21AM +0200, Primoz Fiser wrote:
>>> Hi Frank,
>>>
>>> On 10. 04. 25 17:23, Frank Li wrote:
>>>> On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
>>>>> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
>>>>> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
>>>>> chip.
>>>>
>>>> Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy instead
>>>> of use hacked regulator-flexcan1-en.
>>>
>>> Sorry can't do.
>>>
>>> This doesn't align with other i.MX PHYTEC products using flexcan such as
>>> imx8mp-phyboard-pollux-rdk.dts.
>>>
>>> Even the i.MX93 EVK uses the same mechanism.
>>
>> I think previous method is NOT good enough. Suggest involve CAN and PHY
>> maintainer to discuss these.
> 
> Since d80bfde3c57a ("can: flexcan: add transceiver capabilities"), which
> git mainline with v6.15-rc1 there is proper PHY support in the flexcan
> driver. So from my point of view, there's no need to stick to regulator
> hack.

This arrived at the perfect moment. Just in time :)

I will switch to this mechanism in v2.

Thank you both for your input.

BR,
Primoz

> 
> regards,
> Marc
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

