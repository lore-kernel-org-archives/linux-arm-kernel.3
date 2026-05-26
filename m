Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6398CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69ANfIB+mPawv6oMTVRw25TJh4t4UGQi6U/dIsBgm28=; b=l+f/EbpqOWepTqNft5Phhx9vHl
	ovJ+UdgR7WXwtsp6FrtY7KUIlrdxSIVV6iDLN0aPeO7UXGa+mvWOt+GWZpYVeW5l5QIH+mnvepswS
	lXn73ATxCrg5CYW4KwqPwpf++LoEPLnynzx/HRFZwh/MyUrrLqJoXHPKgMfnfKguYqRL7f6sRpuuO
	8/NRWzq7sJx5r1Sqf5PbsrN544Yk0uiKvCYJr0SoWU4kSOP2L2nMpPxlStLtImaD1Z52GoN82qkzx
	LE3XZZFce5RCDDO29ROHPmTdyPuoi1McH+UduFIQ9wfOCRYBUvZE0tHWumJjmu1ERTHf0RiEJXN2P
	5P8KdNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoJ5-00000001YQU-1Gva;
	Tue, 26 May 2026 09:42:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoJ3-00000001YQ2-3eEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:42:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6000943DFE;
	Tue, 26 May 2026 09:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A75D1F000E9;
	Tue, 26 May 2026 09:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788557;
	bh=69ANfIB+mPawv6oMTVRw25TJh4t4UGQi6U/dIsBgm28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f6yin3KxVaJ1jBemQnvmFo5AGKVub33e0kYifkfPT5EaW9nitTxB49akxonXsG8xR
	 PNe1OnsbXuGzS81XpSTVuYv0RK6twW7ryXfLJ+yAQ6stTyUfGrzXMPt5rq+PRY/QTX
	 0G3Af0VrE//lZh5p6pK20KeUN4qA3EaDNJCEHy2N9jfALuc7dB+uExNnL5KN8DfT1f
	 yhAtRTsh3W9THd1vqjwo6XYR58cbStkIAwXWO6SkfUMejByHUpM+jvAcXtKnbK5uFE
	 qvxyXLCfbmdgbE6hGJNuJnzQJJU8h1YLd6cr8eNo+/OB5F843RFOsV4H3CJDQ7eS3h
	 dG0gXfnRmzHyQ==
Date: Tue, 26 May 2026 11:42:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
Message-ID: <20260526-laughing-hissing-starling-7e088e@quoll>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
 <20260525-acpm-tmu-v5-5-85fde739752e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-acpm-tmu-v5-5-85fde739752e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_024237_945674_FD93F9C5 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 25, 2026 at 12:50:25PM +0000, Tudor Ambarus wrote:
> Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
> to allow temperature monitoring and thermal management on Samsung
> Exynos SoCs 

"on Samsung Exynos foobar SoCs" or "on Samsung Exynos SoCs (like
Google GS101)", used on "faz baz boards".


Best regards,
Krzysztof


