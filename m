Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F960C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg0zFBSw7nNTXxu2Qk+5B/s4OvMkrRpfMugo/fOb9PM=; b=IN/WAkl3UOYMChradV1ZnO415D
	8IPPdudLBXbPQKosuM6cxDd30y7s7oRNRi+QZqtj2aH9Dg7pz+K9CvbB6s1Qvq+No9huchAzxmkUu
	Lx8EMBpUVRIOIa5AWNXDgKvANGACcRQsVAsc613Qm7Ci0Y1NjCgGMSTRxKO5H8IgSxZ1Bj8SYZZRF
	dRU5q/TuNP/4ArfcVLtFPuIEnXJaIPUAJdhBzEIvRbPLXnJD5+hdFn61JNJ6TvRYB7/Y5tE8BuOR9
	Yc5MRgluIIjdyNwEmAz8YqyR4/IC/oq/QMxfn4kEnkeX2jcO5Vt/TKfQvUjCsPKyFaXml1FMb4WMh
	ELwkI40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EOp-00000007S1r-0zu2;
	Tue, 22 Apr 2025 14:14:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DBJ-00000007Cl6-123o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 765E95C5BA9;
	Tue, 22 Apr 2025 12:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082ABC4CEE9;
	Tue, 22 Apr 2025 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326616;
	bh=jYEOUEpAwOn3yr5q5yZLWBNVs85A+4vFAdoYWIC0Rz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyOfS9ConEWjGM9GoZPRI7lw2WMPgFn5fzB7Cx+VjgMJx0eJULzecJomjQgXLGV/6
	 B2ghLoLBIxIPFPxGxJAhACE03s8LUoYHb/rd18Ax/C7O8wBCQGVw9OUnCvOCD0px6m
	 Ovg99aoTtyImGfWjsqtRFKqXld0aZuOjQAPuS6w5VqftkBVmffwORSWdwEN7k/Rf0L
	 19I07Z7sQRmLFFTtYLeyMcndzgjiSeXHcIAkcx/8c5mqSxGGVB/xWGYdUOjO/GVw7t
	 5wggmaSBPT1950LSiYz+GmjQ42Ld+BEkJpQtnoTY0VnWv5hbV6DQkFG5diIStAKd58
	 6KtDcOCs9ixNQ==
Date: Tue, 22 Apr 2025 07:56:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: fsl: convert m4if.txt and tigerp.txt to
 yaml format
Message-ID: <174532661282.962885.3469691185487125433.robh@kernel.org>
References: <20250417150608.3569512-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417150608.3569512-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_055657_325977_78835962 
X-CRM114-Status: GOOD (  11.34  )
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


On Thu, 17 Apr 2025 11:06:04 -0400, Frank Li wrote:
> Convert m4if.txt and tigerp.txt to yaml format. These just use reg to
> indicate memory region.
> 
> Additional changes:
> - Add compatible string fsl,imx51-aipstz.
> - Add fsl,imx53-tigerp and fail back to fsl,imx51-tigerp
> - Add compatible string fsl,imx7d-pcie-phy, which is not real phy and just
> indicate a memory region.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../arm/freescale/fsl,imx51-m4if.yaml         | 41 +++++++++++++++++++
>  .../bindings/arm/freescale/m4if.txt           | 12 ------
>  .../bindings/arm/freescale/tigerp.txt         | 12 ------
>  3 files changed, 41 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/m4if.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/tigerp.txt
> 

Applied, thanks!


