Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231A7CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rb/WZJVRBUvBZWFtxnTKOgoU4EDPO4UL2tHcxFlpBQQ=; b=WTxuVIqQ9GIGszAi+qHglpc1bn
	frxJ4l2+Mr/d0I69A7E+smzbWxcHsWDnN04+5BnSpPatc63a10uyVqfPWFFznPYn5e9wasEmpAGve
	pjf5H9ANcURdRzYClpj5V4S4npHHdMSZRwRI5ESF048qNwek+OUUaDRYZhvgvP9QznOa2QSCPjl33
	ffFSFto6gLPQZwTLuAxQ09lKv+PpMK6T7wFLSTcVm7VlxQnBvQ6SvgnrUQ2TtFnGHzr80GEsA+pXW
	C2BOEfdaV7QO4p/mseyMTMjwOlCz/0oD4qNwKw9E+i6sAUlKekhGq42iE4r4Ry8Fs6lj36MQvBwQz
	5HH2J8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96I2-00000002cCr-42rG;
	Wed, 15 Oct 2025 18:31:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96I0-00000002cC4-2lRv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 207B44456A;
	Wed, 15 Oct 2025 18:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEA9C4CEF8;
	Wed, 15 Oct 2025 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553116;
	bh=745IEqjMLPClb39Tf9d1zUU3SvdsnRvc6cJCVLlU9Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=by9wpcsvmDWWfdyRKF3SXdvPNP6Bhdym/3/NdTCz+DyPQGXuqijjPP9dxLllX8bW4
	 L6CPRD8ggleEOHq4Bm1DIN+EJfxqTo3CY1TXfPDTjBYM+D7a14ucyyXIRfF+Ri4L7z
	 KDGwJtLMaMl5lI60NlVw95oztEumktHRXN1ZS+AJxJWcCVW26sLGqhc5eFE09kOd/V
	 k7SlQIvAJpwv2ivP13t54yOsh15++RJB04QN+uaiBf8dIpWcRf5fv9ooVVBjqzG5HM
	 lYVNpswqVeXzoCN007ZfAC5OCPwusPDBFPLGpSIe66whJRI3/qb79NLzcHVjEcnUmR
	 CYh6y/3MrFWOg==
Date: Wed, 15 Oct 2025 13:31:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
Message-ID: <176055311249.179333.13160204351428508138.robh@kernel.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_113156_717351_8FDA61D2 
X-CRM114-Status: UNSURE (   9.42  )
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


On Mon, 13 Oct 2025 21:51:30 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
> documentation.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


