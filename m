Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54FCC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJNAMbi5OSFWMgFQTSzpGQ2SGZpiqdmKVKO2S1+nBak=; b=07ZaTZ2pJWOb83kOgaA4MNyU0F
	377JBYZ/YXSJjzCHEaZm4VP+JkYosMi/di8UZlVWCemg1NSyu1xbkJzg2LlYaddZhHT3rIU0uZ9nG
	EVaja8SMEgYc37I68plFWpkKqTahzzH58VVpl/nHP4ZIBQuAAx8MTgV27Mb1GeQl7uFs2An5ytIiw
	aRS4LMrJX58tE1TuXJj25mMgaXLQjjFWL8Q/D2rnXM4hNF8cRF+9K2Q2jwY4/lwiZrhzE9RAAeA4s
	GqwH0h9fGfVnwNJFerpmNqMLRPro5rhC4cjVHKmdkqpDFLNfXdyT0pAc7zX38jogTG/3TsmDtOHnU
	15CSaXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht5a-00000004V5t-1T1J;
	Tue, 11 Feb 2025 16:26:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsrs-00000004RWm-2pHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 948BA5C4A9F;
	Tue, 11 Feb 2025 16:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1A0C4CEDD;
	Tue, 11 Feb 2025 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739290331;
	bh=XAmJT4YLfE1GmV8k7jA8oiQS+4DF9naVy5ayUlr3gfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h61IAedW0WZ/MSnh4rTUDSXKIomWuw+PhQyFn1Bo0Iay1e6eMzUc4VjG/3DvBRGBj
	 Fnzb5J/AWtwRtlXkswp1kCPR4BtcdB4chZUT9ocyJsLswckVSPr5lRK5KQ5wcafPUj
	 hl7++gfGrt7P+j+/LQ/8xb0Y2OsI3JWNWeOPH2mTtYiGfdXDS79wWqpLF5lE4gwx4d
	 6t0Y7HunqUgzh+y2o2p9IktjURicCZd/P/zU6Uiu/4fcer/JRx69rkUeG7/XPE8Mqm
	 NLqE29AUFG5QA93bO4Rd6PU7s08akOLpf9hKoqx/FFhqIzlYpram+bv1gbrZx8Ttnl
	 sYEXHipJ/xoRQ==
Date: Tue, 11 Feb 2025 10:12:10 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] pwm: pxa: Use #pwm-cells = <3>
Message-ID: <20250211161210.GA354180-robh@kernel.org>
References: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
 <lzlzq4fh3762kyezzr7eqnbkgsu6nbvzgi7yqzwy5tbsrb4tg2@gdpjz3cqrqq6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lzlzq4fh3762kyezzr7eqnbkgsu6nbvzgi7yqzwy5tbsrb4tg2@gdpjz3cqrqq6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_081212_760446_05A9B45E 
X-CRM114-Status: GOOD (  26.64  )
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

On Mon, Feb 10, 2025 at 07:31:08PM +0100, Uwe Kleine-König wrote:
> On Thu, Feb 06, 2025 at 01:06:24PM +0100, Uwe Kleine-König wrote:
> > Hello,
> > 
> > this series' goal is to soften the special device-tree binding of
> > marvel,pxa-pwm devices. This is the only binding that doesn't pass the
> > line index as first parameter.
> > 
> > Here the #pwm-cells value is bumped from 1 to 3, keeping compatibility
> > with the old binding.
> > 
> > The motivation for this was that Hervé sent a patch introducing pwm
> > nexus nodes which don't work nicely with the marvel,pxa-pwm
> > particularities.
> > 
> > Changes since (implicit) v1, available at
> > https://lore.kernel.org/linux-pwm/cover.1738777221.git.u.kleine-koenig@baylibre.com:
> > 
> >  - Use #pwm-cells = <3> also in the binding example (*sigh*), pointed
> >    out by Rob
> >  - Add review, ack and test tags by Hervé Codina, Conor Dooley, Duje
> >    Mihanović and Daniel Mack. Thanks!
> > 
> > I intend to take the first patch via my pwm tree. Assuming the pxa and
> > device tree maintainers and bots are happy now: Dear pxa maintainers,
> > please tell if I should take the whole series via pwm, or if you want to
> > take patches #2 and #3. If the latter: Do you want to delay application
> > or should I provide an immutable branch for patch #1?
> 
> I applied patch #1 to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next
> now.
> 
> I don't know yet what should happen to the two other patches, but maybe
> it's a good idea to wait a bit anyhow to have 3 cells working for the
> pxa driver for a kernel release or two before we switch it.

The dts change will never work with a kernel without patch 1. You can 
somewhat mitigate that by backporting patch 1 to stable. If users aren't 
doing stable updates, they might not be doing dtb updates either...

Rob


