Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A23CFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJTgCTrCkb1GyKzUG2adEOYBOBSffMZ1KkRKxnhunKk=; b=ijuvPJQXrUvhOxCXi87jr2WoaU
	XJMl6BuT6uPJb5Nz8UZTI3W03/Q8uvC8/zYk341nP4KErC3NeZ1fo0Wi/ufWQDScMDqaCJ/BidCBd
	NtXrOAH0/S7oRHmdThxIAAwXrbi0b93YmdFY6UIYMWJvoyZ6KkmXPMNF2jUWEW9LL9KdnKsr4dCJF
	6/2fcrBgkmWdPj25pcDYELdb2XTsE15N8TV/te1+QICCDMnEBbgb4ZVtCas22I97DC+sd9c/6b+Ub
	5ewGwFQkEPBQCs5dySEcnPwZp2GxTaLrOj6qfEHuohvjoRVijKHPGcPjwhUFJBQccIb2VXpmstkfz
	kbAV0kIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dsW-0000000F4v6-3yIx;
	Wed, 23 Oct 2024 16:06:33 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cy2-0000000EtB6-15te
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:08:12 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6AF5740E028A;
	Wed, 23 Oct 2024 15:08:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aB7gkiigdBbs; Wed, 23 Oct 2024 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1729696082; bh=EJTgCTrCkb1GyKzUG2adEOYBOBSffMZ1KkRKxnhunKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js3IozBhFrMQg+agM/fc877Updu8NsNIguPNHMZ7rds1USIWeHU7sI54e4hdtut+z
	 Jq2ifTJIas25MzdXThFZyS7+y4rcn0l4cUPPqIN6yAi6uWvpyQuHIEBf9b4A2kuSGF
	 MjV6uhpw9QrUBo8sfAXoNF0P9+XM4nUoCdGJpufhhI4RU4xGgPsU2rX58GQZHfxthu
	 A61KHu6hFJ0dBPviN34LjTha9GvnEbCKQagou/3gn5UYeuHg8JTZkER+e0ZOL7ZWo6
	 /oPSCh1H0JgMwbtjctWR3xghFt29K/WzGmBzOHbKNTybl51qhVq2AoXOQ6n3hfF2Ed
	 TIdj+A7O1HE4Y4lgwufjFCvGYjfUan9eBTwkyciU9NHllyRw6rSbemZ5Choh59p1Ac
	 mSgiVofDnLWPL1Am1O1lcP11t1Awsr8NISYRIaghhn48iceHya9Q+kdqRP7ECAdChk
	 cyK15Vg3PY5E364AR8V0g/sYRYAPPRC24CJNCPB8QucKNxv9cBL3re8+3NI20GycIJ
	 6hsFQ/f87glVFer17Ck1M+/wFTI0u4CDGUFvuA02XkBsP0NODj9A8tFrxq+Rta8dAk
	 bAVUOwIWlP/bh0ydV3cIJxy23al2/Txz2ZsxYzfkXPnQV1hvk88LK4Uqi4Gk5KCFYf
	 twrQkwkyHdFDXBe1l7W7mJ1M=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C6AEA40E0198;
	Wed, 23 Oct 2024 15:07:36 +0000 (UTC)
Date: Wed, 23 Oct 2024 17:07:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: York Sun <york.sun@nxp.com>, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Priyanka Singh <priyanka.singh@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ye Li <ye.li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/6] EDAC/fsl-ddr: Add imx9 support
Message-ID: <20241023150729.GBZxkRMZ2zqvt2hS0z@fat_crate.local>
References: <20241016-imx95_edac-v3-0-86ae6fc2756a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241016-imx95_edac-v3-0-86ae6fc2756a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080810_479080_BCFF7E2B 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 16, 2024 at 04:31:08PM -0400, Frank Li wrote:
> Add imx9 support for fsl-ddr.
> 
> Patch 1-2 is prepare patch, no function chagne
> Patch 3 is small fix for bit shift
> Patch 4 is dt binding patch.
> Patch 5 is driver change to support imx9

First 5 queued.

> Patch 6 is imx93 dts change

This one goes through the respective SoC tree.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

