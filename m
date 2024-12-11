Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B38E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6jOe4StafxMUoKvvwb8Eh0q1rYN865XW7Bj6X9Dj7o=; b=iHtR+QD/nveX2K
	yiozMok2T9jqJMF4gLNJxzOVTbLROQ3Hh1yNNh6hhRETP/FbgOmuihaJcJUdNpa7s5pIMlbtclxfB
	s6RmkHBRQf0SBMCcC8yIroAMro/kMJNSEHquXJGhN2gR1Nq1xJ99uYC17KbKpyeWpdc/egbFttYRl
	TlZ+KZzKU8DoWBfubH8omhTxgBhpjSQik9lesBlS0AeB7DNXBgfsit5q7Lv7P4Ybr8pkOMtKFg4aR
	jqpAvknBLJyFbGgNi27nhTS6gBcEjPgju5zFjAqSK+MkmhlfzT2Nqm3UPySWAPzTfwe3t/pfxDGuF
	Zx2n2HOx87Yr/fIURTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOc0-0000000FG49-3pQ3;
	Wed, 11 Dec 2024 15:26:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOax-0000000FFsh-1h9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733930747; x=1765466747;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PX0Dak1GrNxWpNhFmQrRSn4HhzzLwAXXKZWfOHdy07c=;
  b=TbYcAdY3tKmudDYCfKe9oXUKb4pswZN+fxPDCrJwkG0Nw4+oLhXQUS5l
   GBYAhHExNXhaKlAiPKTBFYGHlK9I7RM5fZyQv69XcfBo54E+lwWzttD2b
   oWy8ds9COVH6EQORlXogSzIyfHRMF0agr739sHbls92zRwvKOI2bNLfJd
   Pb1TK3RoYOpsR/m0vPozy5wgDRSPUm0F33PklWtSUoHmfN2UF+n2MuPSM
   A/f9sy+23aeW2fxhgP9VsKSgG3hbkg4KC11OERwY3Q07w/JgFIWApbMRw
   1FAWoV1aXwltIbNqdcQt6HrBtzJly8RZgpvrmsGW/J1guUufM4T6hl0hX
   A==;
X-CSE-ConnectionGUID: qgV54QVtS8C7rcxkisT06g==
X-CSE-MsgGUID: PyP866H5QiSc3zjJIIYzAA==
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="35876300"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Dec 2024 08:25:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Dec 2024 08:25:31 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 11 Dec 2024 08:25:31 -0700
Message-ID: <fb11338b-986f-4a9a-a0dd-e8f4e63941aa@microchip.com>
Date: Wed, 11 Dec 2024 08:25:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
To: Rob Herring <robh@kernel.org>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
 <20241210164638.GA3770349-robh@kernel.org>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20241210164638.GA3770349-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_072547_517834_F4B50359 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-spi@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 12/10/24 09:46, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Dec 06, 2024 at 12:59:52PM -0700, Ryan.Wanner@microchip.com wrote:
>> From: Dharma Balasubiramani <dharma.b@microchip.com>
>>
>> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
>> since the SAMA7D65 PMC shares the same properties and clock requirements
>> as the SAMA7G5.
>>
>> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
>> the clocks property for sama7d65 SoC.
>>
>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Missing Conor's ack.
I removed the ack because I have changed the original patch that was
acked. Should the ack not have been removed even though the original
patch as been changed?

