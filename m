Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175D1F327BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3KsurA59Ej1HBfkusNkEVZ4mS0gJUCd46vf9wvqU8I=; b=4i7xc/8BTyHm+0wRQmprKn+LXW
	2rN6fo2MiGkNLrLvlv15ZEDr7f7wPHwMOoICDGCgMQBpXOfSdgOi3DkrgjShNPEjshOqLfr4Dv+qP
	oj2MoyFEWiQ7mU6CVKD5POLTJMRdrQiJ3xtKvocqXcA/F6WEHE2TlHYgPdfPJpBjP4AsD2oL++06i
	FNDX1s+QpvLX9G/fcbKSGuM1qh/NLUZ2V3UEyp6y+C9U65qY7vnS8zj1mv2tdK8TjZDvL+gJHLmId
	JV/J8xwxb2qkOxe2AB4i73HmrJy5QO3EFhV8Gm2ScTXNjQ6H+aX3GfAWEc727hKfvE8zpqCeOypGu
	+dUHoN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF64O-00000008Due-1hcc;
	Tue, 21 Apr 2026 08:02:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF64I-00000008Dtn-0Dvq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 485C9407D1;
	Tue, 21 Apr 2026 08:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA89C2BCB0;
	Tue, 21 Apr 2026 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776758569;
	bh=MQ0U64TDsK6alrkDhbgHgLn1qQ1ZkRwtQIWdPthswAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+gg2Cbd1haul0eQWTsWxDtkeavAQp3FOX/Mjjg+xuwmc8r/VOZgVKFEtUIwG1DV2
	 o8rLztNt/XYzS3qCwM9H0lOlDvLCbylHUoVstwGPVJ0pYNV6DQfRO1ntRNcSmu9iYl
	 jBH+qUMNrDfKKuCK8aEK5gd+KF7XxhuzMy4tObvzfSzZrehdV79TIWenii8KNvpQ/m
	 f/osnI8xOzAUtRDCjUmMP+8lXVn81+NCBGvDPlpHDg7oIRP2yxYb9lKnYClYfYNk6D
	 mC1Vip6GkLF/A+WEI+dA3ip4R5xLk8BvN6w3aK65RSiJvW3AO+Ge1JcpQihNO+iram
	 o0puqKESaGvwA==
Date: Tue, 21 Apr 2026 10:02:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
Message-ID: <20260421-cherubic-urban-beluga-49ee00@quoll>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_010250_112973_2038D716 
X-CRM114-Status: GOOD (  11.36  )
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

On Thu, Apr 16, 2026 at 01:31:40AM +0200, Marek Vasut wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add ztr/zt clock at the end of the list to match bindings
> ---
>  arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-

>  include/dt-bindings/clock/r8a7740-clock.h | 2 ++

This goes to the binding patch.

Didn't you have also a checkpatch warning?

Best regards,
Krzysztof


