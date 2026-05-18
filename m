Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EA8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSUOQkA4G9lIzr97crkRbWUMdPAUQSFiQh0ExbJayX8=; b=tmK3dcXlSIv7aVjMU9vvT08Oj5
	LlDy+UuBtQtwZ3jQBhqdfmV4lPBn0avvuzX3hir+kfnkxHuqUh0jbntJxV0sxdjEZWOGsUCDWoBKA
	ERDcEEyGGGkd+pfF7ahAAloG+1jJZwhFycJK01F4UTxIltWA6OiSrpvMY8gfMz1uWfkJtWFqSGIxP
	Q25WiFs94Uy6+JmIRXuHPhV0syu+u3wtvYKlGGsVIJdpXjr+fRPkgn/w/qlUenZTHeszTlQf5lynL
	nE2IcbMSMQD/3k6J09fm8vvj91eE+av3Ppr8nEL2umJrHlCLicYybALE/sSefO8DwIzwglIaU5PrF
	Hb/BX+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwkD-0000000FZ7U-1H9Q;
	Mon, 18 May 2026 12:06:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwk9-0000000FZ6V-2vFn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=DSUOQkA4G9lIzr97crkRbWUMdPAUQSFiQh0ExbJayX8=; b=ri
	Ayyy3R+rKgw8i3ipTJONzX3ese8qPk789uvh4TYpYGROjcoMq3F2WlHR/oIG5W5rPvTBszFgCHvmq
	uTdGs/DEWr/80pZc0IeD9WlvmONZbwZTkNdWQP+RzybYW9DfB4z6H+EbsS6i9d/BLY6Ab/Fw7P3f/
	Cxvz+zupang0j0M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wOwk4-003UCG-Mq; Mon, 18 May 2026 14:06:40 +0200
Date: Mon, 18 May 2026 14:06:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [PATCH] ARM: PCI: expand single-line pci_common_init() wrapper
 function
Message-ID: <6b13f087-e865-4afb-bc8c-504eb268ce8e@lunn.ch>
References: <20260517235916.57178-1-enelsonmoore@gmail.com>
 <b3c8c216-d8e3-4ee9-b4bc-1080f73592dc@lunn.ch>
 <CADkSEUiSrvP78rNZYQ=j7hQbgMedLzpqM_KgKD-nCLEXbi68AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUiSrvP78rNZYQ=j7hQbgMedLzpqM_KgKD-nCLEXbi68AQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_050645_731916_5604A0C2 
X-CRM114-Status: GOOD (  14.59  )
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

On Sun, May 17, 2026 at 09:20:46PM -0700, Ethan Nelson-Moore wrote:
> Hi, Andrew,
> 
> On Sun, May 17, 2026 at 8:42 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > Nobody seems to call pci_common_init_dev() without passing NULL. So i
> > think it makes more sense to rename pci_common_init_dev() to
> > pci_common_init() and drop struct device *parent parameter. You then
> > only need to change pci.h and bios32.c.
> 
> I considered that, but decided against it because it would prevent the
> code from easily being updated to pass a parent parameter in the
> future. However, given the age of the affected platforms, that is
> unlikely to happen, so your approach might make more sense. What do
> you think?

These are all old platforms, they are likely to be slowly removed over
the next few years, and then pci_common_init* can be removed. I don't
expect any code to need to set the parent. And some new board does
come along which needs it, it is an easy revert.

You could also include a tiny patch which removes parent from
pcibios_init_hw().

     Andrew

