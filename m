Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81740E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExR1nyq7hBsZlYXzd3B7x0D9vyBCZuw/YG6xVoRUe5U=; b=aZPs9huC8V41pEymwukpD5K3He
	J5hUwo66xDXb7uuaoSK8u4nrpG+EOZotgbFsh2AVWCdudelVQOWLX2NVy/pXMViPstgKZwrsfANSS
	/mRqZAPVS1zU6T8Ga36ZHj4lucsqoS+eM7m//zBCDIgYOkXo0lFuqVLwNhzqKi/F1Gv4qznye68HJ
	EtYB695tuH1OeamF4gkigwKDRBZ2nnDz/xwG06cUnUcAHaGSZ+Se8NhCzuZ8bgwDO3CTTL4Y6YZia
	R9xsfWH7rwsSAkL1teNG/ly4yKLkJ6kOtGmazW1Su2o4ZOAvXzj/RTpxdZf2lExbC6RE8sajP9ykA
	yKGpyYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwrK-00000006SQY-4B4Y;
	Mon, 16 Feb 2026 11:33:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwrI-00000006SPk-2fW0;
	Mon, 16 Feb 2026 11:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771241621;
	bh=onTyZagYpAPjiiOZuy6MDCXz/JCQKAyBYFGyzLZzLvw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kX93qde/2AGQpxYE4XsVcgtKBFHd2odwj54axOcPaJn8lH5LzoUWBy9va68nieeGL
	 st8DAbsV8+1gZXyLvwEOuO9eGmgXeCVPpqL09fLA0sNMoGscCZi8mfyoNgSR7J4Cqr
	 9hV8N3qFiyhH6GsO2kMOeH/CPcd7RcHteDX69oxzztgDmDtfk82HlyMTXQ79kSV6fR
	 hL8SnaIxskTYKK+Fqkx0A1KD5yIVES8vImsdgCP0w3073X3PZ6VaDmE6INjiIp2bvI
	 xN47yJb3drwTEFgYR4hRpmGIHpWYfrpsDuDaIHNz02NI8U7fRkHN8aNL437B6yqsbl
	 3oWfpQiB6miCA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68FA917E012E;
	Mon, 16 Feb 2026 12:33:40 +0100 (CET)
Message-ID: <b42a1da6-110a-4bd5-a4f1-23c3f25e2a17@collabora.com>
Date: Mon, 16 Feb 2026 12:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu
 nodes
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260215100302.136719-1-work@onurozkan.dev>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_033344_827737_D929C628 
X-CRM114-Status: GOOD (  13.15  )
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

Il 15/02/26 11:02, Onur Özkan ha scritto:
> Some arm64 Mali GPU DT nodes define mali-supply but
> are missing sram-supply.
> 
> As discussed in [1], sram-supply should be explicitly
> defined for all relevant compatibles. If there is no
> separate SRAM rail, it can reference the same regulator
> as mali-supply.
> 
> This change adds the missing sram-supply properties to
> affected DT files. This aligns DTs with expected regulator
> modeling and avoids relying on implicit fallback behavior.
> 
> [1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> 

Sorry, at least for MediaTek, this makes no sense. The SRAM supply on MTK platforms
is managed by the mediatek-regulator-coupler driver, as it scales in a peculiar way
in relation to the GPU core supply.

Besides, you're cloning the GPU core supply to the sram supply, which is, well,
simply wrong... and you're changing devicetrees of SoCs that are running on
panfrost (not on panthor), which will anyway ignore the existance of the SRAM
supply.

That's also going to give all sorts of binding warnings, I guess, but I didn't
check anyway.

While the change makes sense, as in, I agree with Mark in that the SRAM must have
a power supply in order to actually work... I'm afraid that what you're doing here
needs a bit more work before it becomes acceptable.

Especially - faking the vgpu-core regulator (not just on MTK, but on all) to also
be the sram regulator leads to confusion and is, well, plain wrong.

Cheers,
Angelo



