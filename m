Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DC2C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kl62yOj/W5FBKQ06i+dZ4yceWMcuRHsC77bihPj0CYM=; b=11rFtTaU11kmlfWHNA4aOcUuZ4
	M8SEDBME3NdIWg/HRhCJAOWrIzyaskeWw41yEP+M+WF9LG2SWDsmxMKhcMTzLGYopLcv/kG+tG/26
	H4u4/7eaDzoixGLTtWz/k9ErxG0j1FysrMMO9cQmGsoTYo+TofytrpQCBexA8drubwreWG4tmkj7R
	2w2wMOK5e/pSKqOShw+Ad9QDnWYvytvDvkkrFqW0wHvk/c4WClM3vsZ6z7tL3P23KVcyqDQzwvQDZ
	2EENhbaO5qW2Kuyo7PISphjaCra52+yX8r20z4+O0TbySMjI5d7Xku+0O8HfsGO+4eshaucq2bqTY
	ikvKRkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfMw-0000000BUf7-29Gi;
	Wed, 19 Feb 2025 08:23:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkf98-0000000BQkK-0z3x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6ACBE5C57BB;
	Wed, 19 Feb 2025 08:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59152C4CED1;
	Wed, 19 Feb 2025 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952569;
	bh=M7Q2P6Nbyqxbqn82NDOiFMTGHBZa2DrnxUtGtE5Yto8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOXkBjOuRvzrlVQU1kpv4rPNC2Vcpz+CkX5vI9Locy7zX59WHDb+L1wef4GiF4lcG
	 IYvLZsHO8fuly+6YD84mOvNaZsnj4nNXSVje9LVFWMDvmweWGiut9DG0ntkQmjhNqJ
	 +ThpiI4CA+fKti9esaiLQ2xpHVUSbrjLFPwAzFXm+SItLTEwty5QX6In2sRfdslgBE
	 0jQkWoYsFTSmp7bZ2TLEGDIuEjbs77Ll1meQxG1+ymLhnxK1rN/rX3tMeC4SphhMj7
	 062Qd1KMSGWpsPA4PQbhGwmmIYZgN90UeFX0l2Z3S+OtzLLi3fte90A8xs4p139HNW
	 Prd4RnqClPtaw==
Date: Wed, 19 Feb 2025 09:09:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Message-ID: <20250219-functional-brown-fennec-8d55ea@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-3-0d1e415e9e3a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-3-0d1e415e9e3a@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_000930_330268_A1916C87 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, Feb 19, 2025 at 12:20:30AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for the Exynos7870 PMU. It's compatible
> with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode,
> as well as other system control registers (i.e registers for the USB PHY).
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

I don't understand why did you send SoC patch to clock. I asked to split
by subsystem.

Best regards,
Krzysztof


