Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VDxrRC7X;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=df16b4rZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9SxjfkPBMGSwJHNywZJ/fVHoFLAInw0+z4Jckz+hCg=; b=VDxrRC7XhQi+IXIwbZgudDV+mw
	UE23CLbbGMXEpwi3EIe4/BM9qkdbEDw/liF3CktwcfLvhje9WV922tqrKetOla1RgVyyTpC2yj/iQ
	/az7OnLoSoktvdMRQvhAScKPD2R3ImXv0NEMTPSREFkXcMidqeskjRDgqh6eSkVmJAm0Opw6Wg7dd
	uAlP0FehQvFhpdkPXALcuDFNW/Nd3feknfUofQQIFBUT05YyRDdmkQHjNnRlhKoqa8ZrZqIGdOyOv
	GKmEWspH8HIF1r01CBOtqGgrez8awAAlAIkQYhfk4xsX5CvNXS1N0eoal/9+WzZvEXfUa5ytioLHP
	aCSavK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ73u-00000009QcQ-0Qsx;
	Tue, 20 Oct 2026 10:27:18 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ73s-00000009QbZ-25VV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792492031; x=1792751231;
	bh=/9SxjfkPBMGSwJHNywZJ/fVHoFLAInw0+z4Jckz+hCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=df16b4rZju6WCMCD3p3UGKnP0ESVB9DEKjsYPJ2fW5bNaVzmzVYAqUwRMjQdZfcgJ
	 sq8L6UwDLGg4a27L1PeAy50+hV9SJ5Hm2cLOwOvDH5Wd9s79/NMAk6B9mLOuZEz9L6
	 LgdQ1XwyRoBuypsbtRqWrcLsBFkCnVQaJk5N5VSxs2tAk1IepZukbffrAOjalzsYxU
	 cBT90y4d190ej7DDGACf3HHKMy3sf3nj2Nz6BKXnS4AaAvw/qfkRmOWX97/VYHDhPG
	 h8NT0UBB8aFdxo5emOCcatvqzWWnDkHNkdeGxBZ/xq0/V6fHDfaYKq/WQlhBt0Wpdq
	 RLMVaWCqC0VxA==
Date: Tue, 20 Oct 2026 10:27:06 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
In-Reply-To: <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 95ccd282feead4333ddd8254b6582c6fa33f7465
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_032716_689438_CABD6F60 
X-CRM114-Status: UNSURE (   7.78  )
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

Hi Krzysztof,

> DTS cannot depend on drivers. Please fix your code, to avoid that.
> Dropping from my queue.

What exactly do you mean by this? The DTS describes the
hardware in the system, which requires drivers to drive it.

Is it a wording issue? I don't depend on actual driver code in the DTS,
only bindings for the hardware they drive, so maybe I could make
that more clear?

Kind regards,
- Aiden Isik

