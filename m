Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90143C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5XVkbYgLEYW3LIKFIi/T5Ml1aOHZnnw28sedEu/jSc=; b=usRyNYjawRw6rD7UP43vWGtVQX
	HErDFLocHFNWkSy58fPwgr/VvcA9RpV6agF/1w4SXumfN5hl/RMd+BoBkQ9EvJWom7dSPusLGvJ1S
	uECU+/QubwBUgLtlsCpEobblMzcIxk0Fw/miqyw1q3JGlPVVsD6QP5k8OAtg1YtTeD5ntPnHSMsBF
	63SkYJs1vkhsCW7Ib4HFIjULbLl3FQbJVzbzc9iuiSFYEvT8DMUHl03dVDKeLoWUPjNn98/Z1zk5Q
	xptoNeSptN+4poDDBaILfYBD9/mzA5b9UdlclJsOde2hipa5jmDsLTij12oR1pzYCr2Eazdve3uS+
	oc+TxA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hc-0000000998K-0KKc;
	Tue, 21 Jul 2026 10:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hW-0000000992U-10DG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EEB840B1D;
	Tue, 21 Jul 2026 10:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2051F00A3A;
	Tue, 21 Jul 2026 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629669;
	bh=k5XVkbYgLEYW3LIKFIi/T5Ml1aOHZnnw28sedEu/jSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L4Kw5CsvdeSoUaHQ7HDmn6PTrsAdovFDggrIfNNcsUF5UUBG/FiPy6T/a0T28wd6P
	 AyCjPervGp9GQXIVaOmj7G29UAxcqI/Nu7CEk2gl+Bo1M0C70BfCY7fwdwfrLkqD0P
	 NxvZcTd9Itxv55Yb4AcC1NQRrDoTTPquVGVKKGdJ5D931coTWd8IoJHZaIPH+fPo4n
	 mojRiZWJOs5aXzR2IExBJuyBN31ERgeNGaDtSd+IyHlNox8tdrMFVmHVMdYibEgHw3
	 KGv02jhzt/WPwIlVFz1cbNfLsxNoXU1nt6T1GXVLyYodKfzg7H0PqBLlEm9bC2qiJX
	 oT0Le1IK7JyHA==
Date: Tue, 21 Jul 2026 11:27:44 +0100
From: Will Deacon <will@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: Drop unused assignment of
 platform_device_id driver data
Message-ID: <al9JoClWlCgCK9Vx@willie-the-truck>
References: <1420ce71c3be5056a384be9c733f5df3277bf61a.1781690829.git.u.kleine-koenig@baylibre.com>
 <al4frY52ASoPFWAS@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <al4frY52ASoPFWAS@monoceros>
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

On Mon, Jul 20, 2026 at 03:17:14PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> hello Catalin, hello Will,
> 
> On Wed, Jun 17, 2026 at 12:28:26PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > The driver explicitly sets the .driver_data member of struct
> > platform_device_id to zero without relying on that value. Drop this
> > unused assignment.
> > 
> > While touching this array use a named initializer for .name.
> > 
> > Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
> Do you have this patch still on your radar? Should I resend? To someone
> else, too?

It's on my radar but my inbox is still a wreck and I've been focussing
on fixes.

Will

