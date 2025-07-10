Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB64C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTDM+ReYbQNANl3aFS/llf4q/ldyHVh7bI7dWXO8+pg=; b=R/wQxyea/t8QxQkrxxoC4GrZAQ
	ULoH9TtFW+0Ll09kGRQBNt0AcBCdZ0klQSCY03hYo6FbSAv8ZcR7dlh6QPaHMiEq5aRjCxg8/vMNW
	2rIM0O0Me3+TZvVEQMWtuKLQjduNGaWsP6HHiOe/hYpmwqSqdPx8+3cfi/qcxsJ/XQsTF7Gf7vlfL
	U4DTi14QsO9wCq7Yjl2fSrZJGgFq3gOq0d3ehWKrGhOiAg0+z5J4kkmWZ1TTmnZyRef9RXt3XbnuZ
	vEE5P9kswjJX/OiTNRdyoFn+yC11BwC8v1uYNAEw7ccNU/S5BzU8e2frocwda3Ve31mF+gWS8eioJ
	O5jVYPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu7m-0000000CQQY-03RG;
	Thu, 10 Jul 2025 16:27:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZs0R-0000000C4oo-3sVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tTDM+ReYbQNANl3aFS/llf4q/ldyHVh7bI7dWXO8+pg=; b=rUZsamgDkOyi5ReaRFUnBeXRwF
	8yLkt0kON+H7Hh2Z22SSUx26F2ZDuW3yWhKQFWW+jy3Qmv1T8UUf7+W6L0KCimIL3gGgyYJAMFSsu
	ghRX7uGj99gWYL5DJMsejdACTllVwBpXNDYxjTLo706jUr5uFQxOBLd45jJmOCCUAKms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZs0O-0017oV-Ku; Thu, 10 Jul 2025 16:12:08 +0200
Date: Thu, 10 Jul 2025 16:12:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <af9b69a7-2e8f-4cdd-a3f3-6375ecfe318c@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-6-ioana.ciornei@nxp.com>
 <898af9ea-9b90-4d1f-8e0d-a8e0686d72a7@lunn.ch>
 <o5v2xdlrtjcgcd6usrfmtq6qffyigudvx3flhhetnd4ufg2mcx@5tem3jrlpxw5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o5v2xdlrtjcgcd6usrfmtq6qffyigudvx3flhhetnd4ufg2mcx@5tem3jrlpxw5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_071211_959476_06CDD9B5 
X-CRM114-Status: GOOD (  12.93  )
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

> The FPGA does have an ID register that we could verify and match against
> the board type that we expect.
> 
> On the other hand, I am not 100% on board with the idea to check this
> from the GPIO driver which teoretically should only touch its one
> register. Maybe from the parent's driver we could do that and prevent
> the probing of children if things don't match up. But this does prove to
> be complicated since those drivers are simple-mfd (for LS1046AQDS) and
> simple-mfd-i2c (for LX2160ARDB). And I don't think it would be wise to
> add some specific board logic into of/platform.c.

My experience is, DT authors will mess up and put in the wrong
compatible. And the wrong compatible might be enough for it to mostly
work, so you end up with deployed systems with wrong compatibles. It
then becomes difficult to actually extend the use of the compatible,
without causing regressions.

Also, checking will catch putting the wrong bitstream into the FPGA.

So if you can check it, do check it, and return -ENODEV.

   Andrew

