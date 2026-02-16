Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE6E7BDB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhyB6c8ntYZYSygMUgb1bVq3hiRaTuESplIUrEVnry8=; b=sYHuSbA3qo0mu8G01uVjlP2MWQ
	MvdfBXgf+X9VWIpj6ZNKPnqVIlainS7PHRKi2IB/qIOaKdGUzbLx39JPTSO5L+eI7UGsE6RYzFhyh
	i+1if00PnmzLOunrYtvq0GX1HuNAozV6cO99s/v98VKm11XNavA+4yZoKVFL7JOKWcZV/6xIIJV0J
	judvMOm4e1mjh1f4D2nzUiGrAmhfTZrj7wcS5t+iQc52ZmUP6bQYfrj+sSOXma21dnZy1dnfP8a+v
	pvalNEDfJ5y/3v6+VgzaraQ4lQs7jc0HKlB2JrWPeiVIakwHmm+BpT6twj7nhS1Z919C2+ORNAwzL
	/69/sEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxtz-00000006XFy-1rds;
	Mon, 16 Feb 2026 12:40:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxtw-00000006XFX-0s76;
	Mon, 16 Feb 2026 12:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771245629;
	bh=PHIqXh1eLE9p2tZcIm96nDuJo+9ii2K9jjaxQdmaZYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IrQ8bremQEZjbg01aNCDrn750sqUk0ybTWIVCZAkFrY1bw89+SLoiIhCLdA/ll009
	 1jHWrvmAk4riWb6sxOrJsfLrWzbYto7qU1Vg0jn91SrlFUoZTFSDPL4IG8u9IpsBsA
	 nHaF58HdlaHPbW3OX86CsU4NxzmbA9QZDx45oWrlAVSolKTN2ZaXBiXeNNRVVdQyz4
	 uSJp/sQU3Towk5ziQGMfloPmonmfJGACNsdSnefoB0ucq+J+uw2L8Ae3sU7mlBsTsF
	 h7AjXMRVo200AS09QenWCC9BKpsnKdpz/l9Fw1ETWVa6ysVsfKD2xVQN/gf5yhvefm
	 TYcK4zFOm4miw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C25A17E00A3;
	Mon, 16 Feb 2026 13:40:28 +0100 (CET)
Message-ID: <90e0cbe5-3219-4196-a4bd-015e320d07b3@collabora.com>
Date: Mon, 16 Feb 2026 13:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/24] MediaTek UFS Cleanup and MT8196 Enablement
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
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_044032_431316_87350E0D 
X-CRM114-Status: GOOD (  38.77  )
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

Il 24/01/26 13:00, Nicolas Frattaroli ha scritto:
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

Nicolas, can you please rebase this series on the latest linux-next?

All that you have to do is resend everything as-is, but drop patch [14/24], as the
same thing that you've done there landed in form of..

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/ufs/host/ufs-mediatek.c?h=next-20260213&id=bbb8d98fb4536594cb104fd630ea0f7dce3771d6

Besides. It feels like we're again playing a resend-and-nobody-cares game again
with this UFS driver.

I want to remind everyone that we've been trying to cleanup this thing for more
than a year and that our patches keep getting mostly ignored, if not for some
random nitpick here and there. (we: as I myself tried to clean it up a year ago
with my own patches that I had sent to the list - multiple versions of those)

Expressing my huge frustration here: at this point I'm not even sure why we keep
trying to make this right, other than being stubborn about feeling the need to
have good stuff in the kernel, instead of downstream code dumps which should've
never landed in the first place.

Though everyone here is human, and humans make mistakes (a lot), that's fine: the
problem happens when people negate mistakes, don't fix those, and don't care (not
because of lack of time, but because not caring at all, again - we've tried to do
those cleanups for a year now). One. Year.
Actually, more than one year, I don't even remember anymore.

This is not good behavior in a community, and should never happen.

Yet, here we are. Again. On the same driver. In the same subsystem.

Oh well.

Regards,
Angelo

> ---
> Changes in v6:
> - Reword "Rework probe function" commit to better justify the changes
>    being made.
> - Drop "Add vendor prefix to clk-scale-up-vcore-min"
> - Add patch to remove clk-scale-up-vcore-min entirely, describing the
>    process for bringing it back (in a different form) in the commit
>    message.
> - Link to v5: https://lore.kernel.org/r/20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com
> 
> Changes in v5:
> - Drop "scsi: ufs: mediatek: Make scale_us in setup_clk_gating const" as
>    someone else already got a patch in for this into next.
> - Make mtk_init_boost_crypt void
> - Don't disable/enable misc regulators during suspend/resume, but enable
>    them once when acquiring with a devm helper.
> - Link to v4: https://lore.kernel.org/r/20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com
> 
> Changes in v4:
> - bindings: Redo the supply situation, as the avdd pins don't describe
>    the vcc(q2) card supplies.
> - bindings: format clock in mt8196 example more tersely.
> - phy: use devm_reset_control_get_optional_exclusive directly
> - driver: get and enable/disable the aforementioned avdd supplies.
> - Link to v3: https://lore.kernel.org/r/20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com
> 
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
>        scsi: ufs: mediatek: Handle misc host voltage regulators
>        scsi: ufs: mediatek: Rework probe function
>        scsi: ufs: mediatek: Remove vendor kernel quirks cruft
>        scsi: ufs: mediatek: Use the common PHY framework
>        scsi: ufs: mediatek: Switch to newer PM ops helpers
>        scsi: ufs: mediatek: Remove mediatek,ufs-broken-rtc property
>        scsi: ufs: mediatek: Rework _ufs_mtk_clk_scale error paths
>        scsi: ufs: mediatek: Clean up logging prints
>        scsi: ufs: mediatek: Rework ufs_mtk_wait_idle_state
>        scsi: ufs: mediatek: Don't acquire dvfsrc-vcore twice
>        scsi: ufs: mediatek: Rework hardware version reading
>        scsi: ufs: mediatek: Back up idle timer in per-instance struct
>        scsi: ufs: mediatek: Remove ret local from link_startup_notify
>        scsi: ufs: mediatek: Remove undocumented "clk-scale-up-vcore-min"
>        scsi: ufs: mediatek: Add MT8196 compatible, update copyright
> 
>   .../devicetree/bindings/phy/mediatek,ufs-phy.yaml  |  16 +
>   .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 173 +++-
>   drivers/phy/mediatek/phy-mtk-ufs.c                 |  71 ++
>   drivers/ufs/host/ufs-mediatek-sip.h                |   9 -
>   drivers/ufs/host/ufs-mediatek.c                    | 973 +++++++++------------
>   drivers/ufs/host/ufs-mediatek.h                    |  17 +-
>   include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
>   7 files changed, 655 insertions(+), 607 deletions(-)
> ---
> base-commit: 4af4e95edc37ae54f64cbd75b46f16ce15f3a6b8
> change-id: 20251014-mt8196-ufs-cec4b9a97e53
> 
> Best regards,


