Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F82D30CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmTOHE9eGl1BNMc+JauRwXrkIcUQVOYTAiMTgSZm6Ec=; b=YSZrhSNNIBGEaJkwohiI3EpFxp
	+Q6MXn8qr9x69HDF033oPpStXoK+hIl1WqPObdkCBhjG+7WSXeNsGfubFy/CsFD4exGjunupCflTF
	TXn/8WPTuFUI2fMSCze2zav+k+GWWy7Fode4kHize8PnCQvv0O4awzgG2WQuKgzBzFXbZ0dcyG95l
	0UlisoRCrDYJzZM8AIIOYVWmpMCukU8bQckwbGoBdFbXz+EX/9jfU23DulRfYQyT1oRk4Eeg5WZa5
	CTQ4q6URrcLMwrKLchPpdEFgIX4l/b9X1dl1VvUXOg0A0NxY36vYAcQeUr/8+vzp8VvcMb6VwI24/
	Wp2pGINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm4t-00000007lRS-3ViB;
	Tue, 13 Jan 2026 21:37:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm4r-00000007lQV-3mm6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 21:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 838294405B;
	Tue, 13 Jan 2026 21:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC9C16AAE;
	Tue, 13 Jan 2026 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340245;
	bh=Y2hYgdYCfpd4HevIoVBQHoDJza+2OK8F8rfVvn2YQ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0KTd5funtU5PUyBEmLRTIsZVdd1Y46Or64t8ttCkGaeTNW52ZLs4Ag0diRXyhSLz
	 Wu60RvCq/md7U7oYL3QSinKx851ZwFcvA6qRN07jCF8KDnBHGvQ0PtXR+gSvaz/beP
	 DloOsKJa0673INaC+qpqIWPLL+y5O6SM3oYQNHaK6c9s3xt+VhkNctgNviDloz+6Lx
	 wx05kUVyilJ91qvUuevaoFxYO8/4y0mlpYjpMt8wDAtPciGLnpFbEVJAFgj+a5nm+J
	 xI0B/hlPhIErdRUh0hyY1tOqnwWO4q7hyUPnke/Zw9jJt2AuP9xyTXDB4/jKnud+fl
	 guBvHQf68kL9w==
Date: Tue, 13 Jan 2026 15:37:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Doug Anderson <dianders@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
	Juan Yescas <jyescas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: samsung: exynos-sysreg: add gs101
 dpu compatible
Message-ID: <176834024248.198749.4225951933665450751.robh@kernel.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
 <20260113-dpu-clocks-v3-3-cb85424f2c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113-dpu-clocks-v3-3-cb85424f2c72@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_133725_964329_8DE9F5C8 
X-CRM114-Status: UNSURE (   9.29  )
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


On Tue, 13 Jan 2026 10:59:00 +0000, Peter Griffin wrote:
> Add dedicated compatibles for gs101 dpu sysreg controllers to the
> documentation.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


