Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14414CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Qcuv6WiyFpTTR6NYZc9zcTGXOdCJ5UbWCYksTq8AEg=; b=BiPpHwmntcQFBUjxf9e7aRwZfo
	io3PPw67f/Hdt60dg+p3VdmIQTOiaqzpxBxYeXMeHvbROdg3qLOMVzxnRJ0OAR2FZ2wbY4YMZwdhN
	SziVghg/nky2pSZYR9TdLvcmqLiqqWGdGSIZu+ddnlR7gIjYtHbn2el+24rBqwDmanKmpHmUvdHxw
	mQCnWBmZ8sLVuisAKxIL32SMh1id7sZCmhUU5sH7vUGKvYAC7Z9WEGjE4jm+/hXaRKC5YNrOp/1ov
	pNE+Iiv9q7SOGj3jzxhmI8G3rZxZGD3J1OAxWk2qySZ+GT/R1pkqnylqNC7NHbS+7YuRpgEU9u+pU
	FACnsQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2Ig-0000000BBN8-1wRu;
	Mon, 01 Jun 2026 13:03:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2Id-0000000BBMa-1ITF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:03:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66E0340640;
	Mon,  1 Jun 2026 13:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C841F00899;
	Mon,  1 Jun 2026 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780319001;
	bh=4Qcuv6WiyFpTTR6NYZc9zcTGXOdCJ5UbWCYksTq8AEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hro2EzSkkrgwHRQkLSvw1iWDm+KKS2NQi9QHW5cFDDP+eYjZwthbqxNpNQ9Ci7gpm
	 gQ4lxGNJa69h5exAGHP6RQf9OK75AMpVc/bhpDGC9OdulIw40M/ZGrVYB9cCe29M5d
	 VS8GQKfJmaG2j3THoI9HJu4Ugh/IKuIZ+Zjyia3SpmHhqTRtbETx/KAZk8GQlqHbD7
	 iNWe4Akzk4y+TFgyNh5Mo0mV+sRhcA2cq0EbYhgZH7RDzymhP+Lqf1lEqRY0ON4a1+
	 3wDwOz/IZYrRWeeJBSInUM0HhurF34SNe+VaYCkiT8h71jcI8mQTfe4B4j2+knTZ8Z
	 7d8UiPGmoKADA==
Date: Mon, 1 Jun 2026 15:03:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <20260601-grumpy-crouching-baboon-9cee5a@quoll>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_060323_392805_64BB504C 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect

"... implementations like Qualcomm foo bar ..."

> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


