Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0053C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJ3DLTIlknojKBYsHiBKYugHEIBfbYTLpD95P/rrvbo=; b=vHdkIwRDdbb48oFTGPTuYwZykc
	6IjWTlYbfiSUUDRX1XuiFBhdnDHsZFw6N08yXpbiPmhpYWUbFmM8Ns1xE4HlEA/bhSb7x7WuTtp/1
	f4jsyB5qTbjPvHSzCLsIlCbLNLDSuAGFIDB7p01n079ri/37sP3s8URzkel7pzWq37GfJuBejIK1g
	lCe8sxKf3mv753aLR+c47NODdZtKxL9MNoM+DlH4M8BDnYVvieGsMWtg8Gs5QATUdrq+9b6Z4kcPI
	IL2iuzzhh/oVKOEIE+vOMG8QWEHUqu8nBblv41ffkE0gOq7HPR4O7j1TRiC2IN9+08FExNCmlPuX0
	0q7cWDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOY-00000004om8-2lBE;
	Thu, 02 Jul 2026 15:32:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOX-00000004olk-0YlT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:32:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F2A3601F0;
	Thu,  2 Jul 2026 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31601F00A3A;
	Thu,  2 Jul 2026 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006324;
	bh=jJ3DLTIlknojKBYsHiBKYugHEIBfbYTLpD95P/rrvbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XaW+qLOrHSkDMzJu6XPRHmFIpYJdsCBqaciYzbaiRU3sanrl2ntlnm2T+/tI1AoFj
	 aKbaNqItCSLp/5eKIQFZPwUXULZaKvTrXGoEt9/ysUR0Fa4U8pyXL4opAQ/wDz/RgQ
	 M80RX2y574G+0W0rM3bU2iTRK/f5nHFrdIXZe7ANyY/dBUiYdJUtP06KsVemLe70re
	 TGQAofhFPRrV0Ujg+0ea6JIEr4yKBoMfE5NxvrjIxuugAo2iXgR3iPw+htBwvJJVou
	 iJWz2VH97MY5Dztk9FsFQQcAfe34YqWW8WvX2ENNDeXTG5u7GhNS7T0g+bZ4Ck6vnS
	 D5B60OSW/o/zg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Abin Joseph <abin.joseph@amd.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260612215226.1887726-1-robh@kernel.org>
References: <20260612215226.1887726-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: xilinx: Fix "xlnx,irq-delay" type
Message-Id: <178300632060.735405.1201510775186759971.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 12 Jun 2026 16:52:25 -0500, Rob Herring (Arm) wrote:
> "xlnx,irq-delay" programs an 8-bit delay field in the DMA control
> register, and the driver stores and reads it as a byte. The binding
> described the property as a uint32 cell, which made the helper type
> check report the driver as wrong.
> 
> Document "xlnx,irq-delay" as uint8 so the generated schema reflects
> the hardware field width and the existing driver access.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: xilinx: Fix "xlnx,irq-delay" type
      commit: fa9cb11584851414b25fd8bf9f59518424b5917c

Best regards,
-- 
~Vinod



