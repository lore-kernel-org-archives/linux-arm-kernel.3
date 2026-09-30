Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF87CCA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 04:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfUllPhBBzE0YRq3zbD6rAiPZpEYJeCYyj16Ug7i+nk=; b=nTIMBOMzjBse+puPqk4nSLA//7
	COPBQ6Mi3GdoRlS5P9WbU9/qAqPFX10jzB+2vzjyejcX9JD7wdFRMKWpsyXwYVFG62anp5vVkwajx
	esZCdsKI+k883QKCAVORajg9/oi4susf7vuRcC00wQpQike/FCGdj5hkwCKDn6pFTEBXY9XPKey4F
	z1xiiOxO0HBS97gZo5BwRXeu9r1ew+Gat0Ar1offO/PWX8s74YSOZP8duMY+G4UwSGa39+8HsL2aJ
	QC+ZQR3VSKdlSH03rRS2/p+VY9KS9YZaoFsgjCl/JRN2jSaJ+jrIFO9T3IbapS5HBznEtror/gWej
	SbMPwOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmCH-000000050cD-1zS0;
	Wed, 30 Sep 2026 04:45:37 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmCE-000000050bq-0lyZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 04:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790743534; x=1822279534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SWeE7D4W3MzPjtObIHYua9ooSLdeWUT6t+wlvGiWv2U=;
  b=mQflLdR7ddF9TPCLpgQj9KrRbrbhaIB4hhMlHtzYUgLzSUnyPvU7UoA9
   zSfD7l59vtWItjfZqR5EehFSF6PG2a2/7K6YRbqknjv2xZtEwMhuT9g+h
   bYPzSQfRXSZD7tT+xfmMatYMm8NqICqaJPWoax97TE/6h7EONYnUxlNVf
   /b9QLM4y93D3Z0hDxElYhQgTtBuSIraMpL/ZYcIP5DDrjzUnnukKRiyTE
   4e2S3VAVLaq2Zc7a0hnnoXakfuc1VN7NfwvVHGudg1nIzCyfe7rc/pWcA
   LO1sPtxP9OmhlJX79ePrTJRwz8J7UJmOgItDZLEDO8L6gwwrlkVL1Q9l/
   A==;
X-CSE-ConnectionGUID: gRsMqQZZRUG9sYAj0CSk0Q==
X-CSE-MsgGUID: WoF896yoTIuTT2/7vbvk6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="256553484"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="256553484"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 13:45:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1685C1002B9C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:45:31 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C2DFCC01800
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:45:30 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.20.173])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 95C041000370;
	Wed, 30 Sep 2026 04:45:26 +0000 (UTC)
Date: Wed, 30 Sep 2026 13:45:24 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, 
	Suzuki Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <arySUmMBSQxCCjM8@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_214534_583170_753825FE 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Yeoreum, Suzuki

On 09/30 12:24, Kohei Enju wrote:
> Hi Yeoreum, Sami,
> 
> On 09/29 17:57, Yeoreum Yun wrote:
> > From: Sami Mujawar <sami.mujawar@arm.com>
> > 
> > Add support for Arm CCA measurement registers (MRs), enabling attestation
> > and runtime integrity tracking from guest Realms.
> > 
> > This implementation registers a measurement configuration with the TSM
> > framework and exposes measurement register values via sysfs using a
> > misc device. The supported registers include the Realm Initial
> > Measurement (RIM) and four Runtime Extensible Measurement Registers
> > (REM0–REM3), each using SHA-256 or SHA-512 depending on Realm
> 
> Is SHA-384 intentionally out of scope for this series?
> 
> Although TF-RMM does not support it yet, the RMM specification defines
> RSI_HASH_SHA_384. A platform using a custom RMM implementation could
> therefore launch a Realm configured to use SHA-384. I think the Realm
> guest driver should support it rather than fail initialization.

Separately from this driver implementation, I noticed that "B5.4.9.3
Success conditions" in the RMM specification 2.0-bet3 lacks a success
condition for sha_384.

Could you please report this to the specification team, or let me know
the appropriate contact for reporting specification issues?

Thanks,
Kohei

