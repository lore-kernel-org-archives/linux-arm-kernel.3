Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AD8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ESRWBTEW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bj8NAlyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jz2RVofrsAtIuVkB1pB0CwKwnBI0H3nNrAhf+naY36E=; b=ESRWBTEWjLGdMPEFWHvYtJCtvh
	y/bNuRNVdOi7TbZDrO1L6XktX59WGh3yt7Ab6GvfMN9QNoVZciWZGiQ82uPLA5oSLoCoYSt3Gc0fw
	EYA2Alpbkzb22PgtMPtPOi2Ms1x0u775HILMZG/OaQvXs2OatTxMxvhRE0ueDZNNG1YDA8d7q4gGh
	W3NcQz8maJ/EYg/4EEfUN642k+1pWb2hzShQ7suVcoZ1MI5zSRysxtNiHYybdQx7O/2eEZoLSSJmJ
	oHn6J3Czd9/YkIwl6/r0FFIhnFCcZ5d3B3EzrKl4Kr8Oh9OSNKEm2b+RQqvtSz+K9B/tEAXgfStcP
	aA4W0r+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFcT-00000001uoe-42cO;
	Mon, 26 Oct 2026 07:59:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFcS-00000001uoO-3lc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 07:59:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4555543C38;
	Mon, 26 Oct 2026 07:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6665E1F01825;
	Mon, 26 Oct 2026 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793001588;
	bh=Jz2RVofrsAtIuVkB1pB0CwKwnBI0H3nNrAhf+naY36E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bj8NAlyiUfZTNnuTTMA5p0z7NdG0U2ouhcd/3vwUMC6BkldNf/NoXNYh0iMdSEtSO
	 qAj05uP7lp+cDlWFJwMsQkHMgaQLaY1FxD9RAkGAgdCKRCN3gPluyXZ7Fv0f1iBJbI
	 ovgQ+opqdXN1wvoKZnqG37vghiRnXCICHtCpUZIGaF+haZM7v9kMwDyYTCfTkRFksT
	 kAY5smzqueqp/aOZPuz4gvCOIHnORK+m3y6gU4aKsqeNoqfnrnMA8OhNg8AZT3btcH
	 5C6kFt523PT4b3ptSaDGMb8M7RzwSL2Cu0KDLixDLb9+mIVPFGVTl5zkMNO4tBTgL+
	 dKIWKCGua6/qA==
Date: Mon, 26 Oct 2026 08:59:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm-smmu: Document SM7250 SMMU
Message-ID: <20261026-brawny-dashing-bird-5df079@quoll>
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
 <20261023-smmu-sm7250-v2-1-8bb881ce19f5@brar.si>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-smmu-sm7250-v2-1-8bb881ce19f5@brar.si>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 01:24:31PM +0530, Ishu Brar wrote:
> Document the SMMU found on the Qualcomm SM7250 SoC: the apps SMMU, which
> is an MMU-500 implementation, and the GPU SMMU, which additionally
> carries qcom,adreno-smmu.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


