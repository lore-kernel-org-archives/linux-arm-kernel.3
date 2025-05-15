Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0A6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uopQP3QShbo2PDcrWulO+Zmr63n4lDcaFCwy7boYw0=; b=sX2XDEZfIahgEaFYqj6PSelDUk
	p4s0XOFOvzWAX+1uND6kojELjoxL5JPgE1I404jjai20BbGIroRYKObkwD/mMiX97KmCMBdTUbkmV
	jIvR7MtKGTcMqhu6nV7t/zY2qvCMdHELY/m6/bJ9KUqE8z+BOwR298/N4wsZZ7HqkxaVymqotACrd
	2EfxCZFnDSz7Vbm6lm7T6msAOyk/1/b9MW8dkapXnHpxlDKNLNXtY4EN4VEgbuaEdmL3xX0Bf8ikm
	To68bmLWi0jtzhUAO0tci0VSC7HKF1/uSHexX8Q+XAgG40aC8P1jHWt1R/cTjdlOBli+DQcr9j3Ry
	natyhvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUpX-000000009E7-3QBH;
	Thu, 15 May 2025 09:24:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUl4-000000007xU-3JAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2A9A5C47DA;
	Thu, 15 May 2025 09:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226EAC4CEE7;
	Thu, 15 May 2025 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747300806;
	bh=rm618sxDeCiPbi8y8NEmx3FDI0gdJMROpy9V3fCDMDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZOSz8X4ZqAwZlE2i4UNV3piIuYOa7FOuUZiETU8K1rG+qkCBfajGh9vnIF6NhVMj
	 pgJsy4tLUzSAkZMM2u34obTByikyyOHn/D4XfZx6DuOaHoeLzrktc8DB6uJebYtOLw
	 71RYOtNxXT0hBXSkQl5PjSt2HZZoBnkAVNmvIj2Uh+qvX1GP6+bWG35Em0ysD0H8Eq
	 UsVg6nz1/2H7HunM2n3XZia+LuZCqlhI4pFKPGprfyeQ8TYmEiEMT62FkRd1OKOjY+
	 3/HgEyi2ngq4aQgnJSecO5Pk+h9VQzQc8vZv+5okj2CKDIbMKdjsTaXgpwChXrxzPT
	 EL2k2gcGKk7Xg==
Date: Thu, 15 May 2025 10:20:00 +0100
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
Message-ID: <20250515092000.GF2936510@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022006_871878_8251EC59 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, 15 May 2025, Mark Brown wrote:

> On Thu, May 15, 2025 at 08:13:57AM +0100, Lee Jones wrote:
> > On Wed, 14 May 2025, Mark Brown wrote:
> 
> > > Could you be more explicit what you're looking for here, the diffstat is
> > > entirely MFD?
> 
> > Okay, more explicitly, I can merge this and MFD will have no issue.
> > However, the Regulator commits make use of 'pmu_id' introduced in this
> > change and would therefore cause a compile break.  So we could:
> 
> >   1. Apply this now and merge the dependents next cycle
> >   2. Apply this now and provide an IB
> >   3. Wait for all Acks and apply as a unified set
> 
> > We usually choose 3, hence my assumptions above.
> 
> Well, you choose 3 - I do think it'd be a lot easier to go with option
> 2, or with applying the rest to your tree as acks come in.  There seemed
> to still be a reasonable amount of discussion on the MFD bits (eg,
> there's some formatting comments still) so I was expecting this series
> to churn some more and was waiting for a resend.

Yes, I expected to apply v9 with your Ack.

I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
in would be sub-optimal and would likely end up in a mess.

-- 
Lee Jones [李琼斯]

