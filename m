Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC014C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvslIDPnB9HfRlx4AQWiUW7XrU6A9m1Gg6T9aG8DNh8=; b=Kv8+Qbrp+E1/bbjdvmjBl1tDkV
	fdKgqVNxNIcztkzxF0CPUunNY+qcVWsR8F0yOnuMPpArV6Kq9LGrS0O9Wy3/XEGRkSTr4i7mg2ArL
	D39gAr450CU/wo/dBbWcUHPFDsTdTHMUB6rMZxX5tdk2ewFG9xZw15fxA80JYBd1yI1elRf0ehsZo
	d6eZ/LZOTR2T5ETKR+MsV6TSvMGC6Mr/1QfyBk9/DOxvusM/UlRmvDk7R+nUlBd280v/AOXCmbPo3
	lnixewc3dIAjdwd+aIjHe7FjGzohl0lLvnQIuyedGzNGpo1y5oQSx7Uc7NzPlvUIZc5L673wpjepR
	SZFGIesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vMN-0000000Dxnq-3pzn;
	Thu, 24 Apr 2025 12:07:20 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s2k-0000000DKyD-3Sar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:34:52 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D879C1F843;
	Thu, 24 Apr 2025 10:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745483689;
	bh=bvslIDPnB9HfRlx4AQWiUW7XrU6A9m1Gg6T9aG8DNh8=;
	h=Received:From:To:Subject;
	b=ZDht9GLoCePMU+ZHvIY/kGiH6nNKaXmnvOOu97DuLln6/irwnb+JLNI90rdVl7XT+
	 YV8Q9qL8XD4KZ9qTn4bxRWnueYXNXcvclg+ANWDObBka3Xgg4aT/u2PjehARf8AcjT
	 CHCknnBGhpmyj8fp1x+v3EcHzKcPCR+lmjMNCKu6wAriyMitrxmY5UJvo0dhJ+bj2w
	 AHfmaWlW5tkGeSqWWHHfg+26xe6cKTX9Gb/+653y5RJyct4smtESPDLPmDBQa4xWtD
	 rI/pbB7/V3LYsO+9dkTen7ZXTvzDau5LxkSjp+BiZ1jkGd3BRVttEHF5dGdTPH+q1n
	 +hfMGLQWy3ekg==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 8B3D57F820; Thu, 24 Apr 2025 10:34:48 +0200 (CEST)
Date: Thu, 24 Apr 2025 10:34:48 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Philippe Schenker <philippe.schenker@impulsing.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: EXTERNAL - [PATCH v3] arm64: dts: imx8mm-verdin: Link
 reg_usdhc2_vqmmc to usdhc2
Message-ID: <aAn3qBG0ckInWvs1@gaggiata.pivistrello.it>
References: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
 <20250423095309.GA93156@francesco-nb>
 <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>
 <aAi_PPaZRF26pv_d@gaggiata.pivistrello.it>
 <9eb7b15068eb8a4337ad0ea2512d02141afd491c.camel@impulsing.ch>
 <aAnXK0sAXqfTNaXg@mt.com>
 <aAnmZkpuaMOU0n2J@gaggiata.pivistrello.it>
 <ec0f5da5a4da6b2649373530d0103d65ea990c0e.camel@impulsing.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec0f5da5a4da6b2649373530d0103d65ea990c0e.camel@impulsing.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_013451_024572_CF3A0367 
X-CRM114-Status: GOOD (  33.28  )
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

On Thu, Apr 24, 2025 at 08:20:32AM +0000, Philippe Schenker wrote:
> 
> 
> On Thu, 2025-04-24 at 09:21 +0200, Francesco Dolcini wrote:
> > On Thu, Apr 24, 2025 at 08:16:11AM +0200, Wojciech Dubowik wrote:
> > > On Wed, Apr 23, 2025 at 11:23:09AM +0000, Philippe Schenker wrote:
> > > > On Wed, 2025-04-23 at 12:21 +0200, Francesco Dolcini wrote:
> > > > > > > 
> > > > > > > I would backport this to also older kernel, so to me
> > > > > > > 
> > > > > > > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial
> > > > > > > support
> > > > > > > for
> > > > > > > verdin imx8m mini")
> > > > > > 
> > > > > > NACK for the proposed Fixes, this introduces a new Kconfig
> > > > > > which
> > > > > > could
> > > > > > have side-effects in users of current stable kernels.
> > > > > 
> > > > > The driver for "regulator-gpio" compatible? I do not agree with
> > > > > your
> > > > > argument,
> > > > > sorry. 
> > > > > 
> > > > > The previous description was not correct. There was an unused
> > > > > regulator in the DT that was not switched off just by chance.
> > > > > 
> > > > > Francesco
> > > > > 
> > > > My previous reasoning about the driver is one point. The other is
> > > > that
> > > > the initial implementation in 6a57f224f734 ("arm64: dts:
> > > > freescale: add
> > > > initial support for verdin imx8m mini") was not wrong at all it
> > > > was
> > > > just different.
> > > > 
> > > > My concern is for existing users of stable kernels that you
> > > > change the
> > > > underlying implementation of how the SD voltage gets switched.
> > > > And
> > > > adding the tag
> > > > 
> > > > 
> > > > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support
> > > > for
> > > > verdin imx8m mini")
> > > > 
> > > > to this patch would get this new implementation also to stable
> > > > kernels
> > > > not affected by the issue introduced in f5aab0438ef1 ("regulator:
> > > > pca9450: Fix enable register for LDO5")
> > > 
> > > I will wait a day and send V4 with what I beleive was result of
> > > this
> > > discussion.
> > 
> > My opinion is that we should backport this fix. The DT description
> > was
> > wrong, that change on the PMIC driver just made the issue visible,
> > the DT is about the HW description.
> 
> From what I understand it was not wrong but it became wrong with the
> PMIC driver changes.

It was wrong. You had a regulator described as not used, and therefore the OS
was free to switch it off. For a bug in the driver this regulator was not
switched off by the old kernels.

The DT description was never correct.

With that said, hopefully it makes no difference in pratice,
f5aab0438ef17f01c5ecd25e61ae6a03f82a4586 will be backported, and therefore also
any fix to it should.

If for some unfortunate reason we do not backport also this one, you'll get a
non-working SD card on your LTS kernel.

Francesco


