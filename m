Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BD410A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sT5mtSo1QsQf+S0QZQW2rTe3ksJVVRq4/Li6QLpKsMY=; b=CIooXsRSSj0cyBMdyCz5UdsgRj
	r9mkJPBoXa9js4ne+tqsUOOoLR4bDAMPAaU+0a+7HWUwDGcG7PUFr8KK5Kyj+A78HHkLEWFFlg+hw
	3rn5b49z7EMfqkFj5j4McQwvZ0JYqlGdkE+cMKyVc/lxI6p4+qQ8dPapl7K6sw35KASWvpIq0n38O
	LYoe5BDDG5WE4fIbhRYybQ2NkgU71zFhE92Pqf22eLm1+Rvwv3I7cs1vsK4RgBKHm9472oWFR+mem
	c6zx/2UcwUNtd7ql3QPvnid5QHjam45TkgMG+9PsM0Mxemrm2wMpBOnmu78xFxZu0nt5077N5doSQ
	R/ozwIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oPD-00000005wJw-0iS3;
	Thu, 26 Mar 2026 17:22:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oPB-00000005wJn-2nUS;
	Thu, 26 Mar 2026 17:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E4E660054;
	Thu, 26 Mar 2026 17:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC95C2BCB0;
	Thu, 26 Mar 2026 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774545720;
	bh=gWAQKtriBxFBte89uPYeWlvezYh2OvK63i/Tp6/VF7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ruj8LsbcbV4dCDq0E48OMRhVzsMLuW17ySAFidrwpOPI40LzVLOiGQ8tlIpee46IV
	 NVnj/U+ctWN8apMnF7ah0Z3pKHeoYBjboAHwulMGFECwUtBmsUbqZElv8W1/Rhnjjj
	 cdxnu5ZGxYk9zca2iRoQ7nuKRj8+/FhHDSPUuFWcAajYRoZuibqnMX7q51UAhjTwnE
	 VdRHq5EpNHzWQEoZibO89qbiOBYCdScrXm11x8doEqQ0e64wsj3Qmep3EO9qmp3YMy
	 EDl7rxZQeMxuvDvukj9qbgbHeJ33ud4N3udWdBh4q0bSCB3iXYH/sb5PVHHkBAHaCB
	 IXnzD3kyCiDSA==
Date: Thu, 26 Mar 2026 17:21:52 +0000
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net-next v5 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <20260326172152.GQ111839@horms.kernel.org>
References: <20260324073017.376-1-lizhi2@eswincomputing.com>
 <20260324073408.439-1-lizhi2@eswincomputing.com>
 <20260325180330.GL111839@horms.kernel.org>
 <2a12c839.5e64.19d28232537.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a12c839.5e64.19d28232537.Coremail.lizhi2@eswincomputing.com>
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

On Thu, Mar 26, 2026 at 11:14:45AM +0800, 李志 wrote:

...

> Hi Simon,
> 
> Thanks for your review.
> 
> You're right, this build failure is due to an invalid clock reference
> ("clk") in the Ethernet node, which does not correspond to an existing
> clock provider label in the current DTS.
> 
> For context, this was discussed during an earlier revision:
> https://lore.kernel.org/lkml/5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com/
> 
> The EIC7700 clock controller support has since been applied, so I will
> update the DTS to reference the correct clock provider and ensure the
> build passes cleanly.
> 
> I will fix this in the next revision (v6).

Thanks.

Please be aware that if the patch is routed via net-next,
then the dependency will need to be present in net-next.

