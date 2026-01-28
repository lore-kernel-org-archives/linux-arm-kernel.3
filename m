Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE624D35666
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdoC2fTunlOvb6SZtjaRuiCE5BmTWgXqtdP4TLLUTo8=; b=I8bj5c5K8uQPjyjRc8WiS+wgo6
	dCQxHx/LkaCb3Sgxy3lPWc+SjkzJfWknQMwBtZz8o0n73ecNzNPQ2b0mgoWAs3ivAJtuhHGOlrd0Z
	Pe2AWDY4jNQpnHMz4PhLBlBOfAKa5sGbUon0+FzXoSnFx1JI3zsiZ/jz8y3R1i853+Vy1mgu227uM
	l6UX57HOiCfhxeS/kwsxtS95M7gwatFQPq/VVMghTr0dlUO+TaJoT4pyvMJPatVeVBCGq42Xn4WVR
	WxG53t43FzeDsyRerDFNSz5cgdxzs3MrGj1900f1D9VnoF7tH7ssmL8E4ANanpmJyRTNQrwKpwRuD
	8aZDahYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkv0Q-0000000FI8s-2PQ2;
	Wed, 28 Jan 2026 02:10:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkv0M-0000000FI7O-1k45
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 02:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1552402BC;
	Wed, 28 Jan 2026 02:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A27C116C6;
	Wed, 28 Jan 2026 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769566201;
	bh=c02Qz508Y2Kp0ercGgCth0mlpDxAua9YE3mNF8P84iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s39sgDpCJxAQVaNB6ctusy7+cRhKyyceDPVc3dVlv5yYt/w/BDtw6PWve3PEOs1Et
	 atHQmgK8rdyQU2nuP5MjaNvQhlZakW6d36ZDsNkaL79rrFsxxmt6gLJktJoXfRlrqV
	 yxZDfXJ1YO0w2Lbss2gU/ATO0e8NbzB0CqAR5CrlcNuQ6DvDk10E/uyD9IR0c7mZs+
	 kc6rmeHRvb24kVENij4iqKbMjiG27HP/8Z7sBaIKbRfnGpNuRExb2jgX5e4FzPAp5N
	 hekA7h0nkVa0cNq+OWUv2EEynHBU9X5EN+W8noLb1bsPcqsggxiSwBIzZ320rAqCWS
	 mnR2AlQzR6ZLQ==
Date: Tue, 27 Jan 2026 20:10:00 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: USB error on LS1046 platform
Message-ID: <20260128021000.GA3716747-robh@kernel.org>
References: <aXh1kjRoGrj0SAyU@FUE-ALEWI-WINX>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXh1kjRoGrj0SAyU@FUE-ALEWI-WINX>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_181002_567476_9585E6BC 
X-CRM114-Status: GOOD (  18.91  )
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

+Laurentiu, Li

On Tue, Jan 27, 2026 at 09:21:38AM +0100, Alexander Wilhelm wrote:
> Hello developers,
> 
> I’m using an NXP LS1046A SoC with the integrated DWC3 USB controller in
> host mode. On Linux v5.5.167 my USB flash drive was detected and mountable.
> After upgrading to Linux v6.6.110 the USB flash drive is no longer
> recognized. If it is already plugged in during boot phase I get the
> following errors:
> 
>     xhci-hcd xhci-hcd.2.auto: Error while assigning device slot ID: Command Aborted
>     xhci-hcd xhci-hcd.2.auto: Max number of devices this xHCI host supports is 127
> 
> I have narrowed the issue down to the following commit:
> 
>     136975c33894e7b48a6007af0f4c25f423bbd1de
>     arm64: dts: ls1046a: make dma-coherent global to the SoC

It's best to send this to the author(s) of the commit.

Looks like it needs to be reverted or USB marked non-coherent. That's 
Shawn's responsibility to apply and the author to send a fix (unless 
you want to). The DT maintainers don't take .dts patches.

> 
> When I revert this commit, USB works perfectly on my system.
> 
> I have already asked on the `linux-usb` mailing list
> (https://lore.kernel.org/linux-usb/aTFr17xKxnWGG3vU@FUE-ALEWI-WINX/) and also
> forwarded the message to `linux-arm-kernel`, but I haven’t received any replies
> so far. Has anyone encountered this problem on the LS1046 or a similar platform?
> Any hints or experiences would be greatly appreciated.
> 
> 
> Best regards
> Alexander Wilhelm

