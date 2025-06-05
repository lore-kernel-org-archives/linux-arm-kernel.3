Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593E7C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBnPDe0pdlHxZsoSWMILi5Eye5T7J8KUuxzbghc/g+Y=; b=kUrEq9kMcXR9LDRCC8bmHqx+dK
	sv+NsCNKniU//6NtJgvw11E25ns+79AQdoANyd1iRLQDyJ53nJvBNDqFTspzLlTyXZrmWckAy6TPV
	uiJvhpkAjzdCFX8GfeVjZNnMv3G2cg2uHe5bVm+gYVmdjC2yNmlaiz2lbOkFQVSgYqfPNbxlgKE0O
	KUovfuP61v+C74yP4mC71NvFrvs+L9W5l7QbvdrK8Zef7qyCPMV0QmF9zSSVp6gjgVFxHXrrbtgT3
	b4yORVF/Z1EX//B+6Kr+Cf2vrlfZm706V2OZBhtZrLLaJjigHSP0U7W7kYosGixw963/TTf7e2kCJ
	E/QhM+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJJU-0000000GkPx-10n9;
	Thu, 05 Jun 2025 22:43:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJHK-0000000GkDg-2cz2;
	Thu, 05 Jun 2025 22:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A62D46154E;
	Thu,  5 Jun 2025 22:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE720C4CEE7;
	Thu,  5 Jun 2025 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749163301;
	bh=hIS2pQctSMpFIPaTq3L1zuxzZbTTneZFumBe8jVekkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuTWCTNvhw0Qv8ZeFQeiEq6lkY864n1iROVB2/iNWkI3ajSPoxBdSWAJ+c4I0QWK1
	 LnMJMP/VRfRUF+fFTdkk2kOzj+cluF5kO++6SGxTpvEAQUP7/lEcnDO/q94sdply0c
	 dz7ZfUr5SZ5S8PEhqa1FvnnBTlYwwzgfx15boVFjqQEM/KMmSk+o/50AElgPC8TQig
	 +6IdQbf/WcBznprlXZMiPrMJ11Hj1JrlrlfD2JPWKTutdM1XYGpzjzWVn2Yni35d8V
	 0pYCBQUWwlHq9RqsAuVGbcYhAltRNSkhExMYa/li+z5wjIQzLGXTnp2vEgrMe7DgVV
	 sN/V6lJhkmVHA==
Date: Thu, 5 Jun 2025 17:41:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes
 property
Message-ID: <174916329542.3386220.14917608144191847883.robh@kernel.org>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-2-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530224035.41886-2-james.quinlan@broadcom.com>
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


On Fri, 30 May 2025 18:40:32 -0400, Jim Quinlan wrote:
> Add optional num-lanes property Broadcom STB PCIe host controllers.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


