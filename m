Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8578CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wuun7QraMRs9Rxn68mbPknbZKo3brZLnFtyz9T2HNHk=; b=tTCHlQHy7NVrY2R6RcdLXBMoZh
	TQuGywRbqqm/8/V8fUABCZqSDVT/BG/2ZPiPN5j63vxkAw5C/JkzufkIU1eK6ovt4DpK5eSef5Khy
	C6ZawdSigRiaO5apIFtt8CaV6d3O0SlN3OqmFpM6VjXL1H3eD1s161xMzZ5cYBifqqFhmC+0JmRvA
	zJYHmwwBMqIcXJf8oOjw9owDB9ayco7igEyLPfE38bmA3okBWRoghG9zvHB+jagb5tr2RBZciEBEd
	9GPdfnNeGg6hOgFrpDGH4/kEeSdf1ue79WwOiKD1lj3vgAVwbm+BT6znMba+kjbn0p+VeS40D+Aus
	wo4dtVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D90-0000000H95D-2taf;
	Thu, 02 Apr 2026 08:11:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D8s-0000000H94q-36Qu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02B9140871;
	Thu,  2 Apr 2026 08:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1C3C19423;
	Thu,  2 Apr 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117465;
	bh=/eYR7q28xOoXfwKdKZH1Svo/Q1tCKLQF1NwcRaM91MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiNp3uLe2VcqWA2YbxCsUinUlHj1nuZqBm9IMQsarSrZ5H8cPF6TR1rXOLu4tdznp
	 jCSJg4lXdCyHQYf+PPL/h+Jt2K+UDi8D6rT9wcIiq+0vULPC/Rza+1V9YZNqkTOdVQ
	 A0N4j7y1TU+vKOijYInEnr0bGYWu/z9U7oodbLOEeDpouvrjao9XMeVy0XtoW0sFSy
	 BlU6ffHIvsaopfiARHj5WIDDsm0z3QcnAukF7npVSDFrFuNuWOmcfKRhSXfjOMLekv
	 KL3qioieyVDzZqDKIoHBTplPv+6uKp0Q3rdCkqLRrkHHZj5UFUM5G0Q3x9f/FhV8++
	 WTRBeaC+i1v6w==
Date: Thu, 2 Apr 2026 10:11:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
Message-ID: <20260402-lively-magpie-of-apotheosis-3caab1@quoll>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_011111_831643_68EEDBCD 
X-CRM114-Status: GOOD (  11.79  )
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

On Thu, Apr 02, 2026 at 03:20:15AM +0100, Alexey Klimov wrote:
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 67 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


