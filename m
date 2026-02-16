Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F2BE7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YIph1E8L/7fUEXqWGYhs1V+S5rQVJN75jjkGKNtSzY=; b=a+mHIBanwE6XmYLeR3ZY9N+Wsb
	TMZYB5tyB6XGT1KY7qgC+fDKgjT+Om26qP/02b3MmVE+QJprLfsHjkLo8KriA/vNBBwLVw6XWvoQ/
	3rpHISQioeJFhK/5uAB1r8LzDwBUgnk2xlgsZWIWe+KlFoFVOBcK4J7SgS8qoZDgnx7rH6EDzZkJW
	cGIvLGuzzIdPuzP8UCb2L0O4faWip7oqSErXqjoayY4Gq6oTBFeGHHmkp6laWoRz4rU7Swguz+ciJ
	C3ecNZ/h1/+NShHbS0eqRN6ALQHyRitd5yIQlPFPl9pQsRGWAIe1TinVEXdrjGUyhMMzpuoEr1KBn
	kCtqSDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUN-00000006Q8r-3ZXK;
	Mon, 16 Feb 2026 11:10:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUM-00000006Q5X-0YdD;
	Mon, 16 Feb 2026 11:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771240199;
	bh=sCZrJe2N1E9E9LthMI52+hNoQJKSLtft1Rg7Fpw95Dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YsIX8Q4ae3YAGnsjhw4qvgaV6dsDUXEwUzvIC+1lmLR+qhTvvoPc5KWt+NwjX/As4
	 NNgub2ObX+qFycnpGceBPgr/lrH3e9M0OFmu8o7l+pvkKXKPL7X3ailzrNB9wbWe8/
	 nJEpQ0UswCOLC8eHPtSnppO18QZH8nLBYNaNTz0te+HzjTAZEFFAcFccbwg5aUJl7v
	 t4HkSWOajSwwAy5Jfx3kUOhySjZWwMkVhGajZLh6VAWFb+vPaDNeoW3323o52HL2gn
	 JZmIU5980Rxn5uxTnfbrcsnGovcidif0amqzSBAFE7IZ34j3h7ocu41MrfKqpfKrUf
	 KxeU1HFzWj8KQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5512117E1553;
	Mon, 16 Feb 2026 12:09:58 +0100 (CET)
Message-ID: <3629cad3-b0e2-475f-8bc0-d93765316077@collabora.com>
Date: Mon, 16 Feb 2026 12:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mt8167: Reorder nodes according to mmio
 address
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1771144723.git.l.scorcia@gmail.com>
 <b7d7c27dda4dc1779425c57d187b84abaf6a1093.1771144723.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b7d7c27dda4dc1779425c57d187b84abaf6a1093.1771144723.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_031002_342876_41EF388D 
X-CRM114-Status: UNSURE (   5.75  )
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

Il 15/02/26 09:53, Luca Leonardo Scorcia ha scritto:
> In preparation for adding display nodes. No other changes.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

