Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CDEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4v7ABRaJOXGS84Y9y+1eDAi0znaTUEJmQIpm3KcqOU=; b=zC8F/zSWmILVoleD1idtFuMr8O
	efqQzYTPpj6MrUceWy3rjSLnQcMI2OoOnqTo+qZxTMjaD7W3Y6vIM0nerM56AB1VrrRfH+62nJLHi
	+VueiyOwCP5rRXZ9aC9n8ZgGddl2EDhzcb/+KQmms5dnJM9faRrxpYTGh4eGFU9edTJsyuqNhmYrf
	AdRfJ1tkDTk+izccxthZOkvVIPpJ1ODIYHOB/Hc1b9ajOx9rCdrX/krMGdXLlExG0dgJQ+WEcAO0/
	jGdLdd7Qw0STi7QU0UAsSQjVGtEvWFTJ7sJy73DzFw8tcb1RDXFZkV4kSH9o6e2hqm8t8QpEg0R3Q
	TUU6d1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNPC-0000000Bz1s-43pc;
	Tue, 17 Dec 2024 02:33:50 +0000
Received: from mail-m1973190.qiye.163.com ([220.197.31.90])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNO6-0000000Byuc-1wXo;
	Tue, 17 Dec 2024 02:32:44 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5ebd5e15;
	Tue, 17 Dec 2024 10:32:33 +0800 (GMT+08:00)
Message-ID: <7c1b03e1-8e0e-4a17-8cbf-ed43459f61df@rock-chips.com>
Date: Tue, 17 Dec 2024 10:32:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Add eDP support for RK3588
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, andy.yan@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, algea.cao@rock-chips.com,
 conor+dt@kernel.org, heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <173436598997.265439.13057492933592323468.robh@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <173436598997.265439.13057492933592323468.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1NQ1ZPGh4YGh9IThoeHk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93d275c2dd03a3kunm5ebd5e15
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQw6PTo*MzIUHB8aSjo4Dy0q
	NQhPC0lVSlVKTEhPT0tJTE5OS0hNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ09KSzcG
DKIM-Signature: a=rsa-sha256;
	b=SYk8NLDv+zPx+SuvEbhnPVkhCcuqRFZxlIVfqB4Mms5YQPO86PUJxSVa4+bd8DeZ/z/2/ayqZdk+I9AU7e3r70GX4/Ke2qS0j2riil7yj/i+YC0nM2V4xlwh4Q9HwgTbowIAQMskbbvJ1tiXMBrOCx0ULBePo2pffQ3Ss6mpN0o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=U4v7ABRaJOXGS84Y9y+1eDAi0znaTUEJmQIpm3KcqOU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_183243_203673_27202793 
X-CRM114-Status: GOOD (  18.16  )
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

Hi Rob,

On 2024/12/17 0:29, Rob Herring (Arm) wrote:
> 
> On Mon, 16 Dec 2024 11:12:14 +0800, Damon Ding wrote:
>> These patchs have been tested with a 1536x2048p60 eDP panel on
>> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
>> on RK3588 EVB1 board.
>>
>> Patch 1~3 are the RK3588 eDP support of Rockchip analogix_dp driver.
>> Patch 4   is the eDP mode support of samsung hdptx phy driver.
>> Patch 5~6 are the Rk3588 eDP support of Aanalogix DP driver. Add phy
>>            interfaces is to configure the HDMI/eDP TX Combo PHY.
>> Patch 7~8 are the renaming of hdptxphy node. It is not only used by
>>            HDMI display but also for the eDP display.
>> Patch 9   is the addition of RK3588 eDP0 node.
>> Patch 10  is to enable the eDP0 display on RK3588S EVB1 board.
>> Patch 11  is to add the eDP1 related nodes for RK3588 SoC.
>>
>> Damon Ding (11):
>>    drm/rockchip: analogix_dp: Use formalized struct definition for grf
>>      field
>>    dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>>    drm/rockchip: analogix_dp: Add support for RK3588
>>    phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
>>    drm/bridge: analogix_dp: add support for RK3588
>>    drm/bridge: analogix_dp: Add support for phy configuration.
>>    dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>>      HDMI TX Controller
>>    arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>>    arm64: dts: rockchip: Add eDP0 node for RK3588
>>    arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
>>    arm64: dts: rockchip: Add nodes related to eDP1 for RK3588
>>
>>   .../rockchip/rockchip,analogix-dp.yaml        |   1 +
>>   .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
>>   .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>>   .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>>   .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  55 +
>>   .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>>   .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>>   .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>>   .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>>   .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>>   .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  50 +
>>   .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>>   .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>>   .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>>   .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>>   .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>>   .../drm/bridge/analogix/analogix_dp_core.c    |   5 +
>>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  56 ++
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 149 ++-
>>   .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 937 +++++++++++++++++-
>>   include/drm/bridge/analogix_dp.h              |   3 +-
>>   26 files changed, 1223 insertions(+), 100 deletions(-)
>>
>> --
>> 2.34.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y rockchip/rk3588-coolpi-cm5-evb.dtb rockchip/rk3588-coolpi-cm5-genbook.dtb rockchip/rk3588-evb1-v10.dtb rockchip/rk3588-friendlyelec-cm3588-nas.dtb rockchip/rk3588-jaguar.dtb rockchip/rk3588-orangepi-5-plus.dtb rockchip/rk3588-rock-5b.dtb rockchip/rk3588-tiger-haikou.dtb rockchip/rk3588s-coolpi-4b.dtb rockchip/rk3588s-evb1-v10.dtb rockchip/rk3588s-indiedroid-nova.dtb rockchip/rk3588s-odroid-m2.dtb rockchip/rk3588s-rock-5a.dtb rockchip/rk3588s-rock-5c.dtb' for 20241216031225.3746-1-damon.ding@rock-chips.com:
> 
> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: resets: [[28, 469], [28, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'reset-names', 'resets' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000: clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> 
> 
> 
> 
> 
> 
> 
I found the same warnings when dt-schema was updated, and all of these 
will be fixed in the next version.

Best regards,
Damon



