Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07023CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wU6LXVbP/oCGh3FkxUPd0dsJDmEtkAwN2Oq/Y5QST4=; b=UF+7pMCXc4CR+ZEmtKF3xZu1WH
	Tvyvzprww7+TfomyPZq/mhiajQORZjL5JikNFdFtChA0jY5UcAwLuLrlAFIEu1z5r9N0WGV4AM3Tr
	cpyDO2LfV8Mx3LXoNDNjqqGlz5XbRM+6Wcl1GPpR7OtyTyDGenTcy3nZ9AK+PfgQmcpHxDYnTM5hW
	W/yq5DdLYk17U0G92B7SLv8Xh9S9izJ/7XSI4RiIXh4SrO3P5UGTADUyIPS70bXO5H0UYuTn/yM/t
	s4M+tzqaBQxvOZNGjOjPHiGVjIWE3pYzIK87vMExBydwawOxlcuqtrfsWZQ3jnfdbPnODkwZ1df8+
	Vh7wIU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkqR-0000000BVp5-0dia;
	Fri, 14 Nov 2025 03:51:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkqP-0000000BVou-1ovt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 70CC260163;
	Fri, 14 Nov 2025 03:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1598FC4CEF8;
	Fri, 14 Nov 2025 03:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763092286;
	bh=22oFX8wBRRC9Nq9UVdE5yPbQ8/s/QPRCJqJO6guZmak=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PWMDKLHCoYkxTbwYOMpLSG8qbPOEk1S+vVTN5opd1Q7edMh/6H+c+v8J5ai/Mu7LC
	 CuKKox9/PPZibwtFhguQoGUk4Ilwuy7cW4mkwXmTQxUEcaVlqe5MnF5JCQd7mRcGI/
	 nXxeafOJtEwsxXyokhflYvc1wQ9GvX12iDOSTDFFXm5VPCVPcBAs4O6aLA+QItRk/e
	 wrPb2K7IVKRiLCebArzReHQLDLtDLpXGsVKk0WaA5ZxPnQ1DTKC0CE2H4bCITM5/Vh
	 pXjVqDr8dH/DLFm9a6BnkGn3NcIsHpl9/DzvTLAIrWvnfxvQWNWanHG/UvC6ei3+DQ
	 uqlNzyLbXSqxw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110151242.136508-2-krzk@kernel.org>
References: <20251110151242.136508-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Nov 2025 19:51:24 -0800
Message-ID: <176309228416.11952.16188046098586273315@lazor>
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

Quoting Krzysztof Kozlowski (2025-11-10 07:12:42)
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.19
>=20
> for you to fetch changes up to d669ec6be0b1965c67248407d87c848b1b7c12ae:
>=20
>   clk: samsung: clk-pll: simplify samsung_pll_lock_wait() (2025-10-18 18:=
12:41 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

