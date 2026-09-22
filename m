Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H376EqLxzYGIR1HtxMkEdnt6E0UelkYiOnFTiHSoQvo=; b=tN0zRxhH97AgpG9KMeXwz/KfJw
	zFr0tMVyKaj0GX1G1PoO3bfhzQCOlBdzqHQNRzMCoh3wrxrrDBTFR0tYXvj1XkBOtt8fKgvRN5VTl
	TN4sAMeDw7Lcj9Rwo/aYOQK21AmImTkAFrxn8b7Ah1lH87SPYQCfLPTJXVsWcsWut0ZxGc0ncuIR9
	/jbDrffooAMmpo/TWY0+QZ7QRts1LFLWuB5Zj1Su3/ZICYRtBboc+rrP6J0WB2So45aTCHqLgXIIK
	pO7U3r2V3MN8wAVqnh8w9x3UgqLNBo0Ze/SrrsScE+cTZAkFuqe1kERcLZH5AWZifb4xwGx2nsouA
	vwol7ZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92xP-00000005zZ1-0ySX;
	Tue, 22 Sep 2026 16:02:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92x9-00000005zTo-0MHd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:02:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85EE560D89;
	Tue, 22 Sep 2026 16:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2531F00893;
	Tue, 22 Sep 2026 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790092962;
	bh=H376EqLxzYGIR1HtxMkEdnt6E0UelkYiOnFTiHSoQvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gbg7ccOGOHfyCevLSfueubPZxgRebYPJKVNDKKFzBzw6h0hDOgjuh74QV9DqMmGar
	 d9IDggV2zjJZA1WhKhXhqTUCs4NUYJ6q3pBmG86/8/jfjfwSF6dF8gIZGTE2vDlRN1
	 xl8n7BRHobN1FgBfD40kFZMnPh3ro3BGBc0hl57HkcDidW2wjF50yywvQP9JpDGVcr
	 6ilT7RzMCyMZR8TybQni7mreH86OAvGdw4/PybXdi7O5QEwYnBndHKAGYD2Rc7LC0t
	 Xb4CEhZWMbv53p80pJKtT65z4Q0flHM8l8h97BPm6pP1apeDo9gyYBvXeChO8IBDPF
	 3mcPVLOdah0Bg==
Date: Tue, 22 Sep 2026 11:02:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
Cc: Beleswar Padhi <b-padhi@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM
 memory region
Message-ID: <179009296069.3521742.6970352626408924376.robh@kernel.org>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
 <20260921145325.300025-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921145325.300025-2-richard.genoud@bootlin.com>
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


On Mon, 21 Sep 2026 16:53:19 +0200, Richard Genoud (TI) wrote:
> Declare a carveout memory region to store LPM metadata on Jacinto
> devices.
> 
> For Jacinto devices, this memory region is needed for saving ATF context
> and the certificate information of ATF and OPTEE and DM image. This LPM
> metadata area is firewalled to be accessed only by TIFS.
> 
> U-Boot R5 SPL/TIFS will use this area to save and restore:
> - ATF context
> - ATF certificate information
> - OPTEE certificate information
> - DM image (which has been copied in memory at boot time by U-Boot
> R5-SPL)
> 
> At resume, U-Boot R5 SPL is executed and detects that the board is
> resuming (with a flag set in the PMIC), then it:
> - brings out of retention the DDR
> - retrieves the LPM memory region from DTS
> - authenticates certificates from LPM memory region and applies firewalls
> - asks TIFS to restore TFA and its own minimal context
> - starts TFA on remote proc
> - loads back DM image from memory and jumps to DM
> 
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
> 
> NB: This memory region is not part of DM memory (which is not retained
> at suspend)
> 
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


