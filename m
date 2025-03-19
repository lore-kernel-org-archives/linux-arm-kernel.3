Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41EFC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNRFscnB6st75VlP5l/AWMrHj29aeG/hnrOOIAo5HAs=; b=ArxNc3ri+SCTqoG30ustkEGETz
	wg4vO88Idna7+31h6bdD5FPjG9+7f8V10irqK3G2/Voqwqp1jL7QzeR8pSe3xhSXjxd4FwKPvnjSK
	jLJ0XgOeMFgEKt3tlgxg+CtWmsQcHOWYEXY7jAgRwuOLEZt3SGL5iJhP6o0m5fRU+EsbGD0l5wqwQ
	p/tBQhHiilTJOerzdYvUn9APnF66kUQZsd3TbS67gqCCO0icMvJYYH2R1V3Hkr1b75jxdD1DQ+SNw
	bZbdUU6egC/VKnfS23amD1PsrHRoBdN196AZ+OLuGv7ZBmLG7y2wUZE6Pm1EZHYZoyFzyTQv9sCBg
	fIP6mcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2aO-0000000AOfY-12UK;
	Wed, 19 Mar 2025 23:12:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Yf-0000000AO64-473m;
	Wed, 19 Mar 2025 23:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C5C942B8B;
	Wed, 19 Mar 2025 23:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991ECC4CEE4;
	Wed, 19 Mar 2025 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742425843;
	bh=L6HRrJPe/oD/P33omcYeeISqRniz4IThgwzvXP5TlNA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ix6gZjFuakS6xfWCWprsg52TMUp9Ym+v6mx/x2FIEZyyrLuhxYAmH/XHlLpF2vqeO
	 wmASTT8Eah9zofiT9Lz8xNDgnywYqQFWntdh8PE/PDULvrZJy0SJ+pLqU8fn5hoZcm
	 SM7homPHBiiXMoknIkuIW56wUyN3xX0UbO8MvLdZkgpKFlcf1tz4kxq8bn4XxSqlLR
	 5/blFlLYjkRfXuO+qPMTC48fVDW/dpuDEfuygfRdDBY0J3ygm+AqetldtUsyYIeMFE
	 mVeui53KLVAvFrt9bQuT5Vsa0QjkFuZ/BoVNxC4YDz3+Mpbkf0/PANa0+/DvnmYr55
	 vWrlMRY0AiAWQ==
Date: Wed, 19 Mar 2025 18:10:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Karl Chan <exxxxkc@getgoogleoff.me>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org
To: Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-2-funderscore@postmarketos.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
Message-Id: <174242564139.2499881.5985170981835885510.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] Add support for Xiaomi Mi TV Stick
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_161046_063091_DD7BDB60 
X-CRM114-Status: GOOD (  27.23  )
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


On Wed, 19 Mar 2025 19:01:48 +0000, Ferass El Hafidi wrote:
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Wi-Fi + Bluetooth
>  * Android TV 9, upgradable to Android TV 10
>  * Google-certified
> 
> There are multiple variants:
>  * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully
>    labeled on the board)
>  * 2. Blue PCB, not much documentation about it, presumably manufactured
>    between 2021 and 2023
>  * 3. Green PCB, manufactured in 2023/2024, known UART pinout, some layout
>    changes compared to the 2020 variant
> 
> Among these variants, there are many boards using multiple different
> Wi-Fi chips.  Supporting all of them is out of scope for this patch
> series.  However, there has been some work identifying Wi-Fi/Bluetooth
> since v4.  Some variants use a Realtek module while others use an
> Amlogic module.
> 
> As of the time of writing this has only been tested on the 3rd variant.
> It is believed that software-wise all three work mostly the same (if we
> don't count Wi-Fi/BT), but testing on the other variants would still be
> appreciated.  Sadly, booting Mainline linux is slightly more
> challenging on some versions of the original firmware.
> 
> The devicetree is based on the Amlogic P241 DTS.
> 
> Changes since v4 [1]:
>  * add Acked-by from krzk
>  * Wi-Fi on sd_emmc_b
> 
> Changes since v3 [2]:
>  * typo fix (`vbus-supply` in `&usb`)
> 
> Changes since v2 [3]:
>  * fix SoB/From mismatch
> 
> Changes since v1 [4]:
>  * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
>  * add `amlogic,s805y` DT binding section
>  * add S805Y dtsi: meson-gxl-s805y.dtsi
>  * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
>  * explain the changes being done a bit more in the commit message for
>    the DT patch
>  * drop `clocks` and `clock-names` from pwm_ef (background: [5])
>  * change sound `model` to "XIAOMI-AQUAMAN"
> 
> More information is available on the postmarketOS wiki page [6].
> 
> [1]: https://lore.kernel.org/all/20250203174346.13737-1-funderscore@postmarketos.org/
> [2]: https://lore.kernel.org/all/20250203091453.15751-1-funderscore@postmarketos.org/
> [3]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
> [4]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
> [5]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/
> 
> 
> Ferass El Hafidi (2):
>   dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   7 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 292 ++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
>  4 files changed, 310 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
> 
> --
> 2.47.1
> 
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250319190150.31529-2-funderscore@postmarketos.org:

Error: arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts:243.1-2 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/amlogic] Error 2
make[2]: Target 'arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'amlogic/meson-gxl-s905x-hwacom-amazetv.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-sml5442tw.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-phicomm-n1.dtb' not remade because of errors.
make: Target 'amlogic/meson-s4-s805x2-aq222.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905w-p281.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-s912-libretech-pc.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-sei510.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-q200.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-khadas-vim.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxlx-s905l-p271.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-mecool-kiii-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-vega-s96.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-fbx8am.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-bananapi-cm4-cm4io.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-c3-c308l-aw419.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-s400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-nexbox-a1.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-dreambox-one.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-khadas-vim2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-wetek-core2.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-radxa-zero.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-vega-s95-telos.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-libretech-cc-v2.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-a311d-khadas-vim3.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-jethome-jethub-j100.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-gsking-x.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-vega-s95-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-q201.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-p230.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-a311d-bananapi-m2s.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-wetek-play2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-mecool-kii-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-odroidc2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-gt1-ultimate.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-x96-max.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-libretech-pc.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-p231.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-x96-air.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-vero4k.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-vega-s95-meta.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905w-tx3-mini.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-minix-neo-u9h.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s805x-libretech-ac.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-a95xf3-air-gbit.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-khadas-vim3l.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-vero4k-plus.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-h96-max.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-p212.dtb' not remade because of errors.
make: Target 'amlogic/meson-a1-ad401.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-go-ultra.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-radxa-zero2.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-x96-air-gbit.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-dreambox-two.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-bananapi-m5.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-u200.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-rbox-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-p201.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-a95xf3-air.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-a4-a113l2-ba400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-bananapi-m2-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-p200.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-odroid-c4.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-s922x-bananapi-m2s.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-sei610.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-odroid-hc4.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-n2l.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-libretech-cc.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-c3-c302x-aw409.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-nexbox-a95x.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-a311d-libretech-cc.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-t7-a311d2-khadas-vim4.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-s905d3-libretech-cc.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-a5-a113x2-av400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-wetek-hub.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-s922x-khadas-vim3.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-t7-a311d2-an400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-kii-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-n2.dtb' not remade because of errors.
make: Target 'amlogic/meson-a1-ad402.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-nexbox-a95x.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-n2-plus.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-gtking-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-ugoos-am6.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s805x-p241.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-gtking.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-nanopi-k2.dtb' not remade because of errors.






