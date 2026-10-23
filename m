Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A242606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xttkKAUG;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=AgMlnCrx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wh7D8Tptc3ILYDf3UejxSTTFaEfE2VaROKuAZO+rrJ0=; b=xttkKAUGKYMeLBG2XaiX5kJXmO
	JIayaR76CMFWXsDR0bhAqNhJ9CyxvZUNyOxCkWehK0KVQ/FjdLc6tq/oIZtNLNX7QdUxo5MsnGUko
	WA82S7SHPdcsR/RYoinyqw3p+lBxnmX/jlq+5nnti0V26vHPX/5OJM4wiQ6zP4JEYtTYdbTGvsKv1
	q11cZnAOrXLF3T8DlHPqMGOdLG2oleBCLBJMwS5zwf/jMfUhHu25sfzCg00RLtwXEDoQJ1Wn16cSu
	EjlQdlTbUXmpWDs+XVUkPbJG1S/87SmbecedzJekWjyKMZTRgjlCgRxLHhq+hHEBs5aDKMnvZ3A2+
	V6q95hmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK88d-0000000FXcx-41dj;
	Fri, 23 Oct 2026 05:48:23 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK88a-0000000FXcc-1lab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792734500; x=1824270500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvaFqs1c0Q8y7cq4icfLd9Exgzwezb7YSxz6AKTovJw=;
  b=AgMlnCrx+GOJg8sg/QUW1xIjNOPF7ra4x4nu8evWimwtll12Ri4CQxSm
   2Z5Q851ByCFo7Y9minE6Op+w1o2Zf13BeYyrFohjRZugpWCVSify0sVpV
   qUEWmfAWNHCQb8f5ouEF/ue86JOo9/f2283kKV4SqklVIy36Qudv3ynp4
   HIthxnzwsczq0F5udRuLczqagUHG+v2aeTop6cIppH/csekzmeYvysrM1
   mNqNK5G1CC1nCCmK/rWYkX7TdR4PbsF277frjraRC1tPbBIMVoGpJGoru
   9Er5wCrihh3jdphDOt806oVkGULo0eVv5zodKMK1ZJRbV5kXrJEWPpeut
   g==;
X-CSE-ConnectionGUID: LFV6D7VkQP60feSQuYWCdA==
X-CSE-MsgGUID: 68oD/j1aRjCKRF8CagMhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="259199973"
X-IronPort-AV: E=Sophos;i="6.27,173,1786978800"; 
   d="scan'208";a="259199973"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 14:48:18 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 484D33D29
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:48:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 049621C002CE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:48:18 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.51.144])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id B947B1800109;
	Fri, 23 Oct 2026 05:48:13 +0000 (UTC)
Date: Fri, 23 Oct 2026 14:48:12 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH RFC 1/3] firmware: arm_firme: introduce arm_firme driver
Message-ID: <atr0fvi-FP7VCwki@FCCLS0092175.localdomain>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
 <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>
 <atoM447tWm2EsoSP@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atoM447tWm2EsoSP@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_224820_970571_1752A8E6 
X-CRM114-Status: GOOD (  22.80  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22 14:17, Yeoreum Yun wrote:
> On Thu, Oct 22, 2026 at 06:48:49PM +0900, Kohei Enju wrote:
> > On 10/19 15:14, Yeoreum Yun wrote:
> > > The Realm Management Extension (FEAT_RME) is part of Arm Confidential
> > > Compute Architecture (CCA) and enables support for dynamic, attestable
> > > trusted execution environments ("Realms") on Arm systems.
> > > 
> > > Realm management flows depend on EL3 firmware for operations such as
> > > Realm construction, resource allocation and isolation, and attestation
> > > of initial Realm state.
> > > 
> > > The FIRME defines standard interfaces provided by EL3 firmware to
> > > satisfy these dependencies. These interfaces include:
> > > 
> > >   - Granule Protection Table management
> > >   - IDE key management for PCIe and CXL Root Ports
> > >   - Memory Encryption Context management
> > >   - Attestation token management
> > >   - Integrated device management
> > > 
> > > Each group of interfaces forms a FIRME service. A base FIRME service
> > > is also defined to provide common concepts, service discovery, and
> > > feature discovery across services.
> > > 
> > > FIRME interfaces are implemented at the EL3 boundary between the
> > > Non-secure, Realm, and Secure states. They may also be used on systems
> > > without FEAT_RME, for example to provide firmware-based attestation or
> > > security services.
> > > 
> > > arm_firme driver provides the common FIRME framework and service discovery
> > > support for client drivers using below FIRME services:
> > > 
> > >   - Base service.
> > >   - Attestation token management.
> > > 
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > 
> > Does this series assume that the kernel is running in EL2 implicitly?
> > 
> > The FIRME spec says:
> >   An implementation of one or more FIRME services at a valid Exception level boundary between EL3 and the
> >   highest Exception level in a different Security state is called a FIRME instance.
> > 
> > and I think only NS-EL2 can call FIRME interfaces as a NS FIRME
> > instance, right?
> 
> Yeap. but it doens't forbid calling the FIRME from EL1 too.

I see. Then it's okay.

> As a just example, when the host running with pkvm, it could use
> where kernel running as EL1.

Thanks for the clarification, Yeoreum.

Thanks,
Kohei

> 
> [...]
> 
> -- 
> Sincerely,
> Yeoreum Yun

