Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8613FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8TMUzGdYNSK/Vy+LXW7FJczTUbzayrTgLFAcKaqXUA=; b=AICSzVEgNHTRViC3B5T1EkrNii
	kDwWVqlrbbhXdvgh1BUVmfMv+ReCLgV4vQ+43xc+BdHO/IrQ3eCdu/PsX1MpbQS8MMHhDJOAYDCO+
	BSkXH9lG7LReCorvekVG895KMqybFHP+pzu9VkuB2Snm4OeeA4U6RvFgsgsrocsXubL7btnqF1Meu
	Smf1UdE8lO/4vm/VC0Br3kqAcGJPjZAgIzhdItUAHnoAxZ4oPeGrHei3mdVhS16kEoOMl8WJ+WH5K
	Ey2E54yFBZspGcfGwAGauRtGrrDwHU+od4yTkJX0cLTBw9OkQsvOfu+3+o5SGkKwpRKdBhebylrW+
	r+mEfuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q7k-00000008GL5-09bj;
	Tue, 08 Sep 2026 07:20:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q7i-00000008GKu-0NRZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:20:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7427C42DE4;
	Tue,  8 Sep 2026 07:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFD91F00A3A;
	Tue,  8 Sep 2026 07:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852005;
	bh=Z8TMUzGdYNSK/Vy+LXW7FJczTUbzayrTgLFAcKaqXUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AljxjW7epwTO1iYIWAH2ZCTedj2G+V1vW7PgQNUErkagHEZOnqt/vS/U/4Koycd8M
	 pXrJ0xHesB8UZrl3uA1N+83YjZc/SfSxROF1cLnbVLecpo6SOeve36gXxpcOVNE4Ii
	 5jfqSL2JjviF1zjkSoDxRDbLrqzXTUYIEEWYO+ldoIOxhMTT49m/NBACighlNPMqW6
	 BNyG4IPoRmLz7OjKntIBiReertNXf/FzDnG5GWLHRwFL1680Td28JTgpxWIRsRtkdp
	 iLeFAHkptC6m+duZFR3W6G4YGaoG4zJqrgXK+t/1d5jJJXP33z0SAYhm0N24osKMVO
	 o/TAtKbCTTg8w==
Date: Tue, 8 Sep 2026 09:20:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <20260908-whimsical-flawless-curassow-059bb0@quoll>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
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

On Wed, Sep 02, 2026 at 09:38:58AM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


