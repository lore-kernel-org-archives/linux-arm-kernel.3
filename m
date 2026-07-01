Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B43C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la1cTwn8GN2DO14kHz2INNaAKV4mkua++Zzl1219p2w=; b=jxZWBtWu7OWAwxJ3H4gGxv4w5Q
	FNTecbUGYLfPIrE7eYk64D1+sllpbyEo/FhsMVnxuyVZUkcRboJkWH3iF2IWwpkZTJIwzsWXoXnBT
	8+VdbAmU5WcaMG4f4SSpTK3SPxB1rOeg9/fuEO+qSjkybmivzW36n68JddfvD0SO3UBuNMy2DYFac
	Bo6ZSdvH5FFG44N/S6IjjWz6ycsdFDLwaOQCVVwt1HMHbER3ppZyB5FyMSidy4JIYIs9UyWaPMG5Z
	fj9VGDKllX9lTODUw2M84Ep0LzmYlE5f3vxhYZA9RPHQABzjJ8K4ZveU7Va56B5tGu3Z7RIU4cg/L
	ZnV6zgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDd-00000002ckb-35sP;
	Wed, 01 Jul 2026 16:55:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDb-00000002chh-0e5V;
	Wed, 01 Jul 2026 16:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924920;
	bh=YfYkB3ig/KBHMaLO3PQRP4rzQsPdZVQOBAWsBZHeAow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q06OGYnmJaCUTt2ag3/3SujadGgGI8m5kToFndSywAuMO4yvpQOooF299MkqtlYeQ
	 9ePkVf6vdFYcgRHQluMNdMxNTAUn6AxOyAQra6r2Ge6Qay8DOJoH2yGq9mXomWC7MU
	 T1TM3f9yk4gNzxu4pTG5J39cx3ttHNdM+iA+tRGTeBjpwLeGg7nMC/jseGPK1sgkmw
	 FM+pYXSE8O4v7rePNOUchz7njKwVss/CNGb1JvhDhdEe5BWEg67JOvZ5hYUELeRYmo
	 BfZAVnexUIip4tyDb2QyKP3j/LnOP2KK0Spo9Bsq/S70JaxNTTgttpXAwHpsYr6HNr
	 JMvfFcGZ+bMgA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16B7D17E0D72;
	Wed,  1 Jul 2026 18:55:20 +0200 (CEST)
Message-ID: <7bda5a3e-d753-445d-a093-ce647d29df74@collabora.com>
Date: Wed, 1 Jul 2026 18:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Long Cheng <long.cheng@mediatek.com>
Cc: kernel@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095523_364873_7075407D 
X-CRM114-Status: UNSURE (   6.20  )
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

On 7/1/26 17:47, Louis-Alexis Eyraud wrote:
> Add the compatible string for the APDMA IP found in MT8189 SoC,
> that supports 35-bits addressing as MT6985 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

