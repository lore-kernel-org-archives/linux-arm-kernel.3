Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82638CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aDrtWvspL+ZX4Qcvf78iH9BXevEQRUYdtv1Km1mYtM=; b=lXNVR8m+U+eIdu1AcoXg9AWV30
	98S+5E7nUkyEOpH4DZZvURWocpIYqzaO0Wm7gTTPZHxWWXc8VC9R8SurWKHcloGIwcr4eYvKqSuWn
	QIkgtbxLhM5V+KfIlQNRdkMPWDZsB8/IyumM8ccZn4eqc/e28R/sPYGyXe07c4zC1xeHjcDZihAqA
	OXnWunwcdrGKZRw/UHA4SagPBesoj0QtOZKr3buZVB4cizrWjN+oKg0o5Wo4t7zHBNdzNtfcqf95z
	Ci0iAg8qioEq4WNSwBROZCxsy3Y3065TmdJM7Gd+/xF77PM+ab95h4uckbfVbVCYCBIkGFE+yT59k
	TtbNKMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOosN-0000000E5MU-44z9;
	Mon, 18 May 2026 03:42:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOosK-0000000E5LZ-40xm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1aDrtWvspL+ZX4Qcvf78iH9BXevEQRUYdtv1Km1mYtM=; b=t1N1M9hEYq8OyQRZrB5+n9/gMK
	ntYFmGQwz+tizokC1g06we81O0Tyh3MNi4T1+gDa74aoR7sx8GPIyqaJS8/ZfMDJA3S8eAVTBdABa
	5Jf2NzTUNk27bF/1u1X3zGx5AI+zN2JuRAu4OWXQjJO8CEg5i4aG7uBErXfz3cSE9bRk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wOosF-003Phe-30; Mon, 18 May 2026 05:42:35 +0200
Date: Mon, 18 May 2026 05:42:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [PATCH] ARM: PCI: expand single-line pci_common_init() wrapper
 function
Message-ID: <b3c8c216-d8e3-4ee9-b4bc-1080f73592dc@lunn.ch>
References: <20260517235916.57178-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517235916.57178-1-enelsonmoore@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_204240_998320_C27077AB 
X-CRM114-Status: GOOD (  12.74  )
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

On Sun, May 17, 2026 at 04:59:11PM -0700, Ethan Nelson-Moore wrote:
> pci_common_init() is a compatibility wrapper that simply calls
> pci_common_init_dev() with an additional NULL argument. The comment
> above it implies that it should be replaced by pci_common_init_dev(),
> but that has never happened - there are no callers of
> pci_common_init_dev() in the kernel. Make the PCI code more
> straightforward by updating all uses of pci_common_init() to instead
> call pci_common_init_dev() with a NULL first argument and removing
> pci_common_init().

Nobody seems to call pci_common_init_dev() without passing NULL. So i
think it makes more sense to rename pci_common_init_dev() to
pci_common_init() and drop struct device *parent parameter. You then
only need to change pci.h and bios32.c.

     Andrew

