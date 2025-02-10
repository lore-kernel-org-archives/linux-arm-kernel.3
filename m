Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA62C021A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01lUzP8wdVQFGy/4bYY7OHZm7ouGxZ5M7LAy0u1RmF8=; b=2eso8XVCRYjcHD21kbIfR/SjWB
	WQG+Rji3g8xuM7i2zX2ckbo9rfwcp3HcGPbBO8P4/JPr1lMVxFsd6qF7Oqx/K3KCpWPMhllf04lAZ
	Qqm7GD2wRAlOheB6+5XCW452IIbH1jjm7RpwYShd6ZUrh2mjGFqVXzWHtS7HpyD1rO3Emj1Qz4Hjb
	ile+sewgeCNawndlvlGhasyjgBoXGRzncnmziq4cYA/xWv/mkdoifREEMKlVXBl6BukO8tUFXuYUh
	Y5RfYeJNpyXP1BZHCgL+OMcqPHJEMjIOqbsvulcgPHYkJpFrA27jL7O/US4cuEbPr515Ybx6wFONQ
	9Fl+eo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thR48-0000000H1Q9-1FqT;
	Mon, 10 Feb 2025 10:31:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thR2k-0000000H1Fw-3UV0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA9FBA40F31;
	Mon, 10 Feb 2025 10:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E2CC4CED1;
	Mon, 10 Feb 2025 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739183373;
	bh=33TmnyQ62etwSFwnvL/fzHi+qX4T+4T29KP7HM0RYP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPjhb7asSJnPsUiNzzeMLsh4W0FOdcbrjA2v90FR9nMGG6nTkaHRZuAiGK7YjEjJe
	 I6iUGB6Yo0PtwD1LqSd8aDL2J0j+8j7Tn3PFoCwWvkFXa4Z+vo6GhwbwzqeKNcDaZA
	 I/ReN7ESzLG6sF5Cls6YhjZ7wU9kZRolrxhULHFT5mXmdPMXbncAV/0LEygsJEQ5tQ
	 pqQ0lU/fH9a3UMFbKMxudZyjjZGweRkuAHNJghBZEkcvHBS7WZMLfbnEQTQQXhHCfE
	 3sg2jE7tgeU4aNU+Xw0J9ZX9+ZRxjgsGFoJ3JvYDEQ8HGUGbO2/0v0OR0jlTxNgtil
	 GaIOdG+5MfU0A==
Date: Mon, 10 Feb 2025 11:29:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250210-crow-of-famous-drizzle-a4bb03@krzk-bin>
References: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_022934_932784_85C8F892 
X-CRM114-Status: UNSURE (   9.19  )
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

On Fri, Feb 07, 2025 at 06:14:58PM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Additional changes:
> - Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
>   video engine to capture video from sources other than VGA.

Where is the justification I asked for? I made it even with bold font so
you will notice that this justification is required. Are you adding
these properties because you want new features? If so, that's separate
commit. If not, then what is the real reason of adding them?

> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.

Examples are not binding, so that's not really needed to mention.

Best regards,
Krzysztof


