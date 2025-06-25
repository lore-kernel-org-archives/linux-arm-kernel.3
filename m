Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32472C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1zTGfZXCcDIzj2c3k458zoj1PAJrzIVVXASHGDjo5A=; b=EDRnQSb9BgrLP/r9OevkaNviUY
	AI2LfNRxVVVE0KVNw+GqPrQUQn8XUhocUA6N7AanTkrHB9eTVTfic/7+PpDN5DzPOWCR1Oul3jRsM
	QZ+GPD5LbLr6OGXvQhqdGq5ZFcJet+qF45TvjjDJtklbRrV/xixwjhhkurIZYzj1iAiCapXXVaKUd
	af1fc+oL0vTdnpx/IAIYHbYcixvxO7RLAKpxgNRGlU8afbWkJZOS0l/HjtV5BghbDx3EIdFEzrOae
	czJLYEWbKs1gj6cE6w0dtiuwWFJexuk6jWeW9yTGDo5Fn8Ft/3QNMDBS0Vavqy3QBFcH8UTFJIBHS
	CPckm+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWwO-00000009u76-0gZW;
	Wed, 25 Jun 2025 20:41:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTTW-00000009PBX-0zGI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 866C4A52D03;
	Wed, 25 Jun 2025 16:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1025C4CEEA;
	Wed, 25 Jun 2025 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750870793;
	bh=xYqSrzoie4XMkPburPrOeUmzOY0bsFg8Tsoegetll/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McC4L7i7HSCu8w701Y5+VBuEKOUQ5wnSlT8RcEaOt+3OrbwoP+OQa/uXw1rv2evSL
	 9qHhUgUPwHzRmcr6wa+vcpCSiWSZte7YAFrC3w0sUKAjBUvK/T0/sYgLCkI0mHFuoC
	 JQmI6KomKHSRFb2Xro4scgotPeDDbEX6Kr88A1hNo80e/ZglUrUlollvFkOaITw7aV
	 5BhRU5zkOyNcUxH0nq8HRgeM08mAvKuzHHQAlLh8YA89oS7zOc1hbIDhL1+STOFodH
	 BCPSdfA45qn3QYin/nEgxlw7Kfj6Vl4Oj529t7aUtGNOvwRls0fDQsAmC6GPJWosQr
	 jRHPKhiMPKEYQ==
Date: Wed, 25 Jun 2025 19:59:49 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/2] generate boot_aggregate log in IMA with TPM using
 CRB over FF-A
Message-ID: <aFwrBU4H0w9AXyQM@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <aFs0of3uZdoMEJXc@kernel.org>
 <aFvRI5OwSLLKz300@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvRI5OwSLLKz300@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_095954_343167_16AC1605 
X-CRM114-Status: GOOD (  26.15  )
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

On Wed, Jun 25, 2025 at 11:36:19AM +0100, Yeoreum Yun wrote:
> Hi Jarkko,
> 
> > On Wed, Jun 18, 2025 at 11:23:00AM +0100, Yeoreum Yun wrote:
> > > To ensure the TPM device operating over the FF-A protocol with
> > > the CRB interface is probed before IMA initialization,
> > > the following conditions must be met:
> > >
> > >    1. The corresponding ffa_device must be registered,
> > >       which is done via ffa_init().
> > >
> > >    2. The tpm_crb_driver must successfully probe this device via
> > >       tpm_crb_ffa_init().
> > >
> > >    3. The tpm_crb driver using CRB over FF-A can then
> > >       be probed successfully. (See crb_acpi_add() and
> > >       tpm_crb_ffa_init() for reference.)
> > >
> > > Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> > > all registered with device_initcall, which means crb_acpi_driver_init() may
> > > be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
> >
> > I get the ffa_init() part i.e, moving it earlier. However for
> > tpm_crb_ffa_init() and crb_acpi_driver_init(), modules.dep
> > takes care that they are loaded in order.
> > For IMA you will need the driver as built-in but that should
> > be handled via kernel config, not via code changes.
> 
> In the case of "module" built, it's true.
> However what I tell here is when "tpm_crb" and "tpm_crb_ffa" is built
> as "built-in" in this case, it couldn't make a "dependency" between
> the same initcall level: here is the case of this.
> 
> 0000000000000888 l       .initcall6.init>-------0000000000000000 crb_acpi_driver_init
> 000000000000088c l       .initcall6.init>-------0000000000000000 tpm_crb_ffa_driver_init
> 
> in this case, wihtout code change, the crb_acpi_driver_init()
> is failed since tpm_crb_ffa_driver_init() is called later.
> 
> and this couldn't be solved with kconfig --
> ARM_FFA_TRANSPORT=y && CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y.
> 
> The Patch #2 is to proing the tpm_crb_ffa as part of
> crb_acpi_driver_init() when TPM uses method ARM-FFA.
> 
> If there's another suggestion, let me know please.

Hmm.. I actually got what you mean now. I was looking this from
wrong angle. I think we can pick these patches!

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

> 
> Thanks
> 
> --
> Sincerely,
> Yeoreum Yun

BR, Jarkko

