Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E4AE94625
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 01:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6X2eZrDy7K1opEthf+NxHHHYVUEBQj2x/wKxFj90j8=; b=Ad/A81nRDYSTQjIERxdX2TziKq
	T3SNwfsF88hTTH1zU+KrTAR12/r7+qFvtxznSqclQ42rxORjULadT7Gxe8pqkcuLkhu07bVxwjWPP
	rM3OBCOKPRv33ujsyRIvCKXblY9m/z4DYchgC5Apqoh1ASthkg/wse1pwpxfDpT3HQvre54RAo1bU
	U1LgStyd07i8qagm60PXUP5wmYYo3xvXIX+zrJqScA34Gt8319qv3PhM5GwJjzJhAiFmFvAKirjh2
	80iQ9WdY+1pVpQ/quqQwJHeb+YpdAJlRDQPGNfBWrpgHi1ANxjxfzI50pjZ4c8tcWxFrf/KdJtOGk
	C6MaVs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpcVE-0000000GHFt-3kOa;
	Tue, 10 Feb 2026 01:25:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpcVB-0000000GHFV-32eV;
	Tue, 10 Feb 2026 01:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AD9443EB2;
	Tue, 10 Feb 2026 01:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4D8C116C6;
	Tue, 10 Feb 2026 01:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770686717;
	bh=B/9xj49pyIQTxEOvUELh2afe3C9tpol8NILa2gk1YSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovnT8SsyNnQ+DG1eYwtSMgsBCc8JamrCDvC4UtiJsyPB3+6hn4mi7PYlXUol2YCNz
	 pCZ+pG5ce41/fIcphnS/ey4AkA+mfpDVy4ktoRUEUXxJW3O8FGTKc3petsUEwf5tD9
	 H08GpUMaOs1BmuYv2/0d5dBlsJInRV6Dl2vdm02LXWZWD0BQaBYSmv/wn2kRFUbDUh
	 UzrwfYuITxYTJiIPPicuHxTVzJhKJ5KUygCXWT5Q6+TaRkR+ne2m/fq2iJF36Sm/wt
	 +rSbb7oUoqfPNpe2FyNzsywCablgYrVrV0SKCyW/B5CDKLUKiPGYLQQdBbPUwGeKMC
	 t7JIkGst10tNw==
Date: Mon, 9 Feb 2026 19:25:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: conor+dt@kernel.org, linux-rockchip@lists.infradead.org,
	kever.yang@rock-chips.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, srini@kernel.org,
	linux-kernel@vger.kernel.org, finley.xiao@rock-chips.com,
	krzk+dt@kernel.org, w@1wt.eu, jonas@kwiboo.se
Subject: Re: [PATCH v4 2/6] dt-bindings: nvmem: rockchip,otp: Add compatible
 for RK3528
Message-ID: <177068671576.2272495.16352349612961041838.robh@kernel.org>
References: <20260205211901.490181-1-heiko@sntech.de>
 <20260205211901.490181-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205211901.490181-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_172518_431238_697ED47B 
X-CRM114-Status: UNSURE (   9.70  )
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


On Thu, 05 Feb 2026 22:18:57 +0100, Heiko Stuebner wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Add compatible string for the OTP controller in RK3528. Compared to the
> RK3562 and RK3568 the OTP in RK3528 does not have a phy clock or reset.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/nvmem/rockchip,otp.yaml          | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


