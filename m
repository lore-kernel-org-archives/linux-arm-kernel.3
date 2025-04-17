Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7873C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dWpQmEnjII5IweLAnp1ASHiWyK5I56uS54XoiQxNWY=; b=IzLOx8bMVrLcqqf7hXFLSwv6N4
	qj4FMtCOtr8YWMvut4DjH872g9slLKvmfTj0ydH7sZtD8b8mBCHpB61fbMtQRVdAwdRzP606LrsUB
	oH4CHaly8GTHspEdT9WYyRR87EMdDdeu+a53wGsECLm9ePYt8IMo5zU0zKIogzq2WmB0F1/WtlUg7
	Q+j91/8ND8pvazNVszaT2xIYQ7EJyjSrsRn6rOX0dOlmWza8Nmj0597lZUeCpn3g7v2xOrByWGMCN
	Ls96IrPkwv2Mq3dShIESCyeXCLaIZXLko+VtAY9i8PQD3m4+zTqXSRDdh04Ug3gKriZilfqEQ8QoQ
	+3NOH82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mi0-0000000Cfno-1Xnx;
	Thu, 17 Apr 2025 10:43:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MMF-0000000CcIk-3R31;
	Thu, 17 Apr 2025 10:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885234;
	bh=8g82L4cDWPuDUUnejcyz0Ox0ZIZ3FE4nCEYjMHpwTWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kD03sOaIknYVPPLm/U/Oo9L/5QRcQ8FfHzjXq2B7cD49IoASZN/FQHAHE//egvp9C
	 lrMoTtJV+73+rekWxwxd0PJFFjfya7VBQF3Y/DbqSD8/lDiHMl4k1YFS1KobC5cix/
	 yMZJ8C4NvzTl7Y+mBaGkEGcFckQ5cVLddSF+n+5uoRPszVpsMPMIOnVQyvqkSKlTN/
	 UXGYIb4i6SZ15Fz0afNq0Wb5vb0BwPEIcUEc4dovDP+9Z0XA6hrV4c7xxLq1TLytTI
	 O5b/Fe9FghbYQtmQrvZ1sD4hwntoiCQYmuVJ0gXes27RbX72Ly8UKzLS+yoDl7XsDE
	 V8hm+lYm+18hQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84A6417E0FA5;
	Thu, 17 Apr 2025 12:20:33 +0200 (CEST)
Message-ID: <8095ca62-0eb8-497d-a5a0-1725a8bad52d@collabora.com>
Date: Thu, 17 Apr 2025 12:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: mediatek: mt8195: Move rt5682 specific dapm
 routes
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-1-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-1-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032036_003994_E6E14DBF 
X-CRM114-Status: UNSURE (   6.47  )
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

Il 17/04/25 10:44, Julien Massot ha scritto:
> 'HPOL', 'HPOR', and 'Headset Mic' are rt5682 specific,
> move these routes to mt8195_rt5682_init so we keep
> 'mt8195_rt5682_routes' for connection between mt8195 and
> mt6359.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


