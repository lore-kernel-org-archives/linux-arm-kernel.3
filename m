Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15644C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hhyWssp07/ZGm2jj07OWH53BPbjC4C4wZgRggSv8zQ=; b=tiUYqG8L0DlKMr9uFubEjVoqqm
	+oNtKNu/1zrSvbbAO7jmp1ZIK+nvmWFHiNlVvPcUFto0FxoiXahR9rQoYKdI6fj4buMSa8eNCO7YA
	OVFEYfznwdNoLMEVzXvJgXzFQOMTt9b+HALCuxw7Y03yxawZsKVeWwglhtVMVEi9pK0RUtwtK/PR9
	yIY5IKaOYMPB3gneJuweuQy1CKdcYk8sbP/lR9lccHpb/G6V4eKNhsMua60vE6jLxd5xolmXuNqBJ
	3wtDu7NAcxr9NzsuM66nGBynyZLSvlm9HTowBUth9P0WRoOxDxL3DxDTfrv8LH9jbKMRE+CsYtAI3
	dR6Z+67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkS42-00000000Txe-0S0K;
	Thu, 16 Jul 2026 19:48:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkS40-00000000TxV-38ZH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 19:48:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7991F60A6D;
	Thu, 16 Jul 2026 19:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD891F000E9;
	Thu, 16 Jul 2026 19:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784231287;
	bh=3hhyWssp07/ZGm2jj07OWH53BPbjC4C4wZgRggSv8zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OWvezLmh8IpOIQJUxbAuOnrKQsiVynhZzqrFMr83q4sRZ8wHNC0UZA/jpqcVEVMTT
	 GydXWvDua5aNX+XLkSCgK2xOcsCBZLccMaURql4LbAreu7MEnYy099QbeZ0qzNlRW0
	 yQ3u0whE/1vo3rND97O8vjNOnj7EAaJGpKiv85DqDoh1cZlgN9kq9J6pEB/FWG2Rzw
	 q/4zgvsbrTQwyvCeZFa3au66pcVI3CGGxL49r73+tB68YE4HRbTOhit/8IcOWK0cJm
	 0uvXZy266TgLv18ytV332cq0+bu5cuQ4nuspFgzubXr+oBFPVAKWkIGvVVoZXstIN+
	 868u333PzLL2Q==
Date: Thu, 16 Jul 2026 14:48:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>, Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM
 memory region
Message-ID: <178423118332.1182230.16969278384286286126.robh@kernel.org>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703143717.177362-2-richard.genoud@bootlin.com>
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


On Fri, 03 Jul 2026 16:37:12 +0200, Richard Genoud (TI) wrote:
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

Seems like sashiko raises a legit issue, but that's a kernel issue and 
not my problem if your board crashes.

Rob

