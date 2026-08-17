Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF794C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9MKJxJV5vAuZcM23XdaSIgq4d2Yiv14ayV3TTGoMl4=; b=fT2Ez12D+D8+/Kj4yTCJyPjcyU
	wIJI+RNyiqpRGn24sn9RwZRqoEfefLOdWM3KZBC2s42zOMkf4+PkOj0Ra5j1ZAM7lZ9SPM0bU6ROH
	n+5wawm9n8RpcR96COZh5rGam1uUhxpBX9r077Ue/toM38JtN4ZLeue/FNRXUTiRO0f0lS62j/W0G
	+hUxlx2xucU/q1XYwzYjZTiH9w+ffY3/JJNncUf8kprgY4hVTFMWgL8cwmOtjSdC1x0aPyLpvPSTv
	46vdIrnY2hsQ6Gb+nYM2Pw1Q5cuj7NKcR1gmAJMuDuJW+JGbwrvi0g40KguIbr5+EJ6w4SNaoBcNW
	c5r7Tk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxd0-00000006Efq-0Duo;
	Mon, 17 Aug 2026 13:43:50 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxcx-00000006Ef5-3JHu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786974219; x=1787233419;
	bh=b9MKJxJV5vAuZcM23XdaSIgq4d2Yiv14ayV3TTGoMl4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lvAQ7aqX0oXWAB3bkIwejQxqSdRgd5fTz16Kes+Khx0NGj5S5I67K7jnyCnf0m3Z1
	 xcLUBzPnGTNV0+P91vx7eOzN27Cc9KkTfGplbkUjnI2bgpQwe3g+izNXy74vSDj5E8
	 S7W+/pfIsdgyUv/1687gL7h5SD9E6qSuh+Z6pOxE8WzPaIjvE9yJ5q7HhyBF7qVkBV
	 tq5ZOTaVvdTBNDjZjHrU3yQcN3wLXGSZVPSsIwxMkURaoAEcMf02xAzTpQLZn+31vl
	 AQfD9S2VbdChcnEiA2ZVVi7ZhU4LGaO0MQp1ds/QgcGYhY8cldCU2TxMoUWCQpFteu
	 CF0IafeHGFEXg==
Date: Mon, 17 Aug 2026 13:43:36 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible
Message-ID: <RwK7oMLsbaq-iXAaW_FlHc3yl355kfN_h4lpvXoLVOUDx2dMdRr0j3tAuVNb6Y2nnVWaiwHKu9nUK9iAZQOi76D9XuZjIH4UwRCaVhkgyOM=@protonmail.com>
In-Reply-To: <d592c554-5e43-48f8-a1bf-5dc6c6525c27@kernel.org>
References: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org> <20260817-for-next-lucky7-chipid-v1-1-eb2908705c0d@member.fsf.org> <d592c554-5e43-48f8-a1bf-5dc6c6525c27@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 6b1b7eec98b0ae89d941f57c5bfa429dc8d022af
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_064347_982647_ED3AB91D 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Krzysztof,

> > Add "samsung,exynos5515-chipid" compatible string to binding document.
> > Use the "samsung,exynos850-chipid" compatible, as it is the same on tha=
t
> > SoC as exynos5515.

> I do not see how you use "samsung,exynos850-chipid", probably you meant
> that devices are compatible? Just say that you add Exynos5515 ChipID
> fully compatible with foo bar (no differences in registers) instead of
> repeating the diff.

That is exactly what I meant, will fix in v2.

> s/exynos5515/Exynos5515/, in every commit msg

Will fix in v2. Thanks.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik

