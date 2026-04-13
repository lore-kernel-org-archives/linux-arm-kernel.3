Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D77DF531D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Rp/aKHneJtTjo6zUJUlwD1E5W1tMJ4zwme5NOlHNp0=; b=I/GBo/U11Tw97t8M67m37RC6ld
	K1kJzDQZurEctUaVsNIONYn2HRLA7VES4xni7BGgaI//KGMWhnnj4wPFivS+eAxrJi7U/Jc6EZ/3q
	YfD1hvg5JPespIOCQb9hVEEJ2aeE9V5e+dhBq6UDpLy9a7aWdLMSuc2m1iBCo8aR5GrQ9EzdHkHLt
	2laDOh5YsJjAIKEpXIYh/SfVh7SaLpzXON09zReIOfGf+AtDnw6OpAA7qqm4Ct5GRJWt+NV3TB74S
	NR9SlS2X7jx1T1AM53Md7v1D3M295g8VEWwxqqQAgjktDSvm3Rz0Rx8MLkhXvYGzddFx0+74gBYsE
	GaEEVvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPV3-0000000GQTY-0B2E;
	Mon, 13 Apr 2026 22:11:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPV1-0000000GQTR-26aR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D00D6133B;
	Mon, 13 Apr 2026 22:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E007EC2BCAF;
	Mon, 13 Apr 2026 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776118278;
	bh=Zzqk2At/3hnsyIprEjIPNKdLQs1jH9hnpq4HpbuOPKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZZKq6p8jWxdY2fbSMpHrbr6TWp3fJ9tuIBH9pAnQprZZ4T3iybx7MeUCEcn2hrjF
	 XccnQLUKj5ck3nLJ6ZKAEvpwtXYqpWIIbhtTAy0/AKUkqGGKYMJsYvRF78oIjBZDyL
	 O/cbb4/7ND21I7Wx0sb1fnKqo5VmF2wtSWKBv4gGzTfkcM8U3lmxdnRMFSQwRhFE2G
	 GVcocdQkXI/NrGx53XxKQ06XaifHLJ/A5Z8ZaXI32MGx6mTuUQgG5+F9nAoGaf8WqD
	 g35rh2dAvP3KWZ66J/JVdW0ly3s21f9lrZkrpkpi7DOiw7pA+h08ULwEy9RbfhGD/7
	 q4j3X7mVTqMkQ==
Date: Mon, 13 Apr 2026 17:11:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Message-ID: <177611827492.3624314.2235321083489065615.robh@kernel.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>
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


On Wed, 01 Apr 2026 05:51:54 +0100, Alexey Klimov wrote:
> The PMU interrupt generation block introduced for the Google GS101 is
> actually a standard Samsung Exynos IP block found in older SoCs, such
> as the Exynos850, and is not exclusive to Google SoCs. To accurately
> reflect its origin, move the schema file to under soc/samsung/
> directory and rename it.
> Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
> string to the bindings. Support for this block is required to enable
> power management features like CPU hotplug and idle states on Exynos850
> platforms.
> Also, move this file under Exynos850 SoC in MAINTAINERS entry.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
>  MAINTAINERS                                                       | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


