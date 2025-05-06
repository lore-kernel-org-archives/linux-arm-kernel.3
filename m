Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F403BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT0Gp2Ie31NdpEFxKpFbHRGAiKa+LKzcBfiWCi/vzag=; b=xrZCbNdh8VOS/K+0M7lT7rPrnj
	AKjla1/Dvz+CDkpH0EA5dJfkvtyJWkaBybx9Q1CS46RotGlPmanGdelscCDcY21HoEjRlAFQsxD6g
	puAMRbLrfTuqV+J/LT05Bg/k9bkYmjzmwEsREaU4E+qFhxhVZpzfjDW9eUp99wMIOC09pxZdHn3ZC
	nG44+M29yJ1Vc8tCbJ075+dB+7Km36YQF+MOmhg/pfFvaSLmw88/LZvZchbqzdOP+NHv9l6yAPFm3
	+Tn9208r9TPcvWBjmm0cJEKKIvmFSEbjtxuyzF3uImZrGlPyyRWsH2nYVvjtgCM5wYnJvBDdvY8nH
	h+g4ToXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEPH-0000000BJrq-0hFh;
	Tue, 06 May 2025 09:16:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDlw-0000000BBQW-43bp;
	Tue, 06 May 2025 08:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520527;
	bh=BA1uB0bqEJgSDP4rtIOcxMMJ4yxs1wrJep5UBsDDoZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fAcvtaRCqtpxu1jAL/i2hRAchnLINaS+Q7R2UxugAPYhY4gG1E8uJuu+Y+Ow/qGMz
	 2yB3KnpFgVNo1HkRDFeYwcknuf6JQ2IQPt1IaW5OzBRnLCLQ9HV3H+1yWHnwLoUels
	 h56Yhj3uhKjHJXaXHDB19SX9Z4CyDpg6j3Q8iLJJxxmcYdzj3wO6V6YJibv84vm20W
	 EFH1x+3iGZOHszLIYacT3lmDZwn0I5SNVIrTbwIn5/0Awv1WURIxh2iS+VNtHqa6be
	 fyR59LYaJDY3lhWX5AC6WmdH8u0cci6w6pKijSRkSb+uWFYxt1YtGm5QCoRvViicah
	 YLkzWNhp9lZ7g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EC5F17E09BE;
	Tue,  6 May 2025 10:35:26 +0200 (CEST)
Message-ID: <f0f7c044-c8ee-4712-94db-882cdf894653@collabora.com>
Date: Tue, 6 May 2025 10:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
 <20250505-mt8395-dtb-errors-v1-1-9c4714dcdcdb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250505-mt8395-dtb-errors-v1-1-9c4714dcdcdb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013529_152847_24E0E001 
X-CRM114-Status: UNSURE (   7.84  )
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

Il 05/05/25 15:23, Julien Massot ha scritto:
> The 'mt6359.dtsi' file already uses the '#sound-dai-cells' property.
> Add the corresponding property to the binding to fix the following
> dtb-check error:
> 
> mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> Fixes: 9bc8353be720 ("arm64: dts: mt6359: Add #sound-dai-cells property")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



