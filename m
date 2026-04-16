Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A06F8A145
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/2s1VZ1wMNNJ0dQlyWl/e0Y6JTrFC1YVYPGmXNT3gM=; b=kU22HI/nYLCUWR09COGHXxutcG
	EfDyC99si4CJjMHEsETlHDtzrYGRxxtLJcoBT4X8QoqiRhEPhMKopdhN6rrquthDZAWcMLrsxWe+v
	oByTZPb5R2sNa6zyfydCOTv0h9p1n2qUwceZeM4Xf6x50d1CLKGQ55+ZOjO49AOJEKR5Ez2j45Ig2
	sntSms1x54qz5mbJyI3LLUMb0QlfsMvHQVIm0/r7tzskL0myMRb1YUWgM70YYmGjhiQ4myO87qRzq
	Z5Hn53fcJ86eZeGbuWAt5En6MaUuO26StF8jtyS48wu8UzDi9CqG0drlLXB7e7zOD4Fb+VvCZGAQR
	vdpfTtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIfo-00000002DdU-43N2;
	Thu, 16 Apr 2026 09:06:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIfo-00000002DdO-1OLK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC83C60126;
	Thu, 16 Apr 2026 09:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3826C2BCAF;
	Thu, 16 Apr 2026 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776330367;
	bh=jdvOEzFNQCnkjiaq/gjCIrrpDBLRp/B98yKiskUg1Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKjANYqgXYLcM+Vu6dT3zaOm17uCcf5i5yRVA8jQLAj/7AjPuaOpFSsCkTxsPvlmO
	 4m/CM47+1jCQDe/pv6hY+RZbVTCuPHo8cBiaqgiAuzhNc+U5BkT52hsdhihUyRPkiq
	 OX6PEj9BbE50j/yRJHwlDU40yfhj0p74Gwzg2s/uSjzK9nMZkSehFg1MylQftmDcek
	 W09I3eyXBiGGyzkBHt7jpK63Q2NBowPCZtb5ba54lk0kMlwfDskezXgfdIH5D91wyK
	 cVZe23obJnTeq8xFUubqxTnZS205BZ2i6CGYjIl5iqFO/A0s6+3uuce+uDOAegZqFb
	 NZBgG3n39+oSw==
Date: Thu, 16 Apr 2026 11:06:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-kernel@vger.kernel.org, git@amd.com, 
	shubhrajyoti.datta@gmail.com, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
Message-ID: <20260416-graceful-warthog-of-superiority-62acbd@quoll>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
 <20260415-rectal-visible-a8ccb534a176@spud>
 <c973f9d4-9bb5-40f4-8f09-72e23f92cd2d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c973f9d4-9bb5-40f4-8f09-72e23f92cd2d@amd.com>
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

On Thu, Apr 16, 2026 at 07:58:27AM +0200, Michal Simek wrote:
> 
> 
> On 4/15/26 17:01, Conor Dooley wrote:
> > On Wed, Apr 15, 2026 at 04:26:27PM +0530, Shubhrajyoti Datta wrote:
> > > EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..
> > 
> > 
> > Why does the compatible have a "1.0" when it is in silicon?
> 
> Sorry not following what the problem is. Yes this is hard block in silicon
> and it is silicon v1.

Writing bindings: compatibles should be specific to device, not some
arbitrary versioning.

OR explain in commit msg. That commit msg clealy suggests code is wrong.


> 
> > Why doesn't the compatible contain "xa2ve3288"?
> 
> This unit can be used on different silicons too.

That's not what the commit said.

> 
> > Why is this device not compatible with existing ones, since
> > gpio-lines-names appears to be the sole difference?
> 
> There is no way how to detect gpio width.

Where in the commit msg are the differences explained?

Best regards,
Krzysztof


