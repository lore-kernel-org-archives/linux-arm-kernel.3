Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ECDCAC580
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArpCIlkh/lraQNLB7t2YyDnE0FROOd+Lpbet72k+rHY=; b=Rb0bjOb4DHgCZ5ZALMa0AmzJQm
	1+vB5aU9eqW60dhbxxl8VF7srhE4OC3TlqjudIxB/jcti4JrJqR5GVpAbmf0TG+yHSwFZpQMes9bO
	9nriKkRrHsKnXcAjXl8XEHtwIExdNALl/Zyp9AFA6S7yBt5f/IhDjT5kEvmb34SvquFN8U8Q4ZH8y
	JMoaBc8Og4DZJqSBcfjeYbKssOT4V+1aXsTt8GQe7DxeY+x3YAW5cHjlhKCMhDPBTYXi0OienCm1R
	qWXN/5tVsdn3AuuKwaKuoFWGKdFqBtXDpH6PLjsyEWSjwG8hImld3e94OjGpHx63Xd8NDiyobMFgg
	hpddsTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVh-00000005Rrm-2aXD;
	Sat, 06 Sep 2025 00:10:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaUi-00000003Z22-3jyu;
	Fri, 05 Sep 2025 17:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 396046029D;
	Fri,  5 Sep 2025 17:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D222DC4CEF1;
	Fri,  5 Sep 2025 17:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757094304;
	bh=C46s7hBIp/7I7g3iFchOJkWWteGrjqmuukelCJb3G0k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MrdBfS71Zbvdbsmuxhc03bjZc5hGJgLzDipeLEo5f4yP2nTCPEbbsO01oMDPLtnv7
	 i/WAAGePBjww9oCPEN49Zolf9DJyTHtjbEL7Xp04eiMKHW6jWxaB28B6PjSnrBULy4
	 keAC4hOknYgKf3F7iKGe6dqWVv2AtE6g812SfXKm8GA+JPz35a9BjKaJjVSxJ5/h0p
	 Sy/igszbOnz3kT/w7vCfgjxvSYq1gzQ6tCs/BUyHGUupUtcKDAfEKVFeJ/X4kq3Mnd
	 JRHpNgPNzOnvnI3234FTlZ1UrYBTBr9/VxeL2gNcgP4zUKHwIpIImo3tLMQWFWrPU4
	 cldqVpcnkHe5w==
Date: Fri, 05 Sep 2025 12:45:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>, Wayne Chou <zxf@t-chip.com.cn>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
 Peter Robinson <pbrobinson@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
To: Kaison Deng <dkx@t-chip.com.cn>
In-Reply-To: <20250905090115.718622-1-dkx@t-chip.com.cn>
References: <20250905090115.718622-1-dkx@t-chip.com.cn>
Message-Id: <175709416215.988676.623201244789080768.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the
 ROC-RK3588-RT
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


On Fri, 05 Sep 2025 17:01:15 +0800, Kaison Deng wrote:
> The Firefly ROC-RK3588-RT is RK3588 based SBC featuring:
> 
> - TF card slot
> - NVME 2242 socket
> - 1x USB 3.0 Port, 1x USB 2.0 Port, 1x Typec Port
> - 1x HDMI 2.1 out, 1x HDMI 2.0 out
> - 2x Gigabit Ethernet, 1x 2.5G Ethernet
> - M.2 E-KEY for Extended WiFI and Bluetoolh
> - ES8388 on-board sound codec - jack in/out
> - RTC
> - LED: WORK, DIY
> - BTB connector for PCie, UART, USB, CAN, SARADC, GPIO
> 
> Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../arm64/boot/dts/rockchip/rk3588-roc-rt.dts | 1120 +++++++++++++++++
>  2 files changed, 1121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
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
 Base: using specified base-commit 6cc18e940db6731556843b7fa2924eb2efcef53f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250905090115.718622-1-dkx@t-chip.com.cn:

arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: / (firefly,rk3588-roc-rt): compatible: 'oneOf' conditional failed, one must be fixed:
	['firefly,rk3588-roc-rt', 'rockchip,rk3588'] is too short
	'vamrs,ficus' was expected
	'vamrs,rock960' was expected
	'amarula,vyasa-rk3288' was expected
	'firefly,rk3588-roc-rt' is not one of ['anbernic,rg351m', 'anbernic,rg351v']
	'firefly,rk3588-roc-rt' is not one of ['anbernic,rg353p', 'anbernic,rg353ps', 'anbernic,rg353v', 'anbernic,rg353vs', 'anbernic,rg503', 'anbernic,rg-arc-d', 'anbernic,rg-arc-s']
	'ariaboard,photonicat' was expected
	'armsom,sige1' was expected
	'armsom,sige5' was expected
	'armsom,sige7' was expected
	'firefly,rk3588-roc-rt' is not one of ['armsom,w3']
	'asus,rk3288-tinker' was expected
	'asus,rk3288-tinker-s' was expected
	'azw,beelink-a1' was expected
	'bigtreetech,cb2-manta' was expected
	'bigtreetech,pi2' was expected
	'mundoreader,bq-curie2' was expected
	'mundoreader,bq-edison2qc' was expected
	'chipspark,popmetal-rk3288' was expected
	'chipspark,rayeager-px2' was expected
	'firefly,rk3588-roc-rt' is not one of ['coolpi,pi-cm5-evb']
	'firefly,rk3588-roc-rt' is not one of ['coolpi,pi-cm5-genbook']
	'coolpi,pi-4b' was expected
	'edgeble,neural-compute-module-2-io' was expected
	'edgeble,neural-compute-module-6a-io' was expected
	'elgin,rv1108-r1' was expected
	'embedfire,lubancat-1' was expected
	'embedfire,lubancat-2' was expected
	'engicam,px30-core-ctouch2' was expected
	'engicam,px30-core-ctouch2-of10' was expected
	'engicam,px30-core-edimm2.2' was expected
	'firefly,rk3588-roc-rt' is not one of ['mntre,reform2-rcore']
	'firefly,rk3588-roc-rt' is not one of ['firefly,itx-3588j']
	'firefly,px30-jd4-core-mb' was expected
	'firefly,rk3588-roc-rt' is not one of ['firefly,firefly-rk3288', 'firefly,firefly-rk3288-beta']
	'firefly,firefly-rk3288-reload' was expected
	'firefly,firefly-rk3399' was expected
	'firefly,roc-rk3308-cc' was expected
	'firefly,roc-rk3328-cc' was expected
	'firefly,roc-rk3328-pc' was expected
	'firefly,rk3588-roc-rt' is not one of ['firefly,roc-rk3399-pc', 'firefly,roc-rk3399-pc-mezzanine']
	'firefly,rk3588-roc-rt' is not one of ['firefly,roc-rk3399-pc-plus']
	'firefly,roc-rk3576-pc' was expected
	'firefly,rk3566-roc-pc' was expected
	'firefly,rk3588s-roc-pc' was expected
	'firefly,rk3568-roc-pc' was expected
	'firefly,rk3588-roc-rt' is not one of ['forlinx,ok3588-c']
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,nanopi-r2c', 'friendlyarm,nanopi-r2c-plus', 'friendlyarm,nanopi-r2s', 'friendlyarm,nanopi-r2s-plus']
	'friendlyarm,nanopi-r3s' was expected
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,nanopc-t4', 'friendlyarm,nanopi-m4', 'friendlyarm,nanopi-m4b', 'friendlyarm,nanopi-neo4', 'friendlyarm,nanopi-r4s', 'friendlyarm,nanopi-r4s-enterprise']
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,nanopi-m5']
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,nanopi-r5c', 'friendlyarm,nanopi-r5s']
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,nanopi-r6c', 'friendlyarm,nanopi-r6s']
	'friendlyarm,nanopi-zero2' was expected
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,nanopc-t6', 'friendlyarm,nanopc-t6-lts']
	'firefly,rk3588-roc-rt' is not one of ['friendlyarm,cm3588-nas']
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
	'firefly,rk3588-roc-rt' is not one of ['hinlink,h66k', 'hinlink,h68k']
	'hugsun,x99' was expected
	'indiedroid,nova' was expected
	'firefly,rk3588-roc-rt' is not one of ['khadas,edge', 'khadas,edge-captain', 'khadas,edge-v']
	'khadas,edge2' was expected
	'kobol,helios64' was expected
	'mecer,xms6' was expected
	'leez,p710' was expected
	'lckfb,tspi-rk3566' was expected
	'firefly,rk3588-roc-rt' is not one of ['luckfox,omni3576']
	'firefly,rk3588-roc-rt' is not one of ['lunzn,fastrhino-r66s', 'lunzn,fastrhino-r68s']
	'mqmaker,miqi' was expected
	'neardi,lba3368' was expected
	'netxeon,r89' was expected
	'openailab,eaidk-610' was expected
	'xunlong,rk3399-orangepi' was expected
	'phytec,rk3288-pcm-947' was expected
	'pine64,pinebook-pro' was expected
	'firefly,rk3588-roc-rt' is not one of ['pine64,pinenote-v1.1', 'pine64,pinenote-v1.2']
	'pine64,pinephone-pro' was expected
	'firefly,rk3588-roc-rt' is not one of ['pine64,pinetab2-v0.1', 'pine64,pinetab2-v2.0']
	'pine64,rock64' was expected
	'firefly,rk3588-roc-rt' is not one of ['pine64,rockpro64-v2.1', 'pine64,rockpro64-v2.0']
	'firefly,rk3588-roc-rt' is not one of ['pine64,quartz64-a', 'pine64,quartz64-b']
	'pine64,quartzpro64' was expected
	'firefly,rk3588-roc-rt' is not one of ['pine64,soquartz-blade', 'pine64,soquartz-cm4io', 'pine64,soquartz-model-a']
	'firefly,rk3588-roc-rt' is not one of ['powkiddy,rgb10max3', 'powkiddy,rgb20sx', 'powkiddy,rgb30', 'powkiddy,rk2023', 'powkiddy,x55']
	'prt,mecsbc' was expected
	'qnap,ts433' was expected
	'firefly,rk3588-roc-rt' is not one of ['radxa,cm3-io']
	'firefly,rk3588-roc-rt' is not one of ['radxa,e25']
	'radxa,e20c' was expected
	'radxa,e52c' was expected
	'radxa,rock' was expected
	'firefly,rk3588-roc-rt' is not one of ['radxa,rock-2a', 'radxa,rock-2f']
	'firefly,rk3588-roc-rt' is not one of ['radxa,rockpi4a', 'radxa,rockpi4a-plus', 'radxa,rockpi4b', 'radxa,rockpi4b-plus', 'radxa,rockpi4c']
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
	'radxa,rock-5b-plus' was expected
	'radxa,rock-5c' was expected
	'radxa,rock-s0' was expected
	'radxa,rock-5t' was expected
	'firefly,rk3588-roc-rt' is not one of ['radxa,zero-3e', 'radxa,zero-3w']
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
	'firefly,rk3588-roc-rt' is not one of ['rockchip,rk3288-evb-act8846', 'rockchip,rk3288-evb-rk808']
	'rockchip,rk3308-evb' was expected
	'rockchip,rk3328-evb' was expected
	'rockchip,rk3368-evb-act8846' was expected
	'rockchip,rk3399-evb' was expected
	'rockchip,rk3399-evb-ind' was expected
	'rockchip,rk3399-sapphire' was expected
	'rockchip,rk3399-sapphire-excavator' was expected
	'rockchip,rk3562-evb2-v10' was expected
	'rockchip,rk3566-box-demo' was expected
	'rockchip,rk3568-evb1-v10' was expected
	'rockchip,rk3576-evb1-v10' was expected
	'firefly,rk3588-roc-rt' is not one of ['rockchip,rk3588-evb1-v10', 'rockchip,rk3588-evb2-v10']
	'rockchip,rk3588s-evb1-v10' was expected
	'rockchip,rv1108-evb' was expected
	'rockchip,rk3588-toybrick-x0' was expected
	'sakurapi,rk3308-sakurapi-rk3308b' was expected
	'sinovoip,rk3308-bpi-p2pro' was expected
	'sinovoip,rk3568-bpi-r2pro' was expected
	'itead,sonoff-ihost' was expected
	'firefly,rk3588-roc-rt' is not one of ['tsd,px30-cobra-ltk050h3146w', 'tsd,px30-cobra-ltk050h3146w-a2', 'tsd,px30-cobra-ltk050h3148w', 'tsd,px30-cobra-ltk500hd1829']
	'firefly,rk3588-roc-rt' is not one of ['tsd,px30-pp1516-ltk050h3146w-a2', 'tsd,px30-pp1516-ltk050h3148w']
	'tsd,px30-ringneck-haikou' was expected
	'tsd,rk3368-lion-haikou' was expected
	'tsd,rk3399-puma-haikou' was expected
	'tsd,rk3588-jaguar' was expected
	'tsd,rk3588-tiger-haikou' was expected
	'tronsmart,orion-r68-meta' was expected
	'turing,rk1' was expected
	'wolfvision,rk3568-pf5' was expected
	'firefly,rk3588-roc-rt' is not one of ['xunlong,orangepi-3b-v1.1', 'xunlong,orangepi-3b-v2.1']
	'firefly,rk3588-roc-rt' is not one of ['xunlong,orangepi-5-max', 'xunlong,orangepi-5-plus', 'xunlong,orangepi-5-ultra']
	'firefly,rk3588-roc-rt' is not one of ['xunlong,orangepi-r1-plus', 'xunlong,orangepi-r1-plus-lts']
	'firefly,rk3588-roc-rt' is not one of ['xunlong,orangepi-5', 'xunlong,orangepi-5b']
	'zkmagic,a95x-z2' was expected
	'rockchip,rk3399' was expected
	'rockchip,rk3288' was expected
	'rockchip,rk3326' was expected
	'rockchip,rk3566' was expected
	'rockchip,rk3568' was expected
	'rockchip,rk3528' was expected
	'rockchip,rk3576' was expected
	'armsom,lm7' was expected
	'rockchip,rk3328' was expected
	'bigtreetech,cb2' was expected
	'rockchip,rk3066a' was expected
	'rockchip,rk3188' was expected
	'coolpi,pi-cm5' was expected
	'rockchip,rk3588s' was expected
	'edgeble,neural-compute-module-2' was expected
	'rockchip,rk3588' is not one of ['edgeble,neural-compute-module-6a', 'edgeble,neural-compute-module-6b']
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
	'luckfox,core3576' was expected
	'phytec,rk3288-phycore-som' was expected
	'pine64,pinenote' was expected
	'pine64,pinetab2' was expected
	'pine64,rockpro64' was expected
	'pine64,soquartz' was expected
	'radxa,cm3' was expected
	'radxa,cm3i' was expected
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
	'rockchip,rk3562' was expected
	'rockchip,rk3588' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
	'tsd,px30-cobra' was expected
	'tsd,px30-pp1516' was expected
	'tsd,rk3588-tiger' was expected
	'xunlong,orangepi-3b' was expected
	'rockchip,rk3318' was expected
	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /: failed to match any schema with compatible: ['firefly,rk3588-roc-rt', 'rockchip,rk3588']
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /npu@fdab0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /npu@fdac0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /npu@fdad0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /dp@fde50000: failed to match any schema with compatible: ['rockchip,rk3588-dp']
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /dp@fde60000: failed to match any schema with compatible: ['rockchip,rk3588-dp']






