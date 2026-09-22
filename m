Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0FFC98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReeuFBiulIHCuGuZeRtDM/zaZVAASyRF8fdtA8nXT2M=; b=aWUVvKkIc6BD+q7c45AShMaog+
	1zzGmUSE4W9FcgbqEFIJXq3O0PBfXGn62pEs0IbVibfwiRJiEkGHwzaA2dEZG+ANVIg3ZCFxLM784
	E0qS3exFL0Y1wbxyiDFsQHHwvbmhGMMhORM2V2cxEvztcGaJ8HeErkZoTVJdkxie4iVPG4aDzNQjX
	jwS9z+lFNrYKuk24IhpO3AJMeJK0XD0RE2TYPAAAtCaMdvBuIFfUupgp8OHnJBvszeYxKEN+yk4oo
	G8YXDghAGpKCB4PTVSlU+mXnVZr9qdR9eThfJpAAReH4KWEW2ZQNW8nim3I1gcdfd2Lmj9UY3AMDm
	jEC84HEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr1-00000005CCb-1Nax;
	Tue, 22 Sep 2026 11:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqx-00000005C8x-3QMe;
	Tue, 22 Sep 2026 11:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ReeuFBiulIHCuGuZeRtDM/zaZVAASyRF8fdtA8nXT2M=; b=Gpa60CQ39ixVp9Jkfg/6jfmZfz
	4o8xjEBrCf59bTkpkaYp5H3PzSZV9FwOMKmvRm9kFZQqtNv1r8VYmkFHcxNd4kbckBGcD3bRRgVJ6
	Vu7REAF8Z8wcoeEJeY23rKXhEKceeGzKyAyoA1keHJ0RkO7DYflF/t2y1lsEw1QLJhPdufYSkkhEB
	tE6MoaWPR0YRIW2NULDI5kGwH6Y+7rfYjSAIDvc1VAODW73J14v5SLRYTR7jz0WmrIupAExQSI0Xt
	JF1R7YfxRSEjr2PdoR6WBC+p+icTBjYbMfDI5sfTI9lsLVUhyzLZnPEYNxd0FLrhtSYWRXvUhZiud
	xp7wW/Lw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yqu-0000000DV7E-28Wl;
	Tue, 22 Sep 2026 11:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077195;
	bh=7H/mtiaqOfbB2OIda8pEHKXeDBj6OH/vgfVNZdtzp4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QX43lBwWKlUToJ8P6ZaRZy0vegdNUj0rIBJ8S4LefVj9iY2ca65+dqMZ3fombT3cy
	 qEfukWlF8HG/AsKy8eLzninuJDH6x/Jkydm7uzLMe5IaR01OXkDbrUUbq+w4r8arAE
	 lJqkY6NyI75kTjmAo0CMJac91vrBJnWQcqcw1Ff7hSkVMzE4bVlX7eMbp6P+LBabTX
	 f9sj+tNsMG5Kv2rXkKSQpor0ooOHzxVmBcpA7c5CRrQdqpRvtulD1mVL/tGh/4r4ju
	 7PW4m/umMjdW2Tt/2ryqJVH96esCLnSdAm6tkF7fdVc/FF9mhwAW6YuHrEUPgsh08P
	 RqEdKnEbn5hvQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 915BA17E0D69;
	Tue, 22 Sep 2026 13:39:54 +0200 (CEST)
Message-ID: <27ba92db-685e-40ad-805d-765bcea840a9@collabora.com>
Date: Tue, 22 Sep 2026 13:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 10/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-11-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-11-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124000_732984_4B1640A2 
X-CRM114-Status: UNSURE (   7.69  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgenc"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


