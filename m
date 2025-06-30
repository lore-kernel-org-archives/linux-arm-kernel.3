Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9D5C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfcuAqnOHEF4UhEpQ8Y0mFG9QB0phDOVmIh+OrgFnpw=; b=AMY5BdU5KhvgJQ7wR/cswq5txm
	UuqK1d1l5YDqB2fIAZCo5mmEXc9Yv4SRcWQKRXtVA6/AXwwJMDphI9AND3fCMr9UiOrQ/ViaUfOEn
	8YtSp5Z5zRo5u0T+6ismWCUIQOAo/fzE7XObxwEaEsdw3/qoeAIB4My9tz7AZ5Vn34HUzf/02x80/
	DSGz5elVLkTgqhtbqJrMkBrORXJev0zVb09yQ4PL4vGnQmDqlkPRCbLkW8UjlhwQYRdp/FLxkj5Qp
	ImrPo8Z+UE3kqSEb1eJvURvwM7zbyhHluasx7CSFixtdpSixPCKx2llFujNK+BVyCHqOff6O0YIo/
	SA41qdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8zn-00000001SEL-1mBq;
	Mon, 30 Jun 2025 07:32:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8xP-00000001Roi-2Q9E;
	Mon, 30 Jun 2025 07:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751268576;
	bh=d4y8+hqplOcGJJ/rNY/oDMRKZ0L4Q60ZUzRRcNJDT1Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kbD1+/P5H9bkqVVAmP7J2kyS9/Q8TesbyfEdHQApY6e6CAXcECdkwDi9F14S15xBV
	 nEC9ZKJ0eTXfihRHL3XCm5bQfbcwsdE54Jgwv2wKeH1/J8zjJz66fpv076LsOJgI4w
	 C4AnKNNURKG3gOOr2gFqXNxx8QJU/c7DIl2Oj8HXBHXlUJYVBzu/xwY6725s45I5Ux
	 hW1Aax8R8qxaijT2Ifnrg/to+R5y8A+Bvk6hmFdIR1HjQN5WqQVy3YuyZKYdp7/7Ej
	 yUzsoyiplH9LZ9Rrj6LmM/iOc0B7kcBqg2jsZWEFJLpjirr54nDSpdMF9kPYNFPngK
	 Txg1nQ/ozCWdw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70E1117E0B0D;
	Mon, 30 Jun 2025 09:29:35 +0200 (CEST)
Message-ID: <f16c18eb-9a28-4f44-ad8c-7303ee5347a8@collabora.com>
Date: Mon, 30 Jun 2025 09:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] thermal/drivers/mediatek: Add support for MT7981 SoC
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250628223837.848244-1-olek2@wp.pl>
 <20250628223837.848244-3-olek2@wp.pl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250628223837.848244-3-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_002939_804700_1D880334 
X-CRM114-Status: GOOD (  16.00  )
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

Il 29/06/25 00:38, Aleksander Jan Bajkowski ha scritto:
> The temperature sensor support on the MT7981 is exactly the same
> as on the MT7986.
> 

If it is exactly the same, great! ... but then this change is wrong :-)
You should, instead, change the bindings to allow you to specify

compatible = "mediatek,mt7981-thermal", "mediatek,mt7986-thermal";

...and that's about it, no driver changes to be done.

Cheers,
Angelo

> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>   drivers/thermal/mediatek/auxadc_thermal.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 9ee2e7283435..020324901505 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1149,6 +1149,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
>   		.compatible = "mediatek,mt7622-thermal",
>   		.data = (void *)&mt7622_thermal_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt7981-thermal",
> +		.data = (void *)&mt7986_thermal_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt7986-thermal",
>   		.data = (void *)&mt7986_thermal_data,


