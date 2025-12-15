Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD7BD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXU9nnjinnCROdwBl30wuXFdV2WvO7Phw3qfcDdpB1c=; b=LKxUwuB3awrFBgJcHETX+dH38d
	y66j4v/YHWkLovWgNGIGHy5xDq2eizL+cQ0xST/0wKFgLwPFiz4J37QVl5wDCaTMPNmSbAixKaTES
	g6bEu24AC5LKUr40O3+vt+hW3pX/Imj5qM2Ncmy7+626ygcgVQOsCkyQn1/2pz+bBnIBCHLBKWRh2
	fWMsafSo+sH1ijSrxekLBhlMui0vH/iFX8zmblCzUDGjf2xi5Zub7a2MgxTCgfdJ8CXdkDBx/6xvL
	kMJEKs7DAiyBjP2+SP0DIPQJwbX1VnMGecNzhLvWXv5I8ASHMbeEIdpPrnQc0UUPJg7NQVzIlag8u
	DqxdTirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7kS-00000003dKP-0DBS;
	Mon, 15 Dec 2025 12:32:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7kO-00000003dK3-1XyK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 12:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765801936; x=1797337936;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dLfaFFRxrhBtwiyM43aiY2kA722KKifVplr8YCkaH3U=;
  b=qsV1r2ncxgPU3nAlzwQz30OSnaHKdeAMe2gJXaIFiQimr7Y++p6MzBeE
   cpFg/dFlHHsll+3JT+y95WeGGUfZQ9kzXxvGrmRa5n29bJZrk/CjI+1kU
   TqQU3x7dCIzyf6e7c/eWYeqBrJPJA9jOwN5HSsnyoTEpw1B0ysc3wCoaa
   nz7BR9uHlW/dbRcJ2f6XHFWjOyFmljtjWArKgsYzrOSobBOSAT/pC8Ydm
   eqQOhPrh0z/rPzZteoM9pcotRIPyTJb6RzUBkubhew53WqxcmZK3PFMHP
   xThBb7u3RUdPSrUdhkUSKdRwABoTtM99Q/HTE9t5mOezcag9NCZZ88fBX
   w==;
X-CSE-ConnectionGUID: i/OwzfYTQjaeepaMU2SEOw==
X-CSE-MsgGUID: TgUegrZ6QwiHS6PGOv+wZw==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; 
   d="scan'208";a="49867330"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:32:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 15 Dec 2025 05:32:07 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Dec 2025 05:32:04 -0700
Message-ID: <173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com>
Date: Mon, 15 Dec 2025 13:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, Conor Dooley <conor@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<gregkh@linuxfoundation.org>, <claudiu.beznea@tuxon.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <luka.perkov@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
 <20251203-splendor-cubbyhole-eda2d6982b46@spud>
 <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_043216_675255_7ADB37A9 
X-CRM114-Status: GOOD (  13.27  )
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

Robert,

On 15/12/2025 at 12:36, Robert Marko wrote:
> On Wed, Dec 3, 2025 at 8:21 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
>>> Add support for Microchip LAN969x switch SoC, including the EV23X71A
>>> EVB board.
>>>
>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>> ---
>>>   arch/arm64/boot/dts/microchip/Makefile        |   2 +
>>>   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>>
>>>   arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>>
>> The majority of devices in this file are missing soc-specific
>> compatibles.
> 
> Hi,
> I missed this before.
> 
> The majority of the devices are simply reused from the AT91 series, so
> I thought it was not required to
> update all of the bindings to add the LAN9691 compatible.
> 
> If that is required, I will do so in v2.
Well, history told us it was better (in addition to be required by DT 
best practices). Indeed, even if the same IP block is used, sometimes 
integration subtleties pay game with us and a dedicated compatible 
string saves us.

Regards,
   Nicolas

