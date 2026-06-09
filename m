Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3EBCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4QYzDYf4/LUWmcbI+d1Kkrx+Xii4UCyajoKUl5bZMg=; b=2L4phEyr5k33Pcl7ykAyMpH3OV
	cTin/QHkPlQAazeEcksod9MOjfXtn3P0X9uVDuu7oH8qPqAgvNiHR8mI951rcd9V65shEqsOQrrCJ
	M2BIWFLp8h2ma17tkON6/MW7qMEycA/knQ9Xn51DoAL0jBhegcYgyyekq81CzMsXUkBcU8bC3AsGP
	xh75LAy/4cSmm/l8EHzOo7BstyGmGoplMB/Ar3b3x7frPlvZr0qNOH3QHPqhdRvoZEWboLlI3SQSu
	EPz7WMd3oQpsBtfAmkQmPSwydOH375anmzzzE7+troPlkBc7J1m84gJDNTgTc69v2RL6ABNDXkxh5
	oRQMSaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvFx-00000005Uiz-1AUR;
	Tue, 09 Jun 2026 12:08:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvFv-00000005Uir-27vX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:08:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E33443215;
	Tue,  9 Jun 2026 12:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE911F00893;
	Tue,  9 Jun 2026 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006911;
	bh=z4QYzDYf4/LUWmcbI+d1Kkrx+Xii4UCyajoKUl5bZMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6zkuvUMo1dX1Oo/ktt7gDmslK7EFxj38ahtkJ2xhdF/GSRgn25j7AHTBZmIcJUMT
	 JFyLmyMZMs9YbeBIkOcAoAD29R0IWlkwfFuz5Pno6wfrGhFk5aJ383vGdJW8jGo+F1
	 Zfw/8DdrADuIzwPS+e/HO+qR/5JutfPOXuNR7XR2HYiVFBE27v+Ag1YQDLgMfSV1nF
	 iDwyHxQYYScK5TJUtxONzMJ3kgRjFAatKT2/r758I9LBWIrhgac+xJLIUiOQV+MpR3
	 QDc9paWZMSQzQXiSFwxiuktCDkiW0l5ci9ZP+en6IGlKmLV6SIQzLFexkNi3N9FVRf
	 iloZ0b3GkLgCQ==
Date: Tue, 9 Jun 2026 14:08:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for
 v7.2
Message-ID: <20260609-beagle-of-splendid-contentment-bbaae3@quoll>
References: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
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

On Wed, Jun 03, 2026 at 11:25:29AM +0930, Andrew Jeffery wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoton-7.2-devicetree-0
> 
> for you to fetch changes up to eae82b6e8c2399892e145195cae9aaa0b960fdaf:
> 
>   arm64: dts: nuvoton: Add Ethernet nodes (2026-05-18 23:18:01 +0930)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof


