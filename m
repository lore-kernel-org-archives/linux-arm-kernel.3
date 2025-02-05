Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE4C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEeKHTjnlMZWXMwMt9EQP1+J4OMBT7FliY5FeZRh9Yw=; b=zQHjcl8Cve/iB5xYGsm4MKOE6h
	CW5hdQ2/6xFHRObDmo+tyB2X0n/Al1AnC/Ndjz2nfv+xMLllkp+jBdgIFlslSjKjY0yuxuS3043ah
	6RZ/9lwHEO7zmafOIr0IfeelHGjzvTM+4uGsDpW8nsrUlt06ZeEdYV6tMqqqliht9QlCnfC9rCf5d
	nmK0LBgny+HNrwlQXKr0VjyV4XBM4BLusyYBNMePNmIgiUifm+XWYA1U7+mjqBRbBX4rGKOLQSXYu
	XO2aS5QqIFsSysehTndxJyR9IDnVahoYNRLNRhh/oLqDTMVE6nF5/eoFEuvDxQ7NY6JIbWgt7BaQh
	+iZ9kjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb1P-00000002bfp-2yVK;
	Wed, 05 Feb 2025 08:44:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfayO-00000002bJB-3DRf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D90F9A4323B;
	Wed,  5 Feb 2025 08:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401A6C4CED1;
	Wed,  5 Feb 2025 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744887;
	bh=hEeKHTjnlMZWXMwMt9EQP1+J4OMBT7FliY5FeZRh9Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er8r/Kibm4oMw0VV+RMr2jtjhN1UJ8gdiwxe8WGrkTUmhep03DO2CCP+VJlV1dopf
	 CT5LBZSBeqAksqYU5ypA1+UtKiMSBMSFM7afUCxx02HCJ60yHtRpVcif2YOtemPF/T
	 cEzlwnSnqsrcAreV5saCSDlkmPr5t2vGZVdA58b1RBgObPyB4t1/wmOFwDdeI+CBcQ
	 GN+M2kXM3CWI0DCFKrbTUE3W3s1dSC7iaafZUC4ea9FfiGWpyQOO7VNt16Yn4Z1ael
	 zOM61FsrbjdAplNaIPG6eREYncwwyk86Ojeaa1NR18/vABWOn49l+P4+8XdstUdiI/
	 EOEYP8OAUGluQ==
Date: Wed, 5 Feb 2025 09:41:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Message-ID: <20250205-important-vagabond-penguin-a69c93@krzk-bin>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
 <20250204-exynos7870-pmu-clocks-v1-3-a3030ae5bb53@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-3-a3030ae5bb53@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_004128_885358_9AD899E8 
X-CRM114-Status: UNSURE (   8.16  )
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

On Tue, Feb 04, 2025 at 02:07:31AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for the Exynos7870 PMU. It's compatible
> with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode, as
> well as other system control registers (i.e registers for the USB PHY).
>

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof


