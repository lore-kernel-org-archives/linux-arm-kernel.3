Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920EACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3KucEpEWr4MToMSs6CzUKDTe9X2PHQh1yKd6odfsIE=; b=Bla4WCroAvhTmjYHS17ycXHksB
	B7DrGai4Hkaybf+/qVTImOxZEXXsOZ/oAwWOQfDNlxcHiZ2b0vBwoqcJkcsWqdof8AOF3gHl6qVxG
	YtV+tVRasNTs/zd8C/5ApBaennbTiJlaoBg79l7pfu332rbblXlGRhaJjF2VYOIu7MI16qjbD082/
	uOSLKyUUQSGC1zMdn4AuTMmX0wSguvnztzpgrq2D4gz0TBXFf5CPVKgflQDGMZUy3oz5GIPfeNVOk
	BrXhYUdlTV+1DIHZtqReoANzslQCgFJQbxfkB1vNNtVakTNgoIFJIosA5P1qHEDwEd6/QFotBtqaa
	p3QYFZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDeg-00000008nex-0laS;
	Fri, 24 Oct 2025 09:00:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDee-00000008neT-0L3t;
	Fri, 24 Oct 2025 09:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761296409;
	bh=2pMVFWg8Y6Z3M92SWEe9ppFW6tJnoGWLUlAABysjQQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z+Ih01GlT6BodeX3GlGgwYg6VLTjgEpcqYwyjvEiVWQizs287I2ZJqyz+QgwB+qz1
	 kVQYm/rtyMAiU3u8+oMr+VOzWiTw/qIagpFzrY1gluVx9lgoFZyiJYtF2MPlmdL7tP
	 +72OtL2qF5CloRaxNlJ0+djuz/A6GbuApoSS0E6a/Bg9IZSDFuHz4nRdawkouzpEZs
	 v//qEcehVBI0ku9LgqzuJOK1QmVsO7RWgNFOrkHzoCYBSxIholKwQy+9oVRzPFlu6a
	 Ip0tcmR9mk4D//bKKN68q8BN4tRRwCpkXxFU2dS8TafQ38dC1QiC6yaVc310c0cEMD
	 ICif9p0Al3FRA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 856A917E00AC;
	Fri, 24 Oct 2025 11:00:08 +0200 (CEST)
Message-ID: <66066ad6-0501-4f56-833b-16f63d06c9dc@collabora.com>
Date: Fri, 24 Oct 2025 11:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/24] MediaTek UFS Cleanup and MT8196 Enablement
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_020012_329945_141DBEA1 
X-CRM114-Status: GOOD (  29.79  )
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

Il 23/10/25 21:49, Nicolas Frattaroli ha scritto:
> In this series, the existing MediaTek UFS binding is expanded and
> completed to correctly describe not just the existing compatibles, but
> also to introduce a new compatible in the from of the MT8196 SoC.
> 
> The resets, which until now were completely absent from both the UFS
> host controller binding and the UFS PHY binding, are introduced to both.
> This also means the driver's undocumented and, in mainline, unused reset
> logic is reworked. In particular, the PHY reset is no longer a reset of
> the host controller node, but of the PHY node.
> 
> This means the host controller can reset the PHY through the common PHY
> framework.
> 
> The resets remain optional.
> 
> Additionally, a massive number of driver cleanups are introduced. These
> were prompted by me inspecting the driver more closely as I was
> adjusting it to correspond to the binding.
> 
> The driver still implements vendor properties that are undocumented in
> the binding. I did not touch most of those, as I neither want to
> convince the bindings maintainers that they are needed without knowing
> precisely what they're for, nor do I want to argue with the driver
> authors when removing them.
> 
> Due to the "Marie Kondo with a chainsaw" nature of the driver cleanup
> patches, I humbly request that reviewers do not comment on displeasing
> code they see in the context portion of a patch before they've read the
> whole patch series, as that displeasing code may in fact be reworked in
> a subsequent patch of this series. Please keep comments focused on the
> changed lines of the diff; I know there's more that can be done, but it
> doesn't necessarily need to be part of this series.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On all of the new commits that don't have the tag:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for finally doing a partial refactor of this driver - this finally brings
it to entirely different quality standards.

For all that you've done, MT8196 enablement is "just a plus". The very important
and fun part here is the whole refactoring.

Well done!

Cheers,
Angelo

> ---
> Changes in v3:
> - Split mediatek,ufs bindings change into two patches, one for
>    completing the existing binding, one for the MT8196
> - Add over a dozen driver cleanup patches
> - Add explicit support for the MT8196 compatible to the driver
> - Note: next-20251023, on which I based this, currently has a broken
>    build due to an unrelated OPP core change that was merged with no
>    build testing. I can't use next-20251022 either, as that lacks the
>    recent mediatek UFS changes. It is what it is.
> - Link to v2: https://lore.kernel.org/r/20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com
> 
> Changes in v2:
> - Reorder define in mtk_sip_svc.h
> - Use bulk reset APIs in UFS host driver
> - Link to v1: https://lore.kernel.org/r/20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com
> 
> ---
> Nicolas Frattaroli (24):
>        dt-bindings: phy: Add mediatek,mt8196-ufsphy variant
>        dt-bindings: ufs: mediatek,ufs: Complete the binding
>        dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
>        scsi: ufs: mediatek: Move MTK_SIP_UFS_CONTROL to mtk_sip_svc.h
>        phy: mediatek: ufs: Add support for resets
>        scsi: ufs: mediatek: Rework resets
>        scsi: ufs: mediatek: Rework 0.9V regulator
>        scsi: ufs: mediatek: Rework init function
>        scsi: ufs: mediatek: Rework the crypt-boost stuff
>        scsi: ufs: mediatek: Rework probe function
>        scsi: ufs: mediatek: Remove vendor kernel quirks cruft
>        scsi: ufs: mediatek: Use the common PHY framework
>        scsi: ufs: mediatek: Switch to newer PM ops helpers
>        scsi: ufs: mediatek: Remove mediatek,ufs-broken-rtc property
>        scsi: ufs: mediatek: Rework _ufs_mtk_clk_scale error paths
>        scsi: ufs: mediatek: Add vendor prefix to clk-scale-up-vcore-min
>        scsi: ufs: mediatek: Clean up logging prints
>        scsi: ufs: mediatek: Rework ufs_mtk_wait_idle_state
>        scsi: ufs: mediatek: Don't acquire dvfsrc-vcore twice
>        scsi: ufs: mediatek: Rework hardware version reading
>        scsi: ufs: mediatek: Back up idle timer in per-instance struct
>        scsi: ufs: mediatek: Make scale_us in setup_clk_gating const
>        scsi: ufs: mediatek: Remove ret local from link_startup_notify
>        scsi: ufs: mediatek: Add MT8196 compatible, update copyright
> 
>   .../devicetree/bindings/phy/mediatek,ufs-phy.yaml  |  16 +
>   .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 196 ++++-
>   drivers/phy/mediatek/phy-mtk-ufs.c                 |  71 ++
>   drivers/ufs/host/ufs-mediatek-sip.h                |   9 -
>   drivers/ufs/host/ufs-mediatek.c                    | 935 +++++++++------------
>   drivers/ufs/host/ufs-mediatek.h                    |  17 +-
>   include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
>   7 files changed, 650 insertions(+), 597 deletions(-)
> ---
> base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
> change-id: 20251014-mt8196-ufs-cec4b9a97e53
> 
> Best regards,


