Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBB7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTplyJ8G30xRLAXwKBGoAL/C8PLtDZmSZYvheYGh/Kw=; b=ev5cpN//oivUD6OW+F1kClOSB8
	9+lfcLFAaiE605Ub+RuiqBusoGMtMKLbR8t61WFUi0zHfjwbWuvHbnqUgO9pJN0V4V9vp449PD22a
	ZEfgOpLcZNvcERyeoHg3ArMM7NkBqAc/436Ap0VUZbUz2jNra7C/2PejzCas6YpAG3J729sHSmmg1
	FM3e3K4sOwKwGPg7SxNgT3ghZ2srfP861m2AGWK2idM+ID/GO8Bjv3lOnfPBAo0/pb8Rk/gHblKLT
	P4IWN0XwQX6G9xCiQR7lym7jVUjlnwfa3szU+p0o89D9OHULfz5346z/d1siWitSuS5KaSE4oYRyT
	I0jy6H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyr3-00000000gRf-1j3e;
	Tue, 25 Feb 2025 17:36:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyc7-00000000brN-2B4B;
	Tue, 25 Feb 2025 17:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CFBC6129B;
	Tue, 25 Feb 2025 17:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6766FC4CEDD;
	Tue, 25 Feb 2025 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504058;
	bh=czI6Fd5JF1+j/TyJHZ73NP2GGsj/fEGgSJ8IOHpG/o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYDMB0u+LW72BguO3XmUKi317GgaTHspr8I+DQSlZ7ccCFo/RjOOaxUPb/DIgIzA6
	 PsB4RMn3ilTLpkTeipYPmQm6f2mpBcSyKuygmPSADhcO2V+Pxt6lfsDu6P9cnJR+tV
	 u3LdBCfIeDXhTLEfOrQxoIANjq6aP2Kw/9I9UmMfJaF6YJbYrsgblZ0Zd/gtlCdoYN
	 gnaI+RpJ5nKJwRhHDmzoubwT/q7oDDBV+C7OjP73w7CoVGCaS1MewVyVIFy1+UO3Ov
	 b6NAfBVhXj7e0ELJMCJZYBuAYUB1UWRywe0Xwlo2Ebs4ogM+6OzXezqM3hPCeEfkLv
	 BVRT0QjslbwzQ==
Date: Tue, 25 Feb 2025 11:20:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, heiko@sntech.de,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Message-ID: <174050405630.2722665.6173973387821461837.robh@kernel.org>
References: <20250225102611.2096462-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102611.2096462-1-kever.yang@rock-chips.com>
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


On Tue, 25 Feb 2025 18:26:10 +0800, Kever Yang wrote:
> rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
> instead of using GIC ITS, so
> - no ITS support is required and the 'msi-map' is not required,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> 
> Changes in v7:
> - Move the rk3576 device specific schema out of common.yaml
> 
> Changes in v6:
> - Fix make dt_binding_check and make CHECK_DTBS=y
> 
> Changes in v5:
> - Add constraints per device for interrupt-names due to the interrupt is
> different from rk3588.
> 
> Changes in v4:
> - Fix wrong indentation in dt_binding_check report by Rob
> 
> Changes in v3:
> - Fix dtb check broken on rk3588
> - Update commit message
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../bindings/pci/rockchip-dw-pcie-common.yaml | 10 +++-
>  .../bindings/pci/rockchip-dw-pcie.yaml        | 55 +++++++++++++++++--
>  2 files changed, 57 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


