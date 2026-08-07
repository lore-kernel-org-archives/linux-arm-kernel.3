Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B0C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlpEb48WPTayGKdm4eVdxNznK3KImhnyyeVW6wCAWfk=; b=IUQJjzXRpcXlZA5Nlic2KtasdN
	NvZcZXy6WFfArM15iByi2BfvUelCWM0pcxtC65f4VI+nsRdDqpuHr0GXAE8O57NWY+jVNhIDNhKpK
	RmyR+5uz1AZv/o+IbQVCPcWMBqE7w/KtzmgrMeM0zJTChzT/v1FMcvZ6SL9FvZJI10hXvnUFn88ss
	4IjuqFXqIIB8o2SFzZOuFNDtEYZ0Cg7xQ2oyhSgUYg96VbgvTt/DHvzDtq4pJwZPINtEEtIhigI3U
	Q6Uf0f2uOmSSvcZsdSX5Zos2jg/a+5nCqnsuPzLu00uZGN+jvAXd7EFbR3Lwgj14PU5jsBmEgaetg
	MlbF/cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDeK-000000078jr-2i2t;
	Fri, 07 Aug 2026 06:01:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDeK-000000078jj-0D30
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:01:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C809404CC;
	Fri,  7 Aug 2026 06:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2511F000E9;
	Fri,  7 Aug 2026 06:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786082500;
	bh=mlpEb48WPTayGKdm4eVdxNznK3KImhnyyeVW6wCAWfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T497BqIIxWI3YaUWHpUZRfd69wbja9MhBt6qFUib0UHQQAUTcP+20Ysn2Uj5XZBIF
	 bZUlgp10L/vfXGa14VhG2Nw+pjMj3IluXbhj5fD4pTCwNkdASrSXBpxTbxXDJArhlQ
	 WIujQ1EC+Qi3OBKnCB66sUQCoBPyTyPLl9FjxiF6nW55mpNSHUOf2pGQbZ4F9VbmNv
	 I4qx3NoXA7GjN2ajbRgN0ISOYvQ1hMmA1vCzWrJrTY7U/3ObmbYt0k06sh8xpOAo47
	 B+YM/pW4NEeXj7ArLsFDOcDuAnosAm/PaxTq1Ajx2DIkJgJnWlWjYbloPI9ayzFstD
	 CCB76+SIsIYWA==
Date: Fri, 7 Aug 2026 08:01:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: add Ambarella secure
 scratchpad
Message-ID: <20260807-raspberry-chowchow-of-endeavor-e57df8@quoll>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-2-6b09707c5fe9@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-2-6b09707c5fe9@ambarella.com>
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

On Thu, Aug 06, 2026 at 05:34:10PM +0800, Long Zhao wrote:
> Document the Ambarella secure scratchpad syscon used by CV75.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../ambarella/ambarella,cv75-sec-scratchpad.yaml   | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml b/Documentation/devicetree/bindings/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml
> new file mode 100644
> index 000000000000..4bfeca0ac3da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml

Why do you need separate binding? What is incomplete here that it cannot
go to syscon.yaml?

Best regards,
Krzysztof


