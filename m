Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6561BCEFCE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORXGOhaoUPxiSNnRknjvw/jwxTx3eVJGmvTdNcJm7WI=; b=TN3duWy/oiMc1WoMMvBJp1QqMk
	Amogp+FojXtbew+g1JsgMGcHk1jeD+unMKAqKOJ+7ltbyXFy0pGza3p7P9IZpbvMUa61CUrajLErM
	OCGWP5/Xg9tdAePAPCN58T1GlU6VQdwkpmVM6QOC+071zvMLWFTt90FqLVr5UQk3WQS9L/J2vIdSj
	FcxWwZQU2yirzFmfaejQRQhg7e5RdCyu6F//PJfDcdyflyqAgLl2mtpTiCsJXAqVy/oIB9HJmu2dS
	VApxGudGLg5SvXlOj+tMl9oE572m+ffZ/4cS7ez0ts/mS6sQmmgIeXo0GjkyeV7+QqBRzFIIzdHkw
	ufUj3BpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBpc-0000000Dgcz-3KUD;
	Tue, 06 Jan 2026 18:31:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBpb-0000000Dgcn-3Ske;
	Tue, 06 Jan 2026 18:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E221F60146;
	Tue,  6 Jan 2026 18:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D66EC116C6;
	Tue,  6 Jan 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724258;
	bh=j3qYVdPPtQj7nJ6L9su6FYxFtx1ULd6M1YMn3jzqG1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVUNTnScjx9U13l0GiA6oDagtHlYJ+115kprdo0k5eSD2WN7/1FmZb3prYZusi8yv
	 pqe47XT9I1GQbsqIyUYBO9Y10CIPbHWOWTzgNCWQylTYmUdUe2VjvO+RUG21PgHLcs
	 OC66YnuftXr01LCENL8kRQaUT7IoatIgvdyRGJM/3M2BlRqJj7CPCfx+xWlbr2Tarn
	 KMJuJZ0/1GqnW1EBTvQsr3A9kRoPZ/qFGMB/fDOcvUH5k/fsI3fHGLnQ4ff863bM0l
	 95r0WUv1lvm3A1Ndwt4S7fq5ptXoYS+z5FALY+jUFlreeTyRObSLJ4dFf7MJL03EHR
	 azjZmRORK8GpQ==
Date: Tue, 6 Jan 2026 12:30:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	uwe@kleine-koenig.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: add TS133 to
 RK356x-based QNAP NAS devices
Message-ID: <176772425740.2513273.11038899818156080578.robh@kernel.org>
References: <20260104191448.2693309-1-heiko@sntech.de>
 <20260104191448.2693309-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104191448.2693309-5-heiko@sntech.de>
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


On Sun, 04 Jan 2026 20:14:47 +0100, Heiko Stuebner wrote:
> QNAP builds a number of variants of the RK356x-based NAS design.
> 
> Add the 1-bay TS133 variant.
> 
> This one is a tiny bit special as it is based around the RK3566 variant
> of the mostly similar RK3566/RK3568 SoCs.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../devicetree/bindings/arm/rockchip.yaml          | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


