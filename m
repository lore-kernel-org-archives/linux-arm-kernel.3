Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2562C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSolkZmWqoKEZ4Igm2OJFpw3akejzWhjLdzndyZnwec=; b=3jXTFsJZ5rUF6IQEUBxpwUxGxw
	xevm/1A9ZNibZljkhttt+r7ZtvR7IqxzpKAMxQZRqzRolvdZTUKlms41oNvnNPqNg2KeBhP7AuWjd
	cbUoJ7Vc4OzgkesCXSOJSCFBjiDaboVXvl2DrHGIhIE33FuTwzhhQJ47cRkKGbiGKsH9ZDDwFzOm9
	EIEHQcaEYq7IAS+ynCvpxQpIV9DIMVH88t7HoAKiKhSkFXWdUNBqqw3MZn7QENT9sQf/rc5KQIZB0
	+SSisT9s4V1Pz+dd5uXq28ZgM92Kip50mLEVr8lUDM7+geoLmLMouLPRYOyqLMnbyagSe3hk8M1UE
	ljyUXA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QD-0000000DQ9E-3PYy;
	Fri, 11 Jul 2025 01:19:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzNg-0000000D7VH-0ePL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 22:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8922C43C49;
	Thu, 10 Jul 2025 22:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426FCC4CEE3;
	Thu, 10 Jul 2025 22:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185079;
	bh=OEb03LJtTJw0ONEHHTG78Zyys2/QnlVxenFbD3godfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jU7cErl5Gpt+790hNyABbyqH2l7NZnhgjCIyhAanTgMlvGnvvyvCp8blVM8ICHzeq
	 ZA9p9vb42SkHA2jT3v6k1Yf8PVWOe77GhdMh33rLlu5WSSjAf6B+zaAAQKzgXqjv6q
	 rLRrdgWFcwnt5EGN+yc85g3Yv/HPrbCux+ui5apPxf8520+M+rCakCS+PXWXv7jxn2
	 nHZEkAeaGNK7PppqymaicEi5WqouEZY2AC/B+ASt6KKiAK1XD62ZIa1avctnrQlLOH
	 SaUxmfzrPaQWM4ZzHtpVCWnFdvJx6++URYrFWwI2pTpqlR2dDdWLyf/pwBNnrtvFDm
	 RkWsByUc1Vc9Q==
Date: Thu, 10 Jul 2025 17:04:38 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support to
 also cover the LX2160ARDB FPGA
Message-ID: <20250710220438.GA4046565-robh@kernel.org>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-3-ioana.ciornei@nxp.com>
 <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_150440_210842_BE671641 
X-CRM114-Status: GOOD (  13.91  )
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

On Wed, Jul 09, 2025 at 02:17:27PM +0200, Krzysztof Kozlowski wrote:
> On 09/07/2025 13:26, Ioana Ciornei wrote:
> > Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> > 
> > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > two GPIO controllers, accept the necessary GPIO pattern property. At the
> > same time, add the #address-cells and #size-cells properties as valid
> > ones.
> > 
> > This is needed because when defining child devices such as the GPIO
> > controller described in the added example, the child device needs a the
> > reg property to properly identify its register location.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 35 +++++++++++++++++++
> 
> So here is the board? Why FPGA is in the board...

This directory is for board level custom logic in FPGA, CPLD, etc.

Rob

