Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C992DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rnvBkPskOINXU9KlTbLS24kcvLtQyf3D1Yj87u7gfw=; b=FoAyomus9M7X2Kyi+4DT5dHuMq
	Epx/dy/vtRv3UnXHeu5l7XRfFr5q2yBeftPJl1tBpCBGcZAjurAaZlfenc9rcary2ZgcjHjcl6Z+z
	7gN8fn1n+AKSuO25AA0s6EgOO6056F7ZhnKxNwJdGd5b+OCbGM4NxpWvsWPxIIZPVoA4lGVuUyqMA
	ch+aIL6bC5FKV7FYbYHq57VWWM1k3J9QN59zmmYvkEAa8syRm5CflrpLUYFQwlq2nJ8Gug3lHHr2q
	skwE4SCEyT475yc1gj4pUePVUqb/7zB5L9CIg2RJEcL0Trpw0C/D0LER4JsFbJXylJVxui+fNQLIv
	WC/rzu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb1T-00000007HyY-2ljl;
	Mon, 09 Dec 2024 10:29:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKamd-00000007Er0-3Tro;
	Mon, 09 Dec 2024 10:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733739270;
	bh=w80pNd53yPsn010J40RXAr/XNrgFhv+WCFz/O/1B7ZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SbUTaKLPqjKvX6zH5JWq+odhN0SexrqORW4cc5MIs0amwO7eZWvRZ1U4xsqCi7GKc
	 93OMB5oQrQ/CSQI06eqpcA2lu6aVmk8Z9as77CAbNN/vdRn7vP/+47eVDVajPAV/94
	 lksISSV8yvK5Qbd1soNLRmfsxXHc46OB2mhvBY/oM/N6TrpW+WngR/u5GgSRDvOcVQ
	 A87neH6WDVNlQ0hX4NIwtiTelub5jDgJinQIVi3oONsn8Vf7dDkzsnTB66/rBNlAfG
	 OMpwRsqN7uemXixwkdtu6GKUJxXu6hpPn9X8MhqV9KnzDva79nXZfWjMTi64W9T9af
	 xKcMsayQNYfWQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AC2D17E14D5;
	Mon,  9 Dec 2024 11:14:29 +0100 (CET)
Message-ID: <456b8050-7a7c-4f5e-8ace-5e88e02e86ba@collabora.com>
Date: Mon, 9 Dec 2024 11:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that
 need two register ranges
To: Chen-Yu Tsai <wenst@chromium.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Andy-ld Lu <andy-ld.lu@mediatek.com>
References: <20241204092855.1365638-1-wenst@chromium.org>
 <20241204092855.1365638-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241204092855.1365638-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_021432_036714_A438EC06 
X-CRM114-Status: UNSURE (   8.63  )
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

Il 04/12/24 10:28, Chen-Yu Tsai ha scritto:
> Besides the MT8183's MMC controller and all its compatible derivatives,
> the recently added MT7986 and MT8196 also require two register ranges.
> This is based on the actual device trees.
> 
> Properly enforce this in the binding.
> 
> Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
> Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
> Cc: Frank Wunderlich <frank-w@public-files.de>
> Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



