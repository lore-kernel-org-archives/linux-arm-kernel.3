Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A88DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3ch7xamCbyea4JaVYKV3Lir+DoV0VKrVnNbKEsep+M=; b=Yx92YHuY1twSaZdbfVzia5gA+f
	ZsZl3OGeqnBxPc4aHlTTkmkoywloOR+43QTSny4RHGmaBGbC9OV7z6osYveAePaTfeH9auRm8vCT7
	MldARQwPyreGfRLQuDcZPDqWlIWO0d8ORRxvhPA2oIkpQI4NuUkNXcIuR/qFL44BkfOu6MJvzY91D
	r8UJfD4zb4ddHNwG/BPkU+5VTe5yhqGHo0Dc0HnaN7iRekqv6JF8wHeC8XHtDlnOgAd4qr4/GQ2Ci
	d8+nOGTkCRlpU67PYQsTcScMfZQmkrOT5qanrmZx1L4ydlLrO4H/SHj+Loj4oxXFkxuWHXoqXSmoB
	QzD4EoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjRQ-00000003JJJ-26W0;
	Mon, 23 Jun 2025 15:50:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgBX-00000002f8Z-2zuh;
	Mon, 23 Jun 2025 12:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750681322;
	bh=BX3kWGffKwR8jKbbugtulEnXj6o/sd8kiTE3A0kY6pg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nlCFAT4qrsm8CJbwA6C9jm53wiNm1n1d/wI2w8xmVhuIRTPHk06c68q4u4nMFKm+n
	 T3RYFwA4sQatd9lOioQGhKgiY1kRNkjFqN0DkadumCvSCKtFp7vJlLiY0jZQ/GFYCv
	 OwHXaKXhfzxdmTtDvbg6qySKVx/CdGeM8Iwr9Xkm8unsdLe6M4pA/Hruzscf3CA9cv
	 Y4MiotqPf3FEuQUFRYKDrQPakNIFMHv6VxGBm2NPrqqEkTgE5+P9PAuOwa+9sEkYnf
	 0mzckR8pSS/VBtF4pEVra+r4X4uVNfk62V+chyGPdfeaYHRSgpUrfprijXC6tEvIqn
	 GkpvbbRQMwTmw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1349417E0FDB;
	Mon, 23 Jun 2025 14:22:01 +0200 (CEST)
Message-ID: <dfbd00bd-37bd-425a-aa98-e536b2a3f2d4@collabora.com>
Date: Mon, 23 Jun 2025 14:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/30] dt-bindings: reset: Add MediaTek MT8196 Reset
 Controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250623102940.214269-1-laura.nao@collabora.com>
 <20250623102940.214269-30-laura.nao@collabora.com>
 <2bc23bcf-0021-44dd-ae42-9ef0e95e3b32@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2bc23bcf-0021-44dd-ae42-9ef0e95e3b32@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_052203_903400_FB1D0499 
X-CRM114-Status: GOOD (  11.68  )
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

Il 23/06/25 14:13, Krzysztof Kozlowski ha scritto:
> On 23/06/2025 12:29, Laura Nao wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Add a binding for the PEXTP0/1 and UFS reset controllers found in
>> the MediaTek MT8196 Chromebook SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   .../reset/mediatek,mt8196-resets.h            | 26 +++++++++++++++++++
> 
> This belongs to the binding doc.
> 
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h
>>
>> diff --git a/include/dt-bindings/reset/mediatek,mt8196-resets.h b/include/dt-bindings/reset/mediatek,mt8196-resets.h
>> new file mode 100644
>> index 000000000000..1a01b2b01f7f
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/mediatek,mt8196-resets.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause) */
> 
> Wrong license, use standard ones.

Oh WHOOOOOPS! No idea how that happened.

Laura, can you please change this to (GPL-2.0-only OR BSD-2-Clause)?

Thanks!

Cheers,
Angelo

> 
> Best regards,
> Krzysztof



