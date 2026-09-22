Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7845CC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvLBNlT+tYxltY75wE2DJhASSro9Tv4AmA54gwbSbpE=; b=TkfrtMi9QwVpUm/d1KiriXUq1R
	M4HsDw/2ka6LlZ9ODs16ypVRymz7GA2g/YetWnuZCwhxWm1o3v3kbbxtvG7ZBC11S7grxn5QPVJ+j
	sA/jsX/ageiHPEQwrOUp2A4GVCYqHZk0IhjJGKnGnmIduTefa/zRcSjw+ZtkMQOYtMxGGGEQ+Ct3X
	dmyNSM+2diO8X81yXFn3jIEOzCKKeuIh5xf92A/TlQGL1HQjN42cLttjFiSkpF100iJoSTB/tSno2
	I/mM3Y7gd5TvRlm1rjg8Jx1NVX65pBq4lnwdOUvoe1GAF/VR7ROAO8HDePdJyuFWdR9JayumEg0mA
	AYETrnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yrI-00000005CYa-1Ye6;
	Tue, 22 Sep 2026 11:40:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr0-00000005CAm-49wc;
	Tue, 22 Sep 2026 11:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=SvLBNlT+tYxltY75wE2DJhASSro9Tv4AmA54gwbSbpE=; b=Txk62y+5OEtyFZhz8v5V6pUVOX
	7pssijlYYppbQ9HvGxbfrYhZZ/MFQWPAUNN0FUNDL64E19Han1X0zV1ctgUonbPSwNPT6MVK0YgnG
	n+sWPgBOJQhX5GijHiufVTHwSsJON+92aEZm2Ag2Ucdo+zQq3vmz2CqZ3BLcgw38Jhp66BQJ2eBmM
	U9HLeYDcyl5qWwCF21ER9fSkGwJINS/oH4tYB7OsfRo8KjKu8JsNUyVNHkjPiE61dSThaVMB77pHY
	td8/lzh25HHNg3FsVv7xGJU2PrbfPHDnurPyW9ZyNrzD4fY5b5m9iEHLaEPoxlWpdye8pF1ygMLl+
	4RQlICCA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yqy-0000000DV91-0wM9;
	Tue, 22 Sep 2026 11:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077202;
	bh=FQNyYELQWOZqqSIXXBpLYWmzFgTJEJee+pRKGcizJ0E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YtTGMFvZt32FR2ik55eJTZB7cbefvgxGu/0SlyEiF1Y7UFrlkQN23qA9fiOr9aqbK
	 9n0RprEcLFyaRrQO/5SZHuxLKzEZZBrugARQxcQnByCjOPKJpMdAyUNOHT3KimKIVo
	 HFbY7TfkRlnubhwpIIw9FnU2GbXhTLDaNWmUI1BQBQ7tE6ruldD4LWshFAnyp/M7TS
	 gqnJa+DTf4iNlyrsVK7MM57RCMrQlSkKo/LFeVxD1PsuXWwHG+lJcmzL3EeGRswXRy
	 dyjsJYbcpiHJp/x1JT/bbRUD3C8grHpnJErGsxt88MpWxD9nKiCSzO5JS2Ai8P5Srj
	 azhaGnDWTp1cw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B6A417E0FB7;
	Tue, 22 Sep 2026 13:40:02 +0200 (CEST)
Message-ID: <f07598eb-df4e-4766-953c-0189940d3617@collabora.com>
Date: Tue, 22 Sep 2026 13:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 04/12] media: mediatek: jpeg: Fix buffer completion on
 multi-core streaming stop
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-5-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124004_418740_A47EB968 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Enhances the Mediatek JPEG driver's stability and reliability by ensuring
> that all queued buffers are processed before stopping the streaming in
> multi-core environments. It introduces a call to
> `vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
> `mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
> is enabled. This change ensures that no buffers are left unprocessed,
> preventing potential data loss or corruption during multi-core flow.
> 
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


