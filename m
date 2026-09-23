Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7EC98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPbwVw8AvPrMTUbDpUqknizZ4TkUS7ak1cVmIlROZSU=; b=GDvpgFPjNF2+cNdcLL5y1nLeb0
	zAt+53To4Jtz3/LkX61KN77/wDxG0rE7nFax1WNMMWbGuVr3I+BO6fWdgdLiCmqCYvHeBcm2HAVQ/
	bzECvx1bhdZZ9o1Ru3UJTsgrL0XkvcYzoeT45dQ+WkHEPkE+05ZFOzppPXYLIcYnOMV9WLqNzIcx+
	t75QA9xxdIIGKgh+rvk1cKiGF6vDb0aN46IhcrkpMHe2dFY8yCbmqVos94CoyX2jx9ikBP/oodlqQ
	7g6b6O0ng8bo+2ogNNriRjmtizNUxwYBxzIE+Pbg9ad9jE0lbgkUA0xomjDa9jdWWjP96VqkpcCMO
	y+3IPyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lce-00000008A9B-1x6t;
	Wed, 23 Sep 2026 11:58:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lcd-00000008A91-18gs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:58:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C50B54131C;
	Wed, 23 Sep 2026 11:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29A91F000FF;
	Wed, 23 Sep 2026 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164726;
	bh=XPbwVw8AvPrMTUbDpUqknizZ4TkUS7ak1cVmIlROZSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J1V/kd7ZmWBsLX+HguWLeI0boJ+DPXn0S7zM3k8CbyLNfRWmgP8BvhhMdH41+WOE+
	 /p1bk1Afzo6V/gpThb3oHZ8NfGNxO/XFblCIz35VyUgQlCoSKPKl9n11stlO0jJw0W
	 83N3/dMNE/PzVc6guTzeztATChzI4ETsgn27m2rQfCzEiYuzcSLNxlcOzFsbKK6HLE
	 jYYCKWbYanC9EgYDqZmLucIXr5rCQ8I4VcnAWkJ/3+gnueE63zR49JDEzsTR3EaA2Q
	 xymQIk/py5T8SQ7ewzX0Pc+3f3WnRnIcBvV/tvBoi05cZiZbwCepUGHnlVmMh46zAK
	 4s+FzuoHfUxTQ==
Date: Wed, 23 Sep 2026 12:58:41 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <20260923-resilient-speedy-malamute-01c800@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-3-andre.przywara@arm.com>
 <20260921-ubiquitous-brawny-hyena-ff6ee9@sudeepholla>
 <1b87219a-dd52-4270-9127-ec68333ab814@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b87219a-dd52-4270-9127-ec68333ab814@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2026 at 01:46:56PM +0200, Andre Przywara wrote:
> On 9/21/26 17:32, Sudeep Holla wrote:
> > 
> > DEN0147, Section 2.1.2, says that the caller must determine that
> > the SMCCC version is at least 1.2 before calling LFA_VERSION.  The generic
> > SMCCC probing path only checks that a conduit exists before invoking this
> > function ID. That could break our SMCCC bus logic. Assuming the firmware
> > can cope up, it is always good to check the SMCCC version >=v1.2 in the
> > probe which is not done currently.
> 
> So as said above, I am checking this in lfa_smccc_probe() now. If I get you
> right, then that's the right place to do? Or are you suggesting we should
> move that check into the SMCCC bus code? I think the version call is
> compliant with the SMCCC v1.0 calling convention, so should be safe to call
> in any case?
> 

I hope so. I was just thinking out loud here. My earlier comment to check
for SMCCC v1.2 before using LFA_VERSION conflicts with what SMCCC logic
as is. But yes it should be compliant, I was just thinking how one statement
from the spec I used to request you to add a check in probe conflict here.

Worst case we can add version based addition in that SMCCC device addition
if required in the future, shouldn't be a big deal.

-- 
Regards,
Sudeep

