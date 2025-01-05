Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECECAE77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nB7jaolAKU34kcUhZLlEPcffhGjknKvR0utYywq3eI=; b=DlhrWAPNvigvkvX+80HMKf9rda
	kGjRtabSK6hZak0LIyQ2zpKA8wQx/QYg73GERVQctvgjzbYB9iCTyJJOiRGusv3E6OhphTwVX1Dsu
	vSr7ei+sLqgo11Ft66+QqxnrYWwA46YOfsMgcAXjnXVa1o731w7uAT9xsWAMlewC7sXdjC7pAVr4R
	Sro6CvtAZMK4odmVvExofvL6r26z5DD/4aJ+0hAJwMayVwCxB75Ej8s6YSfF9xmV6ZVNQ6BQIEM8D
	tuLBf+kiHKF3aiz8V9eenP17TwryNoMOqGX/+SnTPLjDHoFLqxbooySJoFAO++R54iEmAZ1KbErc+
	5daJdRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMtY-0000000GbWr-1HY0;
	Sun, 05 Jan 2025 09:26:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMrY-0000000GbHP-1Pfm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BA33A4024C;
	Sun,  5 Jan 2025 09:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC925C4CED0;
	Sun,  5 Jan 2025 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736069038;
	bh=zl1oDwmr6TY844DchTMB0/AD846FKLBtUuIWHTPMiLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlDHP/QJ9tQCN2gjXbwc+xphbuX3rsKBACyYOpwHmntNlKgDDNBSF9ZF5/UiIsxk9
	 bTLbzn21IL9zWfIS9y34C27DhrVVrYIchdfPb6MaAp8ucH6c1SEai5VPjlr+WBq/Gl
	 NXUmCUGKtwcMWHhq64O6JL+FV1+tZuTCGUHVD2TX8KuUyp7Cn9IVoTGAciwVhl9ij6
	 YhV26DxllNmYDTkaYqlp75FIq2NuCvo6+f9bfsm2RqJtFHuEhvSBGavBwfi70QPNcI
	 MkeODEzBcydD/AufZrc/GQXtfAhEpIaf/cZAwilVWVMHDIbCOBr1ZZoUeZ5vwqhaSp
	 YZWg932sSTa0w==
Date: Sun, 5 Jan 2025 10:23:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
Message-ID: <bysft2pubdnhp6wohafxocix3zdsvmtbvbj3txenminyatxitu@wb6iqsuekvlj>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
 <20250104-exynos990-cmu-v1-1-9f54d69286d6@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104-exynos990-cmu-v1-1-9f54d69286d6@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_012400_438720_79B3FF2D 
X-CRM114-Status: UNSURE (   9.69  )
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

On Sat, Jan 04, 2025 at 09:05:56PM +0100, Igor Belwon wrote:
> Add CMU_PERIS block compatible, and clock definitions.
> 
> CMU_PERIS requires one bus clock dependency, and it's used for i.e the MCT.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/clock/samsung,exynos990-clock.yaml     | 19 +++++++++++++++++++
>  include/dt-bindings/clock/samsung,exynos990.h       | 21 +++++++++++++++++++++
>  2 files changed, 40 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


