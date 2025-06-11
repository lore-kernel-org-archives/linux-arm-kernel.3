Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F6AC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFubRqLaTRPPao3ADmJTjzXg7NYirox4Cx5yp8T1Po0=; b=hwRSF3HMnI7V5S7u5HBcvGyG6e
	62em4nd6KA4FaYxXkRKevP20GlUAIu0HtiRQbPPtAQlkH3x1H/AkKRlsQZ8m1NKbbz8dl6L6gkryO
	Om8JyG22hmxB0yf3yPnf5k0RzbU9fw/Z8GmQANIC6NsGfy4AM23/q8t5fbgrymFuZs2H6p9onRzcU
	rlU2OJDmWEegwqU77K+pBNmcirFyzy9PYnehJWaFg/epIRU3MEqteEBtPyhh6PX9NXYVgDZNiM4S7
	1clTIFCqj26WbYRL6wezXtwTpyNoxfdjpMxqOrIK3/jgi7qQS2dPE0MgMws7H7v6ByrBIbLfyQ9UD
	MimLgrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPH4l-00000009L2I-3gy2;
	Wed, 11 Jun 2025 08:44:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGuX-00000009HSk-0civ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38A64A51527;
	Wed, 11 Jun 2025 08:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5311AC4CEEE;
	Wed, 11 Jun 2025 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749630855;
	bh=YjUuaMXRjj3yUKM1oXzB5tryE1JdcUrQb6CsDD4lW7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3ULcI9IJyU/3l5FNnF21dookZoXpT0aM6QPxdT5KR4dj5+MwmuBef05fRcY7CvZK
	 UeBU/WbML8g8V2ZL2h+sTSB8laoO7PDxiX6kvecKeUcl2IAD8GbCSkN9SavXl6WuY1
	 4MeUMVGBJiaY3jt32AJp0OJWQoVnQ6JEEdcJiQXz2RsWlMl+HyL8g3Otn+G0/gdz/e
	 eKJOq//e/kg3jeadV8QCPHBdmUKKIUSVGrkK1ULlLjfVMh6zbV28tPRlyVBMBK2u6V
	 L7MgsqJc0Pbe0lggsEFkW89fWPIeryKYmGkJTIrzKXP7Vk2hBiIfNccbDW/7SsIYEg
	 IaiTDLO+Cf+uQ==
Date: Wed, 11 Jun 2025 10:34:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
Message-ID: <20250611-serval-of-immortal-novelty-055c93@kuoka>
References: <20250610091026.49724-1-jammy_huang@aspeedtech.com>
 <20250610091026.49724-2-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610091026.49724-2-jammy_huang@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_013417_267069_5DC2CE00 
X-CRM114-Status: GOOD (  13.79  )
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

On Tue, Jun 10, 2025 at 05:10:25PM GMT, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


