Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B76C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPOrOe6Ks1WSFeqdgv+rLZaq6MjbwOFkeEJJHOUYbIU=; b=RoZOKmTJiNZiYGXuTIFlbZ62pv
	ICL88Ig3nU0ipcV+tN1g0DurR1nlNNp9IuaVuJed9g13gzc+0j0417oAU7kFFOCmfEI5aHzY4yKS4
	SQiz3iV51hdyPbugj98CKoGsvxKnjB5WQv5+vlTuOPU64la42WfbYgkAU4I0A2SE3fpf49eCFCwqL
	nFUBQCLxOTRxykySf7QDG0gIbExUYt5EkrennlNOtJrSNdh5CagvhK72QN2iLVKFlTAFCl0v/i984
	AoPZw38KIItGAGqVFxAafSfpAeEaRlenJLT742ZfHRs9lFgT18LSx4NP4lkVtz7GfDP8LsVYiaG2c
	afMT9w/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvEC-0000000HTwp-0gK5;
	Thu, 07 Aug 2025 07:39:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujv3m-0000000HSzQ-05y9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3616D613F0;
	Thu,  7 Aug 2025 07:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A37C4CEEB;
	Thu,  7 Aug 2025 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551747;
	bh=BPOrOe6Ks1WSFeqdgv+rLZaq6MjbwOFkeEJJHOUYbIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdWc4I8gF0rtG32Vov1M61PgSNVNH5fNQBqZavWPSx6RrwL9naqlfeKshageFZsEa
	 pcullofjttvEKmZNgF7FlPvOtXhiaQJ3Hi5idPJqtzJNu6wxBt8tccKuSuqE163Mtt
	 aw6i++aPgfPE+0fJXFS/uJ5w9tMWlPl2n33m0Tw0fbG52ZnzctZQlUd/kw9tTCWxTl
	 RZB15zs8KVwtYd8E31X0imhQyAFM2FqUkkxifWTHSzsvwoC6vU9PAi65uBVgW4UvXm
	 NnXQGhSM7zby1FRQ1uC2w2nZqk+ww7vYElEmLoI+UTD0gD3om89MxeYsxHdpSO9y3v
	 aglCu0I9UNmXA==
Date: Thu, 7 Aug 2025 09:29:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add
 optional ldb property
Message-ID: <20250807-airborne-rich-lobster-6f8e2e@kuoka>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-7-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-7-laurentiu.palcu@oss.nxp.com>
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

On Wed, Aug 06, 2025 at 06:05:13PM +0300, Laurentiu Palcu wrote:
> Since the BLK CTL registers, like the LVDS CSR, can be used to control the
> LVDS Display Bridge controllers, add optional 'ldb' property to handle
> these use cases.

You did not add property here. You added child node.

I don't understand the rationale at all. How the registers could appear
in this hardware? What changed that registers were not there?

Why every device here has ldb child? Why camera has ldb?

Best regards,
Krzysztof


