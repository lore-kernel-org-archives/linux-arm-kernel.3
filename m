Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A121CCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUH7VL3Mm3bzPsO/EVxu6oPgqxi2zrcrXrq0EG5YFSE=; b=EBSCTKnJ3weRMdSuS1sgkANxKf
	wmMMVtugS3ZQJ6zf/x7gNTY623RsdXUzTd/DCel4kCOd5zEt8z9vXgCFfeFIg8BWMkANttT30NZdy
	AtDNy/DHYOPY2/Qs7qzIqhdXLXT6SSxtifULmGyJsz2dfC1zvQ/di6lTL9GoOFhPjhoDrPiCTAHJe
	V973XaD96JHpdx+EIsX2A0+PSoKN65LcVuiJPwZvcMOEcNgp1KiXbD4NqxBeF+AAqcmeaj/vcMSSX
	NNNNvpoyrcx/fJRbJ/lotFzx3JgrGLO7k3e5INhcLRMNhXBryRqo3lIPsanJmRNbf6iK3zNq+q5je
	3tu455Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnto-00000001w55-2Bxd;
	Mon, 19 Jan 2026 11:58:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnta-00000001w3G-09Gd;
	Mon, 19 Jan 2026 11:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768823886;
	bh=jTsRQd9AGY63xLGQjAR5MzI8ActOiX3EAiNvmnftFQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EfhulzcFLtZYOZ0m0LmHUskUL8m/ch1z3bxJdaM9p/rUkGha6yndCy/wyVjOiWsDW
	 E1NZHLLiWKtISCmc+9pm4BxoSiI6xjsy6yCuFmNEHr7AwH1DIL5X1XmflDM9TS68sD
	 OOxN6zPEyolfCKTFiJzKCq4WCzgoKSMVzAQVfalmjp8oIOyXBTZZW9zPAWCWkd8Saj
	 BFCW7QgWJWMsLYurQhwFb8jBrMPKV11p+Mi3oFhcSG5Ml24EPqdv1BCmQZpwI/Vh5q
	 0HV4GwLUv6A35IMt8EoNIp0cAoNDPheLy0eTNoj6mYYt8Vw0AGoZhb0ZzET7B04qAR
	 qP8Oys6/HXtNA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBF7817E0117;
	Mon, 19 Jan 2026 12:58:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
Message-Id: <176882388570.29723.2273368189503773750.b4-ty@collabora.com>
Date: Mon, 19 Jan 2026 12:58:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035817_298677_1AE2F68A 
X-CRM114-Status: UNSURE (   9.25  )
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

On Fri, 31 Oct 2025 23:56:28 +0800, Jason-JH Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
> driver, including related API changes for new hardware requirements.
> 
> Series application order:
>   1. [Fixes] Refine DMA address handling for the command buffer
>   - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
>   2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
>   3. [Series 2/4] Migrate subsystems to new CMDQ APIs
>   4. [Series 3/4] Remove shift_pa from CMDQ jump functions
>   5. [Series 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v6.19-next/soc, thanks!

[2/9] mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
      commit: 266f35701b6f7ddd9521310eb5add01001d4a614
[3/9] mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      commit: 7005b7cb2fff9081a6b1738b84a8ea12a6781fb3
[4/9] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      commit: 1c1874843bc43d9f333d441af00f61ece2373e5d
[5/9] mailbox: mtk-cmdq: Add driver data to support for MT8196
      commit: 5ea617e818333a2078dadc11e5734886e39901d0
[6/9] soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
      commit: c775b23b1f78626daca804bd26f1460368f20406
[7/9] soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
      commit: 4bf783d8415cc397334b375a05f0b2321fc6c319
[8/9] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without subsys ID
      commit: 40dc5bbad63b5f60dd2e69a32def1a2673cba09e
[9/9] soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses
      commit: 22ce09ce1af574747fce072c3f62c29c440538d7

Cheers,
Angelo



