Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B37C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3CV50e0YY5u26ELXKQxJCbGx1tKfYnzsB2w5YG2zHM=; b=d0/G3zvuXJRClZznugYehYgch8
	byqGtpmb5M78kCdTSsIiAmUStN8DUFF8daruvHtT8V/kw2l6VKJpngDWYY+WEBiEybNTUyj2ZHGbe
	iEJGGvmm7g/AjII6WczlKvZHIMkVqge1Sve4V9eKD8dlxoeqeGMgafzq8XT93hin6lC0HjX+Wekqj
	VyUhIvFgFlmmXoEZBZSJnbpCYw431xTVxW6TeEcTVy++NcMCPiD/PJjgmDzGsqFUAVV0yuWfQYyKX
	yJiDg2qNDymmA1kIoqvm4ze8x9MQ4/8hPFkGjmTkSTVxobYbY3grZUPWhanRmuoc5VeAhYPRXJXm4
	av0dECtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTQ6-00000002yLl-2pfY;
	Mon, 27 Jan 2025 18:01:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTOj-00000002y5k-3Btr;
	Mon, 27 Jan 2025 17:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D56785C1000;
	Mon, 27 Jan 2025 17:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AEDC4CED2;
	Mon, 27 Jan 2025 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738000784;
	bh=c9fNMiYQ6IaAXSHNLRvX7gWgmxv11IcH5CNf8x744j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jL1eRz64jrGD1ExY+hDpmzMxq+qv1SJgTwEyLDz/7hF7LKjWZlcIG7ZTETSArNlbx
	 B3cnxtP2/xdU+vfUZsbuP3NLKIo75Clg4Se1FvvkCPyJ2Fp5ZvHe7DXjxUH4Y2opA9
	 +ApGDsDym8XhAzIwop8RLC7ocLsyeY2FIlf/u8c8+++4wyc9kJtJBh6hmOlDkCcc+W
	 4L4u4/lNmbEY/H28q+y2lQ2ncDVmwo2lJY0Eu1ER1UecvFvUF1hk4rt364eXodXm6w
	 Z8KC7b2lQ29ahPBocJXNjFFj9EeS4ha+tQ2vyEUpfrtjvAKwf+oYDoAEZAU/1W0NPJ
	 XVPbTL4gAd0RA==
Date: Mon, 27 Jan 2025 11:59:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-rpi-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Jonathan Bell <jonathan@raspberrypi.com>, kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 -next 02/11] dt-bindings: PCI: brcmstb: Update
 bindings for PCIe on bcm2712
Message-ID: <173800078306.536877.920317411552148665.robh@kernel.org>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120130119.671119-3-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_095945_848241_C880657E 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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


On Mon, 20 Jan 2025 15:01:10 +0200, Stanimir Varbanov wrote:
> Update brcmstb PCIe controller bindings with bcm2712 compatible.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


