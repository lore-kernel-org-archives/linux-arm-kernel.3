Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7228C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kPWix+VaF4poh7BpAMhNhq0brLqKbyp9SLhP3V9jTg=; b=LeKthLDG/2jnQNX9vVLhEkYmH2
	7pQ5viR44HumJRLSVZ3qXI2QYs3g4yOr0XPlyJBOR/kNIH3EGHdfnNn50LSkfvXnu5uNryI23jKqZ
	BBtD/XvRfUAQ5239+Hhxi04QF7ijw7re0ekCuBnKwBPchRWOAi/kiXO6ptylaB3/f97TYOaAsdR7t
	yGvrusSZqAfC4FVyhNzLdI03oSRa/IF0zVfKBOmp3AtcbNclKS039TpMOQ4IbalD6Z63ievDApp8Q
	IToUmGRi/606gLzKLkX4+1ZJWyiIKsr65V2I5w5abrgg78AXlSQXCEG1OWbCK38Jcyx/IDXch8uxk
	Rs7P+53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XXU-00000006eo4-01ET;
	Mon, 07 Sep 2026 11:29:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XXS-00000006eng-1U3O
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 11:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7kPWix+VaF4poh7BpAMhNhq0brLqKbyp9SLhP3V9jTg=; b=ck2R6GhDCdfrOmqlL9E1udQthI
	LxsfVTbvBa2CogabrqbO8xzYLMhe8wk3vgYE48i5JmgJhzAnm8iLD3vtI5iCratl+12PzTEmaRhVu
	3VuhpERNYFptWrjvu7pUyrg71ryam46GHdxwHbyZvfKnZiLDBzUKfLcJ1kDHyaEV16jTk2b/avUDY
	kvim4UdyaTd9qW7LhkfdvhRaoFBbU8iOPW9NwLCSNzxQaX0ndwXLY3FnRyZ5xS6Wk8H+LK5CehPgS
	0WqL1khEMHxrwTILSG9UmE8YIuNjud7xZHgH3HMWjyK+8rdP74YOy0lix+ls0LW5x8WG/BDh/S3dd
	BXnbUUlg==;
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3XXO-0000000G9hD-1dTK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788780552; x=1789039752;
	bh=7kPWix+VaF4poh7BpAMhNhq0brLqKbyp9SLhP3V9jTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NccGulBJmA9yxm4tPEM5Zsk0ALt0JS4ENEHYrGqti698nE4mRX16x/JQKLmMWuXcZ
	 yZGKU5Av+ng42tNyYxHvpNzZijiIyY+XsClW98tLDzD5X7YLegge2Q+wgbjCJf6Yyv
	 0PkyNML6yOO4jfQmMUhtSvi/8o2bYdtrKcQFGdgXJUNoLN0GmubFcqD3vbY9hjw58J
	 UXK9ndz6mGpAcpweXE7GvDrlJVKS+gKwCU7Iv0y2WpWQ8TSqbJDlgd/ZvWH+k9WunS
	 xD02sqga0WLCWeZpPwrBmF/0mVLKAzgScacboIPtBt9KUrGt1i3aNoqTAWVc8B1Zxg
	 0DtuvoyYl0nKg==
Date: Mon, 07 Sep 2026 11:29:08 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Aiden Isik <aidenisik+git@member.fsf.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: samsung: Introduce Exynos5515 clock driver
Message-ID: <m3ip9ZfBNKnGPEYZflZKfrqFZWZrEiwuRzsbwnztko-nw6wYzySsj6ksAWMG7qZRqGMH2a07a0xDtZkyz1FJT4kAVArsP4SUAm_jEYBFvKs=@protonmail.com>
In-Reply-To: <69f1c866-a4cb-4b9a-8958-f56391655bac@kernel.org>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org> <20260818-for-next-lucky7-clock-v2-3-cda0cc80f158@member.fsf.org> <69f1c866-a4cb-4b9a-8958-f56391655bac@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: d8fe420d46301c8e4dfb20e788485ea4e69c9316
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_122922_699171_F54FC49A 
X-CRM114-Status: UNSURE (   6.95  )
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

> You have checkpatch warning.

> CHECK: Blank lines aren't necessary after an open brace '{'
> #494: FILE: drivers/clk/samsung/clk-exynos5515.c:457:
> +static const struct samsung_div_clock top_div_clks[] __initconst =3D {

> Be sure you address all of them before posting patches.

> Fixed it up.

Sorry about that, I will make sure to triple check
that I fixed any checkpatch warnings in the future.

Thanks.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik

