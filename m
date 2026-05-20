Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38123CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhzTwprIasaYOnRmR1T+nFY3LpPl8A73UNuvxAcyD7E=; b=q0nnvYfYMt5nqkMiBfVkHWhx/v
	HxCX1stfBTTtzqOuCDqOgqsIA7UZzzK2pZnSKCQaoJbt5PeV0plalw1j2g/mqLW9UobeyXg8bJQGL
	wS8890y34QeJPO9nTr/6jcAaErHx5KDknejxzsXNkKl8oWr5RLFbfBNUZt74pPA6exXTx44bz61f1
	BVY6F5h9JA+KnPk853J9EIszk0gtUCAr9poz2sMp4EAY8n8/lX/h7HjT04GgWkqiaFjMEZi7WzOZr
	wp7XiR2RafJi3vbYCbARFJuoOprg5LXYa9tInutlW7cEb5GXy1FZpqAcYR/OcAmIbzDp4O2Qn2xUY
	tCGJiNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPec1-00000004OC4-2lQT;
	Wed, 20 May 2026 10:57:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPec0-00000004OBo-1rbz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:57:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E22D960129;
	Wed, 20 May 2026 10:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DAD1F000E9;
	Wed, 20 May 2026 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779274635;
	bh=VhzTwprIasaYOnRmR1T+nFY3LpPl8A73UNuvxAcyD7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TDyFLvHvgPq4LpskalVJd4YQrFmgdL2a7o9+ZsAX+dK0r6jIHk6DIHIRVwTr7Tsvs
	 25CK2cC3T7La2A/rxXtU7aeinTt9ZTVBZCr+aFCr32FVl6RmA6EwSG8rulZGJdi61i
	 Ryg9up98YDSoqmupT3c9nwOKndHqruYHVMmwOuHos8R7pEfP3keOj/WGYjnC6qdgfx
	 Ejm4MEz8EGAFIUWEVL1IxryupUjU1d968tippn3IjLwktRb6Wby6+DGvPkBb4FeoEY
	 EK3K5VIgYvqEM0LYwIjrdCcDqnPBmXIJ9Wz0pXRa1SBtQlzf6EKCrfRPPLiy0I6FRP
	 R6O/jBq0fn/KA==
Date: Wed, 20 May 2026 12:57:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Constrain clocks for Hawi
 SoC
Message-ID: <20260520-evasive-harrier-of-honeydew-06ba84@quoll>
References: <20260520073447.2138384-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520073447.2138384-1-mukesh.ojha@oss.qualcomm.com>
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

On Wed, May 20, 2026 at 01:04:47PM +0530, Mukesh Ojha wrote:
> The Hawi SoC has two SMMU instances with different clock requirements.
> The Adreno GPU SMMU uses the qcom,adreno-smmu fallback and requires a
> single HLOS vote clock, matching the pattern already established for
> Glymur and SM8750. The Application Processor SMMU (APSS) uses the
> qcom,smmu-500 fallback and has no controllable clocks.
> 
> Add qcom,hawi-smmu-500 to the single-clock constraint block for the
> Adreno GPU SMMU and to the no-clocks constraint block for the APSS SMMU,
> following the pattern how it is done for other SoCs.

If you decided to make a competitive simultaneous work, you could at
least tell me that.

Best regards,
Krzysztof


