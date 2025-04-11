Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C75C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lF4YfTr9AIhBpLsWbyDM2hi4bruchpR0yRH8rzJirI=; b=VWgtqsVGbRksIefXMl1wFqTJEt
	10xu8MnhNDulqPxp09NZFhK4cxHqAwFWHzFlavRqdiQ4Vx/QgpeUaj1umMfMuK1i96u8c+opdh9TD
	47bekYLyH9XrpU2euEdno9Fy4zt9X8tt2BXi11Z4o6NzvjKQPXGExjJuylH03KGW+xuMqcPRwINm1
	nCWl/Y3K1SzKFqjkNHSMFLFShz3aykRZxA2Uka1oEVrK444eeGhze4eVhtV21WPuJvJHgJVpPMaA9
	cfNKQtFVJ41rofAueqYi/SeV4IH0LQ9nGcXuDgmufZCLglu7ZxeagMOsgVMX8+y9ZwO4u0yAEDyG1
	zcf0m7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I7n-0000000EVq9-2T6I;
	Fri, 11 Apr 2025 17:25:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I5y-0000000EVgI-1ooY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E285A5C67FF;
	Fri, 11 Apr 2025 17:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA98C4CEE2;
	Fri, 11 Apr 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392193;
	bh=ERyjsQ1M3EAxug/PGHbTwXHaDvmCVIXQyTsmFurqmpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cf3mNQtN08zoE7uYbz6GM/u+v7lAUYuMaNs+cjAnWU2xMJLFv6MUJb8oIFdf0wyBe
	 7JcXyavUkEtAoD3o+CVqkz+0F800vaaLV/opXa0wZ+80G6lWL+XOMd0pxAuV3gMWPJ
	 Rl3ZvPftQ8o9kOLb8ENLeJQNsTgP1LOFvk/uyMCkAMIx1a9tUhvH37hYIzrCKSc0mT
	 XXyP9dzq62FdZpbHKN4Vy4PkS3nVPjHgLhx/b9dNUV5NSedDK8HcoFHli1gejLZ/g8
	 HnydNNNWHynNIrQ5dSj59byLnjaNYqeyvMBS4ckBL/NGl/eShzqXsDalHjfnNDol2r
	 29Ke4xFNO6GKQ==
Date: Fri, 11 Apr 2025 12:23:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, linux@ew.tq-group.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <174439219157.3544865.14100579453477378929.robh@kernel.org>
References: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102314_512763_02F1BB36 
X-CRM114-Status: UNSURE (   9.19  )
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


On Thu, 10 Apr 2025 13:31:02 +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


