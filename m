Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F337C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M11gWjMC29nnRXaIzbq/854Gu2IQm5IrZVsomSvAMdU=; b=u6W9YnwErDnCIYmIy/Bk1Jt4WC
	MMTmDf+wJUkK/831qE2Tcldlz0GWBYw0ytSo7pvLZ47upJFLyAuSiurAvEQ+dEUBWYrRFbM/KT5r5
	N/745Z4zXSa05YKCT7IBX8tLarakBb4HfbiBuAInBizsv/Zlk+IEJfBQeDlYhhHmDp0DpQksqzkhW
	toGrQ0l6M4cSCt3h47ekk1LAZ14EWBJzpsgAV6SC24PJCMIwD7dDSwJXGS8nWnY3OsoYvF+MiWJpY
	HNFTJSXWS+wpyhNmsuj/bWLOPdWnqGiiPtSw7VdVPIDWllh0JfW2WmLYLx21saSfQgCjamNUEjkKs
	TWWx86Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGPL-0000000FKln-4A1P;
	Mon, 29 Jun 2026 18:08:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGPL-0000000FKla-1JLE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 18:08:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B48EC40ABA;
	Mon, 29 Jun 2026 18:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F411F000E9;
	Mon, 29 Jun 2026 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782756514;
	bh=M11gWjMC29nnRXaIzbq/854Gu2IQm5IrZVsomSvAMdU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dr7Z9Mm3bL0tazhOpF8JlDex5a30DXEF6LDvraoQyhrw481XdInDjk3VK/ygsrlD1
	 xG0t0aDO33LZqtzAXIJFKB9BiL7Ny9p9zrWakrf93VQeZwGDDuzygp8pwxA/i16tDS
	 8yqQ6Mxn3xi/I8n/V6iDawR8ZYqH13BDIPtVSXRK5Dr0pOAMhX8mSJ8BIsIee7Fcio
	 VaybNR0v4jYXHFCyZliNkSvQAJ3D49EH1q+EMThoKjqxEeKe2RWnkYnzCWEIIEMpy7
	 AZK3IJCVMJZW0ZIrrYu2kFV3R/dI78yTcOhgw70ulYHyHu5BwmCZQpq8ril9MWgjPj
	 reLTXlpGyusog==
Date: Mon, 29 Jun 2026 19:08:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Conall O'Griofa
 <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Update Xilinx AMS driver maintainers
Message-ID: <20260629190830.0d764d7e@jic23-huawei>
In-Reply-To: <0e4fc27a-9bef-4a78-9cc8-4d9c69c87773@amd.com>
References: <20260629140615.213750-1-sai.krishna.potthuri@amd.com>
	<0e4fc27a-9bef-4a78-9cc8-4d9c69c87773@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 29 Jun 2026 16:10:42 +0200
Michal Simek <michal.simek@amd.com> wrote:

> On 6/29/26 16:06, Sai Krishna Potthuri wrote:
> > Salih Erim is no longer with AMD to maintain the Xilinx AMS driver.
> > Replace Salih Erim with Sai Krishna Potthuri in the Xilinx AMS driver
> > MAINTAINERS entry for continued development and maintenance of the driver.
> > 
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > ---
> > v2:
> > - Replaced Salih Erim with Sai Krishna Potthuri.
> > 
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6b4560681b51..d8591066f182 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29458,7 +29458,7 @@ F:	include/uapi/linux/dqblk_xfs.h
> >   F:	include/uapi/linux/fsmap.h
> >   
> >   XILINX AMS DRIVER
> > -M:	Salih Erim <salih.erim@amd.com>
> > +M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> >   M:	Conall O'Griofa <conall.ogriofa@amd.com>
> >   L:	linux-iio@vger.kernel.org
> >   S:	Maintained  
> 
> Acked-by: Michal Simek <michal.simek@amd.com>
Applied. I also picked up Conall's tag from v1

Thanks for taking over Sai and thanks to Salih for work
on this driver in the past.

Jonathan

> 
> Thanks,
> Michal


