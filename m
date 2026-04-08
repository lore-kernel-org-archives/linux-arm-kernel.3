Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50BDFD5F8D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsNQ/tYhB8P0u4b2laKJacyd1lLsTBj0AxH1Y/1/ETo=; b=Zr19/GEtFXROTB3i+mQL05rgul
	3S7J7csqLznpGTpJCW9LKDTCaiK/v4QTkYZC3XKDbZRGy4pbjfVrwN9vNgumSd0cjXeoh0XBLCeBa
	amaakMMg9FWv7MD8iUPrBIAQGEgR2TxnqNlEih/Rz4O+TfXgRBZIoyYT4GASkIdNLVDTjiL2oKbt9
	VYMkVzaPpZ+Art2dD43Zm/zPxuKcbEqglkhUbmsq5T0yrZr+XpdLo/SeHAMTv12ihMQWNniTZDBF4
	jdWlzLj0rKM/e3xaFnqRrqXuUCJxCmsNNFQfGwzBT64t+1FBR3xNSE3J8aqaqSDDgWxqENqSG/WtK
	p61fhpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAN2H-00000008Okf-15XA;
	Wed, 08 Apr 2026 07:09:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAN2G-00000008OkS-28f5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF0246024D;
	Wed,  8 Apr 2026 07:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8CEC19424;
	Wed,  8 Apr 2026 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632151;
	bh=gSnWs/hdG4id/G+ZDtXX2wOhcyV0p/AOipuWvp3E5LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKrKQ12b6l9zt5BbE/9WX0kjncIHuQhtK9hQt5pnOPM0LyPPInHL1nUBvYOyUy11M
	 fU2ZibPC10Gn+2GTogAr3ufBtagZ0Lve8XB1pq0BMGmRKGqdObErCdYaiYRVlUJPXH
	 Cse2PyBWkcgECXksU86iivqJsZ84YDyFjQ0f+BcUSL/RY9PVQjhRvopW8IrKZMK3lT
	 YZ5upvOhZJJFwkU5VNPJnAAmMYUvfQfmCCuBWuNXITJaSWO8vuXBcc5nwc5/Ka5jPT
	 805V3iOlvQerhhDOfKrivGNfkSiv94HuLkEpEWwxKcdS+lmOz6s7HPztcnmILS9cBq
	 vrxPeHV2JuUgA==
Date: Wed, 8 Apr 2026 09:09:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, 
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: perf: marvell: Add CN20K DDR PMU
 binding
Message-ID: <20260408-fancy-slick-locust-ff68fe@quoll>
References: <20260407153511.4250-1-gakula@marvell.com>
 <20260407153511.4250-2-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407153511.4250-2-gakula@marvell.com>
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

On Tue, Apr 07, 2026 at 09:05:10PM +0530, Geetha sowjanya wrote:
> Marvell CN20K SoCs integrate a DDR Performance Monitoring Unit (PMU)
> associated with the DDR controller. The block provides hardware counters
> to monitor DDR traffic and performance events and is accessed via a
> dedicated MMIO region.
> 
> The CN20K DDR PMU is functionally equivalent to the CN10K DDR PMU, with
> minor register offset differences. This binding documents the CN20K
> variant and introduces a specific compatible string to allow software
> to distinguish between the two implementations.

Drop last sentence, I already asked for that.

> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
>  .../bindings/perf/marvell-cn20k-ddr-pmu.yaml  | 39 +++++++++++++++++++

Still wrong filename.

Best regards,
Krzysztof


