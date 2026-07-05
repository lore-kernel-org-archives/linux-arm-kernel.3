Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZhM/0+OvqhrwsSvTpUuB05s8KN//HqjSTRLZy1Sajk=; b=oLTU111JQZSC8B/aEbgj0JPfCt
	GodJRDlJ7JWhMfrfmeAjwDX5LIT/TeSmFjgemXHnoubGerGDznLd3WNU3UPerHgHtHrHzjOadddzg
	DOeA8cDL0eePIJ2wFXtrpU2BYPHD56fzx6YyYi7pX2ZR7MXW/i87f3XybeZmPdt2wCFIiq1nnmCTq
	FdBFubpYUVpk2b8Ht3oXsOKEDWM+6XCcbuwLzeVHCGFH0EG6Jog2l8R6+3iUN8OWdrhlkBHFJX5Tx
	13g0UvQKGXitAPXojc3RLqT9akwzZuKar++pmNj1GwyqDK4/9AV5W+JYuiFjNXWlxPnzIO1krnioU
	Y4pqxAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJJS-00000009Cjc-0zrG;
	Sun, 05 Jul 2026 09:38:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJJQ-00000009CjT-2vht
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 09:38:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 098B440715;
	Sun,  5 Jul 2026 09:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30DC1F000E9;
	Sun,  5 Jul 2026 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244335;
	bh=XZhM/0+OvqhrwsSvTpUuB05s8KN//HqjSTRLZy1Sajk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ry21T4sYhIVr7FwMl4zizXNPV327UPOoEoUqQKDU0r3Q5w2GTM+4y3CofylaqxlzH
	 yz4tN5puBXEQX0i+FEXpuCFdkKCOpW3y3BftZrm9+EQjNT2Hrvh8xE5R21PCDV2PNW
	 hvAPGp+RtiEkxsfPrz4W46aWlbZxTrfQTQnSnl7/MqkELjGWyeUrFASMJiD0XTgOG9
	 IcvSiJkzioBzeZFTx33D1qgKLA50gwtO3oyutXlLNDqjW+ENMxBfDbn6QkVpVOZkye
	 VrUPCtfbeXiN1BurU3JcEhg7BQSOLkBVD5UlKYUFxBxaY1qsUodZrDr7bXwK1fch9W
	 WWcy8YmeiOJWg==
Date: Sun, 5 Jul 2026 11:38:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
Message-ID: <20260705-hungry-dolphin-of-spirit-c74e4b@quoll>
References: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
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

On Fri, Jul 03, 2026 at 12:50:33AM -0700, Jingyi Wang wrote:
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


