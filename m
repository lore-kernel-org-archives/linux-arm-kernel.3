Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A363C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH5NWtp4/Wyt07OrlAPWKgAbTfQSmMAVcFL/+4W56LU=; b=cz2TQLknoSOK4aP+FwGTbVQMhl
	dpc/21Gwiroqy3DBNNNgDzP5CKUSZFu1/aZUxsTW1AddasxoDJNYrZBPuyOTLUdSuGVz34lx609Ay
	kDajTE+vsyKU+rf/LJA/nYqk5+n7aDtPWkicKR2BrQMIE0spFSuqEBcBOHfkF8+mzIDEdsiE350GZ
	o1lBgJWkha+r3//EiOy/gUX1fQGi49Uu4juklLOe9kFhIfl4kuh0N7dcpAQvZ2Itg76iDUCA/Ttc0
	JMPCiXHM65iWmC5tZo8dkty1u8LMOqwBZDyN6+Ow343Fa59op1kO1lMi4how2x4guB1ZEM3YCFWbr
	7Lu1yo0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWT-00000002oOZ-3dZH;
	Thu, 28 Aug 2025 18:38:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdaL-00000001ufl-0O5h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C82934085E;
	Thu, 28 Aug 2025 14:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762C8C4CEFA;
	Thu, 28 Aug 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756391200;
	bh=nZTT535RfyXPcNBRflR/RKIqbWf0jF5aESO8lp2wvoc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DK6o2o7hQb39YCj7Se7T/Oaju7Jz9DdnSK69P2J5Y4v3z4pv5/NiVgd61NkEzUZpv
	 lo63HA7tMPXLmj3TqV07fCRCN6ktOnIbGPUfnmEIeTlt3VUiykXK/CbITsSBXTHbSN
	 YLUmsoSOqdPmZ8kOnhkUZ6zXmUsz9etsCxMraTWv8vKeufvGLiZeiay9YbEmDT6fnV
	 UMnpx3+IA1LDg8ozja/LlNWJpLxA2Xk8CW3OoAZawG5Y4VsFne0QQbXzjkzuKP4Hig
	 tX3xzQ8pYlyPY3LVpeQECcVwtBxsfQZCf6VdM1Hd5tfyZ79mp7/Gq3UdicBvVJ5vHC
	 PniYkScWUDr/Q==
Date: Thu, 28 Aug 2025 09:26:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, pankaj.dubey@samsung.com, alim.akhtar@samsung.com, 
 krzk@kernel.org, devicetree@vger.kernel.org, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, shradha.t@samsung.com, 
 ravi.patel@samsung.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
To: Inbaraj E <inbaraj.e@samsung.com>
In-Reply-To: <20250828083926.16849-1-inbaraj.e@samsung.com>
References: <CGME20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896@epcas5p3.samsung.com>
 <20250828083926.16849-1-inbaraj.e@samsung.com>
Message-Id: <175639108979.1621797.4942360795464575731.robh@kernel.org>
Subject: Re: [v3] arm64: dts: fsd: Add CSIS nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_072641_170504_44EF811A 
X-CRM114-Status: GOOD (  14.07  )
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


On Thu, 28 Aug 2025 14:09:26 +0530, Inbaraj E wrote:
> The Tesla FSD SoC CSIS IP bundles MIPI CSI-2 link controller and video
> capture interface. Add nodes describing the MIPI CSI-2 link controller
> and video capture interface.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
> 
> Changes since v2:
> - Changed generic node name
> - Fixed node ordering
> 
> Here is patch link for v2:
> https://lore.kernel.org/linux-media/20250814140943.22531-1-inbaraj.e@samsung.com/
> 
> This patch is dependent on below patchset
> https://lore.kernel.org/linux-media/20250822002734.23516-1-laurent.pinchart@ideasonboard.com/T/#t
> 
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 540 +++++++++++++++++++++++++++++
>  1 file changed, 540 insertions(+)
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
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/tesla/' for 20250828083926.16849-1-inbaraj.e@samsung.com:

arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12640000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12641000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12650000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12651000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12660000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12661000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12670000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12671000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12680000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12681000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@12690000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@12691000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126a0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126a1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126b0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126b1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126c0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126c1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126d0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126d1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126e0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126e1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csi@126f0000: failed to match any schema with compatible: ['tesla,fsd-mipi-csi2']
arch/arm64/boot/dts/tesla/fsd-evb.dtb: /soc@0/csis@126f1000: failed to match any schema with compatible: ['tesla,fsd-csis-media']






