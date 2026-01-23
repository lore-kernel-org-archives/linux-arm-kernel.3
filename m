Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96A2D778AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzBxk8neTFVHNh03NTUPXVgJW5Bs5SHZj5M04n7SLQM=; b=3uVu+15FYe+zzMISE2qM8wHYrA
	3/a9jIdIpC8wnc616mzMAqzcJwSqMtNc1t93ao0nySpxi/o8yGlTpamupv99beEQsy8cW+VOC+nJA
	ojfQMl+QERQ+pRF9hXkT0u6j71i49VPjqsKcVi0bfC+XWPyO/OGpkSCCG8LMjkggJ6yskfefS2SiH
	/K6Eiz/lRLZANmV93+m9s8v5/NUrkBHTnVovkXTxJD9uKs2YsaKBYdZCegRbixUhFo2iX0l43FjWY
	pg0pPIJqcmbG6HoLpD7OXSnRzC3jr7Tm8I+dKsRilA8l2CdeOguLFIrWAyZE+A9+ZRUH9W8oZ+JcM
	ZZpxNxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjML2-00000009N5q-3I9B;
	Fri, 23 Jan 2026 18:56:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjML0-00000009N5H-3lLM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B66340523;
	Fri, 23 Jan 2026 18:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D29C4CEF1;
	Fri, 23 Jan 2026 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769194614;
	bh=cixswUpHfyZi3qpQCfZc/4dJqzaj+l66sMvUaGJa74c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OmwEA/CZayJSVP0Nu4nVgkbCG7J0p4G+jeExjXX9NFo7xNT9AfyOFLhcWuPe/tQlr
	 EapuU4YnV0s3+CzAOv50WlJ5z26R0udbhdGAJMeygclGH+EIBg641Z0Wm+E+dsc3QT
	 wvpAMGRSogfK4VKNuvj0T3iTrjnsVA+jaFFbg8UZOVCCgNVWmrneXNSm3qJUOBWraf
	 aC9UCiL8yWDEZJyPRUUxNJjpyHRyBeDv74WFN/R2gwFHD8Y9Iz36w1trqwa6cmAoXi
	 jxz4ALJBOFy27uRU6ogq2xijPWveUH4gEOYb/qpKOYgSgrEjCLfxpuZOKDehN9yZgy
	 /wwEO/677vE7g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Jan 2026 11:56:51 -0700
Message-ID: <176919461113.4027.10346884199457325938@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_105654_956714_445C43D9 
X-CRM114-Status: UNSURE (   5.89  )
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

Quoting Krzysztof Kozlowski (2025-12-24 04:42:12)
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=3D1 warnings:
>=20
>   pll.c:102 function parameter 'req' not described in 'zynqmp_pll_determi=
ne_rate'
>   pll.c:102 expecting prototype for zynqmp_pll_round_rate(). Prototype wa=
s for zynqmp_pll_determine_rate() instead
>=20
> Fixes: 193650c7a873 ("clk: zynqmp: pll: convert from round_rate() to dete=
rmine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next

