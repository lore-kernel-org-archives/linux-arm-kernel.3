Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA0FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9umxLTWLSfrtnjYZ/+GeUmdRtMBqJiviwaDawIz4Ngw=; b=x9NXq9ss2xpoTEn0ksbhbFLHOT
	4hMSpOAqR/Aj7uAtE+K60u6m9lrzxAqIPwHowCbpI+FvpmBDc0c2GurUjx0+K+XEgGNsikfSF0PWG
	E9y3nmJMPP64pIiJpGoV44iNz8Fc/QEgBK4yMboJnNtRRC34EuasjEt1LTh7cY4QXOTY8bTKV9pAR
	Y05uTp78CmXatGSxWvKc4+gs+bPljCRHiO4mFrEqrfjaB6wOMO0haowAtpwwxcwcXjBV+7qepmWpi
	f4EVSEZpTje/OgiFjtRyRsZgzs9SnIiqSNYqC8+utF0ySvdnBo84mIEgPt0xBYkKiJlLwRl+4kEF1
	FiHJvLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2n-00000001xjO-0dtf;
	Mon, 14 Apr 2025 12:36:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Izt-00000001xGE-02PG;
	Mon, 14 Apr 2025 12:33:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4Izh-0000000016s-3E1k;
	Mon, 14 Apr 2025 12:32:57 +0000
Date: Mon, 14 Apr 2025 13:32:54 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
Message-ID: <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053309_046099_41171894 
X-CRM114-Status: GOOD (  21.85  )
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

On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Sinovoip has released other variants of Bananapi-R4 board.
> > The known changes affecting only the LAN SFP+ slot which is replaced
> > by a 2.5G phy with optional PoE.
> > 
> > Just move the common parts to a new dtsi and keep differences (only
> > i2c for lan-sfp) in dts.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - added basic dts for 2g5 variant
> > - moved i2c used for sfp-lan to board dts
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
> >   .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   5 +
> >   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
> >   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
> >   4 files changed, 414 insertions(+), 400 deletions(-)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index 58484e830063..a1ebc9aa4ba6 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
> > @@ -107,4 +108,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> >   DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
> >   DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
> >   DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
> > +DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
> >   DTC_FLAGS_mt8395-radxa-nio-12l := -@
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > new file mode 100644
> > index 000000000000..76eca976b968
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > @@ -0,0 +1,5 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > +
> > +/dts-v1/;
> > +
> > +#include "mt7988a-bananapi-bpi-r4.dtsi"
> 
> This should at least have some different compatible, if not probably also a
> different model string - as it's a different device.
> 
> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";

Imho it doesn't make sense to declare compatibility with the
"bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with the
"bananapi,bpi-r4". It's a different board and using firmware meant for the
"bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will result
in a non-working Ethernet port.


