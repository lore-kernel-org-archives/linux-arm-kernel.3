Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A5EC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UEzKUI5Rlxm0TOMGagDnsHNTLRUXYwJrwmWHO28HRo=; b=eqZWSPYhq1WdRrKu7BaayZsaHm
	j3Zw3HPfaDPxu8hKg2iyzlAialVYeQpLooyZfH89IRZAd5dnZ1wC/oUxHmA3pe/l/fm07rDNDWaFX
	UhpPuLZuSXTwkKa8bFiWnee6HgTPaxKjxmHqMbI+mB7rzeM8K4poA+ypqX9QAbBDjS1gXIT78z0fJ
	/r8pqeQetGMjJJi/0ao12VGDrB+8S4OwaY67tV6ZcrejkthqA3vdVx6RZ8ia1esMBPz7DkHbaLKMo
	f9ciT17lD2xzhuZSIPwxiAsU29yyf42n36T3V3sg7fbLERwZLw6yniLWDM0CPpchLbopNOaLzpOVP
	jCuQqSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Ir-00000006vm5-1vbr;
	Tue, 11 Mar 2025 20:34:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5sW-00000006soY-2fcA;
	Tue, 11 Mar 2025 20:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 035F35C06AD;
	Tue, 11 Mar 2025 20:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42233C4CEE9;
	Tue, 11 Mar 2025 20:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741723623;
	bh=vmaAEzFBzlwDTRy5wbpxrPDsyq9A9SymsOA8U2CimH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPGRFmy0YVDPHDZ7+K5ZTo4vlxXOfDmTaKHtwHWjkPwPsuD0S+rT853k4/cIXkN/Z
	 SY3BYWAPve5Ok17t8mhicA4mhb7c0uBGGXA0ToN9E4WMR9cNXfgFElMzI3qWXI0XNp
	 rhRJryEkB/c5tLMqPviYw8mea5GMaLjULNp9s6D4XEC9FHQdt6QI5eiEuHloahwB2j
	 XA7lfhFwWnvSE9f2mkLHjSJaBm4klpwloKDLGhgKR60XEBmPwkTn4fDVl9P/Rhirda
	 zN3OFgHa2bw1t+CFKFm2GKMnIeoNQjx2dZ+dBRMDHuPTSSYSj9gObLOB08K8iIVkvQ
	 1/zGT3HdwoxNg==
Date: Tue, 11 Mar 2025 15:07:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
Message-ID: <174172361378.44650.15345202042780383326.robh@kernel.org>
References: <20250311122327.20685-1-friday.yang@mediatek.com>
 <20250311122327.20685-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122327.20685-2-friday.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_130704_762202_BA16BB59 
X-CRM114-Status: GOOD (  19.64  )
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


On Tue, 11 Mar 2025 20:23:21 +0800, Friday Yang wrote:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
> 
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
> 
> For previous discussion on the direction of the code modifications,
> please refer to:
> https://lore.kernel.org/all/CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=wXpobDWU1CnvkA@mail.gmail.com/
> https://lore.kernel.org/all/CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8eyhP+KJ5Fasm2rFg@mail.gmail.com/
> 
> On the MediaTek MT8188 SoC platform, we encountered power-off failures
> and SMI bus hang issues during camera stress tests. The issue arises
> because bus glitches are sometimes produced when MTCMOS powers on or
> off. While this is fairly normal, the software must handle these
> glitches to avoid mistaking them for transaction signals. What's
> more, this issue emerged only after the initial upstreaming of this
> binding. Without these patches, the SMI becomes unstable during camera
> stress tests.
> 
> The software solutions can be summarized as follows:
> 
> 1. Use CLAMP to disable the SMI sub-common port after turning off the
>    LARB CG and before turning off the LARB MTCMOS.
> 2. Use CLAMP to disable/enable the SMI sub-common port.
> 3. Implement an AXI reset for SMI LARBs.
> 
> This patch primarily add two changes:
> 1. Add compatible for SMI sub-common on MT8188 SoC.
> 2. Add 'resets' and 'reset-names' properties for SMI LARBs to
>    support SMI reset operations.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  .../mediatek,smi-common.yaml                  |  2 ++
>  .../memory-controllers/mediatek,smi-larb.yaml | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


