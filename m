Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BB0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGdWGd+u9Zw8XuMYIbWjrQD+w6VWtvu/cVGoEvur0E0=; b=L08YEVZkojmwQyVd5fMa1f/gVG
	dGKc79IZEXxdJu++bZKuYxFTjjehsjCoetAGvLGpxzlwi5GFidyGg/Fok08w5CuU2tpeGOPuid7du
	nDnWZCahwswN5/Lo2RqyhwRMxwU8lR2JJSz2uWrgTqvMqh+TsrvDxRfTFVyocTmUWEaG35kClLkKb
	phkOVTegbieuoUlJYfIXRdaBKHtP80qWo0m4Cs4jEROqq5JV0Vr0gcHQ1FBALWVzZ3j8RXidc21RG
	DjKR46JAez4v9yZ6urs9UHbl2m0HRHP2qYDwX9G9J3sPbq9pzJsPNUiFbr3EBSMgK1qMDJUufG6NQ
	pRgf+B8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL7w-00000004iPR-2rE5;
	Wed, 26 Feb 2025 17:23:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL4h-00000004hWl-2S70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:20:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 312EA1516;
	Wed, 26 Feb 2025 09:20:14 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4536D3F673;
	Wed, 26 Feb 2025 09:19:56 -0800 (PST)
Date: Wed, 26 Feb 2025 17:19:53 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>, saravanak@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Message-ID: <Z79NOeyWzfRio8qs@bogus>
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
 <20250226160945.GA2505223-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226160945.GA2505223-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_091959_669746_0859B63C 
X-CRM114-Status: GOOD (  22.27  )
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

On Wed, Feb 26, 2025 at 10:09:45AM -0600, Rob Herring wrote:
> On Wed, Feb 26, 2025 at 05:44:56PM +0800, Peng Fan (OSS) wrote:
> > Quote Sudeep's reply"
> > I am not blocking you. What I mentioned is I don't agree that DT can be used
> > to resolve this issue, but I don't have time or alternate solution ATM. So
> > if you propose DT based solution and the maintainers agree for the proposed
> > bindings I will take a look and help you to make that work. But I will raise
> > any objections I may have if the proposal has issues mainly around the
> > compatibility and ease of maintenance.
> > "
>
> This all looks to me like SCMI has failed to provide common interfaces.
>

We can look into this if having such common interface can solve this problem.

> I'm indifferent. If everyone involved thinks adding compatibles will
> solve whatever the issues are, then it's going to be fine with me
> (other than the issue above). It doesn't seem like you have that, so I
> don't know that I'd keep going down this path.

Sorry if I was ambiguous with my stance as quoted above. For me, 2 devices
pointing to the same node seems implementation issue rather than fixing/
working around by extending DT bindings like this $subject patch is
attempting.

If you disagree with that and think 2 devices in the kernel shouldn't
point to the same device tree node, then yes I see this is right approach
to take. ATM I don't know which is correct and what are other developer's
include DT maintainer opinion on this. I just didn't like the way Peng
was trying to solve it with some block/allow list which wouldn't have
fixed the issue or just created new ones.

--
Regards,
Sudeep

