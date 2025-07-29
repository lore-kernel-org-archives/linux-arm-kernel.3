Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853EDC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HShQsFZsyzWkWuzPVJuYOXZtOi2EhjYtEjfaq+nHqpM=; b=ZF7YGjk+BIw9LU5HRTrC8r5Xkm
	QPLWezvsrYD7jpUD69t727EtDe0ES3nPaNdGNBddCCvcfba99xwO1F4bgJquJYAesc7YxxwX/ELq+
	7j0yhyiLzcv3vR/l/3LI2fSbT+6lurutoNC+bcWiZ8Z1aejshaHl8lJBj/r8JMJYDDaPDjGoJjnBE
	8oxiMBWjoE0vZegRSVADXrfxIp93l0uKtuXWCRRr2RtvXl6yGMq4ZRLKFXiLc0oYs0yiaPs+t3WJY
	1s87iSaR9eNxI/dogy4pg/ff2v9wJYm3anu26Wz0FHWfG16jEK30n6+l67OK//ZZ7ImvD7VOZBv06
	OKbrSGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughRI-0000000GVZv-29cL;
	Tue, 29 Jul 2025 10:20:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughJw-0000000GUh6-0rl7;
	Tue, 29 Jul 2025 10:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753783950;
	bh=N6BzpzMJ9nqQW+m6yOXFimAfKZGre87KRZn59AZZOJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=puh+mggRobH5gbOmcv6zTsN/jEfIcFo6nTxIal4dV6u7CaUC7kl4n6+JecCJwrZ9e
	 JJDRykhI+7xLfHlhmpsezufPIGeabAkwbWRZmlFA55gQDTvX6zECTpiLfGnbQ6tdCA
	 hmamDWYoazYoYbrp07Rj8lNHpriDdx/Cqkh0QVBdWcTWDIWCqQJDBNCm2AMrOiXZcE
	 w/5gH2KI+Dis1M7JBgBPef4pOzfU83g8dvfiOdC878ak2BuhdiT7h2XSLnfKekEDIa
	 lLYrMB1A4SyYKUoFztYJXdOQD48ZptNKi3U0Z//N7pH2idKDqSusbUn8/OckdYmrsC
	 nG4Ip5pAxyR2Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8F5A17E130E;
	Tue, 29 Jul 2025 12:12:29 +0200 (CEST)
Message-ID: <571bf870-f619-49c6-ac31-baf3abcbe9b3@collabora.com>
Date: Tue, 29 Jul 2025 12:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: mediatek: mt8395-genio-1200-evk: Move
 common parts to dtsi
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250729093506.273337-1-macpaul.lin@mediatek.com>
 <20250729093506.273337-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729093506.273337-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_031233_120725_59D48BB1 
X-CRM114-Status: UNSURE (   6.86  )
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

Il 29/07/25 11:34, Macpaul Lin ha scritto:
> In preparation for introducing the Genio 1200 EVK UFS board support, split
> mt8395-genio-1200-evk.dts file in two to create mt8395-genio-common.dtsi
> file, containing common definitions for both boards.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



