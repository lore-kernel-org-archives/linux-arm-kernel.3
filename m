Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86658C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Af9/Ij4UC3M9G1aNesXYjpw829cbfm5E+K5g67q+bmk=; b=PuZ1YTmmc3v/1qeLegHoseqGrw
	JaQzFX8v+jnobErgDZn1BztSfA08hKU4xTss5CsGB96mvKkSunIWYQ87wKR8KN5xmCxXEyJDIXvI/
	MqHqeebDMsWGb+iGy9Xi3tgjF9PyzcKJpsVF5db8R3bPrSxNx/14WeD3Tb7EN/jxby5mzRWmr7CEK
	UhE/laeEBPrnHoyaI4UQMEm0bxaZ+UMfjtCu7V2Vp1PZOvcckSeknxmuVCFNNT0q26+bPci+5aV8e
	GVIR4TT9g8YGJsxK+uC3Kckf/DcQOOMVza61Nwe5a43AGcF7X51yPoyt0VTBDEkagmJaDX6yuY5ag
	HMOPaE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhULa-00000003qHQ-2Aks;
	Thu, 31 Jul 2025 14:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTie-00000003kON-0v3d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4FA75C637B;
	Thu, 31 Jul 2025 13:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAF4C4CEEF;
	Thu, 31 Jul 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969995;
	bh=yXz5mBUZF6Q+N9j0CfMMnnCvdMIaf13rIadj2MRnX6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuKFVyrU6RyPSXasWhoG+PZAXbRQvg71zY3Sb4uTSLtkzVcZM0ctCwZO3WwvbrI09
	 ofP7XRFAPu1cfff9IQtvv+PsZrp7DYf2mrsMz4ChCf7VEdMnancKGYNTWTjE6nTgv4
	 jkH4N26DgfRG0wbOfGY5i72biU7CN1WqAAjiYVz3VcYFVBazuo0nDfZbuitZk1w+Qa
	 t1dnTWlsxZqR9BiurwrZeHrk8ddZNmlW4lAIpMUpX2ytaljEbDNC2ctWKdiOTqCGJ7
	 Uccf4zOgOrnGHzrK+5ybIUOuYGenFyIiknGkpjqzCdoVc7TLn//RW+GppLnn3oeaof
	 /JXo+hqbBlLwg==
Date: Thu, 31 Jul 2025 08:53:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Julius Werner <jwerner@chromium.org>, linux-clk@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 09/20] dt-bindings: memory: SDRAM channel: standardise
 node name
Message-ID: <175396999408.2138783.9344122999119698215.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-9-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-9-03f1be8ad396@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_065316_297470_5EDCC9A4 
X-CRM114-Status: UNSURE (   8.66  )
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


On Mon, 28 Jul 2025 17:29:40 +0200, Clément Le Goffic wrote:
> Add a pattern for sdram channel node name.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml       | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


