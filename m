Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CE0C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x64dhSbRG3976W/AFnDoWQ3i6kbUl3GlicYHKb29MTc=; b=UyBguSyrljZlT11SNSgbxX37Qu
	jegj0yKzOie/SwitlTKesDFeuc4gwm4YWEFhgxmuC1I/WqagG411LRRhRaNa1tRjpqJ4ZtPqGIoz9
	mzBY7PzS+Yr+azsFIno41kRbXgQrKWt7LMOXEW7BWr+E54eQMw1HwhQeS4wriap1f+65pYOnR9eHK
	Q3yCKhUskSfZnSkbj6teiDPbujJK6ebaoOcRenT4ovV8t7JaoSRTcGoEFpaS4qEJg36YrJFqZxhvL
	RribyqU7pyeEvisF2XjR0loQcjKDXv8lhLce4qh3Z8btvSUwl64vIHhtBUJStEm4kuyiucMMXR6HR
	oEaYBMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vfV-0000000G1X9-04aE;
	Fri, 11 Sep 2026 07:27:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vfS-0000000G1Wy-2wP0;
	Fri, 11 Sep 2026 07:27:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7483140050;
	Fri, 11 Sep 2026 07:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C95E1F00893;
	Fri, 11 Sep 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111646;
	bh=x64dhSbRG3976W/AFnDoWQ3i6kbUl3GlicYHKb29MTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhVJSvK0Wn8UaoKxFrtHGjmyng3OL9S+DoVjRfqoYFJ1H5lsCHwiBTguwrk1HW5pV
	 H/IjBJcpPHR1ZScHQSQlnY/UEOCBN/9tC0xMZuLYJJqe5z9d9UxXWXMZu5GQWhcQ4z
	 AJAi5TZlMb+0G2cCp46CT4A26y188MC1AgmclTsgbQ3XAiJvLjnJrJBL3y+TB07Gr8
	 OaXE05A50TRz9KZbrzojPPcjT6rLNMc4wr0VHA6MO1wdslBwI6oAzK2KxTVBbRa2/j
	 p6JCZ2DrB3mosPY96c56pGYXsg8lTni7mKcVB975lq0FQm6BCe1TXR+/2HqRZEsRBK
	 OhvRGjdccornQ==
Date: Fri, 11 Sep 2026 09:27:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: iommu: mediatek: add mt6572
Message-ID: <20260911-khaki-squirrel-of-sufficiency-ccd82e@quoll>
References: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
 <20260909-6572-iommu-v1-1-de261da09fb2@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909-6572-iommu-v1-1-de261da09fb2@protonmail.com>
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

On Wed, Sep 09, 2026 at 05:14:05PM +0300, Roman Vivchar wrote:
> Add compatible string and header file for mt6572 IOMMU support.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../devicetree/bindings/iommu/mediatek,iommu.yaml  |  3 +++
>  .../memory/mediatek,mt6572-memory-port.h           | 26 ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


