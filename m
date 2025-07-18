Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B69C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSPaaQKD+1KQwE0RoZaqBfGqciSCheGL4nggpnlyPHk=; b=keubk8zruN7rKmbBoQtkxZt8Is
	l+mfQwFaC0LNmHHmIdmG/fzWCTpOXxiFbbCoK5E7zqFEJzFQbMIt0im8vTRdYVYTIPD9Vi1k97VRw
	IVw4GxHr8XIygKxTeiP4WQZjeKIpiCXlgP3ZsAOofZUREWu8GguPqIn6SdSkfN1F8YpeLTrkatL3X
	7mpektw4UZFjmoRgkQtOkTZ9KSKoh2uQAW6/vDHpq2K8yC4JkA0FeUz60Rml/D8sSlcxhq+j1hLQ8
	PjjqmB3+o4ObXOzJRI2rkBGPXZfuPeJgIHayfuwXwT9ze9pjZjVAkm1v6uq/8+SuixwfOBmfBsYAk
	IoXHiMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpDh-0000000DGFh-0RPh;
	Fri, 18 Jul 2025 17:50:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpBF-0000000DG1V-0P8C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=YSPaaQKD+1KQwE0RoZaqBfGqciSCheGL4nggpnlyPHk=; b=wl
	irihv7J6I0SLdkRjKy8NvcQcyBKNBcFfGm9BxhDwNRKoOd9xRwUDTbrxMTMT1+uzSjAlkcByMLc37
	1FZG1tjoPTw0PBHCXGXHE/tBnQldrKWr2s5qmaF5AD3E+FB/iGmXPQ0luHxn0L8/H9ggfdgEE6rIw
	UOXdspGlKsOBbtI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ucpAz-0021D4-Ci; Fri, 18 Jul 2025 19:47:17 +0200
Date: Fri, 18 Jul 2025 19:47:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [Upstream] Re: [PATCH v3] arm64: dts: freescale:
 imx93-phycore-som: Delay the phy reset by a gpio
Message-ID: <07a0c325-03f5-4b5d-b6e7-9477aec4e5ad@lunn.ch>
References: <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
 <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
 <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>
 <739f93d0-4cb4-4f1a-8792-84502d4beefe@lunn.ch>
 <626bca58-e481-4d6f-9bb7-252c040f4b3b@norik.com>
 <ad5e7450c5cf3a2f9a5d3c23f7219eb08be31062.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad5e7450c5cf3a2f9a5d3c23f7219eb08be31062.camel@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_104733_137876_A5504046 
X-CRM114-Status: GOOD (  11.81  )
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

On Fri, Jul 18, 2025 at 05:33:05PM +0000, Christoph Stoidner wrote:
> On Di, 2025-07-08 at 10:35 +0200, Primoz Fiser wrote:
> > Hi all,
> > 
> > is there something holding up this patch?
> 
> I dont see any blocker.
> @Maintainers: If there is any missing/blocking point, could you
> please comment.

This _might_ be broken for NFS root. But that can be fixed when
somebody actually has a problem with it.

	Andrew

