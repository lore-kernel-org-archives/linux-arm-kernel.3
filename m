Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8146CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 22:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuMKggUkOXVDQn/vs4VrNx1iKhuGedlNFfxKN0WcIyQ=; b=ZHaZ9jFrq6y3yzVNrJuqdlyhfl
	VmKrbQKxAGQSZhcwAdR3RGhofp+rldhMhL49D1u2JQoHjEXoBlgD+syjVptZFJ31G+e/7jA7Z3mBU
	te0JuygaRpVQB0AWJ4+o63inKX6DgX5GmZso7v+OS/OWWpgDNRRAJCBfSBwb8wl+foDqIENu//L8G
	AgPZ/VPDWReKDTcbiJg0XYp2bYQm8m9vw3OCsB5GAqIu0vxg1y0Z/q70asLW0G7QnMe1yrtIDpIa7
	paUF9TfEC/fKG8ptYPN+ZlSHgNZUTkn53ofcgHvl8djcXS9aXdtpN1Yf+F3BdJQ1dbKnPCIBzQZZ0
	AdpOrISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYPQ-0000000GT68-12Vg;
	Sat, 13 Sep 2025 22:07:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYPP-0000000GT5x-3lBU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 22:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 135E0601F9;
	Sat, 13 Sep 2025 22:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AB0C4CEF7;
	Sat, 13 Sep 2025 22:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757801270;
	bh=KkO4nlDVPP7NGR+5TE4adbTvXwa7kqLzgbOu4m6ZriA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CpsZ7MBiWGo88QH09+zuGyg3NAqkbv0ewMeaXyBUE6PZ1o4O2fviYonVB6L01zmZN
	 h3x6z1XfeyrO47HBE5TvHQPnDgcfOQu8XYPHv3vD9WzjuZQnZX9qxMSuvTS6RfaI9T
	 EM+drg628Z+vNfyrsdm7jR+U1SFC71MNxPAW6wc4yHm2DBv5f+q90ECz8/89FSQudG
	 br9C4F5Boulr3f//Sqi1i6bLquFEs4i34kRjdBGZqHH6QCk/zKaXRn00QvoqKrBh/q
	 aY6CmcC/DYskGu6I1mCJpDp80UXb4KkLtKCHv+l44Oqle/X1qtnFa/KNbQhPmPMe0A
	 Ilgfs6Nu/mxcg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250909183504.104261-2-krzysztof.kozlowski@linaro.org>
References: <20250909183504.104261-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Sep 2025 15:07:49 -0700
Message-ID: <175780126993.4354.439527294817394688@lazor>
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

Quoting Krzysztof Kozlowski (2025-09-09 11:35:04)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.18
>=20
> for you to fetch changes up to b3b314ef13e46dce1cdd97a856bd0250dac8feb9:
>=20
>   clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support (2025-09-0=
7 11:12:45 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

