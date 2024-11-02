Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27190E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8HlDci7UjBpmAeOp+qF0jmoPcBIv+wyf0SDzAMonfc=; b=XGiEjs7eetJkCp+ywjrlTQRhQ6
	T7F0mYfwlKIcnZdj3qymNwepH/sI+dhxFt63CJJE7/jtwT1fRL1XcXmV6gzKi4JrvMo0zqvCvegal
	CnvOeY7wFQXZJQGJWkypUBjvcpirw739AJ8W/SfIyjN9q2EvreSkGQu57erBcsg+Rih7amozN1FI/
	Kx4aBFB70tVp10Y8xF0e4ZQ5ofuUoyfJt3p+shlAWKrVc1Knd2nSaQb83CoMO3FkFlduAoB9JhjoL
	yxhd2aJdbASwjZftWHDr6RX0Xa2pO/nNMUZm3mBG6Pv4WbOtmGy9k8EDMXg9mUsnOW3vzXmxCbrLa
	MgKYlUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dwi-00000009kjQ-3dcI;
	Sat, 02 Nov 2024 13:13:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dv2-00000009kW7-1qHW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B533A400B9;
	Sat,  2 Nov 2024 13:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21A2C4CEC3;
	Sat,  2 Nov 2024 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730553115;
	bh=eGFck0cKd1Wy64d/Ev/jSEbK3IIKOXA4fI7Uzfoz+9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUHv4s6eRD6BBzQHjsh+cFIyMNUx1BNkT6PJb+Vs/t6ALkfudA5Wz7c0N9VjIqXvE
	 nwOIv10w8osITYi4ymFr3BrogeMuR3Ekn+PVgFwp/7WwdtYV0wctd+0vWlEHWX9Jgt
	 GtNTStE8UN/7qVZZq9QE0hDg/d/QAyjzR0ccjazeCmeRd0QanNktUhWN6pzQ+Qp8ET
	 0WPwx9TwPKdiXKesmS8jSlfheWbruBuKz9jSMA9ZKp+jk9LSQLIH9B4DZStMRLxkNB
	 AwvsEGTXK4Qccaa9MEPrbx11qUKk2x/EV+y+08s+nkgAIgismXVnCzbUEJa00tvtTy
	 NI8Eimmavnz1A==
Date: Sat, 2 Nov 2024 14:11:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Apple SPI controller driver
Message-ID: <vzulq4ewdbrk7qdurtypxpaoe4jsswddfprtdbudoxipf6d3ya@4gnbmr722pig>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_061156_564163_56D797C7 
X-CRM114-Status: GOOD (  18.25  )
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

On Fri, Nov 01, 2024 at 08:26:11PM +0100, Janne Grunau wrote:
> Hi all,
> 
> This updated series address the review comments from the original
> submission in 2021 [1]. It adds a new SPI controller driver for Apple
> SoCs and is based on spi-sifive. It has been tested with the generic
> jedec,spi-nor support and with a downstream driver for an Apple specific
> HID over SPI transport.
> 
> As usual, I'm splitting off the MAINTAINERS and DT binding changes.
> We would rather merge the MAINTAINERS change through the Asahi-SoC
> tree to avoid merge conflicts as things trickle upstream, since
> we have other submissions touching that section of the file.
> 
> The DT binding change can go via the SPI tree or via ours, but it's
> easier if we merge it, as then we can make the DT changes to
> instantiate it without worrying about DT validation failures depending
> on merge order.
> 
> This is mostly Hector's work with a few minor changes to address review
> comments from me.
> 
> [1] https://lore.kernel.org/linux-spi/20211212034726.26306-1-marcan@marcan.st/
> 
> v2:
> - removed '#address-cells' and '#size-cells' from the bindings and added
>   Rob's Rb:

Where?

Best regards,
Krzysztof


