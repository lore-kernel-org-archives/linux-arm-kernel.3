Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F38BC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JavA+SudHa63uARftGOTwCX3dkJwSR33px6sS9RD24=; b=mQSnUWffgYI8AMHHUjQcpjWJjh
	Yy1CotZMhZraotVaSn3rvtymSn2cC+Tnb4tU79nJIgkJv55w+b2rpy8JxVr8UIsAv5IiRw1YmFFSz
	9IgXkWHcC3Rmky9No+WgPeMonUIEIJ4FN4DEWZrkGNTF/NvxW2/fQJhXuCu03IiI21IMu5Z7Hs+ps
	SDCAdC6OrvtnH8/Z+aKBbH8pifarNuRa4unVOCU4bNMWnA4zhMnxfTsf58FH9AvbqEgyR9DMz2SbV
	cj6tEKZ1P4RDCY9kJhh4Yp+ZoMaoPy2SpRW3IMkM9y/7kmG2ZOR7q2d/fb7xZ8iJLvBSk/W6F6HLE
	p5Vgs+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyfW-00000006tEs-0w6Y;
	Tue, 10 Jun 2025 13:05:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuu-00000006kOL-0kTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82FF2A51121;
	Tue, 10 Jun 2025 12:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF266C4CEF2;
	Tue, 10 Jun 2025 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749557843;
	bh=7jJB4h0R3QNPQ8a6Ja40SBAdt7xUL9onTatms1ozg1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYbxBWcRSJJKoAk1/lqabLgIJCJDRVy0bg03y0iND/vOQx5+GOeaG2SPoKq1r4GOh
	 eE5jdGfVsTsE9dmB/rJN0vB+zqRSOmIy/TgSD9zOgvImUuU+rv3s1gRtBuLrrRminV
	 IZWJjQY3b3Dp4EXnMRfvXzlYpMGKltcpiR5Wbr4E0U86sHw7NwF8Y6EGEcivoU49Jf
	 m9Fuj8F/EPWTqbHBWRMXz7iQgeBTsoDsGojvPT7Wg0OsVTh/rz0XaV6EGOEzMEf0jj
	 D2mvs16UV0kEOS7gnlKhHFhRXtzA+TEo3JWex/t/Z2LQIJ6Ax507rTsT0UjD+vwumD
	 LTyoVgUrcRI7Q==
Date: Tue, 10 Jun 2025 15:17:19 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH 2/2] tpm: tpm_crb_ffa: maunally register tpm_crb_ffa
 driver when it's built-in
Message-ID: <aEgiT8Pco-Cs8Kpa@kernel.org>
References: <20250606105754.1202649-1-yeoreum.yun@arm.com>
 <20250606105754.1202649-3-yeoreum.yun@arm.com>
 <aEMdGXXBSym7cXmK@kernel.org>
 <aEMvm2MW9bBXf2gM@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEMvm2MW9bBXf2gM@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051724_279073_71F45870 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, Jun 06, 2025 at 07:12:43PM +0100, Yeoreum Yun wrote:
> Hi Jarkko,
> 
> > > To integrate tpm_event_log with IMA subsystem,
> > > tpm_crb and tpm_crb_ffa driver should be built as built-in
> > > (CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y).
> > >
> > > However, this could make failure for ima_init() gets tpm chip when
> > > each initcall function deployed like:
> > >
> > > 0000000000000888 l       .initcall6.init	0000000000000000 crb_acpi_driver_init
> > > 000000000000088c l       .initcall6.init	0000000000000000 tpm_crb_ffa_driver_init
> >
> > The only failure I see is the patch 1/2 which changes init call level,
> > and leaves kernel Git to a broken state.
> >
> > It breaks the famous "zero regressions policy".
> >
> > BR, Jarkko
> 
> Sorry, would you let me know what is broken more detail?
> IMHO, by changing the init call level for ffa_init()
> it's called early than before device_initcall() and it seems not to
> break anything.
> 
> What breaks do you mean?

Let's start from very beginning. Why this change is needed and not just
1/2?

IMA intializes as a late initcall, which after TPM has initialized.

> 
> Thanks.
> 
> --
> Sincerely,
> Yeoreum Yun

BR, Jarkko

