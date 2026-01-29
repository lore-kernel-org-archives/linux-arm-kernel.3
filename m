Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77271D3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK6u2LwfnVrOVnBoIeEOGmeZtI1hOexlZ9K+inLViIE=; b=4IDqhahSdZvRSRhaPaJnYjToc4
	Dv7WZTtnXVsG6+0vtmhOwYCuL60xlzMPc5m1x2wTT/R8Ea5bSjK9WRYFlUg+jj2Px6Zq+KS987VnI
	YfX+nR3lxF137H4idRpz9APeaHK0W1omkVhfsCEMEeL18ZyfrKajI9Pb2QAliHxCwqXlKApiWumJl
	XxlAynvF8dt1Kd15kQ+FXBbJRF+IcG172ns3LyhMXqleKzUXTJWgYOnhKmLgFJKj+75E6eKmfgAc1
	fzAq7cH4o82W76LGJvd0HL1Z4nScmIW11HbmN5WQttkUlqKZ5QCQcawrPzycSR4y6ncNAi8uidjFg
	kA30VNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVKS-00000000Nlt-2zpE;
	Thu, 29 Jan 2026 16:57:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVKR-00000000Nkf-114w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F4476001A;
	Thu, 29 Jan 2026 16:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFA8C4CEF7;
	Thu, 29 Jan 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705829;
	bh=2nPxTv6LjlTvR12DUjaUr8rh0oOFIAjfRLDwDhN7uIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8C2Ntp+Ek3/Qg/ntJZ+iPBT0LTqR2Ob20Ojrhg+jI292GyvCq5T1fnsEe5b0sbfb
	 pDVXTnSt5tWH8/cNU4NPtOr08gEylLIT/L6P4g3N78yBqlMRMyxH2EN6yJdXrmW9Yh
	 zTs+PcL3k1nbYegyXc1yHzoCIy4WWz1QQEkxuAmWGo9s1lrficJ/UMLRXJVMtfEuu6
	 BvlQiGA08lzxqcq4R/5lgbXuWw8tJBAY63c1mj4JbKMNRfOyEtFM0t6E8qrxIl52Cr
	 Szx7feMAPHLDazNzDCAK4PPxL9/Pk/pB0staNlm8vZrz9YQQCxD6ivfDfsdRb+BhVs
	 FZu72yx2tGYkQ==
Date: Thu, 29 Jan 2026 10:57:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: clock: vf610: Add definitions for
 MTIP L2 switch
Message-ID: <176970582841.1274070.1737722961522823668.robh@kernel.org>
References: <20260129095442.1646748-1-lukma@nabladev.com>
 <20260129095442.1646748-4-lukma@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129095442.1646748-4-lukma@nabladev.com>
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


On Thu, 29 Jan 2026 10:54:41 +0100, Lukasz Majewski wrote:
> This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> macros definitions for L2 switch.
> 
> Those definitions describe clocks for MoreThanIP switch IP block;
> the switch itself and the MAC address lookup table clocks.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v4:
> - Do not change VF610_CLK_END
> ---
>  include/dt-bindings/clock/vf610-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


