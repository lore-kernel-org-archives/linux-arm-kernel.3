Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D77CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+TJa+1YAL3xL4DQkHf32bWqzxeCnDN+wkm0l10neeQ=; b=eTnMJTPE2Yh23QsXA1AjfVPVJb
	RR+9ebd2KaBun9gKH+B9PDT2oef/jT8UYlEcl7zhmYfvClAZFBCqBx68kxf83wL6EoEKkpGxyOu19
	vnRe97BMGI8wahjbZZ69AjembpJD9THzkhC0bPkJr4XYBer0TgD0SbQTwNWuYg2titK48I76ZAiPZ
	0X+6by+lA94yqykEX+wcjnemIKRmcGAsYW61Eq+IF3FvIPpB9MvbqcuZbT9rGURwaFPJs+yd+vOqP
	3LXXqwYSlrzZpl24ho6rCVxp52yzaDl8AzeChxTcmRJtW7foj4+61+mk2zcM3okqGI9bUh6nE3CQK
	l4DpvuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgu-0000000BxXZ-0niR;
	Tue, 12 Aug 2025 20:33:52 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultzi-0000000BjeQ-1lCX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:45:11 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A42CD40AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755024307; bh=A+TJa+1YAL3xL4DQkHf32bWqzxeCnDN+wkm0l10neeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jM8TtxRyOctibvek6JqZctFVAABA7VURS2ihCWUfF47+Qb3GDZwrh1qs8QiaRWi3l
	 KhF8LjFwA7Vxgcpju8bmUR79KQdqVHBRdOm/DP2zL5+dNg5HP8CPtNsDL9q9xXT5c1
	 BYLuNjP0yrZ9apv536rH0/ZCgwX8QEpzkwQUK0dODsVbwxGPAH4/vOmf80L33qa+rU
	 0qIOU2WiwQreeFzTkIiG5xUa8NrmmosMi/1SH2pdyQwzNQ4tvLgQCrA3tYCLEPOEbB
	 pwu52N0ltFMDCP6rOMzYJHFRikgSYX8FBd0KJ9kEQNVBKiXzIFS5lO/Rnc/pOOnU1O
	 jyxtMhrOEpQ9w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A42CD40AD9;
	Tue, 12 Aug 2025 18:45:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akshaykumar Gunari <akshaygunari@gmail.com>, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Cc: linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Akshaykumar Gunari <akshaygunari@gmail.com>
Subject: Re: [PATCH RESEND] docs: arm: stm32: fix typo "busses" -> "buses"
In-Reply-To: <20250807145119.2214-1-akshaygunari@gmail.com>
References: <20250807145119.2214-1-akshaygunari@gmail.com>
Date: Tue, 12 Aug 2025 12:45:06 -0600
Message-ID: <87v7mse5vx.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_114510_457052_487E95FE 
X-CRM114-Status: UNSURE (   8.49  )
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

Akshaykumar Gunari <akshaygunari@gmail.com> writes:

> Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
> architecture documentation.
>
> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
> ---
>  Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon

