Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE72C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU599F+MPVjbxx+71wMrndZggEBG2jyWapsgbgw1XlY=; b=wj6FLhpsnW9fQyNU4e4okp/hw8
	8Jho7+42EnIyROxVoJuLGGfMejhGBPASuG7iyqT/IV9HyeIujKV45gH738zTy0iorXoRqe1r/FZta
	YQGR2GiTUICWYT51Ww99rlcGfsgDaOS47vIXh2yCG/464VTv9YCiVibnJpyZEdlu6QPZxcQ8Yq0ws
	47MkmskTFG1JA2mmd+595mTKoUET1Uo1P1IF2jTrQiGsnpgK+eHT15SosKXLzhMkYx3n3igolh8Ln
	+CSBC3gLTZychhK8XICND03QRt7R9RKOR1M+GpB9KWiQxuYHnGjVtgLC3aBeHdJjt2E/Xs6lxalzI
	mc5VRpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEac4-0000000AiBo-1hLm;
	Mon, 12 May 2025 21:23:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaa2-0000000Ai3A-3b8Q;
	Mon, 12 May 2025 21:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4ED35C2714;
	Mon, 12 May 2025 21:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64041C4CEE7;
	Mon, 12 May 2025 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084857;
	bh=0n+J3XWiTC/P1aJ+snuMzQvAm4ZMOQe1OgPN5jR9O+I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HmEZauUGAxhb+Vohr1rCBYIsvRpapWLL/nz80yV72QJxcQOxA8JLHT5SWKlaPL4e4
	 9S2nNNKtMcG10Fs8NYJ8dqtt4lrirO5XNuUe7EerPmAlkSNsG6X/NYqRKLMqfKJS5B
	 ijI9t8XbmStKqVc2mUMh1js3fg3e3fbTKW4FNU6+CZSwvFIEXjmeNYgzGPAmMrLMy8
	 IkAnEy/clnbp+x7orp74Q6uMhYnXUnbpyZY+Wq/IX0r3BTxX+VtBo2wL7WBspj19R0
	 odvCrbODbxh3YNaUCoLYPVsHv9scbqWKKD3q6CIL8ID07UpjS5X2zsGfVX8k4Sxp9d
	 l0MSrtacKdTPg==
Date: Mon, 12 May 2025 16:20:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, heiko@sntech.de, 
 linux-rockchip@lists.infradead.org, sfr@canb.auug.org.au
To: chainsx@foxmail.com
In-Reply-To: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
References: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
Message-Id: <174708481857.4125966.6823663224715045575.robh@kernel.org>
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for Firefly
 ROC-RK3588S-PC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142059_008597_AD83CBB4 
X-CRM114-Status: GOOD (  17.80  )
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


On Mon, 12 May 2025 21:21:11 +0800, chainsx@foxmail.com wrote:
> From: Hsun Lai <chainsx@foxmail.com>
> 
> The Firefly ROC-RK3588S-PC is a SBC based on the Rockchip RK3588s SoC.
> 
> Link: https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> The device contains the following hardware that is tested/working:
>  - 32 or 64GB eMMC
>  - SDMMC card slot
>  - Realtek USB WiFi 5/BT
>  - NVME 2242 socket
>  - 4 or 8GB of RAM
>  - RTL8211 GbE
>  - USB 3.0 port
>  - USB 2.0 port
>  - HDMI port
> 
> Signed-off-by: Hsun Lai <chainsx@foxmail.com>
> 
> ---
> 
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
> 
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 911 ++++++++++++++++++
>  2 files changed, 912 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: remotes/arm-soc/rockchip/dt64-12-gff7c417e54a8 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: / (firefly,rk3588s-roc-pc): compatible: 'oneOf' conditional failed, one must be fixed:
	['firefly,rk3588s-roc-pc', 'rockchip,rk3588s'] is too short
	'vamrs,ficus' was expected
	'vamrs,rock960' was expected
	'amarula,vyasa-rk3288' was expected
	'firefly,rk3588s-roc-pc' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
	'firefly,rk3588s-roc-pc' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
	'ariaboard,photonicat' was expected
	'armsom,sige5' was expected
	'armsom,sige7' was expected
	'firefly,rk3588s-roc-pc' is not one of ['armsom,w3']
	'asus,rk3288-tinker' was expected
	'asus,rk3288-tinker-s' was expected
	'azw,beelink-a1' was expected
	'bigtreetech,cb2-manta' was expected
	'bigtreetech,pi2' was expected
	'mundoreader,bq-curie2' was expected
	'mundoreader,bq-edison2qc' was expected
	'chipspark,popmetal-rk3288' was expected
	'chipspark,rayeager-px2' was expected
	'firefly,rk3588s-roc-pc' is not one of ['coolpi,pi-cm5-evb']
	'firefly,rk3588s-roc-pc' is not one of ['coolpi,pi-cm5-genbook']
	'coolpi,pi-4b' was expected
	'edgeble,neural-compute-module-2-io' was expected
	'edgeble,neural-compute-module-6a-io' was expected
	'elgin,rv1108-r1' was expected
	'embedfire,lubancat-1' was expected
	'embedfire,lubancat-2' was expected
	'engicam,px30-core-ctouch2' was expected
	'engicam,px30-core-ctouch2-of10' was expected
	'engicam,px30-core-edimm2.2' was expected
	'firefly,rk3588s-roc-pc' is not one of ['mntre,reform2-rcore']
	'firefly,rk3588s-roc-pc' is not one of ['firefly,itx-3588j']
	'firefly,px30-jd4-core-mb' was expected
	'firefly,rk3588s-roc-pc' is not one of ['firefly,firefly-rk3288', 'firefly,firefly-rk3288-beta']
	'firefly,firefly-rk3288-reload' was expected
	'firefly,firefly-rk3399' was expected
	'firefly,roc-rk3308-cc' was expected
	'firefly,roc-rk3328-cc' was expected
	'firefly,roc-rk3328-pc' was expected
	'firefly,rk3588s-roc-pc' is not one of ['firefly,roc-rk3399-pc', 'firefly,roc-rk3399-pc-mezzanine']
	'firefly,rk3588s-roc-pc' is not one of ['firefly,roc-rk3399-pc-plus']
	'firefly,roc-rk3576-pc' was expected
	'firefly,rk3566-roc-pc' was expected
	'firefly,rk3568-roc-pc' was expected
	'firefly,rk3588s-roc-pc' is not one of ['forlinx,ok3588-c']
	'firefly,rk3588s-roc-pc' is not one of ['friendlyarm,nanopi-r2c', 'friendlyarm,nanopi-r2c-plus', 'friendlyarm,nanopi-r2s', 'friendlyarm,nanopi-r2s-plus']
	'friendlyarm,nanopi-r3s' was expected
	'firefly,rk3588s-roc-pc' is not one of ['friendlyarm,nanopc-t4', 'friendlyarm,nanopi-m4', 'friendlyarm,nanopi-m4b', 'friendlyarm,nanopi-neo4', 'friendlyarm,nanopi-r4s', 'friendlyarm,nanopi-r4s-enterprise']
	'firefly,rk3588s-roc-pc' is not one of ['friendlyarm,nanopi-r5c', 'friendlyarm,nanopi-r5s']
	'firefly,rk3588s-roc-pc' is not one of ['friendlyarm,nanopi-r6c', 'friendlyarm,nanopi-r6s']
	'firefly,rk3588s-roc-pc' is not one of ['friendlyarm,nanopc-t6', 'friendlyarm,nanopc-t6-lts']
	'firefly,rk3588s-roc-pc' is not one of ['friendlyarm,cm3588-nas']
	'gameforce,ace' was expected
	'gameforce,chi' was expected
	'geekbuying,geekbox' was expected
	'geniatech,xpi-3128' was expected
	'google,bob-rev13' was expected
	'google,veyron-brain-rev0' was expected
	'google,veyron-fievel-rev8' was expected
	'google,gru-rev15' was expected
	'google,veyron-jaq-rev5' was expected
	'google,veyron-jerry-rev15' was expected
	'google,kevin-rev15' was expected
	'google,veyron-mickey-rev8' was expected
	'google,veyron-mighty-rev5' was expected
	'google,veyron-minnie-rev4' was expected
	'google,veyron-pinky-rev2' was expected
	'google,scarlet-rev15-sku0' was expected
	'google,scarlet-rev15-sku7' was expected
	'google,scarlet-rev15-sku2' was expected
	'google,veyron-speedy-rev9' was expected
	'google,veyron-tiger-rev8' was expected
	'haochuangyi,h96-max-v58' was expected
	'haoyu,marsboard-rk3066' was expected
	'hardkernel,rk3326-odroid-go2' was expected
	'hardkernel,rk3326-odroid-go2-v11' was expected
	'hardkernel,rk3326-odroid-go3' was expected
	'hardkernel,odroid-m1' was expected
	'hardkernel,odroid-m1s' was expected
	'hardkernel,odroid-m2' was expected
	'hugsun,x99' was expected
	'indiedroid,nova' was expected
	'firefly,rk3588s-roc-pc' is not one of ['khadas,edge', 'khadas,edge-captain', 'khadas,edge-v']
	'khadas,edge2' was expected
	'kobol,helios64' was expected
	'mecer,xms6' was expected
	'leez,p710' was expected
	'lckfb,tspi-rk3566' was expected
	'firefly,rk3588s-roc-pc' is not one of ['lunzn,fastrhino-r66s', 'lunzn,fastrhino-r68s']
	'mqmaker,miqi' was expected
	'neardi,lba3368' was expected
	'netxeon,r89' was expected
	'openailab,eaidk-610' was expected
	'xunlong,rk3399-orangepi' was expected
	'phytec,rk3288-pcm-947' was expected
	'pine64,pinebook-pro' was expected
	'firefly,rk3588s-roc-pc' is not one of ['pine64,pinenote-v1.1', 'pine64,pinenote-v1.2']
	'pine64,pinephone-pro' was expected
	'firefly,rk3588s-roc-pc' is not one of ['pine64,pinetab2-v0.1', 'pine64,pinetab2-v2.0']
	'pine64,rock64' was expected
	'firefly,rk3588s-roc-pc' is not one of ['pine64,rockpro64-v2.1', 'pine64,rockpro64-v2.0']
	'firefly,rk3588s-roc-pc' is not one of ['pine64,quartz64-a', 'pine64,quartz64-b']
	'pine64,quartzpro64' was expected
	'firefly,rk3588s-roc-pc' is not one of ['pine64,soquartz-blade', 'pine64,soquartz-cm4io', 'pine64,soquartz-model-a']
	'firefly,rk3588s-roc-pc' is not one of ['powkiddy,rgb10max3', 'powkiddy,rgb20sx', 'powkiddy,rgb30', 'powkiddy,rk2023', 'powkiddy,x55']
	'prt,mecsbc' was expected
	'qnap,ts433' was expected
	'firefly,rk3588s-roc-pc' is not one of ['radxa,cm3-io']
	'firefly,rk3588s-roc-pc' is not one of ['radxa,e25']
	'radxa,e20c' was expected
	'radxa,e52c' was expected
	'radxa,rock' was expected
	'firefly,rk3588s-roc-pc' is not one of ['radxa,rockpi4a', 'radxa,rockpi4a-plus', 'radxa,rockpi4b', 'radxa,rockpi4b-plus', 'radxa,rockpi4c']
	'radxa,rock-4c-plus' was expected
	'radxa,rock-4d' was expected
	'radxa,rock-4se' was expected
	'radxa,rockpi-e' was expected
	'radxa,rockpi-n8' was expected
	'radxa,rockpi-n10' was expected
	'radxa,rockpis' was expected
	'radxa,rock2-square' was expected
	'radxa,rock3a' was expected
	'radxa,rock-3b' was expected
	'radxa,rock-3c' was expected
	'radxa,rock-5-itx' was expected
	'radxa,rock-5a' was expected
	'radxa,rock-5b' was expected
	'radxa,rock-5c' was expected
	'radxa,rock-s0' was expected
	'firefly,rk3588s-roc-pc' is not one of ['radxa,zero-3e', 'radxa,zero-3w']
	'relfor,saib' was expected
	'rikomagic,mk808' was expected
	'rockchip,rk3036-kylin' was expected
	'rockchip,px3-evb' was expected
	'rockchip,px30-evb' was expected
	'rockchip,px5-evb' was expected
	'rockchip,r88' was expected
	'rockchip,rk3036-evb' was expected
	'rockchip,rk3128-evb' was expected
	'rockchip,rk3228-evb' was expected
	'rockchip,rk3229-evb' was expected
	'firefly,rk3588s-roc-pc' is not one of ['rockchip,rk3288-evb-act8846', 'rockchip,rk3288-evb-rk808']
	'rockchip,rk3308-evb' was expected
	'rockchip,rk3328-evb' was expected
	'rockchip,rk3368-evb-act8846' was expected
	'rockchip,rk3399-evb' was expected
	'rockchip,rk3399-evb-ind' was expected
	'rockchip,rk3399-sapphire' was expected
	'rockchip,rk3399-sapphire-excavator' was expected
	'rockchip,rk3566-box-demo' was expected
	'rockchip,rk3568-evb1-v10' was expected
	'rockchip,rk3576-evb1-v10' was expected
	'firefly,rk3588s-roc-pc' is not one of ['rockchip,rk3588-evb1-v10', 'rockchip,rk3588-evb2-v10']
	'rockchip,rk3588s-evb1-v10' was expected
	'rockchip,rv1108-evb' was expected
	'rockchip,rk3588-toybrick-x0' was expected
	'sinovoip,rk3308-bpi-p2pro' was expected
	'sinovoip,rk3568-bpi-r2pro' was expected
	'itead,sonoff-ihost' was expected
	'tsd,px30-ringneck-haikou' was expected
	'tsd,rk3368-lion-haikou' was expected
	'tsd,rk3399-puma-haikou' was expected
	'tsd,rk3588-jaguar' was expected
	'tsd,rk3588-tiger-haikou' was expected
	'tronsmart,orion-r68-meta' was expected
	'turing,rk1' was expected
	'wolfvision,rk3568-pf5' was expected
	'firefly,rk3588s-roc-pc' is not one of ['xunlong,orangepi-3b-v1.1', 'xunlong,orangepi-3b-v2.1']
	'firefly,rk3588s-roc-pc' is not one of ['xunlong,orangepi-5-max', 'xunlong,orangepi-5-plus', 'xunlong,orangepi-5-ultra']
	'firefly,rk3588s-roc-pc' is not one of ['xunlong,orangepi-r1-plus', 'xunlong,orangepi-r1-plus-lts']
	'firefly,rk3588s-roc-pc' is not one of ['xunlong,orangepi-5', 'xunlong,orangepi-5b']
	'zkmagic,a95x-z2' was expected
	'rockchip,rk3399' was expected
	'rockchip,rk3288' was expected
	'rockchip,rk3326' was expected
	'rockchip,rk3566' was expected
	'rockchip,rk3568' was expected
	'rockchip,rk3576' was expected
	'rockchip,rk3588' was expected
	'armsom,lm7' was expected
	'rockchip,rk3328' was expected
	'bigtreetech,cb2' was expected
	'rockchip,rk3066a' was expected
	'rockchip,rk3188' was expected
	'coolpi,pi-cm5' was expected
	'edgeble,neural-compute-module-2' was expected
	'rockchip,rk3588s' is not one of ['edgeble,neural-compute-module-6a', 'edgeble,neural-compute-module-6b']
	'rockchip,rv1108' was expected
	'engicam,px30-core' was expected
	'firefly,icore-3588q' was expected
	'firefly,core-3588j' was expected
	'firefly,px30-jd4-core' was expected
	'rockchip,rk3308' was expected
	'forlinx,fet3588-c' was expected
	'friendlyarm,cm3588' was expected
	'rockchip,rk3368' was expected
	'rockchip,rk3128' was expected
	'google,bob-rev12' was expected
	'google,veyron-brain' was expected
	'google,veyron-fievel-rev7' was expected
	'google,gru-rev14' was expected
	'google,veyron-jaq-rev4' was expected
	'google,veyron-jerry-rev14' was expected
	'google,kevin-rev14' was expected
	'google,veyron-mickey-rev7' was expected
	'google,veyron-mighty-rev4' was expected
	'google,veyron-minnie-rev3' was expected
	'google,veyron-pinky' was expected
	'google,scarlet-rev15' was expected
	'google,scarlet-rev15-sku4' was expected
	'google,veyron-speedy-rev8' was expected
	'google,veyron-tiger-rev7' was expected
	'rockchip,rk3229' was expected
	'phytec,rk3288-phycore-som' was expected
	'pine64,pinenote' was expected
	'pine64,pinetab2' was expected
	'pine64,rockpro64' was expected
	'pine64,soquartz' was expected
	'radxa,cm3' was expected
	'radxa,cm3i' was expected
	'rockchip,rk3528' was expected
	'rockchip,rk3582' was expected
	'radxa,rockpi4' was expected
	'vamrs,rk3288-vmarc-som' was expected
	'vamrs,rk3399pro-vmarc-som' was expected
	'rockchip,rv1109' was expected
	'rockchip,rk3036' was expected
	'rockchip,px3' was expected
	'rockchip,px30' was expected
	'rockchip,px5' was expected
	'rockchip,rk3228' was expected
	'rockchip,rk3588s' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
	'tsd,rk3588-tiger' was expected
	'xunlong,orangepi-3b' was expected
	'rockchip,rk3318' was expected
	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /: failed to match any schema with compatible: ['firefly,rk3588s-roc-pc', 'rockchip,rk3588s']
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: leds: leds-gpio: {'rockchip,pins': [[3, 10, 0, 259], [1, 29, 0, 259], [3, 16, 0, 259]], 'phandle': 273} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: leds (gpio-leds): 'power', 'user', 'user1' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#






