Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F0CCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4oORWxT3GCiIj7It7+nD1OxVv4/w6v87vfNkdvuwPc=; b=VvVGT+bBALLbTdlYjlK5Fd1vKg
	faFRq1AOVUaXjgqi+om1QSpT32g3qdIi4b6cqMXEFQkaUxV/DLnc1vlnBth2n/Kmgc0ARgJmHWkd7
	sqb+i/fsXtsFhwNOpPrRp2JskGj3AOivRK9j7XfTg5RKBiQduz0LgAxJDyNxvqoXXem++VlZB7f8c
	8g8V1ZH7h12K6AjE7Tof05v7RMyr2eE1tDfEEMo7bQr6abREAERHqqUQG73K4mc/U6UTppictgDSE
	f0a0mFaL5ARAqXLhZSLty0EgpChb86ynWJ1pGiXeEFG9TKEUuBQzZoTd3HIpE1cnf1ACQj4beJyeD
	VZs7Ex5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsh7-000000025fA-2pG5;
	Sun, 14 Sep 2025 19:47:29 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsh4-000000025el-3yWU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879243; x=1758138443;
	bh=/4oORWxT3GCiIj7It7+nD1OxVv4/w6v87vfNkdvuwPc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K0v43KNhYt5MYQxTsxPaQAjVy2zOoEvAAgyz7JPJo+0mctK3gNE0V4ziHxxhRDMuv
	 5dj9GF9iVr3UZDFE9aql7/YeciylFCV0Qn3bdN/cKPTvdr0hTNh8UZ6nEeqxHgL56+
	 6CXsV/Bsupu2PazGVUnAiEf8IcZxLZwQPg3qgi7fskx0h8Q/ZrWx6fEHlAahUrVrhn
	 ++TdTPv7fAMA1WtHWOBfh0y3PuXywrCA1OmFyUNg0boDfzcuEcPKvQAOnSIYGy/NQM
	 krEV8UTngLUG8OqaY01+XzubykuVApVSNM+ILYOiTJFkXiLFbP80wz9voIJQG7ud/D
	 oYuzeBYzeB5+g==
Date: Sun, 14 Sep 2025 19:47:18 +0000
To: Alexandru Chimac <alex@chimac.ro>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <jK4UF0gSnN6odWToPcqZBg0JpcmWN2xotlc7Sw5J8r4ZSrvtTD0GUATPou5d1WMWq8OcrYXR-O4jjjwZh2RwWw8UgFGykoWSuCxEdoeJWrU=@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 7f4286e46f67aa9e926ed1afa0bd894d887ee469
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_124727_139859_AF709275 
X-CRM114-Status: UNSURE (   4.36  )
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

Sorry for the duplicate patchset, I have used b4 send --reflect on this one=
, thinking it would only send it to me for previewing.

