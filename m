Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iq/Gwtu/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kaMcGbEQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eQf4Ux3KgpPvYJ/vZ/XrAxGRYNkjOFHzjKZYgsvPaUA=; b=iq/Gwtu/ODKqvh0LLLFjvN3vOH
	hjsCr2d1iknJhUHxSaGOIg3U08dG4taQxQ8TDpzMnPz1BLXNNSDWZ3WHxkOrRIaJaDDyREAJSuofm
	ph2cv9abQIEi7LgV7NHs+sXion0C+jWLljJ6xHoKyde326AeHql/NOdgbblIyFU/e7uI440ChG3vw
	VkMviEM5z1gIf+/8wEuJanta/rVqhB43uNG118cwgBlGkq7rYhZDFIvFOSrERHGXFCbBqh5WuwoLe
	l+c+pNLkcPS8q5sQCo2YW6v7atgWjRWR3ovo8/GThZ6VJTY5mhXBz8uFiYwf3b+HMtqQBLZDEPKQ1
	vipw7ACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsfm-0000000EABT-0hD4;
	Thu, 22 Oct 2026 13:17:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsfj-0000000EAB5-2IBG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:17:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 541412C34;
	Thu, 22 Oct 2026 06:17:24 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CAB13F673;
	Thu, 22 Oct 2026 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792675047; bh=0s7bfEvTJgNfIljZiLJWu7OAwfMP+SubhPZFX3IkXwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaMcGbEQxmy0Ec8g7NLwAJplIEgN0KZqDZ25nJ9T+y9vCYjJMo4N09+X/gtUyZjEB
	 QaI8BY1cstU+Ae4jAhbmNYNh9x9UWMtawAEkMuKUfaokNLXw9ksxMfZq8wYGR9x+Zv
	 eqVWgSjmgDaE+Lukag3OFgdzIjpd/YkWqjS5jn/A=
Date: Thu, 22 Oct 2026 14:17:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH RFC 1/3] firmware: arm_firme: introduce arm_firme driver
Message-ID: <atoM447tWm2EsoSP@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
 <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_061731_657525_0CD2C131 
X-CRM114-Status: GOOD (  18.73  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 06:48:49PM +0900, Kohei Enju wrote:
> On 10/19 15:14, Yeoreum Yun wrote:
> > The Realm Management Extension (FEAT_RME) is part of Arm Confidential
> > Compute Architecture (CCA) and enables support for dynamic, attestable
> > trusted execution environments ("Realms") on Arm systems.
> > 
> > Realm management flows depend on EL3 firmware for operations such as
> > Realm construction, resource allocation and isolation, and attestation
> > of initial Realm state.
> > 
> > The FIRME defines standard interfaces provided by EL3 firmware to
> > satisfy these dependencies. These interfaces include:
> > 
> >   - Granule Protection Table management
> >   - IDE key management for PCIe and CXL Root Ports
> >   - Memory Encryption Context management
> >   - Attestation token management
> >   - Integrated device management
> > 
> > Each group of interfaces forms a FIRME service. A base FIRME service
> > is also defined to provide common concepts, service discovery, and
> > feature discovery across services.
> > 
> > FIRME interfaces are implemented at the EL3 boundary between the
> > Non-secure, Realm, and Secure states. They may also be used on systems
> > without FEAT_RME, for example to provide firmware-based attestation or
> > security services.
> > 
> > arm_firme driver provides the common FIRME framework and service discovery
> > support for client drivers using below FIRME services:
> > 
> >   - Base service.
> >   - Attestation token management.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> Does this series assume that the kernel is running in EL2 implicitly?
> 
> The FIRME spec says:
>   An implementation of one or more FIRME services at a valid Exception level boundary between EL3 and the
>   highest Exception level in a different Security state is called a FIRME instance.
> 
> and I think only NS-EL2 can call FIRME interfaces as a NS FIRME
> instance, right?

Yeap. but it doens't forbid calling the FIRME from EL1 too.
As a just example, when the host running with pkvm, it could use
where kernel running as EL1.

[...]

-- 
Sincerely,
Yeoreum Yun

