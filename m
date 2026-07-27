Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJYFfRAQe4EYpFAgbkCh2VFYrI05YT8c8pjifiCNC7c=; b=Rl1WyGbcbLQ01zlPlsPdFyPhbi
	zzsdmo9n5GNyJPBqYD3qNqROELx0cpE9M0WoOWRdZtTjNKA23INQMga9xQ1h0Cg0CyMAqmGgCpafF
	TMPbdpC/q5G0utOt8GHN3NHia8ev0Ia0i1eA6VNCjXgc9rUTjPDfkr3sotS4M513W1UWF/Xp9Xffx
	TjtvCxtM4C4rQvfniciObqTlFLdkLnet8IcKyeWOLdvHOUhVQJrfJa5uZbJwX98W+XTZ4g50yWCu7
	dU9NJvdBEvUqdJorNrXg9xwJ276cEe1pz/N/yPqRK6SBhpKdOXXGh5eZUuIlCqVVLQwTTpZHPEe+p
	X84A9rfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJTw-00000002aE9-1umk;
	Mon, 27 Jul 2026 11:26:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJTo-00000002aAZ-0lsq;
	Mon, 27 Jul 2026 11:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785151600;
	bh=VudUmPApW/6BvsASJRAn2l9GazNPQVjwVnEN7CPOftk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cx65eFm0WM++0oMh/QxN4GR3DLdeSsiDf9NEHkLeYcjzhh84UFgH9aV2k6APGtgip
	 60YJWQDaXtpyjZn4ygUN9hn+a30uGV6Mgblx6n+HN6WNN85TVsaP2G0rfZDtL/SvTV
	 ZHxyCYXmzvsm+K+bclQF0w96Ny2jFxX3w+4Xt1O2c6ryv58VQqEDLqRv7N7I/ZiE9l
	 9FUJFZS3ZxVTGdlqOM82G/aptq/agSpjvEuaeAjubXkyP12zTZrr0yUKtBeaUuPnEk
	 zFZZ1zpsLYtkzXn6Stgw7rhgCe8XTshGeGC/asygXNoV2gt+P3yDQUXiYthVK+ehC+
	 uso9C8wYachzA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A905B17E0682;
	Mon, 27 Jul 2026 13:26:39 +0200 (CEST)
Message-ID: <3c17cdf1-7e75-4002-9ce2-08d4dc56198d@collabora.com>
Date: Mon, 27 Jul 2026 13:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] clk: mediatek: Add mt8173-mfgtop driver
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 YoungJoon Lee <getfeus@gmail.com>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260727091555.1023910-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_042644_377664_A46A8CAA 
X-CRM114-Status: GOOD (  11.20  )
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

On 7/27/26 11:15, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
> 
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
> 
> Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes since v2:
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>    - Needed since the driver implements PM domains using the generic PM
>      domain library, which also depends on PM
>    - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>    clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>    (Dan Carpenter / kernel test robot w/ smatch)

