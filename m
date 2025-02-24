Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B39C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCRuTgaqAyC8KMZj1w0hz92m5LH4684utECNMavwboY=; b=AJ8Q54E8qy1Xvrk26qtmDhxGu3
	UIWctLlObbkX/1hlCirNC5BqWoeGakD5EYmycnydcvW588VlbG7JGh4t91OJTbVeusDchDEKMhuGe
	ne2nPZa0UWewNyj8nms7dtgD+4JVVeGY6jGokEbi2Aanw1IJOnReShufXR05rKAcMZZ4HiDJ8U03I
	yuZOy8ONahi/ezj6ey2IrbzhbIIPvOHq52y9bEKPrHjIm40jb5F8sf0r/nQxAyadqJWVjt5o+bOVw
	KgYD4863pX1iIQKioGv7ktPHBkaKnu8N11GSwwk6xXsnzXABYIlueDabaFFbVbeWP4d5p1N8L5u1x
	XMY783cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUNk-0000000CoIk-05uy;
	Mon, 24 Feb 2025 09:04:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU2b-0000000Ck4A-04df;
	Mon, 24 Feb 2025 08:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740386535;
	bh=9X/bnnLfLCtEqjesJ0RZJAqSE1C/0Bz3YFO70PNFU1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LkrNPd3Pu8wqr3G74Z1FTKI+FIM1md4HzmySQQfWtKl4XcyKCVbgnN1Hn4BrRrMSN
	 qmOYmBHwZ2dSBrpZ/reWn9yGiLTexKaQzqiX9L669o2p/tVMVFRZaJXD91r3VB07K4
	 XI7EhGQbF0Lb0gooQu3IWMpARvnNSUSoEPVGuQj3yAZCDqcUWXGaF02EPqW8qk2HIz
	 z31QNMbzT9mxYKVbngel1/mZHIR+COZkwu0DrrBEULDG23J2PTJPsvOSQgWghAenGy
	 CAugEFjPQadAX2ADWep+L1deKikRZggMC8g/1VTltpq6Cm67oHWLBSAJcJGWMsNXq+
	 3cdlFB/etlPtA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1AB117E0187;
	Mon, 24 Feb 2025 09:42:14 +0100 (CET)
Message-ID: <acd15979-f9f8-4695-bd6c-9eb57a056c8f@collabora.com>
Date: Mon, 24 Feb 2025 09:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: mediatek: Add SMI LARBs reset for MT8188
To: Friday Yang <friday.yang@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250221075058.14180-1-friday.yang@mediatek.com>
 <20250221075058.14180-3-friday.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250221075058.14180-3-friday.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_004217_243882_4694A95F 
X-CRM114-Status: UNSURE (   6.59  )
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

Il 21/02/25 08:50, Friday Yang ha scritto:
> SMI LARBs require reset functions when MTCMOS powers on or off.
> Add reset platform data for SMI LARBs in the image, camera and IPE
> subsystems.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



