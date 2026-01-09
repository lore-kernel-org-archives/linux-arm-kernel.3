Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B600D26D8F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoU/pYR/8Cjf2D5K13/a9aFfWsyhDLaSPlVF5yOnY/g=; b=Pxqf69qzW/Q4vipdR8WXfORH/o
	iLI/lWr4WWu1S1Bv/ZLfWJGf2vh/zj7SJdQ/w+J+OW7yvxhT+9u0A+jEp333+MpwYgbZ7HNBDZXk9
	ZdKFJodhiXziCWf18o+mYmhIVRpXnKvQsZ2ndyAdgzke/aXG9S8BaSP92KI/ozJSjNZJY7MD2esEe
	0+3N4qFVJcgN+jtORvX1xMo724HrBZYV5gU/55/mI+U8HqyYdtgErXEQZsmoIDy1uyR9C0cbcuuyO
	ITuHSC3gy6W5GFJGmi8/M1hFd6B9eS25sudIqSxvLeWufqyUP/j3d/VZcv4rexRw98e3LEPy9UcY0
	LyPc0P/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHDd-00000002swS-0Rhl;
	Fri, 09 Jan 2026 18:28:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHDa-00000002su9-11mw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 18:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AoU/pYR/8Cjf2D5K13/a9aFfWsyhDLaSPlVF5yOnY/g=; b=r9CsqDaoUY730tg3SWrg8c7dpA
	n/bCi+XeY9OOvMvpx3OVeAcCe8afkdzHtULOeScAtoUSD3v716IwgcQOxmljCavQStYwlAW5P/Zmb
	b1LO4V8xOGVNaOG8FjizxFDVdOHs+fQ0wkwrNdwfVaAvHFSPjsfLLPxJLPZzT+ZfIOME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1veHDG-0029Zc-9h; Fri, 09 Jan 2026 19:27:54 +0100
Date: Fri, 9 Jan 2026 19:27:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
Message-ID: <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109080859.1285-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_102814_288214_0F44B9E0 
X-CRM114-Status: GOOD (  10.29  )
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

>    rx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
>  
>    tx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]

You need to add some text to the Changelog to indicate why this is
safe to do, and will not cause any regressions for DT blobs already in
use. Backwards compatibility is very important and needs to be
addressed.

> +  eswin,rx-clk-invert:
> +    description:
> +      Invert the receive clock sampling polarity at the MAC input.
> +      This property may be used to compensate for SoC-specific
> +      receive clock to data skew and help ensure correct RX data
> +      sampling at high speed.
> +    type: boolean

This does not make too much sense to me. The RGMII standard indicates
sampling happens on both edges of the clock. The rising edge is for
the lower 4 bits, the falling edge for the upper 4 bits. Flipping the
polarity would only swap the nibbles around.

	Andrew

