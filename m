Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF769CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw8axk8L0LiGYZ9BbA/74Y3kxYyeDWvD8iGv4yL1a8U=; b=rbWeWgllh/qV7LMSZsHhiR7uqy
	YXCUctjt0USgcRImuzxtZQMYODI9TJkccHJsE04kwER5RbV4LzVFx1b1hq65mNIMLuj6yh4orbuUj
	kmo+y5PUqfJTsCWSEEG/Z5cwRoJFn3ehcPRgL0V1scLwBNW9C4RX9RuFfEIwU+6uHgHsqbw4QBl5Q
	K90W1vb/WIiKIUXCZid2iNPVb+/jPbeVhnLwzDfw8yqipFDaNKw1yX3/ghyRPAa+BnvOqXMp788eN
	iRP/3XBnuG4vyNLaPhi9lL9II5H+8tdQm4A0Ff4+sar+Ag8C2U2g2QfPMYJmZ2+ALStzZ1gOdYDz0
	x2lkX8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBThw-00000001y1K-41PL;
	Wed, 22 Oct 2025 07:56:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTht-00000001y0r-3p1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 341564453B;
	Wed, 22 Oct 2025 07:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7802C4CEF5;
	Wed, 22 Oct 2025 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761119789;
	bh=xwEauBPEHJrofe1MoLxXmJ4AZ4uBT0GSA7wT/TN6xso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ycu3NBZljVs6uSEdPzZQx01UnpxSg8des4ZxUjbESf/JCfjShD5hjY1BnO7bQPcxr
	 FXcrDkKWfEBH3ldYc0V792BrueZ+zXQUKvhdKQoI3iHnLBLcoV9V7qm8dnz6XENWjq
	 7LJzMb3SvLSo7W5vjh4p5U2pj87CvbDNUTaWg7L+fER8Nek94/XvBNxaGUrlDVWadA
	 VP2FRMB9piQYUgP95kJQuh3/hMjI5kpgbhE1lLqkAmbP1YtzCdcWuRCn4ykTqf3cNl
	 QSZeFsp+moMgkWCQCeuvg82BPwCg4wlHm6Agf0SR9qcffnQABmEABOeNr8AeOq+BuA
	 K/pyDbcemR8Ww==
Date: Wed, 22 Oct 2025 09:56:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
Message-ID: <20251022-savvy-sly-auk-a60073@kuoka>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_005630_009606_415197E7 
X-CRM114-Status: GOOD (  11.04  )
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

On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
> Introduce a clocks management driver for exynos8890, providing clocks
> for the peripherals of that SoC.
> 
> As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
> Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
> are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
> bits in the same register that controls manual gating. Hence, don't use
> the clk-exynos-arm64 helper, but implement logic that enforces manual
> gating.

Please CC @Peter Griffin in future versions.

How much of this can be shared between this and GS101?
https://lore.kernel.org/all/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org/


Best regards,
Krzysztof


