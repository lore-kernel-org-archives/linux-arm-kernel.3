Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908B6C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRMEa5c5ui2nn0EcJvJsdjakYRKPPxlzAFWBj5ZyHAM=; b=KXyasdbYHm6lPmXPhzftB8UHmD
	7mteD2JADKhfSRpOWiAzuqpkzW7lLi/QvxR2wgIhdLZpS7hTMBocxt04yim5ACKJXA+VPiLxX+qXl
	76tHq6pWwgREsBoaarUJ7uGtcUSzyJpEV8APjs5QFXjjGON7SzxirvffZ9QPgjVYQ5hOM67yMQSSI
	TNKhHY3z9YHGiolC0zvPP1GGy7dvCGYP7eAr6ePlj2YyI/FZD8rGhmVXzUUlXGMko7ZUjncjo4JdW
	ZrodosQjOO5ft0HzBv8IlQPteGiFs7EmE/VcJk2lC7OwaFBXBRNIEUrWo/HhBgbM7FkgZx3zpiJQZ
	w6rmu7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1VMl-0000000DLio-1MPe;
	Tue, 01 Sep 2026 20:45:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1VMk-0000000DLig-1Fop
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 20:45:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63BD940C56;
	Tue,  1 Sep 2026 20:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FFE1F000E9;
	Tue,  1 Sep 2026 20:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788295557;
	bh=zRMEa5c5ui2nn0EcJvJsdjakYRKPPxlzAFWBj5ZyHAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=l7BEi9MFmuTupEv7HxYHW0JJUAGv2eP4grXl8QE/a1dhT/y6E2jk44LxtzEFdf89b
	 XZhPCV1uzTE3KgMlUY9GsTHYkqavoQlXuy5YW3mjL3O8UmVV4EB1tgIUyhOZc3GLgE
	 R+JDBdW5sDkZ8Xx2BXlTc7F1EwEE9vCva+mRwJMx4bg6DciEXnWQ1l81a7doZ40czx
	 PpIw7GkdBCNtU2vlAEa1kQBRfBDiVPxNRPEefF3ea/V2G4Fg2R5Us1XZwMJENcJT6U
	 z1TogSnBYLl8SJbL1lZxPQdSNGWnvBj1CPS7veVxM13tvOG4WPMbiNJzSAvTyDk/o+
	 ORBqadjH1u+oQ==
Message-ID: <2b95fa20-22a5-4ef2-9ea6-c6fb7d1f16ac@kernel.org>
Date: Tue, 1 Sep 2026 22:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iommu: apple-dart: Support specifying the DMA
 aperture in the DT
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
References: <20260831-iommu-apple-dart-aperture-v2-0-d16ce3770299@jannau.net>
 <20260831-iommu-apple-dart-aperture-v2-2-d16ce3770299@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260831-iommu-apple-dart-aperture-v2-2-d16ce3770299@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 8/31/26 15:46, Janne Grunau wrote:
> Apple DARTs are often connected directly to devices that expect only a
> portion of their address space to be used for DMA (for example, because
> other ranges are mapped directly to something else). Devices can specify
> the start and end of the aperture via "iommus" args if the DART device
> node specifies "#iommu-cells = <5>. Aperture start and length are 64-bit
> values as apertures above and larger than 4GB are used.
> Limit compile testing to 64-bit architectures to avoid warnings in the
> calculation of 64-bit dma_addr_t values.

I don't see any Kconfig hunk below, did you drop it by accident?
Otherwise:

Reviewed-by: Sven Peter <sven@kernel.org>


Sven



