Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74820CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXcOX5vVUq/PJEu08bv8uBGOpzowTlweYGixA/mJt54=; b=BdB3/wAJhd16alsBJ08KQp6DeD
	GCKHVnau5BZmGD5Jm3WbQBE8Kz8Q0pKqkjfMIv1iv7wToag7slpYYYLMp8+NY02tE0tZvSUuBberv
	RJuPBlnlBvS9LeJlEB4/gK+n4byETvYiAon4B8xdHvWRSsmQBI8dRzwGMrMRkXfdAg9PUvaeeQDm2
	+zCQkKxuQsBnrefnoZar4RHss4EsV1eXlI1mPL5d2NaZlU38OfnKph6rHTcKDWoZfsNDw7ykSt8Do
	z9D4+0Fc+ECAY7i2zAXuCPYJsZNDif4x7M3VmelKRlvHHMAJu6N4fvoNrG1F+pcXuJbXorOep5gtl
	zM79kLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml7-0000000Cj45-3UYI;
	Mon, 20 Oct 2025 10:04:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkp-0000000Cij7-3s6Q;
	Mon, 20 Oct 2025 10:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954677;
	bh=x2mWF27zYDCpuMWgQWiHXG23FvxacWyah9lAcsG8EKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g2rBO0NMHkK12kQUBh2/MnJcHSUsh7lgw5QWOV+xgsnebkOZih6VBCXL5zzG19MLI
	 iSNorhpODz3CLPibaT0EJ7HBGNlun+xrfOi+1sQkJO1cImEtv+329Sf9OI1+vjHZ4O
	 OLRAy32YUeWHalsEc1F5zVmicF9CAPtqIruVKPzv2aEmMZz1593P2RXgj6ushgb1jF
	 xK5NoGNoEY6IdFNBaByYjwhJ9Yic+oMVBGVQP0wK+t8xdHmYrRv1V6ygr0Ht6jqqpx
	 89HhIVA7BTRQiAvzbMQukFK0BdFqPx5VFf1c30g2CdDGPxRHL/IyvnyUFgme/ZlQOJ
	 i6tM5ozWapRzw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B25EF17E0FAD;
	Mon, 20 Oct 2025 12:04:36 +0200 (CEST)
Message-ID: <336e7154-b618-466c-a9b5-cc15f0f62a27@collabora.com>
Date: Mon, 20 Oct 2025 12:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030440_128356_8621322B 
X-CRM114-Status: GOOD (  16.83  )
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> The GCE in MT8196 is placed in MMINFRA and requires all addresses
> in GCE instructions for DRAM transactions to be IOVA.
> 
> Due to MMIO, if the GCE needs to access a hardware register at
> 0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
> the MMINFRA will not know whether to write to the hardware register or
> the DRAM.
> To solve this, MMINFRA treats addresses greater than 2G as data paths
> and those less than 2G as config paths because the DRAM start address
> is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
> DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
> less than 2G.
> For example, if the DRAM start address 0x8000_0000 is mapped to
> IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
> the address in the GCE instruction. MMINFRA will then see it as a
> data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.
> 
> Since the MMINFRA remap subtracting 2G is done in hardware and cannot
> be configured by software, the address of DRAM in GCE instruction must
> always add 2G to ensure proper access. After that, the shift functions
> do more than just shift addresses, so the APIs were renamed to
> cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
> 
> This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
> CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
> cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
> instructions.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



