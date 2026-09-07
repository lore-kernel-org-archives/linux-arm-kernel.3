Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD53C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MU8vTnQ4SCG40k3kEVDcMjU9vE6Mm32ui6oD0ivsqAE=; b=cqraHBXKTOsEFXtGnr65Wfn6/p
	qMwjpg//kD5OnRnhFKdKyOnPkahqmHbxd8GHVQK4VYEwVVN8loWDf0h+1vNjZU/0DsrglXvH5dIMg
	05YYXKDnGHCf0Z8UrjE1rjpzMCM8JeLLyNzOPgxnpfkYofRgbBKMkZojw539bqZU4V3GLHwmBcv38
	DSNyxjf6WR3XuVMak3xEN29g4kkThpErFvKow/hIWobcq3MW4LHfSnfkHmipjW40+iJrO/S1cItig
	AaOhBjjhwGZeJrgFLfNOPhfZltaSD44/tkT45NYfCAbcbbajFXCM+66cJaMkw6Vz9jq9jps8nqOYf
	v27RN/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SXs-00000005zYO-4Be9;
	Mon, 07 Sep 2026 06:09:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SXq-00000005zYE-1n2h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:09:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62DFE42BA0;
	Mon,  7 Sep 2026 06:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7EE1F00A3E;
	Mon,  7 Sep 2026 06:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761369;
	bh=MU8vTnQ4SCG40k3kEVDcMjU9vE6Mm32ui6oD0ivsqAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TxJVmaxXf2/z7qqsQQ66XgHCtelNQqPDkAdBTJK1oBJM6KcFZfUqh8XvDytAy6GDh
	 4t5KvbQnQ/1vz/nTLJRVdBpMtcH6lGLx+hXmjaAMJ/KyB6ABqapuVYEX1GPfMPA+Av
	 OE3DJBwaT1WeG8gWjmnt7LQFsW3T1d0PFnCZYN8Ti+n6RS4/GtHB0N73Wh26H3a9by
	 ZSXY6OjlwfXvS35EVkX8IU5qqd+dw4VADEYbD2yQHUEIYddnFJq+yoa89kyjg93MUB
	 N8QwKL2DoT+sCpR8Z4LZg8L/YryBSWthu/pfd+dd4py+tPujqSicVAyfTLlFGc4u5e
	 kfUSnR3JMkh7A==
Date: Mon, 7 Sep 2026 08:09:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leng Honglin <lenghonglin@axera-tech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Zhicheng <shizhicheng@axera-tech.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, hlleng233@gmail.com
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: add Axera AX650 SoC and AX650
 Demo board
Message-ID: <20260907-portable-moth-of-passion-ecb1bf@quoll>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
 <20260901-ax650-v1-v2-2-993bea305476@axera-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-ax650-v1-v2-2-993bea305476@axera-tech.com>
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

On Tue, Sep 01, 2026 at 05:19:29PM +0800, Leng Honglin wrote:
> Add devicetree bindings for the Axera AX650 SoC and AX650 Demo board.
> 
> Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
> ---
>  Documentation/devicetree/bindings/arm/axera.yaml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

No replies to my comment on patch #1, so dropping this from DT Patchwork.

Best regards,
Krzysztof


