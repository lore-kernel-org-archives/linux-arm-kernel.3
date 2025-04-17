Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8A6C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L09eMiSaHsq59pOhHjr01smG+bFVCAHGKpWSFH7r7Y=; b=0AaJRXI3CT5yQ0sWYHUxo7kjh2
	XAOlT9TX84isdzVitsBU+Qis0ViYDULpRyP/1bhMh9iU9FXGaTbAZs7FxrvCvF1QHIXm0YhyyHiPk
	PFeixJm73zNXh8px4+NpTz8pdjiiRG1IFvsFPvcBSH7zbN4ETjeZHbBlfDBDcfIOOOraRoQ4tInnG
	NS9yhHKpUshCqOHF9V+sz6BVnUCQEFzt+P4PF9cdW2qjv+O1DET3/vzZFa0bNg0ki5OgLkzJ+s6IK
	NCd+3L+eg6xtjSEz+VXHpwakgKLC5Xgw3qbu/Mb92uXQgPWN+8a38TkTUzTd0ctrikYCcJq2lb97L
	gmH5SUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MeL-0000000CfHx-1A6U;
	Thu, 17 Apr 2025 10:39:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MMA-0000000CcHn-2mre;
	Thu, 17 Apr 2025 10:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885229;
	bh=prazWVCV9d6qQTwqxR3Cd31+F1sNY+NrupHwLtS3KZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmxT861F++j0VWqDgVdyBQ6qLIvUFZ5yu+pAb+EfrQqeqEeHwZqOFBj/VdF0TJmGg
	 5mI79b/V2N4lzvtCLXAzDcJl+0/YxCC7Ynh3v+CCSiWxFPth7fCOlJhRcKf5a6ZEgp
	 d3g6RItDpfrEb9+apgi3k71zo4TAq5Vn4CD1CAwl8DJSWSJsAeZK8pddDh4cTgma36
	 QAS4PeyJtLxKsvfuWkSKfu/YXmZ/NHzoAkpPPNth15yDGHcP4RGoIga0jyGpgLP1+0
	 yl2STg71eWikk2L0w4MiipSEk6urFOwxIAPb4wof7zOpW2WW0sVq16fkwRFUwPs0Fp
	 +dvauuDP12h4A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61F5417E08E3;
	Thu, 17 Apr 2025 12:20:28 +0200 (CEST)
Message-ID: <7f5f55e9-0276-4976-962c-37fbcc6e0966@collabora.com>
Date: Thu, 17 Apr 2025 12:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ASoC: mediatek: mt8195: Add mt8195-mt6359 card
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
 <20250417-mt8395-audio-sof-v1-3-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-3-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032030_850584_900ED836 
X-CRM114-Status: UNSURE (   6.50  )
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
> Other mt8195-mt6359 cards rely on external codecs,
> add a card for board that only use the mt6359 codec.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


