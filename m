Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AAECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOcFcgY1V6J8KHljsoIdgkv3VHYF7mSEnrSmYTuLj/k=; b=W5mF3dhZ1egywug+Xb6hWtoRaX
	D6798wOxBXZV+PNANohLEr2JFIJerCRwXw/KLt5R5lRFLTpouOO/cj5fWC/IREmtthpvTGrEErMeP
	U7KOKf+4Glwu1sJ+zAxclsYE1IsVy+obvsn3r8v+te7U3xGgLK99zcMW2/AQ3cgJvRaKgRCYurPJH
	UEQoMONxoOnoWL9toZlyvjYTxAYZqtga6Tbwy4kpClj3JWGBJgyE26/sWz2+ouL4q36QdFzX1ZHKw
	NSSzukMWZsBJosnwW2qWyVHb4Q+vl5AiAuXGuLCGBRJi9Dxy8US6kvFDQQCb6WSd9HW21Zebgeieo
	cJl+yniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNndR-00000007hiw-0lM5;
	Fri, 15 May 2026 08:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNndO-00000007hiJ-3ys5;
	Fri, 15 May 2026 08:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6868560008;
	Fri, 15 May 2026 08:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC60C2BCB0;
	Fri, 15 May 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832662;
	bh=dY87oxcNd6Plp17E/7k3+AqTR4VAYLZgpmp+DlDQquc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oi/UuL1LieUa7RCIK/099R2KfxRQxtNVVvuqv7V6a5QXlf4EpSLfD1Cq3yqekWzvV
	 MiCuerQyqg6H0oLcbHVMcWSy1EY7OyLnPk36DDtyosritaAITa2g60jAGanGoTZsnm
	 29ItWZFesltRiqZZVSq9a6yI1N53rkV2q+XaoH6qLbDoke9fMz4y6rCVH/R4eZnPF7
	 SVtyAkyCWBreWqIHKuhdVZbsnfZl1UfiPxj4Wd7CAJOBPK8mSFnosRKa2umf5FH2wo
	 eIuTcqaiaiXfb2xfDypx+R7RDt+XCDQ2sIRBzSWa3a6pFXQ9zJ6sRHnTKS3OaPzbpN
	 ou9iPZ8j3uohw==
Date: Fri, 15 May 2026 10:10:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
Message-ID: <20260515-resourceful-diligent-hound-b666e5@quoll>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>
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

On Mon, May 11, 2026 at 08:47:26PM +0800, Jian Hu wrote:
> Add the Always-On clock controller dt-bindings for the Amlogic A9
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          | 76 ++++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      | 76 ++++++++++++++++++++++
>  2 files changed, 152 insertions(+)

All comments apply.

Best regards,
Krzysztof


