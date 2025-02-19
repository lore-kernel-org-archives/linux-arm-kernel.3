Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAA0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsVzN3nnm9VNwCSBB0Rqm2BpZwNttGfob43hynCx8FY=; b=aWHrjaHd6xPCFMGN6loW5c5Nhu
	bcmObXnd2+BxJjxubFT++17kLOHozIccE814bZCoUj4EqwItrddRc8E9vaSAq91idW0NuAEgZCl/g
	Mm2XNKCl8iuBeBF2Ky7R4sDqBMmuQJiKsbLr9CFsCJOZcBWCdOK1fAHBs2UaRqFeVE1x1qtnEsxRQ
	ENArYdDpPs28JvMKp/JfTK6R8y4/F/rQDJNHzAF1EJw2jqXXfQc6ZQZ0KDFOcPLrh+Nr1OsHBVTSz
	hHaAcYDrDfQ4e76N8Daq0B+5gjTN+fqzJ4FdYeR6DxI40wdVw5gSYcgVsLvpRrOVjWyG6rWcR8m03
	D/6Jp5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfLU-0000000BUEr-2lNo;
	Wed, 19 Feb 2025 08:22:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkf73-0000000BQBq-1D0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 923E65C57DA;
	Wed, 19 Feb 2025 08:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2754C4CED1;
	Wed, 19 Feb 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952440;
	bh=oPdqC27LMeZBOtRe3tu0wOqkmalfCuiPMd3Is+E5hPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDt63obSmoG/1zxBKwdIVxoCHK2hZzwNXC5nnATPG58h9v7zMHt/8OS/xRCp+TcwW
	 uw/3i8a+wbqMj0JXq/HSO8cI3tcsFHiV/qnoJl3+WwK3aG/xP476JiDgnmDOMFDNmP
	 cKxjksRceqV/TCqiU/tqa8ZLJvltccQfEZuXGayYSdsAcoqUk09D8DmN+0kNyFXrqk
	 0C8JM8YbXPKwPIDbysbtp2r6W1dI227ae0s+7s2WiXxgPPxKtfWwyAo/j7PO84gaVx
	 MrYABIWZ7Z4KhEMfUDGtiE6apwYGPgta9mGGTvuRbtVHk0oA42yvMCV0SPoM48NvW8
	 isuBkuFnjDadQ==
Date: Wed, 19 Feb 2025 09:07:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
Message-ID: <20250219-naughty-spaniel-of-refinement-ab6fac@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-1-0d1e415e9e3a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-1-0d1e415e9e3a@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_000721_365606_2FCC8266 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, Feb 19, 2025 at 12:20:28AM +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++++++++++
>  1 file changed, 324 insertions(+)

Again, you keep repeating some old patterns ignoring what was added
recently. This must match compatible, so missing vendor prefix.

Also squash the patch with the binding itself so you will see the
difference in names.

Best regards,
Krzysztof


