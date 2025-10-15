Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzYGu2PXNG3GqIBQOujZLfYI8c2HsuMuD2/JUQrAjmI=; b=aVYnPl3wcOc1OSq6B1W9RtX7nV
	yhM8veyXHuejSlMkTa4xzq7H6uidV9JlBO/RrCeCfcu2XeSwZaabUDiv7ygzO2nFqCdUBDsXySYdA
	PV5s6HeaN/QLHVSLqOftCjwshGOXK0yQazaueG3tSQC6bD4RRTZ1RdI9AkiEi8g2FSP2bTiCLxHgQ
	97zoLhpmh9dwg7vEn58juGTKXPMSxKoPCilyhvqGSQ/o2Jj9KAaYi32MbeTOxhr6A0auFjvrOZiMl
	Ls2ik8v9pnsQajt0eAtp0x29nu4yDdK9VZ1IXiYa9FItmqnqCX9s6J2JtfsuxABicNQAyMEZM3Hz+
	KA1cYvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xDC-00000000zaW-0Lq8;
	Wed, 15 Oct 2025 08:50:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xD8-00000000zXJ-1u2q;
	Wed, 15 Oct 2025 08:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760518216;
	bh=t29c9PtetIvlXp2obnw6JXqlK2zmWW7fIGiXSexeMgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jxwy1LCorlVU2G/siyVim5FEcPV20rrZ4gDiPM0fjx7FIGoPL5hJraFldsbvEg1cH
	 mXse3vmeNjq80z22fd/dBmYnkjBQb5NTWnxxcYlP81egBwJmRoclO7SvBf3vVmzgNK
	 ysr+PspBw5Jf6l5FcgdjeVXNpQFR3CJhhoe5Z0R0HxYPLg8qid8zlsf/+IT5RXg4Zz
	 gGZBGS/mBdUrBRBW2kNyWA6c22wH2m++sHip2qds5qB5YliYRfEb1UTvoKFv/T4fkh
	 7ACa7+rASft6rMcdD/QMHOizCGIz+fPiwUsYBESUdGvRUfqy3PtoQys6ca34quIk0w
	 u1pA1Gb54kbnA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05B2217E12C8;
	Wed, 15 Oct 2025 10:50:15 +0200 (CEST)
Message-ID: <0848e13c-8eaa-4a26-88f8-a1b7e5da4d10@collabora.com>
Date: Wed, 15 Oct 2025 10:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu/mediatek: mt8189: Add INFRA IOMMUs support
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
 <20251015032509.5057-5-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015032509.5057-5-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_015018_638939_D8BF4B13 
X-CRM114-Status: UNSURE (   5.67  )
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
> Add support for mt8189 INFRA IOMMUs.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



