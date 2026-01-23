Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AFED6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV61e5ibKcTUWKaioVC0P5d+0IKN+WKyEtaMDHa0AZQ=; b=Ftfr+gfVQi2/aioLk7mkI6AWx+
	E6Su6SmvNoMC8sZHs05/RYBKVmrLexhCPvWLlRB6hfH1T0oWG6lkIzs0YOeXJ6MsU1mU5fks3Ut3S
	kxTCfkdvVflQ85TyMcPUVOhF0La5AS3/VjBs7oZ1bHFtCVoCpMHXHQGD3Qpz94xaMowNaQ7g2dcHb
	S3GdXN/lYeKfQH61ZSwgJ1P541m9E37UATmDqOsqCAokyK4ls3ngDTkZProw055BVGcncRvQPA67a
	cPEytEcTpsxqdJAfRtY7w8y1Dli0VwfERKIurRdLYzTYFsz5i8OMVWDJoYPLW22ZbCwA9hxKQCVLK
	gPIyBFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6jh-000000081Ra-3AXk;
	Fri, 23 Jan 2026 02:17:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6jg-000000081RQ-3olm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 02:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF74560146;
	Fri, 23 Jan 2026 02:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEE1C116C6;
	Fri, 23 Jan 2026 02:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769134639;
	bh=jVrEQlUVE+DpbMHieJe37nHILdx8CqAQ9VOT89oe2co=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tjcYP/ovcuUZkZ7+y16bkfwn0zZsRUjx+mFgEOHZSXzIszdATS3wJOgliy+gcHOKQ
	 gyKdPqwNmN/c9fjvHctlpLnnZa3FYM4VmkkZTCa39Qvy55AH1yGyXjqhpSAlCtjubn
	 mCyr/5bjFkQ9mAZZDT6cHZQQqjQP1iZHdgsyGFquZhmIW/5FXKp+COjgNzTgi92UR7
	 O8szrPYrmDB21ZF+VnlpGPt6WyxvNLek/u0M5p8q6ebfVMOyBgSR1k803/969yvwpz
	 trMi8D8DiWsXAd8o5P82HcjgbU1h52r0FvaF+90m3/E+ovJSmBzq83kLVb/6dxmrY3
	 gTOXV+gJgZWsA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260122083920.20271-2-krzk@kernel.org>
References: <20260122083920.20271-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: clock for v6.20/v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 22 Jan 2026 19:17:17 -0700
Message-ID: <176913463789.4027.16250770249580323384@lazor>
User-Agent: alot/0.11
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

Quoting Krzysztof Kozlowski (2026-01-22 01:39:20)
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.20
>=20
> for you to fetch changes up to 4b18a3ef2230e38439c9c3a0e3fa4a2b5edcc5cd:
>=20
>   clk: samsung: gs101: add support for Display Process Unit (DPU) clocks =
(2026-01-17 20:30:38 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

