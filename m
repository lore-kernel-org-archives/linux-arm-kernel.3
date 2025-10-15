Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F18CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1qaZkX1700g4dn1D/gzvs0pnDtTldETwvN+nCYzCHU=; b=WbQmUCwaPF6b1Aa510Z9nD7G9P
	W/Gg4R/uaEW+m6Fp7D02P57D7i5twgZiNsEHvZE295y4y7nzBhUhK6Ugl1PATnqNDAyCBGA5dMtnc
	rO6bkEHF+uSm/lsfcO9QcN3i11vfs+Es+7IPYFnkyqlq0ocMoHe0lFX+G+fLLbUxAIEO7S5686/30
	Cd8TBfMF38rW7bJcNG1JXytHUGFHbds57DwzTbyktXihLiplTqL0AmJMrHXHMYU3xVyMoj0kCrva0
	uUlVmAbQOjnfsVAkIn9bbuThy79V33uIcj81uC3CT9dX32F10H1h5bWLzf6H2dfbbVMIzDRKAiMss
	2xN7RD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vxo-00000000kSp-2BFN;
	Wed, 15 Oct 2025 07:30:24 +0000
Received: from mail-m3279.qiye.163.com ([220.197.32.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vxm-00000000kRJ-1Sn4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:30:23 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25f9bc543;
	Wed, 15 Oct 2025 15:30:15 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: adrian.hunter@intel.com
Cc: arnd@arndb.de,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	soc@lists.linux.dev,
	ulf.hansson@linaro.org,
	will@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH 9/9] MAINTAINERS: add Black Sesame Technologies (BST) ARM SoC support
Date: Wed, 15 Oct 2025 15:30:14 +0800
Message-ID: <20251015073014.1480709-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <57743880-aecb-4300-8386-44d962659921@intel.com>
References: <57743880-aecb-4300-8386-44d962659921@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e6c6d7c409cckunme94767a761da4f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTktMVhpDQhgYHx5CGEkdTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DiCuGLGhn/KPK3GPbkC95HwnBSfdDQSl6wzN48jMYxr4NlDlx1h9TIsyGVqFQu2B6KU5LMb9zWxnuLHsbplmLMloHqzMwPEd43MCvj4YahW/3hpskaFGzLGtta3VEDTY6M1oiDNILtzKjdmVbj1stKUwOG5hChS++4BUT2mfbj0=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=O1qaZkX1700g4dn1D/gzvs0pnDtTldETwvN+nCYzCHU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_003022_554650_44E58FD4 
X-CRM114-Status: GOOD (  15.44  )
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

Hi Adrian,

Thank you for the review and feedback!

On Mon, Sep 29, 2025 at 04:29:25PM +0300, Adrian Hunter wrote:
> On 23/09/2025 09:10, Albert Yang wrote:

> > +ARM/BST SOC SUPPORT
> > +M: Ge Gordon <gordon.ge@bst.ai>
> > +R: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
> > +L: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S: Maintained
>
> Seems like it is "Supported" rather than "Maintained" ?
>
>         S: *Status*, one of the following:
>            Supported:   Someone is actually paid to look after this.
>            Maintained:  Someone actually looks after it.
>            Odd Fixes:   It has a maintainer but they don't have time to do
>                         much other than throw the odd patch in. See below..
>            Orphan:      No current maintainer [but maybe you could take the
>                         role as you write your new code].
>            Obsolete:    Old code. Something tagged obsolete generally means
>                         it has been replaced by a better system and you
>                         should be using that.> The status should likely be "Supported" rather than "Maintained"
> based on the MAINTAINERS guidelines.

You're absolutely right. "Supported" is more appropriate for this
vendor-supported hardware. I will update the STATUS field to
"Supported" in next of the patch series.

Thanks for pointing this out.

Best regards,
Albert Yang

