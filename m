Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75FAC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwCh9Ld1JOdq2P1NYMKZndipV6XqTb9tvIWRkfYlK6g=; b=qeOYr+bx607M7f5o7KBZOqqwJm
	bFNB4IGeYgy6VIaM8N+2RiBp6nELNRfgJiW5Olg20YfR2AyoljSWs8nL40pJRGs5GzlHCGt8KybQe
	Hcde35VWLU0upc2ZjVkeDb54tu4Wdp05jEzn1xxsT1m4z7Kxk/bCxaluY/5qQX5bXEvNw7UIlspUd
	L6Jr/U3XMVM+3a3vO2QSH46cXOuDQxl7Nm5pSAHR4A2w1ijB+7vC8jrOG7sfezdAcp7VZMm5nrT2F
	Ri0ODtGY0d++lcDcIe0YwKDXKbw3U1pSKfNLb7e+LK5ZORYsLCygfRfWOUtiGwoRsLGxiSPpbOVA9
	OS+nTOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eYX-00000003Wph-3XFs;
	Sat, 05 Sep 2026 00:46:53 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eYV-00000003Woq-0VVb;
	Sat, 05 Sep 2026 00:46:52 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 46CE9C2AEE;
	Sat,  5 Sep 2026 03:46:41 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 46CE9C2AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788569202;
	bh=SwCh9Ld1JOdq2P1NYMKZndipV6XqTb9tvIWRkfYlK6g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J96grHf2SOphrttK7FzcYLqiA882B2VNzMTii/hBrr345ASQqtHBDMTUkvNbT0aUA
	 4yDthPWWcLTeGrku7JDU0pwaDBud41inkc+RmsRtNv1pRD15x0h+q6Gdf53gTzFp65
	 9UCizr98DRVRJO9s6gaxjpiCKTvTiQLk4L2MCqOYHIyT7B7cCxhsRtQ3RknxubG2j8
	 BcEUtlmnCW9aS0py3srFk6Jyy2V4/3PhaOGzuhpE0vS+vo58SweQpT7lgP7ttuJeLU
	 wCqFvdPNK8iQepfVzwjkdmFv9MV9X4V1clIWRO1fugv6NfcpsjocyLDsKrHC5fUTsK
	 lWwk0eHh3uHDQ==
Message-ID: <bca904b69fbdb2a0bfa7afb1e3fd055184fa87b5.camel@rendec.net>
Subject: Re: Interrupt chip driver maintainence
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>
Date: Fri, 04 Sep 2026 20:46:38 -0400
In-Reply-To: <871pb9841j.ffs@fw13>
References: <871pb9841j.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_174651_504435_3B771DBB 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, 2026-09-04 at 16:49 +0200, Thomas Gleixner wrote:
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
>=20
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.
>=20
> I've just marked about 20 patches and patch series obsolete due to zero
> feedback from the relevant architecture/SoC people who were on Cc.
>=20
> And I'm going to do that from now on very consequently. If the
> architecture, SoC experts can't be bothered to look after their stuff,
> then don't expect me to suck all of this crap up and then deal with the
> complaints when it breaks.
>=20
> I'm still going to pick up obvious and simple bug fixes, but for
> anything which requires deep knowledge on the underlying hardware, I'm
> going to just mark them obsolete when they molded in my inbox unreviewed
> by the people who understand it for six weeks.

I think that's fair!

For what it's worth, as a simple reviewer, I also consciously ignored
multiple patches that required knowledge of the hardware, simply
because I didn't have that knowledge.

--=20
Best regards,
Radu

