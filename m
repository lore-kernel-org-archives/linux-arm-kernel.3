Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA3EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy5u/ulodLTDRqJWPoURFu+B8nn/sPW/Vm10qLOT0ks=; b=FGCzWW5OudwrBgjCIIKj66Degn
	gfXyPNa/B0h7Hbzj+F/ajcCGXnesGdlb4d95X5IpVmAa9VZdK1BK2e8SvE0DVZjgcbjkIjYvzk1qA
	DBtig2RYIxrdlu2QNo7fbkEC5q1fZOxPOKvXCudwqhfooHVdOSKRGsclUpeZtpnVMxGD7e2tYfXqL
	+zM2yqMc+e3WPqd5Xlzk487BjypTA/6PY8z4DW4c4j70SP3O7+lSkGLLoHSgjWllkvYO7r1XS3iYg
	lRgOUgQh/i+XwaQlpCzbjuQk0soTe62EbbNNDQPFYrE8wQwA+zrIqQpJZevSvEfL+put7kfphqLyj
	k0Y/TaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUx5j-0000000DDk6-3Ekp;
	Fri, 27 Jun 2025 00:37:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwDZ-0000000D52E-0tA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:41:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C66D5C61BA;
	Thu, 26 Jun 2025 23:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4146C4CEEB;
	Thu, 26 Jun 2025 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750981280;
	bh=nufpK4Nake12iu3u9jfr0M9zStpbPBpxmbakfnPf704=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJ/QpE2B/GzkordjchYV5m/4fLjACW4smPYxkk8ImwOTXwMWGGPxz6uEiv3PwbUZH
	 V6GWQdR82jvw+2fXaBrODv6QK/cP/lMIAlUy9JXcZjzyhPGnmTMX7JBirCVLcKUflN
	 eAy65iQfvYpkokLNo60qeAO3rBrRyvIwTgytXObbPOdp4xpPKNxFEYIMSo7TwxurzX
	 BmRRkjlFrEJP52q/9YP+wqHGvDPwVXkrPuXIY1jAg1BYrTHelcaf/EvbgJl3WWzbSH
	 7dCCdwMmerDHMV5pk3XxH6VZcv1URgGmeMOBE5T6hKw2MxUHTBuUx4rbpJkWqMWPmG
	 V9gfwJKXzXpEA==
Date: Thu, 26 Jun 2025 18:41:19 -0500
From: Rob Herring <robh@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, richardcochran@gmail.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Mun Yew Tham <mun.yew.tham@altera.com>
Subject: Re: [PATCH v6] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <20250626234119.GA1398428-robh@kernel.org>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
 <20250623111913.1b387b90@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623111913.1b387b90@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_164121_292046_45519CED 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, Jun 23, 2025 at 11:19:13AM -0700, Jakub Kicinski wrote:
> On Fri, 13 Jun 2025 15:58:44 -0700 Matthew Gerlach wrote:
> > Convert the bindings for socfpga-dwmac to yaml. Since the original
> > text contained descriptions for two separate nodes, two separate
> > yaml files were created.
> 
> Hi DT Maintainers! Thanks for reviewing the IPQ5018 bindings!
> In case my pings are helpful, this is the next oldest patch in netdev
> queue. The v4 seem to have gotten some feedback:
> https://lore.kernel.org/all/20250609163725.6075-1-matthew.gerlach@altera.com/

No need to ping us. Like netdev, you can check the PW queue:

https://patchwork.ozlabs.org/project/devicetree-bindings/list/

In any case, we're a bit behind ATM.


It looks like we have 2 competing conversions of this binding. This one 
and this one which I reviewed:

https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/

Looks like there are some differences which need resolving, so I revoke 
my review. Will follow-up separately on both.

Rob

