Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E667BD3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kG3U1p8Pn7HmOzCh+jEo3/V9lrX06UoCqh8kH+FqBXo=; b=JPCKxCKl+qiHERdT1bXxcD9DG8
	a2Xn7OcqPc0OMf1l1HS3FQj0pV9lB9yzCm1VL/JepQ4PhFuYZFathAT7zfvXAzQJ6B/NP2Rm0bCjb
	/SKiaQSQJJUxgN2ovwC41JyiaYatYczmzrb/YerOPLvxaYt9HdVsLbpw7rQWFeF9xgyYu1wGm+cw5
	kv9nYYyvSrRen2cEahVujznVK3XEYhXBPmnGbQgcK0WgY4hmwXU6D4kaQH976IKcn1F5M9CbpUe6M
	nJiWFQC7q1sYRQoIc4L1F4WVKigg2gXXPx64r9CLCbMnoyJTiGzPnDGS5qqjkhpiTJmJrkJ8YKUfI
	CwJ0ILSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsEQ-0000000ADlm-2zYB;
	Tue, 26 Nov 2024 09:51:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs6p-0000000ACOI-12di;
	Tue, 26 Nov 2024 09:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732614229;
	bh=silOpgBaB1TBfyEkySYbdFpUMzvfOGkWRJVI7SuKIcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G4yBJzk78+efknk2ReghOk5HGUa5kceRDLNt5ZNvSo/lreXTqMihuYIuBBvTw9hVy
	 FFjaWx8j/mdTjC3cshUAeVm32yDISS6PlvZuG6BrUTG7wt4WXbiK9ci7AlqoUCFWv2
	 nGbA8emn67cWT09UkMaE22cZRZfuVGlheCNVN1x73MloygYAqr531HfiH4BcgAXJL9
	 iIjT9vxP4L14bf+MAiEDrcm/ozV0UO8rJ3ryiCmnmfwIyU1oe/nx785Ric4jLtjPVT
	 2FRgHw3qPVuBvPLU1sWzKS+gC0cZlm2fELx85a6xgaGQjxMkcy6bvWp63LcxPX5+wJ
	 gNjlXzb5NZd8w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C8F117E35E9;
	Tue, 26 Nov 2024 10:43:49 +0100 (CET)
Message-ID: <6eece7bb-acb8-4b0d-9d45-86e8dff44ed3@collabora.com>
Date: Tue, 26 Nov 2024 10:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] thermal/drivers/mediatek/lvts: Disable Stage 3
 thermal threshold
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-2-42e3c0528c6c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-2-42e3c0528c6c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_014351_427940_117A9910 
X-CRM114-Status: GOOD (  13.84  )
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

Il 25/11/24 22:20, Nícolas F. R. A. Prado ha scritto:
> The Stage 3 thermal threshold is currently configured during
> the controller initialization to 105 Celsius. From the kernel
> perspective, this configuration is harmful because:
> * The stage 3 interrupt that gets triggered when the threshold is
>    crossed is not handled in any way by the IRQ handler, it just gets
>    cleared. Besides, the temperature used for stage 3 comes from the
>    sensors, and the critical thermal trip points described in the
>    Devicetree will already cause a shutdown when crossed (at a lower
>    temperature, of 100 Celsius, for all SoCs currently using this
>    driver).
> * The only effect of crossing the stage 3 threshold that has been
>    observed is that it causes the machine to no longer be able to enter
>    suspend. Even if that was a result of a momentary glitch in the
>    temperature reading of a sensor (as has been observed on the
>    MT8192-based Chromebooks).
> 
> For those reasons, disable the Stage 3 thermal threshold configuration.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



