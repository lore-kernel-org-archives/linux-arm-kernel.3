Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050D8CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yooudVuA8gsbUGTO9ssg9za+lCfVob+b1/KEzJNqr84=; b=uvK+t+HvprLgaF5JHzitqOxm/v
	A6WQVW/K2FJs0eB6cXypQGyahBorVMcEFZ91MBHXBiCYfGeKLask3E6ashBBBe/XBPQEhNORmj2iG
	rCZxYzH43/vcyILA09j3aXSDce6A95q976M+s7i/ktEAFbccHqK3WjIJnRjWsRyfyRR88phtMHzk7
	X6PvF08b3eiWe0/8TohVyVQ3gabI+JP6hVhCgpugyvodB7TPdMOKR7kWbhxypTt7wYHluxG/3nBdY
	djKC6qsBnsgphwZDFGK4BUur6v8xZJaKL+P5GqLxw41IEmeyDJ6qM0HBA/vRfuPWaFb5WmVtLPcgc
	pc0cF22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCCx-00000007NNI-2t3n;
	Sat, 30 Aug 2025 03:24:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCAE-00000007NHQ-12gw;
	Sat, 30 Aug 2025 03:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E6D560191;
	Sat, 30 Aug 2025 03:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA81C4CEF0;
	Sat, 30 Aug 2025 03:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756524120;
	bh=uJCWLg8Xr/0C+/8ZRu6677VYEHkkf5iwokGEhBnGEiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvEbtI1ytCwUwam3rCM76cmTxjzFL004GOrQNw0nOxG3e7xUMl0Y2Xb3LISngBCrs
	 quhz/Siq8fyNOa/n5vOlMC3BsLo51jbgRMXLqI0YqhKBgre2UOyFzcPdhbS/qcovLu
	 ULPkFdUuWHYFvAJIaN6F9kSnNRSlb/E5rTnwOFLO6av/oInj11Jdu3KrdRK8pUeE+S
	 nYN2IvDhE6/pkaf4KBQWwLTMkFerx+2QWl9GeGBy5ltBDg0k+zps5rAIy01sNB+eSM
	 QuL2KyC9IMQc5gj/0iUdovvDdJ6or4DypUQ9GwZvEkJg7FLl4I+CtMDzx5A7Q6lQF9
	 hD8I6wodAF2yg==
Date: Sat, 30 Aug 2025 08:51:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: 'Krzysztof Kozlowski' <krzk@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, 
	jh80.chung@samsung.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH v3 07/12] dt-bindings: PCI: Add support for Tesla FSD SoC
Message-ID: <3eykohfvqgkbvwirzx63bx65d5uv774gib65bcyjlpphrssfjp@74bqakxvnkmh>
References: <20250811154638.95732-1-shradha.t@samsung.com>
 <CGME20250811154725epcas5p428fa3370a32bc2b664a4fd8260078097@epcas5p4.samsung.com>
 <20250811154638.95732-8-shradha.t@samsung.com>
 <9e065582-9349-4f39-88b5-048d333ab8d7@kernel.org>
 <000901dc101c$917bf160$b473d420$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000901dc101c$917bf160$b473d420$@samsung.com>
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

On Mon, Aug 18, 2025 at 02:16:16PM GMT, Shradha Todi wrote:
> > > +
> > > +  phys:
> > > +    maxItems: 1
> > > +
> > > +  samsung,syscon-pcie:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description: phandle for system control registers, used to
> > > +                 control signals at system level
> > 
> > What is "system level"? and what are these "signals" being controlled?
> > 
> 
> I will add a more detailed description for why the syscon is being used
> 
> > 
> > > +title: Tesla FSD SoC series PCIe Host Controller
> > > +
> > > +maintainers:
> > > +  - Shradha Todi <shradha.t@samsung.com>
> > > +
> > > +description:
> > > +  Tesla FSD SoCs PCIe host controller inherits all the common
> > > +  properties defined in samsung,exynos-pcie.yaml
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pci/samsung,exynos-pcie.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: tesla,fsd-pcie
> > > +
> > > +  clocks:
> > > +    maxItems: 4
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: aux
> > > +      - const: dbi
> > > +      - const: mstr
> > > +      - const: slv
> > > +
> > > +  num-lanes:
> > > +    maximum: 4
> > > +
> > > +  samsung,syscon-pcie:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description: phandle for system control registers, used to
> > > +                 control signals at system level
> > > +
> > > +required:
> > > +  - samsung,syscon-pcie
> > 
> > clocks are required, compatible as well.
> > 
> 
> Since this was inheriting the common exynos yaml file and that had these properties
> under required, I did not mention again. Will take care in next version.
> 

dma-coherent needs to be a required property as well since this binding is
supporting only one controller, that seem to have cache coherent DMA.

> > Missing supplies, both as properties and required. PCI devices do not
> > work without power.
> > 
> 
> According to the HW design of FSD SoC, the control to manage PCIe power is given to
> a separate CPU where custom firmware runs. Therefore, the Linux side does not control
> the PCIe power supplies directly and are hence not included in the device tree.

What do you mean by 'PCIe power'? Supply to the PCIe controller/bus or the
devices connected to the bus?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

