Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dvEaDbn6;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=xn2yY9af
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ee+0w4xlD5ELK5Ml16S7G83YFTChVMAe2H1W94F6EnM=; b=dvEaDbn6gGVT84
	01pzpeoUtD0Xuf7pPRf+PFNNCFtTb0GPPvOALqXoEO3WgwkKkhRrcfTuVv/YHjK+m6plWm4AagIgm
	B0g0XR+pb9m7fvCsqKPHxNix5ugVXV0EtgDJAGR8fGzMnnkaCjpSpn68fZPSazZbqQdO/0mN7fZsX
	Fd/34rHKD6lfSItz7YSJqkUJjZOOerZRwRXUlHaFHmsyZeDbbJFQcdLGeJwKdjUvaE90rQ+VKt7t/
	SCWWEPehPVwi7IAV8a5Zjf0ObV7ag3DWlvcZKWwlTvb2w8bIXoOnyfKafuN5UEYNTKf+/1OGZ0q5U
	gts90HNHnAfLabI5ZNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNplQ-0000000GEqp-1edQ;
	Mon, 02 Nov 2026 10:59:44 +0000
Received: from mail-106101.protonmail.ch ([79.135.106.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNplH-0000000GEpC-3m26
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793617170; x=1793876370;
	bh=ee+0w4xlD5ELK5Ml16S7G83YFTChVMAe2H1W94F6EnM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xn2yY9afilndurnQVUzn0jI13yubFLI6FMDwLqagV7p+nij579en7Klu7t1WVe8Hm
	 ExXZYZIXdK+UrDTVMwCufafhY4cXP2JJiDm3nx35hEZ4BzZ+9qa45sGU0xXpy3DQjD
	 y42H+q59cwtaTpIoVU62T6oK8CyDFEUwWfi+s8OtfKoPZzt4jW6U9LgniWg64hrsrx
	 bC1hY90/E0Bma2soBSfDGkpjwPUZ/y4nQWinrHqD94H2odsVSrmjqQ7XpKacXy9bFa
	 jTBIKkMX+pukMz3NmL4/bvYMEgxUg7ruOIigNncH109C7/t3P3Ak4RBv9NPLJJ2Tlk
	 qPFVYHpwI+YoQ==
Date: Mon, 02 Nov 2026 10:59:23 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: samsung: Add lucky7 board binding
Message-ID: <oQggKJyvPN7MEiO3hqH401UfQAGPL5C5o7_Ybg1EXSh_m6aq_d3hKX9bwovgUqDkOTf0zCtHXZjaBHMc7tY261ze6m3AeufMxCi2iUg8ro0=@protonmail.com>
In-Reply-To: <20261102-origami-shoebill-of-fortitude-ddf566@quoll>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org> <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org> <20261102-origami-shoebill-of-fortitude-ddf566@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: eff9712326438b909497253eeb7a4054cbeb4443
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_025936_100304_AA1C4788 
X-CRM114-Status: UNSURE (   4.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzystof,

> This looks misplaced. Entries are sorted by the fallback compatible.

I'll keep this ordering convention in mind for future board/soc additions.
I was trying to order by description (ExynosXXXX-based boards).

Will fix in v4, next merge window. Thanks.

Kind Regards,
- Aiden Isik

