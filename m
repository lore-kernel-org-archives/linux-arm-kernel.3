Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B048C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH9LdmUzfI8EUkeYsFPUuRBFRpzb8dsGcTvfnqSjFGM=; b=XxFWly8XF/HEP+1j09Q5ohnrGE
	R2Y9EBjG0O2g3lM9YoSNUfcCMmynRE00IyB9TmmTsAwzdmliF6jNJfoPdSbmR7ZaI4YIisrme57pT
	nvyxYJALPZJJQmBzbXJ5Mpb8Zmqjp+nS3fBYhw4yA77X3oB655ubRnDzZkyVytEcWLHQ8XJpoPg2A
	QTuEBV9K7M5ad/Zq48UACOwlVVWdl/3DQyzNr2xRBbibT5NCsgSB6KQySm4GTqpOtXKoZ7h1mQT/8
	gs6Y65jx4fMp3CDwHd3V9Zro89wS4quNG/IphEUY0Grg3pn08a8IahA49+FwIfbIDWW1dXYVT1ltb
	T8vUaDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJTq-00000002aB9-0iJf;
	Mon, 27 Jul 2026 11:26:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJTm-00000002aAN-17kx;
	Mon, 27 Jul 2026 11:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785151599;
	bh=PxursN61kh6Aec8NWrNjqV1VnT3lTqwDy1MoMDvk4SY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yql08sWyeQQpzOvqehN/AhCCx8GUyn/3e2cItgKWDOCGwZyAz79tgrmcMh7s0y1q+
	 l1rlb72WY8w8xymDZgrNyr6fqz57A8iLy5W5Luv5XHdwmV63DXNOUfJRzAiY99vJ7E
	 3qLRqYm60AW36mZIqnXwada+povnk8n0f8AoGrVcEQcf+Mt6I8wXSeZ3xlLzcYjvxF
	 4r+Am2zCMLClkUmTRUErskbtjLOry427j+aHLlbo8UzZZfwpCnNdXTySFs9RwKvx0c
	 gAx1nQRGmuETEX7wtH27S2O2jU4yLNaU08tg+P9JWJuuwCa9yCsu20IIwMsSmcsp2r
	 SEApApOK4zDQQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 534A817E0678;
	Mon, 27 Jul 2026 13:26:38 +0200 (CEST)
Message-ID: <6f91dfd9-16f4-44d4-be24-7abc89b9894b@collabora.com>
Date: Mon, 27 Jul 2026 13:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
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
 YoungJoon Lee <getfeus@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260727091555.1023910-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_042642_490584_273685CA 
X-CRM114-Status: UNSURE (   7.89  )
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

On 7/27/26 11:15, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
> 
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


