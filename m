Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B573AC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLx85hewkyxE/kVi+opsqCCSjOrk34BsgxZUq/J+Tec=; b=Wfd0WE3nKQ/ChswU4mD5PGFxvj
	EpuLYPTv9m7LsV/qYCDd8+AdVBi2Z5A3CGNer2ibrhDD86Tv/ICgYCTyZn3XDDmHVBV0ZYezv2ZRg
	QoTswew60ALWmVW+XUffLleI84F+ZvEAOY8+NKPVYnPd7Z6d87g67RBl++ZI3X5ykGsi3Q/e/WKPu
	bK4AJ9HIOo0c+h5R1N0kdAlfl1TWdD77V0vXAt982aqTe02cPXN46ap9xCFn2oddMRq8s2Fu1a8wI
	qqEXFinHTBLT/fmss7PcXJj51oCsj8vhrB4zl6X5OQ8eP+ta4jLCPa672ZXIYvIbYAaYjDu3IU+fo
	FaeY4FBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOVw-0000000Bfjz-1YOo;
	Mon, 10 Aug 2026 11:49:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOVs-0000000BfiS-0132;
	Mon, 10 Aug 2026 11:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hLx85hewkyxE/kVi+opsqCCSjOrk34BsgxZUq/J+Tec=; b=VlgLFv1HJy9KpUpxtx8HVTdDQh
	EzLNQ5HB1410XGH7tieiL7/zobeis5a3IW2J/s8nIbc6cjM+lsArleju+u4udEJifH1z6Q36fvMhq
	QijgSXgKg08oNOnUD+XFLMCqeHfYrlfoHENbhglgTwK8u4v+Dym2hHUl2P0V4j2411odIODAlAj7A
	f4CdduXpzfdrXZXT9YlhQU8XVBBS7eun6VNc6sfu1/ql1qjzjkrO92O0hbB8Cv/wz3p54MXDuRjVo
	eu9wqFGx8ktUEsDB/BS1CxgpAmN51sordisHJRU+0EPLr8KPIF+dkGmAvMgFuX/zW7X1fvDjDiUn2
	3DTxeT2A==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sashiko <sashiko-bot@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements for
 Rockchip platforms
Date: Mon, 10 Aug 2026 13:48:58 +0200
Message-ID: <20767137.geO5KgaWL5@diego>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_044952_261860_B8E1FF25 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Sebastian,

Am Donnerstag, 6. August 2026, 19:02:06 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Sebastian Reichel:
> This patch series updates the Synopsys Designware DisplayPort bridge
> together with the only existing user: The Rockchip RK3576/RK3588:
>=20
>  1. Follow-up bridges (PHY, USB-C connector)
>     This is needed to get USB-C DP AltMode working; I've followed
>     the Qualcomm driver as reference
>=20
>  2. Runtime PM
>     The initial driver has been upstreamed without RPM; add it to
>     avoid wasting power when nothing is plugged
>=20
>  3. Audio
>     The initial driver has been upstreamed without audio support;
>     this adds all missing bits for audio with single stream transport
>=20
> To properly make use of the bridge code the following USBDP PHY series
> is also needed:
>=20
> https://lore.kernel.org/all/20260714-rockchip-usbdp-cleanup-v13-0-6cb3e76=
9d4c5@collabora.com/

I've now had time to test both series (dw-dp + usbdp) :-)

=2D On my 1080p display I get nice output
=2D On my 4K display I get "some" output after increasing the ACLK_VOP to
  750MHz - although the output itself is garbled. Before there was no
  output at all
=2D hotplug works correctly, typec-display altmode gets correctly set up
  and the drm driver enables output [0]
=2D cable being plugged in on boot does not work completely. The usb-side
  gets detected correctly, but the drm-side stays at disconnected
  The usb+typec-related kernel messages look the same though. [1]
  Unplugging and replugging then produces display output.


Heiko


[0]
[  221.536599] platform xhci-hcd.4.auto: bus: 'platform': __driver_probe_de=
vice: matched device with driver xhci-hcd
[  221.548102] platform xhci-hcd.4.auto: bus: 'platform': really_probe: pro=
bing driver xhci-hcd with device
[  221.558836] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[  221.564990] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned b=
us number 5
[  221.573652] xhci-hcd xhci-hcd.4.auto: hcc params 0x0220fe64 hci version =
0x110 quirks 0x0000808002000010
[  221.584184] xhci-hcd xhci-hcd.4.auto: irq 108, io mem 0xfc000000
[  221.591002] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[  221.597149] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned b=
us number 6
[  221.605724] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.0 SuperSpeed
[  221.613368] usb usb5: bus: 'usb': __driver_probe_device: matched device =
with driver usb
[  221.622335] usb usb5: bus: 'usb': really_probe: probing driver usb with =
device
[  221.630503] usb 5-0:1.0: bus: 'usb': __driver_probe_device: matched devi=
ce with driver hub
[  221.639776] usb 5-0:1.0: bus: 'usb': really_probe: probing driver hub wi=
th device
[  221.648171] hub 5-0:1.0: USB hub found
[  221.652396] hub 5-0:1.0: 1 port detected
[  221.656891] hub 5-0:1.0: driver: 'hub': driver_bound: bound to device
[  221.664125] hub 5-0:1.0: bus: 'usb': really_probe: bound device to drive=
r hub
[  221.672155] usb usb5: driver: 'usb': driver_bound: bound to device
[  221.679099] usb usb5: bus: 'usb': really_probe: bound device to driver u=
sb
[  221.686864] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[  221.696175] usb usb6: bus: 'usb': __driver_probe_device: matched device =
with driver usb
[  221.705143] usb usb6: bus: 'usb': really_probe: probing driver usb with =
device
[  221.713323] usb 6-0:1.0: bus: 'usb': __driver_probe_device: matched devi=
ce with driver hub
[  221.722578] usb 6-0:1.0: bus: 'usb': really_probe: probing driver hub wi=
th device
[  221.730961] hub 6-0:1.0: USB hub found
[  221.735170] hub 6-0:1.0: 1 port detected
[  221.739647] hub 6-0:1.0: driver: 'hub': driver_bound: bound to device
[  221.746889] hub 6-0:1.0: bus: 'usb': really_probe: bound device to drive=
r hub
[  221.754920] usb usb6: driver: 'usb': driver_bound: bound to device
[  221.761867] usb usb6: bus: 'usb': really_probe: bound device to driver u=
sb
[  221.769602] xhci-hcd xhci-hcd.4.auto: driver: 'xhci-hcd': driver_bound: =
bound to device
[  221.778585] xhci-hcd xhci-hcd.4.auto: bus: 'platform': really_probe: bou=
nd device to driver xhci-hcd
[  222.032051] typec port0-partner.0: bus: 'typec': __driver_probe_device: =
matched device with driver typec_displayport
[  222.043845] typec port0-partner.0: bus: 'typec': really_probe: probing d=
river typec_displayport with device
[  222.054819] typec_displayport port0-partner.0: driver: 'typec_displaypor=
t': driver_bound: bound to device
[  222.065547] typec_displayport port0-partner.0: bus: 'typec': really_prob=
e: bound device to driver typec_displayport
[  222.336513] usb 5-1: new full-speed USB device number 2 using xhci-hcd
[  222.493299] usb 5-1: not running at top speed; connect to a high speed h=
ub
[  222.512188] usb 5-1: bus: 'usb': __driver_probe_device: matched device w=
ith driver usb
[  222.521057] usb 5-1: bus: 'usb': really_probe: probing driver usb with d=
evice
[  222.535340] usb 5-1: driver: 'usb': driver_bound: bound to device
[  222.542185] usb 5-1: bus: 'usb': really_probe: bound device to driver usb
[  224.327221] Console: switching to colour frame buffer device 240x67
[  224.353443] rockchip-drm display-subsystem: [drm] fb0: rockchipdrmfb fra=
me buffer device

[1] -----------
[   23.452524] platform xhci-hcd.4.auto: bus: 'platform': __driver_probe_de=
vice: matched device with driver xhci-hcd
[   23.464004] platform xhci-hcd.4.auto: bus: 'platform': really_probe: pro=
bing driver xhci-hcd with device
[   23.474654] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[   23.480783] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned b=
us number 5
[   23.489401] xhci-hcd xhci-hcd.4.auto: hcc params 0x0220fe64 hci version =
0x110 quirks 0x0000808002000010
[   23.499910] xhci-hcd xhci-hcd.4.auto: irq 108, io mem 0xfc000000
[   23.506671] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[   23.512790] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned b=
us number 6
[   23.521346] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.0 SuperSpeed
[   23.528805] usb usb5: bus: 'usb': __driver_probe_device: matched device =
with driver usb
[   23.537771] usb usb5: bus: 'usb': really_probe: probing driver usb with =
device
[   23.545879] usb 5-0:1.0: bus: 'usb': __driver_probe_device: matched devi=
ce with driver hub
[   23.555120] usb 5-0:1.0: bus: 'usb': really_probe: probing driver hub wi=
th device
[   23.563486] hub 5-0:1.0: USB hub found
[   23.567675] hub 5-0:1.0: 1 port detected
[   23.572138] hub 5-0:1.0: driver: 'hub': driver_bound: bound to device
[   23.579343] hub 5-0:1.0: bus: 'usb': really_probe: bound device to drive=
r hub
[   23.587327] usb usb5: driver: 'usb': driver_bound: bound to device
[   23.594240] usb usb5: bus: 'usb': really_probe: bound device to driver u=
sb
[   23.601942] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[   23.618552] usb usb6: bus: 'usb': __driver_probe_device: matched device =
with driver usb
[   23.627501] usb usb6: bus: 'usb': really_probe: probing driver usb with =
device
[   23.635604] usb 6-0:1.0: bus: 'usb': __driver_probe_device: matched devi=
ce with driver hub
[   23.644841] usb 6-0:1.0: bus: 'usb': really_probe: probing driver hub wi=
th device
[   23.653203] hub 6-0:1.0: USB hub found
[   23.657389] hub 6-0:1.0: 1 port detected
[   23.661798] hub 6-0:1.0: driver: 'hub': driver_bound: bound to device
[   23.668998] hub 6-0:1.0: bus: 'usb': really_probe: bound device to drive=
r hub
[   23.676979] usb usb6: driver: 'usb': driver_bound: bound to device
[   23.683886] usb usb6: bus: 'usb': really_probe: bound device to driver u=
sb
[   23.691574] xhci-hcd xhci-hcd.4.auto: driver: 'xhci-hcd': driver_bound: =
bound to device
[   23.700524] xhci-hcd xhci-hcd.4.auto: bus: 'platform': really_probe: bou=
nd device to driver xhci-hcd
[   23.951857] typec port0-partner.0: bus: 'typec': __driver_probe_device: =
matched device with driver typec_displayport
[   23.963628] typec port0-partner.0: bus: 'typec': really_probe: probing d=
river typec_displayport with device
[   23.974547] typec_displayport port0-partner.0: driver: 'typec_displaypor=
t': driver_bound: bound to device
[   23.985243] typec_displayport port0-partner.0: bus: 'typec': really_prob=
e: bound device to driver typec_displayport
[   24.252358] usb 5-1: new full-speed USB device number 2 using xhci-hcd
[   24.408085] usb 5-1: not running at top speed; connect to a high speed h=
ub
[   24.427935] usb 5-1: bus: 'usb': __driver_probe_device: matched device w=
ith driver usb
[   24.441732] usb 5-1: bus: 'usb': really_probe: probing driver usb with d=
evice
[   24.462931] usb 5-1: driver: 'usb': driver_bound: bound to device
[   24.475569] usb 5-1: bus: 'usb': really_probe: bound device to driver usb




