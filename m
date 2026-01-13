Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E595D30CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TRs1ejv0N1uMxiS7wooSXgh8VjUkFHH22V9Li5OZ04=; b=iJH1EmG7QUAJIz+BFk1gzPgc7Z
	cFuzTQ9hnjYizvYTMvzR4AEdJvs8S3Y45U8H+WYp2r5dKtaEFqRAFEh4DgAMCc/L8XzIka3idBUDa
	BwwMMB2966OHFkDwoRiUKo2sVJyNHFXcTyHANGPAKTZzOATwavdRm/M7sQVkdON3Rmtj6zDd2wpwV
	coJ1AR5kSXaEVPIAFSwvkt+2BY7E9QbodsAzvtNjFYu2PyvshXdwFh2P63vOJu+EEvdgU7SaC/t0g
	fSjFCbt+ZjkFx8CeC60kGMeQIiZ83xCxSr5XWzd6waGVIk+JGyOVR5nkboAIps/ZLOv3LdPsyYs/j
	2MkZzV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm3u-00000007lAm-002T;
	Tue, 13 Jan 2026 21:36:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm3r-00000007l9l-1H5t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 21:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70AA24420D;
	Tue, 13 Jan 2026 21:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36014C16AAE;
	Tue, 13 Jan 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340182;
	bh=FEkMizbDSsQypYg+svblccChMUIqdyLjDJVlgTL1oeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKYTYVTY2nqg+BQH/i5PvS6FoyoODvwBzij8SP8vPrb4+MurhvFUSXQbPuG1U1rzW
	 LVyclwmUIVHDVYlUrAwI5//tA8K58bumt/c/yr+D0c/wwaUyWfljPr2fqfb1wdQk3P
	 fJNqdTFqU391Ncj5t1QNEuz8fZzeunfYG0cxN9FBc0GCzA9GVftZtzXEqS9HcL4RyN
	 YY7rVG4kp6QHVyjD9702xOXOIGSqkyV5mTM8yTz2xhyiQ8xvHTwzTxB4I7MWAAlMBs
	 jZc9xZ+zkJ6E/K933mOi6U+wH1/s/xbGPOO38WCWQq6PKQ+Lv27SN3eLsLkJsMyL+k
	 pU9FmDJkUpgdQ==
Date: Tue, 13 Jan 2026 15:36:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Doug Anderson <dianders@google.com>, kernel-team@android.com
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
Message-ID: <176834017914.197388.17009547252471169772.robh@kernel.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
 <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_133623_370913_C4E34431 
X-CRM114-Status: GOOD (  11.80  )
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


On Tue, 13 Jan 2026 10:58:58 +0000, Peter Griffin wrote:
> Ensure children of cmu_top have alphanumeric ordering. Top is special as it
> feeds all the other children CMUs. This ordering then matches the
> clk-gs101.c file.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3:
>  - keep 'top' first and alphanumeric for cmu_top children (André)
> ---
>  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


