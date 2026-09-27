Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331FAC98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FyG054HNrO/kXG35lu7ivFIZVkhkQ5n7nZNjUmmDnN0=; b=svK2WVGGpCcDZO6i7Ts472tTVy
	jUvhZnUKigehPSqE8R73l/+/1FgbmTDR+PP7qbtrAR8VXXGDPZLFGaWfU056LK9+CQweaqOXwclLR
	lNkRxFt9f0OJGdJcmkYn5buvAYNazo2IIj0E0XcuF6srrdSkG1kWdoiH/lnfrRGLMf7sjdru18EYB
	Rj2IYibuyWsPUKR11O5DJH+SQH5XSlUSSv1Q7tW8lSmTpChQNo9Ba4sAI3vnooIBe+ye1Bb10UUSG
	4PyxklmjJMANKmTvkqm8eFqvI08g02Xi46oXnIwGZDXZJp+H4qchhZAYBSdXv/YHF+D5meUWGBIAp
	Bk4gvPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAo7v-0000000GJhN-44x2;
	Sun, 27 Sep 2026 12:37:07 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAo7t-0000000GJgG-215m;
	Sun, 27 Sep 2026 12:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=FyG054HNrO/kXG3
	5lu7ivFIZVkhkQ5n7nZNjUmmDnN0=; b=Pb6EUO5qprKbaZkU1rmsjzYX1x2sPi7
	0ZiXE2URkpy+MwjQzbzphLWecu+/rVN+zErL1rkabQ/8S8r/Ob10Qj5IzowBy7Ah
	V9ONBAFe90bPzuCFLQVXh1Z3QF1sHm8M5ogMCdwDp9JjBy1pWlo1eYKlXZaaV2kC
	egkhAtgadJhY=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Sun, 27 Sep 2026 20:36:59 +0800
Message-ID: <179051261955.4055.4823239353832017342@163.com>
X-CM-TRANSID: _____wD3_0TrDblqcxuyBA--.50921S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryUWr15Kw4ftryxAr4DXFb_yoW5ur1fpF
	Z8ZrWfKrs7KF1xu3s3uFs8CFWrArs3Jay5WF1kW34ayws8Jr1UJF4Sv3Z0q3W7urnagFyj
	qF4Y9348CF1DZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTMKNUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3QyH9Gq5DexwsgAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_053705_830640_9F818F3C 
X-CRM114-Status: GOOD (  17.46  )
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

Hi all,

This short series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S
based single board computer.

Board summary:
 - Rockchip RK3588S (4x Cortex-A76 + 4x Cortex-A55), LPDDR4x
 - eMMC, microSD slot, M.2 socket (PCIe 2.0 x1)
 - Gigabit Ethernet, USB 3.0 Type-A, USB 2.0 Type-A ports and a USB-C
   port (USB 2.0 plus DisplayPort altmode)
 - HDMI output, MIPI DSI and MIPI CSI connectors
 - ES8388 analog codec with 3.5 mm jack, HUSB311 USB-C PD controller
 - 40-pin header, RK806 PMIC, IR receiver
 - No SPI-NOR; the vendor bootloader reads extlinux.conf from the SD/eMMC
   boot partition

Patch 1 documents the board in the Rockchip platform bindings, patch 2
adds the device tree itself (plus its Makefile entry).  The "alientek"
vendor prefix is already present in vendor-prefixes.yaml, so no vendor
prefix change is needed.

Tested on hardware with a 6.18 based kernel: boot from SD and eMMC,
gigabit Ethernet, both USB 2.0 ports, the USB 3.0 Type-A port (5000 Mbps
link), USB-C DisplayPort altmode, HDMI video and audio, ES8388 analog
audio, M.2 PCIe, ADC keys, the IR receiver and ramoops.

Notes worth the reviewer's attention:

 * The codec node keeps "clock-names = \"mclk\"" together with the
   I2S0_8CH_MCLKOUT_TO_IO clock.  Without that name the MCLK never reaches
   the codec pad and playback stays silent, even though every register,
   the DAPM paths and the ALSA controls look correct.  Verified on
   hardware both with and without the property.

 * The codec compatible list is "everest,es8323", "everest,es8388".  The
   second entry is not cosmetic: sound/soc/codecs/es8328-i2c.c matches only
   "everest,es8328" and "everest,es8388", so dropping it would leave the
   codec without a driver.  Keeping it produces two dtbs_check warnings,
   because an ES8323/ES8388 binding is not upstream yet and the node falls
   back to everest,es8316.yaml (the compatible list is "too long" and
   AVDD/DVDD/HPVDD/PVDD are unexpected).  Two mainline boards already use
   "everest,es8323" with the same gap (rk3588-firefly-itx-3588j,
   rk3588s-youyeetoo-r1), so it looks like a missing binding rather than a
   board issue.  I left the binding out of this series to keep the board
   port focused and will happily send it separately - please tell me which
   form you prefer.

 * The USB 3.0 Type-A port is wired to usb_host2_xhci through combphy2_psu;
   both are enabled here, as in the vendor BSP.  combphy2_psu is free on
   this board because the M.2 socket uses pcie2x1l2 (combphy0_ps).

 * The MIPI CSI camera pipeline is described, but does not stream yet: the
   sensor probes fine while the RK3588 VICAP/rkcif capture path is still
   incomplete upstream, so those nodes are included for completeness only.

This is my first patch to the Rockchip platform.  I am a Chinese hobbyist
(amateur radio callsign BG9OXA) working on this board in my spare time, so
please point out anything that does not follow the expected style.

BG9OXA (2):
  dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
  arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml            |    5 +
 arch/arm64/boot/dts/rockchip/Makefile                |    1 +
 arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts | 1508 +++++++++++++++++++
 3 files changed, 1514 insertions(+)

-- 
2.43.0


