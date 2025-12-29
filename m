Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AACBD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 03:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GnrEUv4bi+55mgugovFVEyUPy2XIupWUpfObnHg5e4=; b=VUlrzoVlsn4cCf3IBdZCNSacCH
	+Lyj/8D+qO/j9amOO1SqxrqYUJPWSlqcU0W/B+BtxIMFMpeqfOCak2x6DsSL/+XZT6YO8id7gVKD2
	9A0mOguoh0C7XPwJNLbc0ppCxyy5zC69OOcRcdOz/CXqQTNcwqrqpRKDzidPgO+pHVoju7k0huGiE
	d8hbGK4iYP4y7+xDjD/5RJvkCL/BTF/9nZikCvAkoAYbyDz+Q+pwnJKfl/zmJkid1E89lJBT+QEW5
	TFFTQM1FRB9RztGUiyBsQhbYnEKkLMka50JcBsBRiWx+pdc2YbIJNMezy4ea5Mh8W9c5fNyyGk0N/
	41FhPFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4CH-00000003IFB-12nJ;
	Mon, 29 Dec 2025 03:45:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4CF-00000003IEz-36xS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 03:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D062260018;
	Mon, 29 Dec 2025 03:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C092C4CEF7;
	Mon, 29 Dec 2025 03:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766979926;
	bh=gMAqY+eLWWkGTNdPByA5LgE8BZzt8IImI0FhJUWIwCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXQj7FZeFJLdyCcbkg47T/TL7P3I6md1cTwcWxhEk6wFWIBxGsyCcT/ouKl0kcjOq
	 Fx62JucQTDL2pKCt41loOYgm8y/cZJ+k6YdFR7obV8zwFLuoegxJKEhob72TDtqQ/l
	 paHwtFpW1vZah70W9VRgprewlwYOtzxlbe+qWKBsGhzRRLr+coili/cHU8vbz6c/pw
	 wl2bag5FPPsnj52dbOZ6lZ04WvYAOxm+6zqUGFRm3xqERpVBB2jcjoCpr5/hNwVbDV
	 kNhJ8DbiyiEB31F3bhn0w1qLlC2ELXaC0CafhlLSrj7gpM32kmrsisUb2iX9oxCxtq
	 CfXCpSAT9goYQ==
Date: Mon, 29 Dec 2025 11:45:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM
 SBC DT to rev.903
Message-ID: <aVH5Ua2g8WbpW3Ge@dragon>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
 <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
 <aVHqlnNGNGmaF14m@dragon>
 <b61fc304-26e0-422f-bb31-303e7bcbb824@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b61fc304-26e0-422f-bb31-303e7bcbb824@mailbox.org>
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

On Mon, Dec 29, 2025 at 03:53:53AM +0100, Marek Vasut wrote:
> On 12/29/25 3:42 AM, Shawn Guo wrote:
> > On Fri, Dec 26, 2025 at 11:24:29AM +0100, Marek Vasut wrote:
> > > On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:
> > > 
> > > Hello Shawn,
> > > 
> > > > On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
> > > > > Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
> > > > > board which implements significant changes. Keep some of the rev.900
> > > > > and rev.902 nodes in the DT so that a DTO can be used to support old
> > > > > rev.900 and rev.902 boards easily.
> > > 
> > > [...]
> > > 
> > > > arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
> > > > 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
> > > > 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
> > > 
> > > This is addressed in bindings patch [1] . Can this patch and the bindings
> > > patch be applied ?
> > > 
> > > https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/
> > 
> > Could you resend them?
> Why ? The emails are in lore/patchwork and the patches still apply just
> fine, don't they ?

A couple of reasons:

- The patches were sent one year ago.
- They should be in a single series, as binding change is a prerequisite of DTS one.

Shawn

