Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B794E7315F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N75KqhXC3nxiU+7c8dAOYwx7I0lvbMaWLHAqMGWrC1k=; b=smlfcc2T9MqjhCjVPJtJgi8mgA
	5B85GXOP1fMdBeV3Ffmzk7/a2A/ksg7Bz+1uP6QPAbxCUXs5FE7lExGsvsGC6MaMyNkJGdb9Umnmk
	+H2fCNE6NDrQc/Jm1iR2IkoXGaHq00Qz5Wv4Nb3JzuxUNAm5umNvz2J4xArzXPxeyafpH3E7cLVgw
	QfP5MmrzuflOqajv1OLxPQjr3kQJfS0JakoYbefwJAl2WCpjum0ljzY4qf0ZP8xR3eezJ9sjNB/Uu
	1S14wfdBqZ9zM3yuNxdydbpO2ZKLdOAsTgwhQM0bPfM4B4yq2nzNawbW3hYH/Hm1EFEa6u9aNbsfs
	pk7F32HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsdC-00000004wOW-1CY7;
	Mon, 02 Feb 2026 12:02:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsd9-00000004wMB-3sHt;
	Mon, 02 Feb 2026 12:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770033729;
	bh=U6clwAJ8Kdmzgl6drGO6FUVsAU8rJ6AUKqT9+P6Tsrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CgSP6MqUEfgZJikRAxnDluuWlCNKmRM4/23TXQKxm1RyHv/MkZeVqBYPqAqGgrJ5n
	 qOnIcpF37DtzqPElDVZ4OXQqyKUeLbOX4x5zfw4UEF17pJ/tVvw54YQBWLIOhos3+b
	 ww9ZOQMeIFS/2P9PF5cXcqaWekF27Txl/rS/tIt0KmQMqUnlE0Ue7S/+RlFlE8TjGj
	 9wD/3cPFs7rNbWaAt/EOrQIFcyb5UYMCKynWDddeNejI6U835MXwP9fKtlmQ35+87Q
	 rsgzypDjxZhaRXRcASAGMvQjCzgd4JFcTvC8ih1ic5ZR47i/+aH3hFaOcdldz4qoNO
	 /v2bMydJkOzUQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5796C17E12E5;
	Mon,  2 Feb 2026 13:02:08 +0100 (CET)
Message-ID: <7727490a-16bf-4774-84a0-4fcf3b34f393@collabora.com>
Date: Mon, 2 Feb 2026 13:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: Add MediaTek MT8189 power domain
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
 <20260202064820.347550-2-irving-ch.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260202064820.347550-2-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_040212_144298_D973323E 
X-CRM114-Status: UNSURE (   6.63  )
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

Il 02/02/26 07:48, irving.ch.lin ha scritto:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add dt schema and IDs for the power domain of MediaTek MT8189 SoC.
> The MT8189 power domain IP provide power domains control function
> for subsys (eg. MFG, audio, venc/vdec ...).
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



