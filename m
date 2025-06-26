Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357D9C83000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FM8P8pOWAsYhFp+gRmBwToR1B/PuwzpuWRqPGhfY/0=; b=fWw59uk0KhBXtPc42acwCrHtBw
	uq11u8qKz6IZfipjIDfnJmmnKGtEx22WIMgm32/1P4EZKY/gAWweZxSzteRS7Nn3VangjAU+KE8Xt
	Xi+2ZSS4BgBbBzewcHAlVEJjdBf2m6FkxhSX16CCy81vTdvZ0wk5tfsqj+EECY8R474Yy4l4NhMpV
	lCmEK6c8Gjb+TcY2lc8eJdvreskGTAu7PUHHzTOKoiEMc4j/ffUZIsAaJJjeeG5DzLWObjJCTVSgq
	7DRmUhQOmaRKqXEXcbKAcsAqoFrEHW1TnHFwReEsGiOnmqdl8DidFcDkQSWjQi9tlD2ZaaEUO9dol
	JmY5VJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuBI-0000000CqHB-1DI2;
	Thu, 26 Jun 2025 21:30:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsfO-0000000Ced8-0FXM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:53:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F3661692;
	Thu, 26 Jun 2025 12:53:31 -0700 (PDT)
Received: from bogus (unknown [10.57.50.223])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8DB83F66E;
	Thu, 26 Jun 2025 12:53:46 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:53:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/2] generate boot_aggregate log in IMA with TPM using
 CRB over FF-A
Message-ID: <20250626-busy-hilarious-octopus-47c2fc@sudeepholla>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <aFs0of3uZdoMEJXc@kernel.org>
 <aFvRI5OwSLLKz300@e129823.arm.com>
 <aFwrBU4H0w9AXyQM@kernel.org>
 <aFwrf1HnsilrASzX@kernel.org>
 <20250625-chital-of-infinite-proficiency-fee4dc@sudeepholla>
 <aFxuZV3lwd2Uc90g@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFxuZV3lwd2Uc90g@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_125350_131271_ADF66327 
X-CRM114-Status: GOOD (  13.04  )
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

On Thu, Jun 26, 2025 at 12:47:17AM +0300, Jarkko Sakkinen wrote:
> On Wed, Jun 25, 2025 at 08:35:33PM +0100, Sudeep Holla wrote:
> > 
> > If you are applying 1/2 too, feel free to add
> > 
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > I was initially thinking of taking it separately as there is no strict
> > build dependency. But I am fine if you can take them together.
> 
> Hmm.. Yeah, if you insist to take them, that's fine for me too.
> 

Ignore me 😄

> That said, I'm also happy to take care of them :-)
> 

Yes, please take them via your tree.

> I'll append your review.

Thanks!

-- 
Regards,
Sudeep

