Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFC9C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io3H7eT8+LcVwxa4TUx68Yyzl1iwGXsQIYcZ6tFQJ98=; b=tH9+7jxKXMbdUL8ZVw+Ks+EcV2
	mov3CWHUxUv8fgJOTRF1mLMMbYZMvO+PelMkYetoD9mubTfF2ffjfN0n3iSrk1upKzn3zwRnADdDw
	5sGnghRby7qhJVSDzhhfvsZMVIoDB4dHzc7yldbDT3hmC4HYMsPzxJRvsHhU433kq9JojSmIjPIFs
	clI0zYLIQSqzarWkSmYD0Z9tx4/yLBVH4naV4ObN7N1j/4CfWOOgscI796r8ESO3IP+tA71g2N227
	ji3hSHpMVDmv2kZ3AiF+GBac9Mkl/TS9n5FC+M0XrfIc0sFpRaq5NFoOpCmbFgkYIb2AeAdyp/sPN
	B9CikKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dzT-0000000ELdg-00ib;
	Thu, 10 Sep 2026 12:34:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dzS-0000000ELdZ-27yy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:34:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F01CA43B84;
	Thu, 10 Sep 2026 12:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578341F000FF;
	Thu, 10 Sep 2026 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789043693;
	bh=Io3H7eT8+LcVwxa4TUx68Yyzl1iwGXsQIYcZ6tFQJ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=u1xLW18ZHX7/n1Wou5fWybTlwRYu6ZlLjZtXO8L23OFv40UOva766BrcpKgINEwrf
	 AhteRRgEUNZ1S2S4dJBbJX26x5fRnke9xFf26XrSZASXOHoei01unD1PQv+JG5dpM2
	 Mdw4hTSE2GPfyTpK9pcMOPeFuaHN8/0Cm9zpXfGk=
Date: Thu, 10 Sep 2026 14:34:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <2026091038-trailing-jaywalker-2055@gregkh>
References: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
 <40845ad0-e321-4e1b-860d-ff798f430c42@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40845ad0-e321-4e1b-860d-ff798f430c42@kernel.org>
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

On Tue, Sep 08, 2026 at 01:58:18PM +0200, Christophe Leroy (CS GROUP) wrote:
> Hi,
> 
> Le 08/09/2026 à 11:27, Bartosz Golaszewski a écrit :
> > The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag for gpiod_get() is deprecated. For
> > actually shared GPIOs, it should be replaced by using the functionality
> > provided by gpio-shared-proxy. The Freescale QUICC Engine GPIO driver
> > uses it as a workaround to access the GPIO descriptor already requested
> > by the caller of qe_pin_request() in order to access the private GPIO
> > chip data.
> > 
> > As the existing comment itself states, the user already requested this
> > GPIO and the only user in tree is the FHCI USB driver which does in fact
> > request it, we can safely modify the function to take the *exclusive*
> > GPIO descriptor as argument and stop using the deprecated flag.
> 
> This change seems sensible. I will take it via soc/fsl tree unless you have
> other plans.
> 
> Greg, can you ack the change to drivers/usb/host/fhci-hcd.c ?

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

