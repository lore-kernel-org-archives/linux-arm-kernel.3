Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87167109446A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMEhE4msWOZDGJxPEu1NaUZ7Ue34rvZMRBkQB/P2B6I=; b=vAm8+sAPLoem3eM2W0Pua/Gf+9
	Yz3ScrNUV1A/T1J9T0ynqpaeKuzMAktiHzh2vElfBTjh8idJpIHC870994X93GQWTBulEtr9+Y7Pl
	y/3T+LNidb0VbCRe4VJe2o9HBiEgDd3ndOSMcAZfuR/jG4lehPbehlgvz6VVkPFA41fNAdCD9PDBg
	/5LPcV+K2X+lc1XwjXWfCwIS46Luhm74dEf5dZXLPUjmaitiUTfCAcXPrJXup8QbrNSYjeyP96GVl
	mBHsUSWBWPFN9SNPabOh7KMcFDLMAJyF5npfRyPNwMWDb0irsENiyhbSBzfu9hBeotWmiXwlYBtL2
	R5SVF81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tou-0000000EMqg-1eVf;
	Sat, 21 Mar 2026 10:44:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tor-0000000EMqI-3qNF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3CAC44312;
	Sat, 21 Mar 2026 10:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A95C19421;
	Sat, 21 Mar 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774089875;
	bh=M9as8yUXW+U1s7wVMlwZOyhJYgE1gI5CZxx7KjO7IyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuOGAJB0xPJFqXaIPyKKG9O/8ynVmBv7ltnq4TzkPKBcI4DLDvwaNuTPol5567gOP
	 WTdz3/Vzc1fPesS5H4alScfSe5kUO4u6OWdjuU62ojG/zg7Ih66XgflCGmt3WnZA04
	 GbQMagq/rOuFWW5GIm/+9In6szVSU3uIPBRtojsbFFJ2kHklo3nLsoNQ60kQcsedhs
	 mUAo1yla7VKCb3zgU6257Nn8EQvtVYeDhqZP9XGjC4seW4OLfrN6LfKftNN/y7du84
	 HsgEBWlEugI6rxeaZbgw/6lwmBa2Lm/AVTO8lkfPrUNHyEKEwMNxzx5iTXjiccTIn3
	 apXUp/j8sCqiQ==
Date: Sat, 21 Mar 2026 11:44:33 +0100
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
Subject: Re: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
Message-ID: <20260321-beautiful-garnet-magpie-de4fbd@quoll>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_034437_976561_62E2D6CA 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, Mar 20, 2026 at 09:15:12PM +0000, Alexey Klimov wrote:
> Hi all,
> 
> This patch series introduces support for the APM-to-AP mailbox on the 
> Exynos850 SoC. This mailbox is required for communicating with the APM 
> co-processor using ACPM.
> 
> The Exynos850 mailbox operates similarly to the existing gs101 
> implementation, but the register offsets and IRQ mask bits differ. 
> This series abstracts these differences into platform-specific data 
> structures matched via the device tree.
> 
> Also, it requires APM-to-AP mailbox clock in CMU_APM block.
> 
> In theory this can be split into two series with correct dependecies:
> device tree node requires clock changes to be merged. The suggestion
> is to let this go through Samsung SoC tree with corresponding acks
> if it is okay.

I don't understand why this cannot be split into two seris
*practically*. What is exactly the dependency between mailbox and DTS,
that it had to be combined here?


Best regards,
Krzysztof


