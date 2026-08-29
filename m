Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECB8C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 06:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gmo29pYEms2+Q4Cr8/V2qBTEL01TPuCLhDnBuX4g4LY=; b=up6rQLwNlMB4ihvAJGWIxqjOWS
	Xi/5sQtix298RG+9qNyY99DLH3Ew1B1pkAwzClaWU0quIw7L/+1b9saIuHuhjN/G0NiFQn8/ALvhu
	dsDtQLX9etDq5A+eX65n1BtSilowPg4fOCY/KuB24LoWcf9KevZBuFzu9D2gR6qxUjk4L+ydjKVGq
	9j14alkUxpWWEnTclzPuWJCXbOMF6wQyKQmoqGGHUKjJEZNr0eT8hZG89o4LVGgeAsxFbX1CBpaMu
	4rY3WZ2RMhXW/HrWepeu57xvWqIi+MBfwIpS7EBm/5p00yMXOOxma0SxNG29GqnV05ybRaZd+7Ov6
	VVA+KUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0C9D-00000006lZ6-3oHZ;
	Sat, 29 Aug 2026 06:02:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0C9C-00000006lYo-20RK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 06:02:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DECA342D87;
	Sat, 29 Aug 2026 06:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2871F000E9;
	Sat, 29 Aug 2026 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983353;
	bh=Gmo29pYEms2+Q4Cr8/V2qBTEL01TPuCLhDnBuX4g4LY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IOq8adNUVKyS9MvFAKnNOl5jXgUJq+rvuPyYjO+aYorZpj3EN4Vw9mQDoN5dJR6+d
	 i4Xu5zDr/rJVcPD71YaZxI0DnQ+jCNa0fhBHTSlpdWBZmaFhxjWhbHrB8pPfiKltqP
	 W8IQ46DKkSKT9EDTwUK1dF2nPf+BHR0JYKzWnP5YuERGDe0Sn0kCBLupOQKP5H0Qqc
	 w8bxHP8hLouUV2LYxk5LZuAlBL6y9W04nltSwEM8KSxSmwZTnV7odvqfvIhVGSgWA2
	 yEWLz/gN6Gx100DqgoSAJV1WqxWl/Us3Y6JZcUuPP0tAQIjnfEKLPjbM3I7frZBY7g
	 rUw9Bz1HwsU8w==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
In-Reply-To: <178794567779.4159892.13554089762527571548.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-6-aneesh.kumar@kernel.org>
 <178794567779.4159892.13554089762527571548.b4-review@b4>
Date: Sat, 29 Aug 2026 11:32:23 +0530
Message-ID: <yq5ao6eltqfk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@nvidia.com> writes:

>> The Arm CCA guest driver currently only implements TSM report support, but
>> follow-up changes will add more TSM-related functionality to the same
>> module.
>> 
>> Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
>> arm-cca-guest module. This leaves room for the module to grow additional
>> source files.
>
> That's pretty confusing, the module is called arm-cc-guest.ko but it
> has host items too?
>
> I would have more expected the module to be named arm-cca and this
> file to be guest and a future file to be host or something like that?
>
> It is annoying to change module names but we do it, and I think it
> should be no problem in this case since there are no users..
>
> But maybe this patch should be in another series..
>

We have two modules, arm-cca-guest.ko and arm-cca-host.ko, located in
their respective directories:

drivers/virt/coco/arm-cca-guest/
drivers/virt/coco/arm-cca-host/

They also have separate Kconfig symbols, ARM_CCA_GUEST and ARM_CCA_HOST.

-aneesh

