Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD1FE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyAWCHGRXlZ6kB8KVKpfFRGOj7nnQ8rJQbzL7VMShfg=; b=GOhM0hfYZHpJ/1PCPAhV5hoVUB
	YaTRiwZJrSjxHABvDIL0Wh56I8XCRpTxSHNUateJBsZHsTqsxwAjn5a8c990nEH2ht8+DyI6Nhy04
	qFPp9/xN/TRcTl7opzKraMFPJzmHz3CRabsKg0lH7Y8jeW/5zMDHd0tpYjcWBG8T5AY0y4XK3crHY
	XMyjuLZAen9HZOdhoZ/9PcoTOoEDCFISEpXyBslEbJF89NEqziEA8aX434UZdUi2/8OOwIeoQ/QYc
	CutuHIGIXVF3EyENSBz2B1VPPmPML0Zz0rruPRkq63MZU36h1krky2pLB+v0o1VCKmlSivGHJDvn/
	l0hbf4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgbf-00000009tyV-3Yg8;
	Mon, 23 Dec 2024 11:28:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgWJ-00000009tBK-2Qbr;
	Mon, 23 Dec 2024 11:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952961;
	bh=iG8LVexyiQx0FY+OVsLXWZDFMOKx4KXIDEnoHn8PVCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OncdMRtOPQul8mFceA4kqNvG1Nosls31I4H5l2aqGVpNXuThnqD8QYT8WBnsBzpV1
	 jFsO6JdeEskOsoao8+wdbzYOQnA/R9nLn0GS640D206NSmCmU+d73PILoI9w5GviHv
	 1EpZYqSOHdAN9EUwB3qXCju5J+7dvF6QCTQb8TtvcRuGxeCPftp5hwKUS7ixadndDU
	 DIbHRaVCG0wTx/AmGjjy6wD10gPsw3qbWMv25FhZTiaeKERSZM0m5jcWEmaX3k0JPv
	 BSZ43MSv8nuao169UsDtJpuonRtY4zlvs7JPMhzFFlOv8f9PmR1fk/ldA3BG4nc+Tv
	 rcpZ+4p0lqjNA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A520417E366D;
	Mon, 23 Dec 2024 12:22:40 +0100 (CET)
Message-ID: <d7a8cb14-ce81-4f1d-9f64-a29348776170@collabora.com>
Date: Mon, 23 Dec 2024 12:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
 <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
 <9a75e88c-d90d-4ea8-b5c3-6d056d4f0498@collabora.com>
 <425fd1b0-fcba-4547-81f6-84acee5ce7f4@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <425fd1b0-fcba-4547-81f6-84acee5ce7f4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_032243_796309_1C553531 
X-CRM114-Status: GOOD (  10.52  )
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

Il 21/12/24 21:22, Krzysztof Kozlowski ha scritto:
> On 19/12/2024 11:54, AngeloGioacchino Del Regno wrote:
>>> hdmi@
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Thanks for the great review krzk.
>>
>> I was wondering if it'd be more straightforward to just send the bindings in a
>> different series, instead of sending another batch of 33 (actually, 34, because
>> I forgot one commit adding the DDC binding, ugh!) patches...
>>
>> CK, any objections?
> Maybe just wait few more days for other people's review and then send v4
> of everything? You can split the bindings separately, although there is
> a risk we will get confused or we will forgot why they got separated.
> 
> Best regards,
> Krzysztof

Yeah okay, I didn't think I'd have to fix anything in the v3, but apparently I
was wrong and need to push a v4 anyway, so.. whatever.. :-)

Thanks btw

Cheers ... and happy holidays!
Angelo

