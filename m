Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDFFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8OgO4zgeom0LQ1PdVTyQ7Btz9II8t0ewGeM7TVM3oY=; b=cqS2K3FDZHMdNDfSrDaVGtii6X
	43c3Vz11c76OEZ5q4MeSIWebMydKuKQm0k2wj3CyrXkB0dfCk64ITbVh9RG+ASR82KMXshZRl4gUR
	p4boRHqhkzRmKQbr7orSdM7eH7zb8I5inVgXicAA97k+j1hatmHp2j+MxWbmg3LD5ZiXQ8Zt0f9v5
	SPi4CthgfS/VN26g6N0kUJCsdYvYzSNYevdd3vHr6xvvxspawQBkmROEGotSLrgBVh7pSm/9Ki2Sb
	zq7DdIrA6MjXqnlUqE9RJm7FGTXN8KXf+/rnNzku828qYfRqbe0Wq3vSJM2L9evsuSVFvLQOwWu2B
	FMZSsOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fzs-00000008rY6-3NkW;
	Tue, 29 Apr 2025 08:07:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fuW-00000008qhT-2EZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E04A65C547D;
	Tue, 29 Apr 2025 07:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE16C4CEEA;
	Tue, 29 Apr 2025 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913706;
	bh=x9VoDbvoqvFqnT/X3scRFhes5XAkMzFvSdG4jDOS5BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B13+zFI2FLbAV3uk06BxtWvdLY89xXuV7vQKdNdEkVH7XUeFXyiLxbQpXJlqA/0ly
	 2Hik6VuJJeY/+vfUU7m8h4esoK3NIHPnFePj8OjfM83HdzHVROhmqUE+ou0kk4orYu
	 46ApDRG4grEmAZkq+AE33xs37iMb+0s8P8Rq4pk9H99jfl5/Es+tBv2ovlWJ0NCmsM
	 nlbvYMAFnzwbtJf2TSxbVCR/VlaHC/p2hAkwv1F/7ucTpZDN6GObDmVGO/Sw9ktbO7
	 A/ZsMc8oEz7ofhqY1pRJrSPZ8W45HuGOAd/9ax0HyOkEzGvj7BykExfN3iQAmlf2OZ
	 Kk+ok18Q5ormA==
Date: Tue, 29 Apr 2025 10:01:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
Message-ID: <20250429-frigatebird-of-unexpected-feminism-aecb7e@kuoka>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
 <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-2-1bcc44fb1d55@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-2-1bcc44fb1d55@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_010148_626929_768EE0D7 
X-CRM114-Status: UNSURE (   9.15  )
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

On Tue, Apr 29, 2025 at 07:19:38AM GMT, Peter Griffin wrote:
> gs101 requires access to the pmu interrupt generation register region
> which is exposed as a syscon. Update the exynos-pmu bindings documentation
> to reflect this.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


