Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBvqJ57ipZ1p4EGbhTWpRmAqhtON3czHtaHNYwpZIsU=; b=FJOqAi+n33U6LF/Xgfkjosaagr
	9ksEWspMNdkDbO5MEs8EFeN8WhhTOi57A78zGIZL6TqL9y+CPmH6bAr6Atbhd1h34KH4JMcpg51MG
	71x6l9jKDcssMczrlsRUtB1FImC6D5oGOBU1qMPcRxxkLq54XPMUGMSORO/7yZ002HtGHtnL7WtGI
	frXTqUWQxaLRFB0aFLbpihCexglu+TDJjp9LZEmIGAjILF4PRSE7EC5awhm5NHjV24GOys1YKJhUA
	k8WaO3MTGkM2agDXdNT9s79fecGkug3GKesrRb1V7VOyKHWLS906ZWngNsh/qKjnOD03/H7k7qS1X
	KrswI7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x8v-00000000yY1-2WhR;
	Wed, 15 Oct 2025 08:45:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x8s-00000000yWi-1ikI;
	Wed, 15 Oct 2025 08:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760517952;
	bh=Tu2AHP6luKsiurT9a4lne7CLhn3ugAJtHzpoSPKfhdY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lv2Kd0vbfl62sJunmw3iykR/1ljZJmdB/GF+Phrrn4JOMG9LzAsRvx/IFYD2keek+
	 TSjylyC/je4k3u/A3Eo/S8XOSGnpAh+ON5E80+jeuaR5uBFDPaBS1JbZ3hVforhhET
	 Y4IfQ0SoKtFzeZ0ZZpZwy9rbxMwpiZzBGbeKEXptqafn2mLdk9EMNK7O0z/96R7my+
	 4YSdYcCYrOVexFic8NA+5bpfVu2/nZrOfydptSPAB+ORYcLj1XK0vKLAaIDIG2nYBR
	 DWVoRvxcTZhQkjQOw79WkeXy+lY4VrDOuF3LkERB9WOCBwuAFPGGXZofYv2n1ghcb3
	 0g7uL4CHIutXg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6078417E0C54;
	Wed, 15 Oct 2025 10:45:51 +0200 (CEST)
Message-ID: <cda37b6b-1ad5-48b4-b861-ae49297f72cf@collabora.com>
Date: Wed, 15 Oct 2025 10:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: mediatek: mt8189: Add bindings for MM
 & APU & INFRA IOMMU
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
 <20251015032509.5057-2-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015032509.5057-2-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_014554_628754_3CEE9848 
X-CRM114-Status: UNSURE (   5.89  )
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

Il 15/10/25 05:24, Zhengnan Chen ha scritto:
> There are three iommu in total, namely MM_IOMMU, APU_IOMMU, INFRA_IOMMU,
> Add bindings for them.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



