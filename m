Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0829DCC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UK69zfv8ULoPqSpkb9GSEue9UR1+HV54r/oW2fqerx8=; b=nAr+wNYSak31k/U8kkgL35BB2n
	XMGHRBQmdqLBGQSVp7t63m9vIYdHoXUtRHKHQlr7WkOcZPYL/MisUm3leySO7tBxppBqoovcdSkj5
	39r5GPzdSuJEm9i4CUeMEis5aFfTihR28Jzp7LZGzPcV6tQ7JlKdf7lShCPf5aMS+L6PY26icS1mF
	0Vsu1My7K9azn+b9K8nX2P/VtICh0JF+MeLuQua65BcTwNcEQJJqugYKkTcngvBE6H5PfH2ujQm5I
	unnqYkaqJX1xxoRUM2PyMVkf0zMzouLXX40l/8GBIof4zNQaYSWVydmnBy296mJF+tN/XYPVs3EMi
	Og58NOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9e-0000000H9RN-3Bzg;
	Thu, 02 Apr 2026 08:11:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9d-0000000H9QT-2aIA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9D8F61872;
	Thu,  2 Apr 2026 08:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9102C2BCB3;
	Thu,  2 Apr 2026 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117512;
	bh=at+kDrwKt+tLBgwx7ez/phBkLtYprqmLsRltROwZTwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3ZZeSZxDTwO/kZDCLSJIwFB+fdFrowK0gmwFxGThvaL92zwAC6CrUVRyBpqC99TO
	 3jTEF3dWcLPe4GpOPCCLxU1VOZdcAJwkAKfXxcw2LM90aqGPl90WlI30J6CS2uuHpQ
	 e7HNF0pA/a9UCZhyRvZrA6mQE/6JKdcOIXJYBiMI7DqKKL5PV7w9qF5zioyedHDMoE
	 6ymwv4LfOqG1hLgyti2t+FwgbERlj4jzAp9oV3+28qh6s/RcbfevkTyHmRigQLc7N6
	 c59bRr2APNuRQFLL0GWKbZhpMGCaLJEbCajZS5iho2cFLLrLlbJIzB5MmMfB75nR/m
	 OkgG7d7R0eC9g==
Date: Thu, 2 Apr 2026 10:11:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Message-ID: <20260402-phenomenal-secret-squirrel-3efaf5@quoll>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
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

On Thu, Apr 02, 2026 at 03:20:14AM +0100, Alexey Klimov wrote:
> Document support for a mailbox present on Exynos850-based platforms.
> The registers offsets are different from gs101 mailbox, but the
> workflow is similar, hence new compatible.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


