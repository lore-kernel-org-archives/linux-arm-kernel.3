Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D173C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YvSKUk5v6EFDKQLEGztTw1EfOLgqPgtPZVAGwGdWSV8=; b=4wrWbl2q3w5FqpeSzRV6j9GVWE
	Z0+wFm1HDJPDfU2P7oWM20hiH7B2H09yzx6V5CKstxHt67DyuJxZP7U7qdpzZZK2+u/fS+kLrWUL/
	/YhgxUWo5igZ50LzDDXccg32iHc4p6mQIRhYDeIugvIJDoeFk3WtW456+1bmuz1CZr0fygsEXezbV
	bZTXPHIYyoDn2fJWWD0P+mlvBgm4UTwuW7z8d8qsJIczr4dbyP+I7qu2sz1KSms8DrNkfAvPDmNRA
	61AfjqeptPW94ppVnDcRvhvkBnPycdsX1CyAM/spdoAprneB8E83tn4buTP040oLxGr1qSKrU0hFQ
	FlXOH2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGBc-00000008DjL-1dGR;
	Tue, 21 Jan 2025 15:29:04 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taG2Y-00000008CPF-2Wm9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:19:44 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 341A5A1398;
	Tue, 21 Jan 2025 16:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=YvSKUk5v6EFDKQLEGztTw1EfOLgqPgtPZVAGwGdWSV8=; b=
	EDYM4KaCJlzn5nU9DaE4/F2L53G9QcUJe5kNRIsYjfViLqTIbit6OzIbFGniH+LF
	Djy9tgYfH5znDGs/uz68zNkaNbcP1FHKRRnc/DYOzr7ajZWphvK+vZ3Mik3DDhFg
	iCxjDhcmC0tL4y7QtgcuKydotWHPllcnh7IdbPDzgr3ki7tPuvBgpF3jWcC42IBe
	UqaVatbPIVtT3pJIhlxDeXqew2mas2O4YHMpo4ahVaeOnzFJuVjlx8SINHN3aDG5
	fIC1tOzBpkAv87Dj6C2pQzPxExAyWbppKWZRsMDBG7ZzaNu027OwXqU3885gpcuA
	9VIE7NXepx/qdYuTRxOedmGVbfQMhllfsZcBVEl0ovkzCUU9dSytbiAGJNFO7IU7
	QA8zbjBWySvbXhPI2cleKV7Wz3YIpEBH5N2pmmjdqLcXitjWLkeDKOuMLU6kds9l
	Gc+DUI77fjTqcfNZBIvC3Iy6U8Gbgg0ZW1qadfMlC+aANiYqfOWiP4+lbAlPQx9e
	cOL2rlSfNV+0BdfylzzCn9sqbpXRQHJDsVoDMyEPCxfAA68fIzxvar7LIyVnyypj
	t8uzptbHQIjMBmFVhGHDgYet6xErA53fcjR3hj0kLs0AHBvQh//J3H7/YtqPgaSR
	GD21DQqFvLw2T3IsR5esHk7KEEz3aGciGpU0dvRMJMc=
Message-ID: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
Date: Tue, 21 Jan 2025 16:19:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<timestamp@lists.linux.dev>
CC: William Breathitt Gray <wbg@kernel.org>, Jonathan Cameron
	<jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Dipen
 Patel" <dipenp@nvidia.com>
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: [Q] Frequency & duty cycle measurement?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485267746B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_071943_041427_CE062CCF 
X-CRM114-Status: GOOD (  13.67  )
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

Hi all,

we want to measure the frequency and duty cycle of a signal (relating to 
power consumption) using a hardware timer in our SoC (Microchip 
SAMA5D2). The hardware is capable of taking a snapshot of the timer 
value into another dedicated register pair (RA, RB) on the 
rising/falling edges, and a small `devmem`-based userspace utility was 
created as a working PoC. Now we want to move to a "proper" kernelspace 
solution.

However, none of the existing drivers seem to be able to do this; the 
closest was `drivers/counter/microchip-tcb-capture.c`, but that only 
seems to count one type of edge (rising/falling), and cannot give us the 
time between them, which would be needed for duty cycle calculation. The 
only other driver I could find was 
`drivers/clocksource/timer-atmel-tcb.c`, which again seems incapable of 
such measurements. Therefore, a new module will probably be needed; the 
question then becomes: which API to implement.

As `microchip-tcb-capture.c` uses the Generic Counter Interface, that 
was obviously a first stop. However, from what I could see, you can only 
represent (1) the number of times an edge has been encountered, and (2) 
rotary encodings (quadrature and direction-step decoders); and not the 
time between edges.

IIO_ALTVOLTAGE and IIO_CHAN_INFO_FREQUENCY/_PHASE also seemed promising 
(although the lack of IIO_CHAN_INFO_DUTY_CYCLE already posed a problem), 
until I saw that all current drivers are frequency *generators*, and not 
measurers, the latter seems to be completely unimplemented.

The only other contender I could find was the Hardware Timestamping 
Engine (HTE), but again, it's not clear whether (1) the API is even 
capable of relaying duty cycle information to userspace and (2) if it 
is, how would one go about implementing it.

It is also entirely possible I missed a driver or API that could handle 
this better, if so, please don't keep it to yourselves.

So, how could one go about implementing such a driver?

Bence


