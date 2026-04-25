Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA03FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrOTvtcvWrP0TyutCm83pMXD9rX5I3pM0QuGMxKVktQ=; b=myZLi7oXP1cMArzJuW4f9qq5Q+
	62Xq/7quvi5aeh7QdMqrv+s2srIJo7Ph9eQY5DDvOpolIIBPkyXvwNiKB7ZRACNIGs750K4eFSHuW
	RK39Peu0vRiii7r0AgfC+sQutpWAd7nlSWxTDF0ixmco4EWlGhlFzrD1Vd0OmC/Sj1OP71Q9C9jnY
	0F17Tj4jtli3VkvyodnpSHPHgppUhzaGuoY53bC9exUimzEK92weylEZFDtPvPosByuoRiPCgQQiF
	XmK5ZTg5rvAWVNt95uDTfok9VvL2rmCPv/SjyautwaY9o7F3cHFid606W7Nv5sifjKepPefOqHiLm
	ZhOckNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZoB-0000000EKFx-3rtv;
	Sat, 25 Apr 2026 10:00:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZo9-0000000EKFc-1PD0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 10:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B45EE40A85;
	Sat, 25 Apr 2026 10:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D2CC2BCB0;
	Sat, 25 Apr 2026 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777111216;
	bh=0JI/sNhBy7s5x/BVI9wTKO0mI5GBqDtKbA7wQnD5N3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwmye6amN9Ii56XtGCyVLlIySXU6NXdKia5YQdMmYiGO4+Qrad9jKp1zwC243Of+g
	 9Mtdo5xpmxVXCLNiU5Q1k1AAPX6ehs+5Nkepk8cmCDawaRvGDehvglZasErnowzf7F
	 JZqHGW+VbhzZ2x5zZ2EUhdXITKbhdG6U01aFVsgzL658R9atdQembuVCysJ507Yo7H
	 kbs6ZwoPsmmipysGr0K4uqcayBqchOE+R5I6zHy/NegQaDTzhQfEoP1/lSX+H5crbj
	 1u2J6H3e72bRv9idBoOZVGWonRPNZzXdvAdWfam3hTr/r+iifGfSAdalb/6RQWo4hy
	 DtSE5SopYCmMA==
Date: Sat, 25 Apr 2026 12:00:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com, frank.li@nxp.com, 
	l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <20260425-agile-impala-of-unity-cadced@quoll>
References: <20260424025735.1490772-1-hongxing.zhu@nxp.com>
 <20260424025735.1490772-2-hongxing.zhu@nxp.com>
 <20260424-sinless-unfiled-d1087a894da5@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-sinless-unfiled-d1087a894da5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_030017_388910_7B3681EA 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, Apr 24, 2026 at 06:06:18PM +0100, Conor Dooley wrote:
> On Fri, Apr 24, 2026 at 10:57:33AM +0800, Richard Zhu wrote:
> > Add optional 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q
> > PCIe binding to support PCIe event-based interrupts for general
> > controller events, Advanced Error Reporting, and Power Management Events
> > respectively.
> > 
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> 
> This binding supports lots of devices. Do they all have these additional
> interrupts?

Yep. Commit msg says only i.MX6Q...

Best regards,
Krzysztof


