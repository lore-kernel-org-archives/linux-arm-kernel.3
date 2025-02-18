Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0697BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dw3vhFkFr3TaomQkOTF+/iPnMob0f7dv5p6Z04/y6g=; b=ViPkI3tbe/hO+09czvY1a0BVeg
	PUsvPcTdQw86MvHLfEpfGPJj/n/Tt+DVqLy+2Aluzi12OCP/GTcyXqKVdOR2SKOjGOMIeTOo0u76f
	3CPPI8VrQUYFIbqpKak3JBwKDzMCKo+6RpEAVMq40Bhd8ELGgOtVu+Umzgobng3YAw25TDY5T9pry
	HTD+6b0nPIKS54a/kFOP11m61jTDzOSAF2ejboWJ1LSgs3O3oK/yr9PCsG1s2y82eh4YictX2tLch
	A14i2Qa9VvRljcvT9IgKs7n4MQhmtDnkBEdO8S1GN2QzqFdsVKo2D4CGCPx1uSy7elBYxHMmNTdUh
	ngUmYmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkO9T-00000008PfX-1AfR;
	Tue, 18 Feb 2025 14:00:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkO80-00000008PQp-2TEL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 13:59:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E518C152B;
	Tue, 18 Feb 2025 05:59:30 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4D8C3F6A8;
	Tue, 18 Feb 2025 05:59:10 -0800 (PST)
Date: Tue, 18 Feb 2025 13:59:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pm@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update section for cpuidle-psci
Message-ID: <Z7SSKwMtY8j4XWJI@bogus>
References: <20250217140145.117086-1-ulf.hansson@linaro.org>
 <CAJZ5v0hi=zCuhmVRf2HVRWkR53U7xqxC3oQDs8-JN-cyQ+ZX1w@mail.gmail.com>
 <CAPDyKFq1w7Ez+6GSKDeCpeQ=Xm4c3U9BMu3G8q+v2MXk1TdwKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFq1w7Ez+6GSKDeCpeQ=Xm4c3U9BMu3G8q+v2MXk1TdwKw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_055912_667037_7AB4152A 
X-CRM114-Status: GOOD (  14.51  )
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

On Tue, Feb 18, 2025 at 01:54:44PM +0100, Ulf Hansson wrote:
> On Tue, 18 Feb 2025 at 13:48, Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Mon, Feb 17, 2025 at 3:01 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > Add myself as a co-maintainer for the cpuidle-psci driver and the
> > > corresponding git-tree, which I am already using for this.
> >
> > Lorenzo, Sudeep, any objections?
> >
> > Ulf, do you want me to pick this up?
>
> I can take it via my pmdomain tree, but thanks anyway! Let's also
> leave some more time for Sudeep/Lorenzo to comment.
>

Sorry for the delay, accidentally marked it read and missed it until these
emails. I have responded on the patch with an Ack now.

--
Regards,
Sudeep

