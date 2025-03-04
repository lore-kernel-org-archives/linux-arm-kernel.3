Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CDBC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAAx0WCfVD9Yht0Hjqf+5lQdm3MbQGouHvs42YNXPAI=; b=vWPgw2cN1A+2ICg9wNQ9hrDai6
	mMcV3V2pmC4pJjpTTYVersN/YUaejsbmfxhn1YKFaLPX3fTP/kxZeBi6XmFE18wRhfXEXYlBz1WhN
	8JpWQ70vVfqKH8KHLvMw0zCkIwIpDOCwD6aeW7czxW0N24gEE8pfwDwFwh7ZvGlPOiZQj5rSndiQu
	OgRP3fsSiKFfHyCJL7ly/2sBJ4vUDyW70/pCiBiz5JLB2mp7lT3ONfcAJHIdcZCToYoda/OvuQoz/
	IBX2xWct68SKYsLeey9a+5XkzNTB0NuH+BXSOcjVYwQam58q6MweahT1l0mDLvFqW6NkGUhlXqcKb
	HcyFEc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP2Y-0000000420m-3E9O;
	Tue, 04 Mar 2025 09:58:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOz0-000000040rU-1fdz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:54:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EBE9FEC;
	Tue,  4 Mar 2025 01:54:51 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 676D93F5A1;
	Tue,  4 Mar 2025 01:54:35 -0800 (PST)
Date: Tue, 4 Mar 2025 09:54:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, oliver.upton@linux.dev, snehalreddy@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: Move the ffa_to_linux definition to
 the ffa header
Message-ID: <Z8bN2MI5GYdVtGyE@bogus>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-3-sebastianene@google.com>
 <20250227202557.d3fd6ylzbaho4pvx@bogus>
 <Z8DxZY-09R6lwEW3@google.com>
 <86wmdapei8.wl-maz@kernel.org>
 <20250303234426.GB30749@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303234426.GB30749@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_015438_478582_7E41EE83 
X-CRM114-Status: GOOD (  21.52  )
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

On Mon, Mar 03, 2025 at 11:44:28PM +0000, Will Deacon wrote:
> On Fri, Feb 28, 2025 at 10:09:19AM +0000, Marc Zyngier wrote:
> > On Thu, 27 Feb 2025 23:12:37 +0000,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > >
> > > On Thu, Feb 27, 2025 at 08:25:57PM +0000, Sudeep Holla wrote:
> > > > On Thu, Feb 27, 2025 at 06:17:47PM +0000, Sebastian Ene wrote:
> > > > > Keep the ffa_to_linux error map in the header and move it away
> > > > > from the arm ffa driver to make it accessible for other components.
> > > >
> > > > Do you plan to push/target these changes for v6.15 ? If not, I can take
> > > > this patch with other FF-A changes in my tree for v6.15. Otherwise, it
> > > > is must go along with other changes.
> > > >
> > >
> > > Yes, feel free to pick them with your changes and we can push them
> > > later.
> >
> > So this series is not a 6.15 candidate?
>
> I think this is 6.15 stuff once it's been reviewed. Sudeep's message is
> a little confusing as it refers to 6.15 twice (I guess he meant 6.14 the
> first time?).
>

No I meant v6.15 both times 😉. Since not much time before v6.15, I was
thinking if this is not v6.15 material, I can just take the driver change
for v6.15 itself via my tree. Now that, you have clarified, I will leave
it to you. I think it doesn't conflict with any of driver changes in -next.

In short, just to avoid any further confusion, please take it via arm64/kvm
tree.

--
Regards,
Sudeep

