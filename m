Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AEBCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3OvlBI248mTZMw63xWYkASSwXMQ7rEagSH8HbA4E0g=; b=j8gpLDBjIkbPRC2MRYigTyXRz0
	8ipRyFex8psWd2g0+DYdiPWS+7ZF6mouFf8A1Mb08lweOPYEymuXNrDnOi6QJLopl8JA+TZ5SVtIr
	ewRy8wXGpqJd7Ess5I04Kgki8YPwvE4kXGZ6KxWC9eb0o/AQuEk4SH1H4BGrNuPBXR0LHlot94Iqb
	9TgcvAhLImWmKEaQMXA3tNpmRefsro7thLKJpaNkegxgp38WoX0/y+f98DlwseFcVJoE5z2Ai6Lsn
	/ON9xY/Qe/ikl7mjVLdV8acJLOM1Wvp41GO5r3cWHuIP0LDD3mawOK5HcrkNAcThA2/9NHuiX6Wio
	hZIXjVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL32r-00000004XWe-2iKE;
	Thu, 07 May 2026 18:01:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL32p-00000004XWG-1YwP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 18:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91FE14088F;
	Thu,  7 May 2026 18:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401A4C2BCB2;
	Thu,  7 May 2026 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778176914;
	bh=J3dtbGZQFQZuIYIfKBeMMs8pVLnSGZmKJs6jXEj3ulU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaO1YibaiY+IyJqY51nSLyVcd4rpmDFMD6bcmePzPwcue8MXbSCkUm7RZ5P5PxLjF
	 12qLQTmRAK0WuY15ZVTEbFhCQrsui6VNRlJImcR21p9wxvLxR/2RLI6yICGEU63a8U
	 3n2tQS5b6stI2hFdOwrhEv87G7rHqOU9oekfyVbzCO+oxVm5f7CSd4VAsU3uNoIx2e
	 EDgP3Cp76E7YQpYVSBcC8aBEFcU13rjMTsh1lQ/BKzUT8aQcaPy+791hMUEq+cxxnZ
	 Pi9O3IWWPHZTG47bl8Xl+mobT/nfRVjuKB26Osxy2cqXVoHLBno6C9UPlCCQtiP6VQ
	 REqFkX5ig2dgA==
Date: Thu, 7 May 2026 13:01:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Message-ID: <177817691083.2170439.4110317447956750153.robh@kernel.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
 <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110155_434801_252808A6 
X-CRM114-Status: GOOD (  11.96  )
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


On Thu, 30 Apr 2026 02:56:52 +0100, Alexey Klimov wrote:
> Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
> property for the 'samsung,exynos850-pmu' compatible so the driver can
> obtain the necessary syscon regmap.
> 
> The Exynos850 PMU relies on a separate system controller block to handle
> interrupts generation, similar to the hardware design of the GS101
> SoC. To ensure the hardware is correctly described, this syscon phandle
> must be explicitly provided.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


