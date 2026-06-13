Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A2BCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY+WHHGsAnJN/4eY+iYURE+KdmDKPrPGJmVfcTioUBA=; b=cSqcNbqpulnXxCcMYJ/4uHVMsm
	qyz2uewtT4fNHyh6IyHPCYxlAjgH/6wEqO6ics508sOemk3IkIfJncnV98cnQtA0WAPuAvav98+E4
	VIiPR0L25Y2MinXeV9HNwsfubMhdYW2thg11jaC/+I5Y1PojtBkCKa1gRItp55j/daohkkOOhalpk
	419AbgQ/eo7znFZXGgAOScUPCOD26jwxG9kMcZMRFudfEdEOTg+jvz8K0GVBE7rrNgo/XSqrB17F1
	2n+FIR3btrkPATVffcyMJfzU0D/S7A3rbulBovQ4ejtN6h3qwq+toYH3wkL/VIybyy70VQrQmKf+0
	uDxXSKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXWs-0000000Cbj4-1hJp;
	Sat, 13 Jun 2026 23:12:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXWr-0000000Cbiy-2B2s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 23:12:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AABF643360;
	Sat, 13 Jun 2026 23:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C41F000E9;
	Sat, 13 Jun 2026 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781392359;
	bh=IY+WHHGsAnJN/4eY+iYURE+KdmDKPrPGJmVfcTioUBA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=S/wUsrNoxzrGp4EZRaGJAg2tNTOL2JXSB+ZUA42KKQJfBEXkPGbEqkd1+LVfStFTq
	 9rQ0JUcBUGVTX87cPIuJntEGLMupTB307UtnBHVRlEAzxc0BeCjux6hdwW/n1Mwdlf
	 XflDamQwfQsa+8CPaPq2Lv2vOKWMOXX4ghlBE4w8AIwa6ayWtUJZmRD7t+2wl1CA7C
	 fIA3+L2Sspkj2Pb8lFdzsWqO6XL3jZaKJpXcaFp/udgyO6dJLIzfwWUi2cmiFnbmph
	 mk/hZRwBaGUafiukCqlaL8hZFB6C+l4MVg5Vd3t5PamvZw+doFYJ9ry7Hc+Q+Le51L
	 Lgw/4Z8+Rtv2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260604164729.83284-2-krzk@kernel.org>
References: <20260604164729.83284-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 13 Jun 2026 16:12:37 -0700
Message-ID: <178139235762.819343.11900802215889516024@lazor>
User-Agent: alot/0.12
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

Quoting Krzysztof Kozlowski (2026-06-04 09:47:25)
> Hi Stephen and Michael,
>=20
> Notable change outside of this pull: Peter Griffin was added as co-mainta=
iner
> to Samsung SoC and Samsung SoC clocks.  See also commit 20550601bf4 in
> linux-next and
> https://lore.kernel.org/all/178015858043.36212.8088079079471293822.b4-ty@=
b4/
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-7.2
>=20
> for you to fetch changes up to e11560b050ce867bd7d3ccea138231db54e2250a:
>=20
>   clk: samsung: exynos990: Fix PERIC0/1 USI clock types (2026-05-30 18:50=
:36 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

