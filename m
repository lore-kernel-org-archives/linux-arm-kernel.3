Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C57C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0eP/ZUtDnfnWC1sbkTcciQkVIrYUYIsPBMMzZjDxVk=; b=0o02MJDMq1wx9w1mJpkWlGouNv
	oSB7zMx+InFaC/tQRRexKbaWyS7a6XZ6hz39PTFuH3z2koBDwYfuhLyzFUJ/NBMtWnLC41jFgwYiz
	SVlxYpzxbj/Jhw7zsisxhrSEyQVoiGCkJBB9WQwaYNCVC1mcrL6euh690lc0jZjjxD66AI8fYUATi
	EBne5qeAdvNss1XNWZBo/+ARS2cvIVGd6JnVP9r4H35F3f+fbza03u8lYEnXueNNgH63ODdPgx61Y
	cNnMYv/TCfxuIM9siL73lB8aId0DKM5fHn6kulffr6jh3sSS3izI5XsEgTbY1xFBQ/c2Ggg1wS1Uz
	tnysJwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew83-0000000FSy8-0Mrn;
	Mon, 03 Feb 2025 13:04:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tew4d-0000000FSTP-3cdW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738587672; x=1770123672;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/6QWZmvgdgRKemS6uCI/7kDUzuut2jiaZ3WLSrRT25U=;
  b=LTm1RVLUe8LAw39aKC4Bzz7G7vNN1FcHp2SgClJAvH2QiXwGwdBLIFOX
   DwCpV6pMt6QMsFKrFSVG6oJdum38sbcPDi+KQTiGKy+iwWLiYY8Tv4fYn
   Dn8l5snXbTu3AZ9srF5W3nN7VwohkDANV2Cd0BltFJkbCogz4RRt+2Xa3
   VqRu+PSNQeqB/wAjrNA8/93i8x3de5Ly37J3i4H/UzVuRNN8V3SiJgmhj
   ysCP2EsJO7W/DyC+411WOZ7JF5m1YPjqu8a6vN8rS/Moetlp5V2fa45qb
   Krd+DmAO8mdqqkaQ+/1BBO3lcaeJ3eIU1paTgi6f7eZUnY+3z+ybY/Oc0
   Q==;
X-CSE-ConnectionGUID: BiQ6Mj8JS4mUyf8xst4c6g==
X-CSE-MsgGUID: nEiw4WNsRAyBbXcor0RWiA==
X-IronPort-AV: E=Sophos;i="6.13,255,1732604400"; 
   d="scan'208";a="37622794"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Feb 2025 06:01:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Feb 2025 06:01:02 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Feb 2025 06:01:01 -0700
Message-ID: <d4c2a158-6b93-4fd7-a638-9f202ed21b17@microchip.com>
Date: Mon, 3 Feb 2025 14:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: dts: at91: calao_usb: improve LED description
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
References: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_050112_189247_F6755D58 
X-CRM114-Status: GOOD (  11.85  )
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

On 31/01/2025 at 17:26, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> For developing on the road, the Calao USB-boards are still very useful
> to me. Time to give their Linux support a little love. This mini series
> fixes a wrong polarity and removes the default heartbeat. More to come.

Thanks a lot Wolfram! Patches will be welcome with pleasure.

Best regards,
   Nicolas

> Wolfram Sang (2):
>    ARM: dts: at91: calao_usb: fix wrong polarity for LED
>    ARM: dts: at91: calao_usb: remove heartbeat for User LEDs
> 
>   arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 3 +--
>   arch/arm/boot/dts/microchip/usb_a9263.dts         | 1 -
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> --
> 2.45.2
> 


