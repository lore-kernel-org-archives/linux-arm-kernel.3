Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33FAC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTSgW3lqKvxe96bVUgTAt0zx4SrLraeyYO8HpL7beks=; b=pOsmeN0JRq5MbOuRfNB1vT5YNM
	6Tqh1A05e7pRuKoX0qEBlzhmh/VzPYaf/o1oDYbQ9SSeXy9nma3kYVgLZkFTA3np5iuO6rLA3m9tk
	V0zC62Ko5ThyXGvXjnQ+ljj2Wqe5k94l9D9R6KGPycXf5hEeWugQ/JkgIYAUysUbI9xAzVdWxztj8
	bSpKKgzY34lhZIUPkEXGH9PmsfzBBBOhw+jtj3C+01Kr31XXsqsaxQ7TBbWQlff6XeUvZJPRYTELW
	VVePp2EysEuV34xxDnBhIOZl5fl7JLFrbeoF5lCbRH9SSaZDulVXUyCF7wM0rRNWoIHResvUqghDR
	8Kw/S5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG1J-00000007bSs-0Jhx;
	Tue, 18 Aug 2026 09:22:09 +0000
Received: from mail-106101.protonmail.ch ([79.135.106.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG1H-00000007bSC-0NN8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787044922; x=1787304122;
	bh=zTSgW3lqKvxe96bVUgTAt0zx4SrLraeyYO8HpL7beks=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XUxmBcBZ5e6SeXUVt+WJsc8HpGpKBN2hWyltd8u6Sm+MWzeQmxGaJT6h2DTsYaXfM
	 cPaD1wQioujiB9ujpeg0tvQHqtVdPo1v9AxkH5274/GX+l0a3m849a5jC/CqAVg/RH
	 af4+qMb4PFxu8bFu60P1QSDBjnYGoOZCZk0WxJ0y2SHe7OPenVJArRXb3HOULU9glt
	 6UFMtwYThNZQZnMdgFnOLFKTeuE3S9wyzXp6CxJUY9OSYsaCHSud3s2+LgGHzs3gmU
	 m/1dHUZfbqQk9Xf9y7YYQ5sPMoj0+DyDcgl1rBb8szYqjaoOoYxNiGKrSBrwBdWDK/
	 rlOrmqETvYYSA==
Date: Tue, 18 Aug 2026 09:21:56 +0000
To: Alim Akhtar <alim.akhtar@samsung.com>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, 'Krzysztof Kozlowski' <krzk@kernel.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, "'Peter\tGriffin'" <peter.griffin@linaro.org>, 'Michael Turquette' <mturquette@baylibre.com>, 'Stephen Boyd' <sboyd@kernel.org>, 'Brian Masney' <bmasney@redhat.com>, 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>, 'Kees Cook' <kees@kernel.org>, "'Gustavo A. R. Silva'" <gustavoars@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 'Aiden Isik' <aidenisik+git@member.fsf.org>
Subject: Re: RE: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309
Message-ID: <WlIHBa8-P07AMfFe5EEKZh_6Wf7Uy5uOuF7Jn23UY5QHcjjSpab2Vw0u_bZLCjHe73lu3fg6IevtFeJrkc3lNcZZtDnN41QJwZ7hzzBAsfg=@protonmail.com>
In-Reply-To: <025901dd2ec6$0245bcf0$06d136d0$@samsung.com>
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org> <CGME20260817101721epcas5p228e56fa915717b7a547df144ff801c8c@epcas5p2.samsung.com> <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org> <025901dd2ec6$0245bcf0$06d136d0$@samsung.com>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: cb31ad2511c84fea8b1ab9d40af6ee6983b56437
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_022207_305628_A2679911 
X-CRM114-Status: UNSURE (   6.65  )
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

> This patch does more then what is described above; please explain all cha=
nges in the commit.
> If needed, split this into common and pll_309 specific changes. Thanks!

This was a mistake I made when rebasing onto a newer commit.
It's not meant to do that. Will fix in v2. Thanks.

> Regards,
> Alim

Kind regards,
- Aiden Isik

