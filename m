Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E7CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnCt08iyx9p65kCHh++KcVGmpWjpQoBE4djE/J4FPTc=; b=sd52QcRPlGkhii4tG7qzbYm6Oh
	bFPLkKkqFo4KHf7yaHIVE5d5Sh6BDPfO787BoarIHUaA97nIYKz9lbUNOJwMylhB5bPgAFOv9XBff
	8LWTwpa3QlZpzxpOZyO3m0lciOG/34NvBrN3LMKkapE8yiOoKkojvx+ve+nKwNKcBV0gSMC/7xSWD
	mGM63x5KxC81LQ83m0zU18kvvKtMdVXSHeT/gSbNIGjfx8S4FabSlB3+VUFjpS02XS8JTRlz8ldZl
	j6L+vxK/9yOr/oBpUfsnAesZk8HKBIe89zmKhOj7UAm8aKfCjQLOhdX5Pk3dcpa6pdFT82IOGvwfQ
	Ix2t42Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4VE-0000000DIUh-18sV;
	Thu, 23 Jan 2025 21:12:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4Tw-0000000DINJ-04AG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA418A409E8;
	Thu, 23 Jan 2025 21:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CABC4CEDF;
	Thu, 23 Jan 2025 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737666678;
	bh=IQhvNoww/zQ0SkvP01IHh1ffmGSc1Awplj7X6QyKyD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txLNZqar3c6JVfjRfeE0aOHAA8Yrnv/cVeiKwkCxrlrlY89xxdDc2y82OXbiIY0FL
	 lz4t+1x3P+0KO1aFAfe4PuyueHj6xSJ6YSobFCzb3JnY57ThhKj+HieReUSviNuicW
	 Uk7r/ziyQy5Q06LjugpD8oDFUZxoQp7nn/GDqaEY0qLelVAikeXcwwDF5q3Zl97whb
	 6KBT+ZXtswh6i/wU80+Ad9hUBVReT47F0pppcgypIXnUOMRrgxGgZ/4lgXYgRAtttb
	 lBDYm4WGESdNy7NaZcki/tL5ezOXgfKUDN1FAMTPzwbDO1LeW1uuDkFagixclANJfZ
	 iEonjKB1DWcgQ==
Date: Thu, 23 Jan 2025 15:11:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Avri Altman <avri.altman@wdc.com>, linux-scsi@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] dt-bindings: ufs: Correct indentation and style in DTS
 example
Message-ID: <173766667168.303412.17397912225491913488.robh@kernel.org>
References: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_131120_120774_C4D33AB5 
X-CRM114-Status: GOOD (  11.06  )
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


On Tue, 07 Jan 2025 14:10:19 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/ufs/renesas,ufs.yaml  | 16 +++++------
>  .../bindings/ufs/samsung,exynos-ufs.yaml      | 28 +++++++++----------
>  2 files changed, 22 insertions(+), 22 deletions(-)
> 

Applied, thanks!


