Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC91C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJIzJZL+9E324wmx2Y4k9vJUCo8Y7J4NQi8Zjypy024=; b=Fp6oY7YyLraSvIuZWpYrJkbaKL
	sQl3twTZ3mIJGh4tzwXY6Ufr8LjMvZ21A14pFLgmgvq8FlerEu3ypLWOPdu2nhLTQhGqEPEGQoV8/
	/8V8GXId8sddEOhVJKYzh2LjCV93/Lg1N+nkqcAWQXpX1PDLJloRw1BXV5gVAusPK9KmwOrjRwC8t
	Kv3psCo8TjVEDACGA1n7AD9dfeH/dF3mD8sfdzjRsQSA3KyPXL8jyM2MUPRHksWSRcdDaYj7dgSIs
	vNR/aCc9OeFxSmdxErQYepWc/AFJEvxbYDIo8e6KDaXMucpz9H/4R0Eeurvhq5aRSg380/wi2PPH/
	uDN3swqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AlU-00000006jg4-3m3d;
	Tue, 22 Apr 2025 10:22:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79cl-00000006VHy-12FG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5A8E4A674;
	Tue, 22 Apr 2025 09:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE33C4CEE9;
	Tue, 22 Apr 2025 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745312941;
	bh=4SxyP4AwtGoYtKvYffseqyjyXt2IPn2EOqtSRYijZhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWcrHETjd8SMiA5Wr5Iisut2TzWYCOMDMJ282aVM27sa2PDmN1axhBXgxcycUaM4j
	 Q69RzaXLb7SknWk7558tn0T/GAUS/JxyoBTAEn6nR8xLcwlWt93J11t9uytrYqqY5J
	 nd/JLXFiNpkOS0AXQTcOnj7wEnQjgfiYvoqcM+HTJGZp92CJn+PFHtKWK6oGNnE84o
	 wjysSvbGqeZ/JQFSG/cRevFu8UOevjQx4SV7VCC/wCYoo7FLnkKWUEUXr8Isogc518
	 HoeidgbNI8ix76y8B4ipYp5oA3ZubFv+AO8tgfdtVdoz3hIfRk601m3DxbafBULraw
	 06xzgMv1IwHjg==
Date: Tue, 22 Apr 2025 11:08:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dominik Haller <d.haller@phytec.de>
Cc: robh@kernel.org, kristo@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, vigneshr@ti.com, nm@ti.com, m-chawdhry@ti.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC
 AM68x based hardware
Message-ID: <20250422-urban-nocturnal-ocelot-c025bd@kuoka>
References: <20250417125921.100580-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417125921.100580-1-d.haller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_020903_304904_25123063 
X-CRM114-Status: UNSURE (   7.49  )
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

On Thu, Apr 17, 2025 at 02:59:19PM GMT, Dominik Haller wrote:
> Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
> and the phyBOARD-Izar carrier board.
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


