Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEF3C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6VNhutnB/odDF4x/dijrieo9zYEdG6n/8A+qkujl9g=; b=H81GbaUYBKeTqX8yLXhjfxKIjs
	LR/mIa8K9fvsBdFXkvRK186MtblZWUtuxyevAacmVIFsLGM8iFiBxeDaFBQH7DwNpt0GKyFb4NAVp
	7Ela+Gq7sEynyIR0+vuKTadzIlj8eqy1uBUf93FdbWQvXAiFkXd9M0/9DsSvlZGqaznn6dfih8AlT
	z1zV+hDd0x/+fupRzAL7gOBxdTeKU0docsGQEQyRRz+pa2MRFk0rPx0+E1fzpsOQk4yKfa61Rz85y
	xwJAXi5FWxbv2fmCcSEzatZ82KmOmViO/Ia5f1NKLrPfwQO+y5MZeORijCZ2oU5utvd7jYt5F/3gd
	AjFN24AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEje-00000002KCw-1jrC;
	Thu, 22 May 2025 22:49:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEhT-00000002K0v-1RmD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 22:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 760335C6AAB;
	Thu, 22 May 2025 22:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6CEC4CEE4;
	Thu, 22 May 2025 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747954062;
	bh=Kqb87YqrH7GgbRIjtu3CSrvC/nfpw9kj2G/CS9u5zDI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H9SBvD25Q2PU4UflB41Gd97nlaKsoI8SbBuXLVrsWgQJPn08cEjwwG4+hn50kJ/mF
	 +Z3oRbYBMY03HCGgKutmjHhfiUkuBI/7FY5lGlF6yzUk4kYDCEzMUyQRG2+xGQRh6I
	 ypc76/fUP4HHZcvpaE3jJebn/F+jehfq3+LJdpWrHwTCSN1E+9Iyk07a+qUqA/GIEs
	 9bCbllTUz/giCzT9FLWPNXCMP7WArMCddkmI8VxxxEBrH6Rj95veyfF1C+WK+9XgWL
	 auPisFZjm08OSeq5/vytZDsxymD08ImPmYr3Qkmqh/dhSGlOBCg4UIdrZ8sEXu5aMd
	 WzE6SNvlg7bXQ==
Message-ID: <4932d11de93098b86e3f18e858930388@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250513101407.22233-2-krzysztof.kozlowski@linaro.org>
References: <20250513101407.22233-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 22 May 2025 15:47:40 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_154743_428143_A83C630D 
X-CRM114-Status: UNSURE (   6.76  )
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

Quoting Krzysztof Kozlowski (2025-05-13 03:14:08)
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.16
>=20
> for you to fetch changes up to 81214185e7e1fc6dfc8661a574c457accaf9a5a4:
>=20
>   clk: samsung: correct clock summary for hsi1 block (2025-05-12 08:30:06=
 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

