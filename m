Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD249C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaUgv+JLZay3Y2F+/Ogkx8/sFTrHyxh+hSqyOgzPIyM=; b=ORMBmHFyXNpPjMH8vIDqJE+mr+
	kYde2AnJclc2uN+qUIY7TiWoOz12JwnE/OBZ3fAikVI9SzoPYIZ2D2BiyeSaNlAmVwpdfuaaEY2Pr
	U8Y3eh2zlyENaTYMdjJsy2clHkS/8YohPvuuOADnD25jJItXeJpBHyezVmKdazmg+/9g7Wzs4hwZa
	av9/S9wCDfre/reXB6YXR0JGLVfdWrP18YIYql3hEs5r8N7U7Ioa1QkBgFDph0mLejuV918MmVHQa
	+zur2hz92r+2iVyrfafye7jLHmyYpOaQDF4TRCP0X/ZmQFPmyq84mRRNcP0suXm9LjyQVPKP30WTI
	nsrNrrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWpc-0000000AC2z-0SdB;
	Mon, 12 May 2025 17:20:48 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWQ1-0000000A7rZ-0LlM;
	Mon, 12 May 2025 16:54:22 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 0890510086D;
	Mon, 12 May 2025 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747068855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qaUgv+JLZay3Y2F+/Ogkx8/sFTrHyxh+hSqyOgzPIyM=;
	b=M5CVNodRKZjir1J12a/+f4bPxrmlXKe+6XYTWLKNXH5uS1JBs6n50QRnLG3JXxJkWmz80B
	2u2qGbDAMEYv/GIm9WD2mBhqQdAddXdqycGfZfZQii9rsyURYsDYJG2yvJchoXa47CMjhu
	+FPtCj4pyNJBeIqwSAAQGyEYQ1ibYOA=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id CE4D51005DA;
	Mon, 12 May 2025 16:54:13 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 12 May 2025 18:54:13 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank
 Wunderlich <frank-w@public-files.de>, =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9C?=
 =?UTF-8?Q?NAL?= <arinc.unal@arinc9.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 08/14] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
In-Reply-To: <78abbdb9-70d8-4e53-8593-91735cde73ec@lunn.ch>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-9-linux@fw-web.de>
 <78abbdb9-70d8-4e53-8593-91735cde73ec@lunn.ch>
Message-ID: <acc9ca84eadb1f78308f0c3e2b527406@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 59e01210-9a66-4032-a58d-f1ce7445dcb7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_095421_284017_5E8CE453 
X-CRM114-Status: GOOD (  10.25  )
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

Am 2025-05-11 18:38, schrieb Andrew Lunn:
>> +			gmac0: mac@0 {
>> +				compatible = "mediatek,eth-mac";
>> +				reg = <0>;
>> +				phy-mode = "internal";
>> +
>> +				fixed-link {
>> +					speed = <10000>;
>> +					full-duplex;
>> +					pause;
>> +				};
> 
> Does phy-mode internal and fixed-link used together make any sense?
> Please could you explain this.

Hi,

the fixed link is used to bring up the mac and switch cpu port up with 
the right settings.
Of course we can hardcode it in driver for mt7988, but driver already 
supports the generic
definition via devicetree. So imho adding driver code for whats already 
supported via devicetree
does not make sense for me and devicetree shows the right settings 
(speed,duplex,flow control) without digging in the driver code.

e.g. we could disable flow-control there (but it causes retransmitts) 
without changing driver.

Imho this is the cleanest way without adding unnecessary driver code and 
SoC conditions and
devicetree describes hardware ;).

regards Frank

