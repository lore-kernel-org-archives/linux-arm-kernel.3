Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D19BD3399E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD4VxrCxXj/vuhbbYoyQ1RvbV7RS1kZWHSuzEFjeBXc=; b=gc7txh+AO6eH7VIEg5GtQ0NYf6
	cR6B+eN8G2BMlh4j7Ei6Pwi4an1YBkQMSoOHpKUu1XKQQ3xYuRakrFiW0uowuudTNrxtyIrLCfaiF
	ZyiX6bUyfGcf/+Bbq8t1zadPcWF358LckGfUV5EW6yP+bsQV333GyKcbdVAdop8+F75cO9KCiaGI9
	t8OJ7f3RMXcV2gA0euBw6F0vi3ooOpKrBGuKtGBTyX+p8nkB1LAwVmSntUAOutGso5wOsWHuk5neH
	xCDuv94E94xjCKpWWo+J1FB7mFpnjutfu7ktlrbk0jAiQ76MZO0LrOpHMBvbd+NLNxRyaO4p5rIHm
	QSFrfEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkO-0000000BVrL-43eT;
	Mon, 28 Oct 2024 16:37:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SId-0000000BQgd-28jD;
	Mon, 28 Oct 2024 16:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730131737;
	bh=RFIuHkEL9QlURGA8odJLQx+5TzCk9F/XU/g4Ze+ayaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LnP7lfOS/ZKF0gdhu6J4yKLLyvp6/z6MZnb8GwOvInLDSODHuT4wcS3dC36ZFWSKM
	 oUMo6abWT5nc69ETfNHy0ZTItIvwU1ZjooRzCz+Hh3PoBNanqgrlbV3/5v+kPRdU9h
	 xEc1vCOOm1ysf/9jwW6gUZl5AunFMwPuCE6RE4SjsmWHSkmbIZm/fPvIzUw/gWIdMz
	 1GqSGykSd5VCOjWf0c7pCksRO/yjQKJF78jnY0xAfLcLWow1xgPgAzfjH77o8xz5WV
	 iW6u9KiYfsn35uS+sVN/lCVBHdYllJt48fAnq1qjV8pqqIW0Ldk6vxEJ0rmbAeMZxP
	 1p1Ry3c1FgwGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A783217E3663;
	Mon, 28 Oct 2024 17:08:56 +0100 (CET)
Message-ID: <006dfe88-25fd-47a1-a57c-3345af2bff21@collabora.com>
Date: Mon, 28 Oct 2024 17:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: add adc, codec
 and regulators for mt6359
To: Macpaul Lin <macpaul.lin@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241004030148.13366-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241004030148.13366-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_090859_736525_1F323497 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 04/10/24 05:01, Macpaul Lin ha scritto:
> Since MT6359 PMIC has been added as one of the compatibles of
> "mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC",
> "MT6359 Audio Codec"  and "MT6359 PMIC Regulators" should also be
> contained in this DT Schema as well.
> 
> This patch includes:
>   - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
>   - add 'mt6359-regulator' to the compatibles of regulators.
>   - add 'mt6359-codec' to the compatibles of audio-codec.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com


