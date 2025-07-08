Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED537C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 01:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT+He+/bLdBApblDPvfhVm4fYFViV3TDN7BKrw8dpSE=; b=EaZiwjKx9VYqDMXpNG6X/y1RsW
	jG/4xrkmcInJA6yUxa1FYk9Go88KNqxeAUOgg8K02OnlgexIAP4l0qgkFkoRpyr5EDNSXyPD8Q2Ex
	jyThP6H6TYvJebc8cyV4yfOwqb7X17DO72SpfHKrdU/a2Jzhsws3+PXPkhO/EsbxDSNJMoERJSA1l
	MCGFD9+JRKj5VSyjUE4qEpevQuzhFLolBDclpXDmXAbJxf0vwghp7ugMWl9TYJARxNM7gfuotQbOr
	kde3kuaM4dDhkbY3zSVmuUEI/FY4zrHbcszMWQ4sVlVLUwwZ1bGwTymcri+7Ga2i3Nz5VK5N5yOg6
	VuOWCuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYx1y-00000003wrt-1FGA;
	Tue, 08 Jul 2025 01:21:58 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwzd-00000003wau-1QzN;
	Tue, 08 Jul 2025 01:19:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uYwzK-000000007oP-40A6;
	Tue, 08 Jul 2025 01:19:15 +0000
Date: Tue, 8 Jul 2025 02:19:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>, yangshiji66@qq.com,
	ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 6/6] MIPS: dts: ralink: mt7628a: add wifi binding
Message-ID: <aGxyD3mtzdNZPPnx@makrotopia.org>
References: <20250706214111.45687-1-rosenp@gmail.com>
 <20250706214111.45687-7-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706214111.45687-7-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_181933_401007_ED415195 
X-CRM114-Status: GOOD (  12.88  )
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

On Sun, Jul 06, 2025 at 02:41:11PM -0700, Rosen Penev wrote:
> MT7620A devices all contain a wifi device as part of the SOC. Add it
> here to get it working.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The commit title

MIPS: dts: ralink: mt7628a: add wifi binding 

seems wrong as the commit (correctly) touches mt7620a.dtsi and not
mt7628a.dtsi (which would be wrong as the WiFi part of MT7628A is
already supported by the mt76 driver and part of the device tree).
Also the word 'binding' seems wrong in this context, you are adding
a node to the device tree, not to the device tree bindings.

I'd hence suggest to change the commit title to

MIPS: dts: ralink: mt7620a: add wifi

