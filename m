Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EB7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZYQOAJ6LqVx/y2pX8CakYIeDZQAZDDnBuPRyOAH8pA=; b=LoW9tOYtUBwe8xLuylLSs04k0s
	lgTx1/k/qbGpwRJVmuNPoAMME1gAN5OItaEbcV3XWEIJE1dXZ0P96oGDP65YA7/Vq/0v4x2QtAZwE
	/3fKI6rmRWOV4BwIRxNj1i20J6RtRp1aCL4nCpswhZx1iu6mP3bcdFl6udj5GZR+5KLoA3EAj0biL
	M2tElZjSN3kmrYdTWAkqJm6jADHtjOwmsZss4ecDTLUhRZyRxHFl4dAEXJI0RlHFH+3u7rcB53xy6
	Y54CAFzzeuL2a4zWwkwaBDvanLerMaAr2xcttdzy9aSEkwcJpsym1SM+x1J7Sly/czGTvd+t3HfZm
	XSkTSBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs8A-00000005bJW-2WrD;
	Mon, 17 Aug 2026 07:51:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs89-00000005bJ1-1B60
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:51:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9230960120;
	Mon, 17 Aug 2026 07:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258EA1F000E9;
	Mon, 17 Aug 2026 07:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786953096;
	bh=5ZYQOAJ6LqVx/y2pX8CakYIeDZQAZDDnBuPRyOAH8pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NU90Nc47IvDFoPD8YQ2vm1Bt10nUJvfBqtw/JxNTOLs5Qo4wB9UIk7hEGlbBqyXnL
	 73+ujLyrJY5Q+a97d1uqQ9A0TcickJgoQfLDET/Bb9g8k+iEYG3K2CXYiRgzPTWQFI
	 kidOAkkBOSuGLN96qzuxgeWKD4w3oDAN8j1jwIkXxOn2Olyp7k8YvnCe9YE5o2PQf2
	 m4sh1891AiQScZ9yGUNNxLbo79qSre2ixAV9ukGQsw3PYIh4RtxospXMkbmvtbJWZ/
	 GP8fsuq6jJ8CJLsqf5Sewb766Jbm4k7+WOh3yR7/GRJh9lIyq2wPkPMNSRTx0kJ24D
	 tJgqHFFSiBeTA==
Date: Mon, 17 Aug 2026 09:51:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
	Borislav Petkov <bp@suse.de>, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: edac: aspeed: Add AST2700 SDRAM EDAC
Message-ID: <20260817-origami-chicken-of-popularity-6f205c@quoll>
References: <20260812-edac-v1-0-03992edea297@aspeedtech.com>
 <20260812-edac-v1-1-03992edea297@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-edac-v1-1-03992edea297@aspeedtech.com>
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

On Wed, Aug 12, 2026 at 01:48:25PM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-sdram-edac" compatible and note DDR5 support.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


