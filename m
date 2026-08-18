Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6552C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0a1d41jUyBzoUQnpBW1+sRJAnF6tWFUiwXSZlZsK3g=; b=jNy5oG5khvh+zEFNuQufoNj8hs
	aGq75WCFvYI2qsymULWvP0dqDN0pqYFjYJa4+HPsSVJCI35dLQoa/VdWokaWlPgQjYUl1PCyGTiDL
	0ygj51iVHaAQig4F7QUcruFz1BiVPC1wGPuytl+oDODOsD+pQIjJ2PpCOZ8KeEX6NmpWW+okYJ0Zi
	of1Uq2MuKyX3nXq9GuQV2VvW0RCHC80hAGlSCnuxH5yqDsiFCigC1pojNiBnjmPQptFWjh68hgSQ+
	AsqcuSurzP7TeMw7mxvmwQR5lvT/bix2uF1TNLdME0F7EhFQUgy1H5jMN7u5hD3LytR0F1uclKr3M
	Rq3sVDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGDZ-00000007dd8-1zq8;
	Tue, 18 Aug 2026 09:34:49 +0000
Received: from mail-106104.protonmail.ch ([79.135.106.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGDX-00000007dcC-1YSO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787045684; x=1787304884;
	bh=Q0a1d41jUyBzoUQnpBW1+sRJAnF6tWFUiwXSZlZsK3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n5UXNlljt/9mBHx5326t3Oh8YN+iuE2U1xAy5C+u5iHZxE+W0OXzWcR6Q+AmFCt5D
	 9CdHeVnO2Pk92mySDZ6LMQqE5hhbIOfDh2sZMI1150fXZ4hcrG8bmipUk2gkE5hGZf
	 EXcf6939gNE7z6IYuJCcRrZEiqKdg3Q42uq2xh3QnNSVDL7jXTmF5tBpQU/EkVXgn1
	 oUIFKytELQYGTntpxDtyVCA7GKIHqsxbLoO2PIn6/MftuEL4+NQkQT7nA9a9NDjsde
	 PK5gvLawfl12L8vkTXNZPGZ3fyFm9FeT89OYP1RfSGtlM/JjEWCb0qYtvw6L4FbrlI
	 GajOL59Dd5dvQ==
Date: Tue, 18 Aug 2026 09:34:40 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: samsung-wdt: Add exynos5515-wdt compatible
Message-ID: <xYkqqAlkGO9BORDl0gr_RUf7wX_yGFV0umuQjGA6F4GEOpAhKqpe6AuwMy60a6DKPQoCwzD9BljivI8jwFvfvK2U2JCpkVSJ5nQU8pkblhs=@protonmail.com>
In-Reply-To: <20260818-singing-rhino-of-glamour-accb9e@quoll>
References: <20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org> <20260817-for-next-lucky7-watchdog-v1-1-a14370e20b92@member.fsf.org> <20260818-singing-rhino-of-glamour-accb9e@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 8afd6c597dbe49eae2ecfc00bae5b54add095e2a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_023447_574311_8109B96A 
X-CRM114-Status: GOOD (  10.05  )
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

> DCO mismatch.

> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

I did run checkpatch (promise) but then b4 failed to send with
that address so I changed it.
Will fix in v2 thanks.

> No need for the comment, old code is poor example here.

I'll remove it.

> samsung,cluster-index: false

> Just like other cases.

Will fix. Thanks for the review.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik

