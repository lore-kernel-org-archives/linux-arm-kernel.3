Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF613CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSlmjzGGVUOZJIl/wxQDRj8Hhxo+nr4fa4rHU2LMt4Y=; b=aZvE8ytuRUstekiod49l+TzoiK
	gdOf8LNSnf6/AelAJRf8Yc4DtEHMl6SGGnh3S0fnMK9AvZsDvRdsEHaO6WX2pmtzs0O589LZm7kQP
	77sqU+ntqmPFGs7X6ZjNmfycXQ04w0uCe8Ht0WzzPurhnqMnO5nSqHEVyC0MZUZ43fgNoT+NKPz47
	t8ppEfFG0Nt0I+bncg5+aFuq+I7Gz4f3Q3DMYTXHTMxDG9/s21JXR11VeeZMt7mKs5tPjXmHN9h6p
	WoD9c0+Yxdu6v5rD6IRUacqOPXCQXcGh5qgcmfVSW2ak99wo/N6sKLAZIieW3FcVQIWrg9KxnGlKH
	1APcjItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLX-000000010Ql-1H54;
	Mon, 08 Sep 2025 17:08:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvai3-0000000GvIX-2JK9;
	Mon, 08 Sep 2025 12:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757333457;
	bh=eA5IKwm86oh4IC1IXrQrqhzod5aEjDjQZFgET/xLfw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HvgEiEVxha2G4nrYPRMoeQJlBcWs8at9+NXvCVaPZtv2CB2svqxMXSqSskJ32glJF
	 CjMMFTIwdNUyKVDkDBzMLaKu1lWHHhRfzID5rakeRs6DDtKx7pW+RMhgIxmZDSlgai
	 nWqXObB9X8B9UUy3WyZsTLtBkk3akgoHSC/iK1FJ39tptv2eF4nhVPSXr7NWpqfPVc
	 bozlTu4kwTnxat9lImfqN7HGKaPlmOob+uB+DVQk4v1dCh+mFiVTYgqBt1aEadZSOK
	 YN9EUWoUdrPeXBTQ/7wpKPpDs78SOVO7Ul9/QiZf7bnMDt5RLEqjyKW9u+Kd42YC+R
	 uuCa2NDDN6bKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 241BB17E00A6;
	Mon,  8 Sep 2025 14:10:57 +0200 (CEST)
Message-ID: <aded7865-870a-4ba6-82b8-459150b7d1c7@collabora.com>
Date: Mon, 8 Sep 2025 14:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] initialize vcodec scalar variable
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250907093557.8008-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250907093557.8008-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_051059_769817_C9644225 
X-CRM114-Status: GOOD (  11.59  )
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

Il 07/09/25 11:35, Irui Wang ha scritto:
> Initialize vcodec structures:
> patch 1 add missing initialization to fix the encoder's UNINIT checker
> issue.
> 
> patch 2 converts memset() to = { } for other vcodec structures.
> 
> Changes in v3:
>   - Converts memset() to = { }
>   - Combined with Qianfeng's patch as v3
>   - Link to v2: https://patchwork.linuxtv.org/project/linux-media/patch/20250715081547.18076-1-irui.wang@mediatek.com/
>   - Link to Qianfeng's v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.118892-1-rongqianfeng@vivo.com/
> 
> Changes in v2:
>   - Add Fixes tag, update commit message
>   - Remove unnecessary memset
>   - Move memset to before the first usage
> 
> 
> Irui Wang (1):
>    media: mediatek: encoder: Fix uninitialized scalar variable issue
> 
> Qianfeng Rong (1):
>    media: mediatek: vcodec: use = { } instead of memset()
> 
>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c    |  3 +--
>   .../mediatek/vcodec/decoder/vdec_vpu_if.c         | 12 ++++--------
>   .../mediatek/vcodec/encoder/mtk_vcodec_enc.c      | 12 +++++-------
>   .../mediatek/vcodec/encoder/venc_vpu_if.c         | 15 +++++----------
>   4 files changed, 15 insertions(+), 27 deletions(-)
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

