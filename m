Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7461AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfmhg39OXz6idRUtZ/yz7s9wg55pQ2awUJp2Z5oo0Mk=; b=i6ahnBWtjWLDOAAOIdHjy2Ek26
	Zwf4eqD/KRpdDLirro4eyg5PYmnvEuZrTSvLRL2YZ4VvxAx88+ZC1WYcG97nehOUpNGse95TQQg6X
	FLjLrwfNR0OgLFMHLGOrxdAAMPSQtrD8ES/Q0vHv/RaKxyIuFynJRiS/QxOo3dV3Xqq5HWiOV6l8F
	ecxHBY6XtkgqZd7Q8B9XHtiy3kurulPp7ob5jA2Lu9j3c6sl2S7rUxH5O1oHCICMVsy7g2Wt/Mgi8
	f+ZZO5DUdJIjKrZcKOzpXNswepiJ4UJMmu74Rsyvb9rgDnxO+Ah0AFMrSbZAedkgncCW4KXljAg8l
	kFQG/E6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBQI-00000008UVG-14gI;
	Mon, 13 Jul 2026 07:49:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBQC-00000008UU3-2LmD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:49:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32EB040378;
	Mon, 13 Jul 2026 07:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93831F00A3A;
	Mon, 13 Jul 2026 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928988;
	bh=Rfmhg39OXz6idRUtZ/yz7s9wg55pQ2awUJp2Z5oo0Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LYJfhOg+WG9R3Wi4cJ985Q6VWKdmpp6ETkmF7dw1JK/JxoCfh+SG5Ly8oVGTdiQFh
	 qpjr+atMbSqd5m6rvKffRbwcEn6xOm9UmhJF1Dh0GZa1mJKkmt+1I+wdlOQDAIOpSw
	 BGEUYyrRt9p+TP8nyz5ywrSN6xbdaBvbv4sQCeIyYT7E72IxDkWnDTp/YrxPq4m7vf
	 R7n3ew/n3AhHglHjjbOdJCau7HRYXjdSfAzvn8dLZr9RhR+PaGpSzEMZGci+EeOi5F
	 S9olo6B8ALjZgUmg4IViN9D3avBE6CtpS5KDYsd3FaQYSijmweOyahEwTNAfYuZAXt
	 bpxm+fQoubt4A==
Date: Mon, 13 Jul 2026 09:49:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic
 KTS1622
Message-ID: <20260713-literate-influential-kagu-59fcd5@quoll>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-3-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
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

On Sat, Jul 11, 2026 at 10:59:31PM +0200, Marek Vasut wrote:
> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
> expander via the I2C bus for microcontrollers when additional I/Os
> are needed while keeping interconnections to the minimum. Datasheet
> comparison suggests that it is compatible with TCAL6416, add the
> compatible string and TCAL6416 as a fallback compatible.

Your commit msgs feel too early wrapped.
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


