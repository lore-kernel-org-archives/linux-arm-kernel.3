Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2359106B53C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/uWIVCsHM3OuV687UGaxKwlFpK8BmL0FOzKJeyrA84=; b=d77byw4wx1005vah455dA36Lep
	eXQrEdYeTAXeqt8vS8SrcnCBICEm+ksRtteORJlsxHPaolmZeNT7M808XghuZgTwS2RFtlTkt97xH
	qDS4JSGvJEia4ADvcfaBWVjSXQUgepVA5mCae+OiqMQuEtjERwEUE6+sXH1rOrcCXTzqH3Y2YDcKQ
	S4C6NjTmWRFam8sGFPAIIca+Q+C3AIk+zGC62gt+aN4RF+y6Cw7IbrVZ14DXwwYYjfKWpKO0Lgx5B
	sUXf4FIDyqj4eq0q3yft01j2418mBjofHQqEKkRCATtQ7CdWKmRNxoW4ep8m7ntiBpZ8p3cI+Rw8K
	PJvOZK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OVJ-00000003UF1-0Zdc;
	Wed, 25 Mar 2026 13:42:37 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OVG-00000003UAz-1ByV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:42:35 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fgp455J6pz9vD7;
	Wed, 25 Mar 2026 14:42:13 +0100 (CET)
Message-ID: <ecbbfcde-7f51-455b-bb54-b5302e43b582@mailbox.org>
Date: Wed, 25 Mar 2026 14:42:10 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex
 MIPI-HDMI adapter
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Scott Murray <scott.murray@konsulko.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8rtm93ju491ad1x3sjgu8jiqyor49wpx
X-MBO-RS-ID: bc1cffd0535c5fa0316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_064234_495714_35A7A2A4 
X-CRM114-Status: GOOD (  15.30  )
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

On 3/25/26 2:32 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Fri, 20 Mar 2026 at 03:53, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>>
>> From: Scott Murray <scott.murray@konsulko.com>
>>
>> Add a DT overlay to bind the Olimex MIPI-HDMI dual-lane DSI-to-HDMI adapter
>> on the Retronix R-Car V4H Sparrow Hawk board.
>>
>> Current device link is at https://www.olimex.com/Products/IoT/ESP32-P4/MIPI-HDMI/open-source-hardware
>>
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
>> @@ -0,0 +1,94 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +/*
>> + * Device Tree Overlay for Olimex MIPI-HDMI adapter connected to J4:DSI
>> + * on R-Car V4H ES3.0 Sparrow Hawk board
>> + *
>> + * Copyright (C) 2026 Scott Murray <scott.murray@konsulko.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
> 
> This include is not needed, so I will drop it while applying.
> 
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.1.
Thank you very much.

