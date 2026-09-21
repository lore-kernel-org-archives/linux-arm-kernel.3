Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E8CC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPlV0TdnCTuH8vfvhnR/rAYRlqQVlX7OjVUEqZ0RXs4=; b=HsBP1tmhcxiKIC6Z2425o4HW8C
	iFoTfu6RetPZu2EuvyQVlCQ2wi9Ky9lWOWjYECKnHKMR6tWfJH85gF389/6FWFBE9+KJMKxeOuYON
	MT4ACrdkEso3jVBN/PdgaSwzYuNxOl8tE6/ZlecmiV+kDKRmPSd2XuoGUPBNs3FbToOVuUtWmoy17
	HG/E8UMm5cis/hAxA2hStXYBR/E1nBZvTz0prcEkHMWA4YBlQJNW8VaJgKf5sP8XPMop2Li6BRKJH
	9XZaRJnm4d1NqlUllHEF8NGN16850QnDGk5REj+8YpARlxNNlwQfDfDPJO/PIXOlPWJG5FJTGnKUS
	YpJPt5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8l6v-00000003PPD-3keo;
	Mon, 21 Sep 2026 20:59:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8l6u-00000003POj-1UBO;
	Mon, 21 Sep 2026 20:59:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6509F60008;
	Mon, 21 Sep 2026 20:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5056D1F000FF;
	Mon, 21 Sep 2026 20:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790024375;
	bh=yPlV0TdnCTuH8vfvhnR/rAYRlqQVlX7OjVUEqZ0RXs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Oa8RQ9a7JeDDYSLc9Gu6ElBfI55EIEWZCl0XXhIvLnkx/PsbHR8FUA7cbI4+JMOlo
	 BCXpIxl+mgv2W6OOw/MjR3dcAQkoEj5pHbX5ozf8bFB4ASlt9brFAfwrQ7HvCeJg1i
	 H6gU7R5+l9l8foq8FWwNQ+Fq7EOTq/9/KJbt2pPTz8yt+x7ekWsTpEtM3CGZSRmgtM
	 NR34unzMDglHo4oaSzutRTkCfekeJ4e8k8sQEKlOOcaFKNJlAynAgaKDayG7gBPqhN
	 ESVQ8NaZWqlqNNM7hfC1Zj/EYWSMrMI5UDxUyCXRuNzXr1dqDvt4tqPPEisVGLNF1P
	 /DrimOFamdqHw==
Date: Mon, 21 Sep 2026 13:59:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for
 fwnode PCS
Message-ID: <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
> 
> At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.

Looks like the review for one of the patches failed so it won't be
emailed out:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com

Are all of the issues invalid?

Once the AI review is cleared, some human will have to review this 
and vouch for you as a maintainer. Better still be your co-maintainer.

