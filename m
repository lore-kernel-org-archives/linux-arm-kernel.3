Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2AACD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PKIUPzKZultVLVuDEshDOuPNkVRnRPKWDlFHZcHgBg=; b=IWdI8IhXSSYJEzOj86p8c+LU9z
	/9iTkPrenFNgWYfexGiIFFxbdT8B75SSZ7BguR4BOFlI1X+8If89nhluP3ldTVIxfbvz0Bsi+OfI0
	4TuseVKvI5n0b0I3PY/nZov4yKuV5Vqr5bRVjH3upyZJEbWVE7ThJXthNp85UxXNZnIJlLUUpi1S+
	QoYzIXqqrFlVb5Ra5R7BYW2mdUxnTTmt3eyXuhKVIjDFXMtuj8ZR4PQoTkRSSltkYqXkpISA1gKIv
	Y7SJUY3dipREAs4QR0talO/55vqTKAMUin5zq0xHe+GX5Q2g2knxFrr+IJc4dOhDomrbZSCzbRmKD
	pCuHZU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHlH-00000008fq4-2bVs;
	Sat, 30 May 2026 11:21:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHlF-00000008fpk-2Ety
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 11:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA756406BD;
	Sat, 30 May 2026 11:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070561F00893;
	Sat, 30 May 2026 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140108;
	bh=/PKIUPzKZultVLVuDEshDOuPNkVRnRPKWDlFHZcHgBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e5XFGMMNxepVlF0/oJxZsyKEE0iKf5a9QQNSu1ZUZxh6mJwXvRhE25rYLnJ4vfONa
	 XaMyjSqBe+AIJEFhfFQPYfemmMlilA3TnIPyjgKhvp2grF/diRalawoS62X+Y3/qZH
	 bhF+NFaVVmTyB9uwfW+iZ1s5B526gAmyyUH3TrCoo6AaZqk9u+HlgjUs9TCeNB8OIp
	 qvOzkgjFtkK9iDjqMVzVlssA09nNAndEe1g8c1af7LmqaR8ktEuUfbscuT3F/F/tCV
	 +mI2nHp+iLiYtrfUdLfsm8aoxOzagSr0o1UyAvlDWsYAAZCRdpUB3CP+MWhRDdUmsU
	 rwmOaHYIWlAFw==
Date: Sat, 30 May 2026 13:21:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
Message-ID: <20260530-blazing-copperhead-of-gallantry-c1dd23@quoll>
References: <20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_042149_597518_1565047F 
X-CRM114-Status: GOOD (  10.09  )
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

On Sun, May 24, 2026 at 11:17:34PM -0700, Jingyi Wang wrote:
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Same comments

Best regards,
Krzysztof


