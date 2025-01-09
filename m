Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DDEE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKpnnZkZWnc4QEo9RGmqWlKte7CifZ1AXugiy+8RVtA=; b=tgXH4yPC6Z62Z7SPGrtZFsfZje
	yC3lDvxlgO45uEccww7hfRyYK3uA+HoCx0RPvSO/iN+9E+gI1dyhJE1F8jXzHszORVYG3OHVEViH1
	sL4BCfgLf6eKuRsJQ6yuFDz63kSH1aN+xnOC4BI1Kuqfs5U3HgkEbHd+7jcGH19+nHMU4wpiqT/un
	9fR71fCmPSPARk7uDOvuA5pvxuxySdr9xC5UH6fnrkxPxQSp1zeisX+qE+HlD+ArpXIPLm7d3zA5c
	1/553tw2V3qV7DQhSzOu5rGX0D0IzeFIha+2GQ77La3AlnUeMocDV/Fy0Oy3HXFwkZffb0NjAWVQ3
	AiO6I8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqS2-0000000BfLk-2doE;
	Thu, 09 Jan 2025 11:11:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqMd-0000000Be94-0wc0;
	Thu, 09 Jan 2025 11:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736420769;
	bh=3EohmzamWFZhxCTdtmF76ejzTHNzw1Zt3xIVwB2wX44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HoikOfyysXvuN18HEXmzKd+ZzscVgzfMumm2NOPMUpwMfgid7uKPJOd8E4mN2C7zu
	 Ls3vKpF4Rq1OGdoJBoXL1hlE6HCq4JTRNolv+CUCyiQejm7QkA1tZAL6eRv9qHpjaz
	 MCi59+fpss28gnwnMD/Npz/rLdJliEvMiLa/UFIKFyj7I98tYYoHcl7Bz/LA1QP2ZY
	 uLfpDUMNO43HY6UuUqSxv7VySk+rbSiy3BNlGtw2tqhyN1gElXswzvoBniO0WNoxcc
	 5I2xSVaoxBKl0K1G8/D8UbTMh+JByimAh+f0eMnwp/viI8XBbRpjmiRBSgnfJfeGm7
	 UxDAEep48PCOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CA3717E1567;
	Thu,  9 Jan 2025 12:06:07 +0100 (CET)
Message-ID: <4d5f2ea2-bc3d-4228-927f-28cc8785644c@collabora.com>
Date: Thu, 9 Jan 2025 12:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-5-c6af4f34f4d8@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v6-5-c6af4f34f4d8@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_030611_415115_B92261A6 
X-CRM114-Status: UNSURE (   8.69  )
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

Il 09/01/25 11:37, Alexandre Mergnat ha scritto:
> - Add aliases for each display components to help display drivers.
> - Add the Display Pulse Width Modulation (DISP_PWM) to provide PWM signals
>    for the LED driver of mobile LCM.
> - Add the MIPI Display Serial Interface (DSI) PHY support. (up to 4-lane
>    output)
> - Add the display mutex support.
> - Add the following display component support:
>    - OVL0 (Overlay)
>    - RDMA0 (Data Path Read DMA)
>    - Color0
>    - CCorr0 (Color Correction)
>    - AAL0 (Adaptive Ambient Light)
>    - GAMMA0
>    - Dither0
>    - DSI0 (Display Serial Interface)
>    - RDMA1 (Data Path Read DMA)
>    - DPI0 (Display Parallel Interface)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


