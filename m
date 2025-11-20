Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A13CF64A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 01:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B13YSSVdzv+A9HSJEV6haxN1uEpuGwZCWegPWDkjWo0=; b=iP1z/uC/LExGZFNGhxepPYGn4S
	3H3ZJNIPk/Cvq//zvxIhvhN12gf2ZgKHBshzfB7LYrsPnx1XwQo2nRCZ8TsaVp5g2aysiSXQPHsST
	TyqKj+mLZ3VxlcjDJVkx/YDC02THUIHXCqqxekw37e/JoZlFAoSVz3dUQ+PAnmnsid37gzSQbi1ze
	sFMd0AG+wrQ/KkFTnMY1GeIIq6niat1fKMkC8pe+eTsI8kQwlIXC9mTZfCARlDFOit74+TV7alQ5j
	JsB5eY51hpDo452juv9rPyORixeHyKOrb0AjtxkfXyv6Dg55Jr7Q+MyYjF7NX8HJGYFk5ubSXSkXl
	gfEwmbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLts8-00000005wtv-26Nh;
	Thu, 20 Nov 2025 01:54:08 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLts4-00000005wtF-3pWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 01:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=B13YSSVdzv+A9HSJEV6haxN1uEpuGwZCWegPWDkjWo0=;
	b=FsX4dyzILs5Mz6P4OxTN0CZ6a8W+QrZGfT4i9E3mD9Dv8c2Wr9s1GER+09vuSz
	Dpxgn8PQ5E00Q20Pwiw2acWxvlUkmrX6TRLNIYoPBDhFIob5/fYH1Bbh6yxBhp5B
	1fnjOh6XPpG1UEzIw76l7HjPslGkMFtm4wD6UPJer8H7w=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnHTeLdB5pzrRhAg--.10170S3;
	Thu, 20 Nov 2025 09:53:18 +0800 (CST)
Date: Thu, 20 Nov 2025 09:53:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aR50iy_FWk6PqAUg@dragon>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org>
 <aRnBqgzeotfrdNmy@dragon>
 <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
X-CM-TRANSID: Ms8vCgCnHTeLdB5pzrRhAg--.10170S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnzV1UUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg4ih2kedI5lUAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_175405_397412_4FDF22F6 
X-CRM114-Status: GOOD (  11.98  )
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

On Wed, Nov 19, 2025 at 06:00:55PM +0100, Marek Vasut wrote:
> On 11/16/25 1:20 PM, Shawn Guo wrote:
> > On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
> > > The instance of the GPU populated in i.MX95 is the G310, describe this
> > > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> > 
> > The commit log seems need an update for the regulator part?
> The patch seems to be already in next, but if it can be somehow respun, I
> can do that ?

Hmm, okay, just take it as a protest that DTS shouldn't have been
applied by GPU subsystem, @Liviu ;)

Shawn


