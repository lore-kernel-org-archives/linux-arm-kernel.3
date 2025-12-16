Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB0BD609C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9dZCeK20B2E8dRjlfiu/TdFb4hT1h2TtVis6brnVgw=; b=CWEKbNe/Sv1zh4S+38h9kHoiUO
	meCoMGmCDGOOxLVf5Km4QXDPmf7zF+asfwmRz7eLhj1/hM35a3JqNoeZjV+x9u7Z1r+3FojuNYRL1
	wgu2N+mKKpvfHniOLoUy/aG9mdZMt78WKtwZJW2mdd58ZnCnGC7/DY7no+lEdru15OHOtpFjatabd
	OJwvzSyJecoBGr+txpLgvgn8GVMXgD/YJ2u/qAMTMiXaIb7PciKvdzjEc2rhXN0op66xzWNbOoMij
	cAtyofKZnGmVvArXsLM5LWHjdgZWm+7gq70HhQJlQ4KzwTpLJMFUo3Yk/43f7lBVmn/hl93MMMsGV
	aDbJm0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6v-00000005XtW-1KSM;
	Tue, 16 Dec 2025 16:41:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6t-00000005Xsz-3kdb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF2A960138;
	Tue, 16 Dec 2025 16:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E149C4CEF1;
	Tue, 16 Dec 2025 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903274;
	bh=BNGlKNXrFcMszHtpZGdpCBGMA44Zd4nfy6zZNUS2vIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdBtsUDnEeP9v86imiJVmiOfvQ6YE6GciqyakMtIWMGnP7yZNeVzJ1O9o6dlqchkx
	 xdSghYihJgLERGWEGhm239s4eWOnICPsD/zHmxajGzEqIZY60QP8e7r8uwNwhx2Sg+
	 L9HsZnimownJ5Ecoz0VcX/u13wl2Uc9uqT1snASx7DPoTDl4gvUON5aynabgV5zgx0
	 ab9/mxCk8ll5CGpvI44mwxIBnpEt7yI9HELpUHFVEtXDPKT2bctvSuJ7tj5tfzcnBB
	 EqGSkws/+FE+0ZT/7rOHu4h524JldaXrQhmE1+1WRgmuCGsiC4A2MB2d9kf9oao06S
	 MAGqIwncA3Nrg==
Date: Tue, 16 Dec 2025 10:41:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] dt-bindings: arm: vexpress-config: Update clock and
 regulator node names
Message-ID: <176590326845.2606868.3243744984088093789.robh@kernel.org>
References: <20251215212914.3323741-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212914.3323741-1-robh@kernel.org>
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


On Mon, 15 Dec 2025 15:29:14 -0600, Rob Herring (Arm) wrote:
> The clock and regulator node names were updated to use standard node names,
> but the binding wasn't updated.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/vexpress-config.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!


