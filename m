Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC2CC54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7zuwV2JZca4eijXXscXNiWJqgYG1K5yz14eLcgDiSM=; b=PWYIDxFycWlFEzTjTR93YXiz9/
	u6BF5M8as5DQUbMWO0+FGtG+uTBpFUg3vSgBRmw8OY4q7CTJnEhSHFUWaP23atvGRKcO8SJAUBzne
	J77/lp2xAtRIAHjMcax9nWjwhRfixD1sal6sxZ0Fl6tWSPzhNuCrRhz9ZzhAfOPMblEjen0AT77Ia
	5UzqqqK6i0tuW9VpqTi5c+nCaqTMAKtnpkGA2Xy0UpFz5v6W7jxT0gq14BVUERcttVnxhMjxCNiPu
	w7RrWAaCz0+DcbpPQW1i+1GjIc3lrzhOSCzygfVRYBAT1a9bQn/SC+R2SJULjBShvO/G0f/Xf//49
	J7ZB/MPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSp9-0000000HF0w-2dCx;
	Thu, 15 May 2025 07:16:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSn6-0000000HEk6-2oYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 07:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99C9BA4C62F;
	Thu, 15 May 2025 07:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC0C4CEE7;
	Thu, 15 May 2025 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747293243;
	bh=Syz8C/K8vQVrYKBBm3kOIZvaSdCxUO5VXlp+cippDyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcF5w+bpiB1TFh70WadbYABFSsa5q3WA8YOQaDkAjYHrVmGQTC6rWfIJe5JDJQl8v
	 eI6sWG6owQL2vThL+lO4+AWtBVr1sgtbqeWkMZd8CD3FXTcAA2lT4YCgZUwQkIXgll
	 0VzTkunGCmI4S/DE1Lo4O3lDcl4ToPYf7h6t16odQ6zC/0Y/yswTxhKpfUu09w/Grj
	 7f3476LoaXXyeZ/QBc+7reZYlfS6AMRxq6yK5XgjUyN0MrLhPz7Ls+fY6qs/fvK3lt
	 pGFQ8O4/Hb7S0rLek3i+/kYxYKRe6hQVUYrQvuNwYw//boTwZ5T1N9z6Pi0jL0WCvR
	 coAjHPKXFJ6HQ==
Date: Thu, 15 May 2025 08:13:57 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250515071357.GD2936510@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_001404_776871_6CE1AA28 
X-CRM114-Status: GOOD (  15.86  )
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

On Wed, 14 May 2025, Mark Brown wrote:

> On Fri, May 09, 2025 at 03:09:57PM +0100, Lee Jones wrote:
> > On Wed, 30 Apr 2025, Artur Weber wrote:
> 
> > > ---
> > >  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
> > >  include/linux/mfd/bcm590xx.h |  7 +++++++
> > >  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> > I can't merge this until Mark has provided the Regulator Acks.
> 
> Could you be more explicit what you're looking for here, the diffstat is
> entirely MFD?

Okay, more explicitly, I can merge this and MFD will have no issue.
However, the Regulator commits make use of 'pmu_id' introduced in this
change and would therefore cause a compile break.  So we could:

  1. Apply this now and merge the dependents next cycle
  2. Apply this now and provide an IB
  3. Wait for all Acks and apply as a unified set

We usually choose 3, hence my assumptions above.

-- 
Lee Jones [李琼斯]

