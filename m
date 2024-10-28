Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8C0D339A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJyGW7jEX0wbslRRn/Tljh1dOlIOkHLoGGTDkbkN9Sc=; b=wpKRvYRgbMCZe4dU+TqFEljupB
	8O/duFfkapqOPGrUuV1ByInEKeaMCY6iP3nA9NYVswajGpLv/EufjLERjRfzM5ScdxcctpIIDzQRH
	mzURuOFpd0uLVZXCSHP1ingpdIqz/aorqbbtDBWzVPdmXFtXTxaIqURIDaEZrVWlSZn+EoRtNWcoD
	iCjA4fVUF0s2IxkVMr2+QXUSJxkQBMwMOUB3CqWS3v3elChMitf08zniIGdD2LP9cKNOcpsXA4yEn
	spV0nYbyTYr+kLz+kYipySBfi9lWH8LIiobVsANHHRltG9YHXgWvEoqMdV/CW48/ypm64vrnY5mCK
	Sx+mcEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkQ-0000000BVsJ-1Id2;
	Mon, 28 Oct 2024 16:37:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SId-0000000BQgh-3u6m;
	Mon, 28 Oct 2024 16:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730131738;
	bh=1THuqio++W+7jbROKSG1qt1l+ZvCjDv4tyB3qjxS6io=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S4RgWV6UBYoHHy1QTaFKmYLAN1q/CXAm3CsNGhHrflPcciW64H5FxpZYdcYZPJlce
	 0me9l5SGplWIFagSeoU1bWvPicIHF05fncpaLjGT5XpJTkfplaWixDRKhnT3q7WtdM
	 Jremsj3+ZXTsHpTxUofUmrBwu90kwYq1A73niCG90ezpf0SeJi9fsItAnLZa/cQLCY
	 AafYxnz1XckumeHzycdjISA5g2cYo8/DJ3TtH3l7qmT3bC0SVGvLJnpLybCY8QSD/S
	 Xp7fkThMGRUJ4URiT7IrRLVX39yolJfUf6VIvHHLAmHQ4rvo3BfLsmOOJQLYzA2A4s
	 1+F4dgDxfRFfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A752C17E3676;
	Mon, 28 Oct 2024 17:08:57 +0100 (CET)
Message-ID: <f39f0740-d0e7-4f8a-a0c5-2d23146672d4@collabora.com>
Date: Mon, 28 Oct 2024 17:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt6359: fix dtbs_check error
 for RTC and regulators
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
 <20241004030148.13366-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241004030148.13366-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_090900_152538_AB3C5376 
X-CRM114-Status: UNSURE (   9.18  )
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
> This patch fixes the following dtbs_check errors:
> 1. 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
>   - Update 'mt6359rtc' in 'mt6359.dtsi' with a generic device name 'rtc'
> 2. 'pmic: regulators: 'compatible' is a required property'
>   - Add 'mediatek,mt6359-regulator' to compatible property.
> 
> Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



