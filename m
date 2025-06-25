Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079ABC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PvmkRH4pmScHsEddGOntL1O3uwyVpIfOvRkyfffFbM=; b=nLolkytUGwfzJRs0HCO77zW3Xt
	qDEVcvcBuqWIEcq42BhREGI0njGkOY+UqS/YZL16qDXKgQzWnhL94sQqzob1kzC3It85NBnfDB7tC
	GNIZ1Fpzqfnaiv+irULXs7lKUwkPxSP+Y78JB/E+2iAFkX10T1NwwnuR3/RUr+AqFERn+cg5aIyDa
	c7W2bX3cahNh6CtdTc0QjZYk/fZQKWqfUU3EsOLt5ClfZXkMg3oOwNPSdSChUStps//71D/K19qQC
	POE7rL0WSRJdp0o6u+uo0PMTeojrQ9bvWYDZ591F9As0FvNY75V5GN1HIzJ07TZVJuMNrIfk7mmAo
	gRB7mLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXtN-00000009zAV-2Vt9;
	Wed, 25 Jun 2025 21:42:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUViA-00000009jvi-2o42
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 19:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/PvmkRH4pmScHsEddGOntL1O3uwyVpIfOvRkyfffFbM=; b=nAOBgGz8hZILqeGN/4J2b2g+I9
	Jc8LrkU7v5UL82w1b+XNsfkRLXJR25KBRtLOqg9X3BnRQ2558d6LIvL64ZVfZofZMwm1Bv9LtEne2
	oI4FFHvZcwloEblqbL4g84gKiB8BtPkfutMwbT00W5uMkm+A3oyG7VnNJnWmyIYUzBrqJOrOUHUo9
	CGq0ymeLvhw/xApH2Ks3/L/LX5VWjLeOh2KIUB3mwHRqAGch+xlV95Pf8v2iAx29nTSdX8UTYq8R7
	pgVKwRsOvESKLx6/W9aPOwu8NuqRBQmlCdHti59zCP2f+t6gG2d1UTpORFZxK9l6bRVTNdBrciHoD
	LroNC7xQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVi6-00000005xYm-2me2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ECFA4A872;
	Wed, 25 Jun 2025 19:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4D4C4CEEA;
	Wed, 25 Jun 2025 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879383;
	bh=lJyhFTuJ2bn202oJ8ZI0ggk8KeMYU2wn0+K2GfvB6QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxc9OBk5dNVN+NOzkSPzJ4DedenjRdsv8sLs634WixaWQ1lGSi1/TrP7EJbxnV9yi
	 Kw90QSPxq9xuTvVy50cERQ+f3OSvinYTe0q0wEIa8ja96fg3WpZxI0N7sQ+66Y8pZp
	 2o+1TouSlnfeAr4P3kH+60V5r1WTiss2oV0LW5+y6bnkPe0VxBvZBeDQzE1f3vL+Nz
	 c9SzCtw3DAQgcVewcViQwYSJ75n625unDwk7MkWmQFyn/5dOH+44VIxmCKIMBsEhYa
	 qOa5sDMg7UqdqhIR79C7RUiuAWq/OGQycMsDCJdGhHHOEpZT8L1c4TieiD+F+ofB/y
	 UDepFPKMod3fg==
Date: Wed, 25 Jun 2025 14:23:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 5/8] dt-bindings: media: nxp,imx-mipi-csi2: Mark
 clock-frequency as deprecated
Message-ID: <175087938216.2071813.15875759870468220160.robh@kernel.org>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608235840.23871-6-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_202307_405371_4528BD64 
X-CRM114-Status: GOOD (  11.55  )
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


On Mon, 09 Jun 2025 02:58:37 +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property, which is already optional, is
> discouraged in favour of using assigned-clock-rates (and
> assigned-clock-parents where needed). Mark the property as deprecated,
> and update the examples accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml  | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


