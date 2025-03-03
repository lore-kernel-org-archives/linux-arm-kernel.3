Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056CDC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z47Nd/3pjSaaOhM1lDHyH94jDdY9wmZ0DMhtpseq20c=; b=Idwrfz/ONGdi1Cxd8FncpKFCdN
	B9EqCCc7FkZMZ3mR1zBe7E0Z0085Yb+szSvC5naSy+3qABcUh6BiNvjQP03rE+2GngNplu0+Ov3zu
	iA9sySlc2p/AaDS5YP5Da/GqoV9yPXEbBPRK9tacGKbcJ1hHL9MNTCEujIwBIkfpMzsNEZRiPpsCm
	d8tkofFfOunbTfvvAvI7AETxiVtJTEydUUgSGutzxHJiL1GiFq6kaBmpkWx/ccpXU+QfuTWErmvVc
	DiEVwl8VVcrjEv5zF3whb+suoLICmaywlcOJ3zqXFZZfYnXy6caPY6z1g7lRmib1gJaUhPZO88eZ2
	eh3zkstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFUO-00000002aba-1q01;
	Mon, 03 Mar 2025 23:46:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFSd-00000002aSR-0knV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 23:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 886F5A44D5C;
	Mon,  3 Mar 2025 23:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14BAC4CEE8;
	Mon,  3 Mar 2025 23:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741045474;
	bh=mYuhDBxNc/e89ws6z4cdoCMAAbClP8hLNaC+xBDI57E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o31MaesClDbhQ7BppcXMKmMs6N/dQaiDATGICBZiGtiO6FycEHFyv3Nhx8qQCqSjj
	 3xlP2WcD7i2kRRK4XemY3j54us/Dlx1x5kgB66WVjeERbGVE98/ARiHcYFwynH7AVw
	 O5sVHJPRhV32fJQ+pK85kZMgyc4I+NZGHOUbYC+nx1UXnNZJUGJLdWeRSDlE8P5TVX
	 2unjRESVuJIrVcj1r4b3+VcgKxQHTuvIvT9KW6WBiM5u2GFuecGi2z1yZG9zmuRg5o
	 hlfQLUJHa08c9U7rQH0quO5M6Un+KhIuXjZpHwOtBt8tY6UR4k7YXwL9ZCH6pfC/uv
	 sGoOZZp9lu/lg==
Date: Mon, 3 Mar 2025 23:44:28 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, oliver.upton@linux.dev, snehalreddy@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: Move the ffa_to_linux definition to
 the ffa header
Message-ID: <20250303234426.GB30749@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-3-sebastianene@google.com>
 <20250227202557.d3fd6ylzbaho4pvx@bogus>
 <Z8DxZY-09R6lwEW3@google.com>
 <86wmdapei8.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wmdapei8.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_154435_284094_A6B8B9E9 
X-CRM114-Status: GOOD (  17.71  )
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

On Fri, Feb 28, 2025 at 10:09:19AM +0000, Marc Zyngier wrote:
> On Thu, 27 Feb 2025 23:12:37 +0000,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > On Thu, Feb 27, 2025 at 08:25:57PM +0000, Sudeep Holla wrote:
> > > On Thu, Feb 27, 2025 at 06:17:47PM +0000, Sebastian Ene wrote:
> > > > Keep the ffa_to_linux error map in the header and move it away
> > > > from the arm ffa driver to make it accessible for other components.
> > > 
> > > Do you plan to push/target these changes for v6.15 ? If not, I can take
> > > this patch with other FF-A changes in my tree for v6.15. Otherwise, it
> > > is must go along with other changes.
> > > 
> > 
> > Yes, feel free to pick them with your changes and we can push them
> > later.
> 
> So this series is not a 6.15 candidate?

I think this is 6.15 stuff once it's been reviewed. Sudeep's message is
a little confusing as it refers to 6.15 twice (I guess he meant 6.14 the
first time?).

Will

