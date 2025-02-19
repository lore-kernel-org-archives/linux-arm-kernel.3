Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C871FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flKMf6yE7BfBBS55mC2wkxK1h5G2JBf9BKK0DTrx3Nw=; b=FbJazlvx0tVQj5A5lkkt8oAdmr
	pw/auNfNLMxi3WM29nmopb8VWowxtYVt/JDGTu3xEKn/sV/GJiIveiFukx7grcXVzcvF12oALxFnI
	Pku2n+k9xSwHG7RKNRlZVueVZL3H10gB0Deenb5+drNperz7WG09fiU5/C+14ddWAARW9HQUZA5P0
	eRHfEu9JEc0UhYx/Bs0AcL1ABloyBvH3g0hv783LxwypRgp0bzKTZiV67Zz1Blqmp94BKNxdRcfWJ
	loecPytz6EJQmLTv0np1Fh+8Pp20QZgALTZLeKsFQaZa16GpfoT11o6tHtdRJhOZO27/MSsuUUFzg
	Kn7mZhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfPp-0000000BVUe-22cM;
	Wed, 19 Feb 2025 08:26:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfA4-0000000BR3g-1xW3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAAEA5C5657;
	Wed, 19 Feb 2025 08:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFD6C4CED1;
	Wed, 19 Feb 2025 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952627;
	bh=6daNzU34b0ai1+kOC+LbIJcJDSwe4SEgiE/l3fIVfMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNzeSBLUOT97nZH9tDnbnfc6gmflk304SFgxL1unwfFOCyhooaU8RzZqp+WXq8U0k
	 U6uEsCzPA2VBbZdp/WZoFESjQuI+vC/4h++NjJZ+Xxud10KCyX6kVhWDD+VfNHC02R
	 aIbSK5QTmM6A91l7hsya6sWdfD9wrtb81eoRfFYcgt/EhQ0ZVhE9otfgn36YqRA1P9
	 MSTxdZ6MQZRG/H+QWQrwyRz/9J30E011Ws5dUkkKLzZCm8dny/nXrJMEjlfXBWUxh1
	 3jvnMD9ghZcEmywbwx3vIRm/UaRFbD9DIp2iK2+WGdZAmNHdlFAwYnXsI2MALTJOGP
	 HcYPpc+DKBtSA==
Date: Wed, 19 Feb 2025 09:10:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250219-discerning-convivial-flamingo-6d9eb5@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>
 <20250219-competent-bullfinch-of-justice-09cbfb@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-competent-bullfinch-of-justice-09cbfb@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001028_561977_33CA5A2C 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Feb 19, 2025 at 09:05:55AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 12:20:29AM +0530, Kaustabh Chakraborty wrote:
> > +  Exynos7870 clock controller is comprised of several CMU units, generating
> > +  clocks for different domains. Those CMU units are modeled as separate device
> > +  tree nodes, and might depend on each other. The root clock in that root tree
> > +  is an external clock: OSCCLK (26 MHz). This external clock must be defined
> > +  as a fixed-rate clock in dts.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this identifier
> > +  to specify the clock which they consume. All clocks available for usage
> > +  in clock consumer nodes are defined as preprocessor macros in
> > +  'dt-bindings/clock/exynos7870.h' header.
> 
> Full path and drop quotes

And this filename becames:
samsung,exynos7870-cmu.yaml

Best regards,
Krzysztof


