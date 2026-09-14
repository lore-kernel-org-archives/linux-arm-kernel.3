Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92892C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij4YbyKIKjg7Hzyw1DY92tAjGLhjU9tHoYdZsTBdePI=; b=i51KQ1OWii0/EK25GtHibVDaWe
	cs8V97bJ+ZXdQTcJEH7gqU0lX1GJsJ14g0cwAfrlDCKIEaMJuocQSXDuohjKyF6VP3AYfec05ofsd
	huPEKIpk1+2ptkVizEUmeDUj8HexjTJksNVj+GIloclAVxe/mAAn2qn50HO3nRZwWT+Xj+vjZXVV1
	WRhFIH+vWRg5wE9tu9Ap91v/bnCEuwmD5BfDeosS2SyHS/00UKn1jNv5xCOZb77iqYk9i9H78EUT2
	VW48lw72bmZqWCeKhPyWry5c08CwQFwAMa0kQteIZXuphIgEPlSrDiUmP2HYlH8ut78/YGzTpwAFm
	jGdc3Wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66f5-00000003kFK-0rtk;
	Mon, 14 Sep 2026 13:23:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66f2-00000003kEd-11ul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:23:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D77481570;
	Mon, 14 Sep 2026 06:23:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 771FB3F59E;
	Mon, 14 Sep 2026 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789392230; bh=Gbs1+PidVJW9zHKmZC4gQY3M0pzm0ZbJmUV6YmKXQgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gn2byeU/T2kYgfVpU4sa9Gn31WdZeEKgKqCTZbOcnN83WrLhc0HhLnX1lUeZRQtqq
	 E/brqte8ZGowQTzJBcK6isRuY3nOADbnRrZ/+jQnuBiq/JaRocx6eMI1dXVeHJiPpr
	 7ypAgObUmwFBnapm0ayvweLmt3ZKRgiBfsHGKkZU=
Date: Mon, 14 Sep 2026 14:23:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <aqf1YAlH4XIvIRSj@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-6-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-6-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062352_335245_9EF7FEEC 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

On Mon, Sep 14, 2026 at 11:35:09AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

