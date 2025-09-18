Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD2ECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+obiJfJYI5oqPmXtrY+2iu7IixSDRl/k/VLYoW8S/4=; b=odjzNKY3mwuFDINY50iEXijezY
	d8VWoNR7H6T9PEvsLrSZOmBVs5YW3X5VrVAEL8Xx9Nsv6AhEKt7DxdSRWEUQGQuqExDvvXR7K68/0
	3d2EfOVfYvXFIGQJkjoQHl+sYNdvYP1HWmqqBECcT6lbF2GgZARgi8c8e6zDiqibcw8CP/vPrkhLd
	+jQDKD+XrzYvG4Sk1dKzMt/joPf7CQBI19Ric9MOnR5pot6gi8un0CInEkYHVbVFpkeWTzUxJ9nSm
	NdOtsIIaT7tTSaNL2RcijARKQPh7jHPM8wXmDQxUA37wGhE534QprdZLZrAQ6uk4IFwwYecleWqgA
	/zKt0EDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD6i-0000000HG6b-40RU;
	Thu, 18 Sep 2025 11:47:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD6g-0000000HG6C-39iT;
	Thu, 18 Sep 2025 11:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758196040;
	bh=6EKZDkdDj+TQTFKi29y3ENgReTXMEGTTC1s38Fo2/GA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aT13i7doY1WMx3ADOq+HzXsPl1jAKpBpEZI81nRRpR+YRkCVwTNVdH5tHrdUx3Ave
	 c4g1Gvmj9RW3sKCGJM52hwcYc/6zn+zlK/Zd+zsC4hBX1vWPqf/EFswGkgsaDi+xhb
	 +k4ZyVOf7h0E3WxBhGKhb8x20GmLSarNAv5g9/6+2zAS6XBJj7I3RmfHAdN6Fkghu8
	 33DaoU50JzO5m0UplX3G/wEQZpt2qUBVdkwgWr9Q4P5pStpXl8UjqIWMQb9GPvE7fV
	 Ew1wQ82nMzRp497XUEfegOK0EIk48nKPkU9MuQwkYliUnzpmPYQEU7nZhpOsTzxtXG
	 aYenc45V8LhOQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0583E17E0B8C;
	Thu, 18 Sep 2025 13:47:19 +0200 (CEST)
Message-ID: <c31bc281-94d5-40b6-a9bd-76b41769f6e5@collabora.com>
Date: Thu, 18 Sep 2025 13:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SPMI: MediaTek: Add support for multi-bus
To: sboyd@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_044722_965949_B13348E7 
X-CRM114-Status: GOOD (  10.03  )
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

Il 03/07/25 13:58, AngeloGioacchino Del Regno ha scritto:
> Changes in v2:
>   - Fixed indentation error in dt-bindings
> 
> This series adds basic support for multi-bus (multi-master) SPMI
> controllers, as found in the MediaTek MT8196 Chromebook SoC and
> the MediaTek MT6991 Dimensity 9400 Smartphone SoC, including RCS
> interrupt handling and per-bus registration.
> 
> AngeloGioacchino Del Regno (5):
>    dt-bindings: spmi: Add MediaTek MT8196 SPMI 2 Arbiter/Controllers
>    spmi: mtk-pmif: Add multi-bus support for SPMI 2.0
>    spmi: mtk-pmif: Keep spinlock until read is fully done
>    spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
>    spmi: mtk-pmif: Add support for MT8196 SPMI Controller
> 
>   .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 +++++
>   drivers/spmi/spmi-mtk-pmif.c                  | 471 +++++++++++++++---
>   2 files changed, 530 insertions(+), 79 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> 


Gentle ping on this series.

Regards,
Angelo

