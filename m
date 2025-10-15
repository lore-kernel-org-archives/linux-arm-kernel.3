Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31266CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVGTqEUYogT2twWxJrmD8l3KzpICUJ5Rm2puX/d79BA=; b=bysw6LK05kEpGf3NcQvt1OBcHm
	CDGbyyv9lFtxI2Av9md4wClTsJ90+9jePm9w4Hlq1WhG4kQ0OtTZ6jRTmEKPnuE8nJaEZp3Crg0Pr
	6UjLHS8UAuLN06/HEQGohoV5k7xnDD7QstNVaqunk8hrqzSvYuzx6Iht/8rexeB3ESMTAjOhW+HHa
	u4/doafYW34ERI5jkcRTWG3UROR6uOxNFutXBLpuBnuy+5QSSYk6UfbMMZKdfkmB8vBFYeYT9C2Io
	a/HzlbxjKKYSkhYMrWpgAVBIq5lmXyuc+SxNH2lFX3ZcLh/3rtY6vyyXGploDqsU0strRb5zDYXXm
	19XQlVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Ib-00000002cIq-1Ht6;
	Wed, 15 Oct 2025 18:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96IY-00000002cI9-3vK4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9293741A88;
	Wed, 15 Oct 2025 18:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D3AC4CEF8;
	Wed, 15 Oct 2025 18:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553150;
	bh=fQ6Dvs6k0CQ3t/luHMYAgBo0nY4Veo8+0mTyWsYHiwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEG4U2O8yPqmF/FtLYfSbvUyTNChkJV8jzzx4HeGE1oz1q4G9b00Fh+HWj7b16kBn
	 BwJElzg5wduStaoJgTlIH0HQKMuFD4gChKoSk+EeOcN7+xkWjO+ZOJJmpjF3Y5e93X
	 Iq7ysnMH97lPOHsY8uMOKkq4oKcsjzEAqDxNFJ21JbRiaccYzeR+lOHtedTZ46Exnf
	 KWVuVoD2Woa0q1vmnP7STrKQoE1CrqibKeL4z/xHsKZ0fPuPobmnpDHoqVn6vEDVVd
	 lSMr5pDFiPEFIld19VlKmSAsyD1gIDy1mrNcHddNK4tZYjibmzAykMVROkAOFbHCHB
	 XKvXJ4OYwcCuQ==
Date: Wed, 15 Oct 2025 13:32:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <176055314794.180061.13794322940289476072.robh@kernel.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_113230_990843_D4C098E1 
X-CRM114-Status: UNSURE (   9.99  )
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


On Mon, 13 Oct 2025 21:51:31 +0100, Peter Griffin wrote:
> Update the bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/clock/google,gs101-clock.yaml         | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


