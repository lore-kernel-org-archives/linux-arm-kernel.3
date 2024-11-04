Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623C7D1BDC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0XV8Oov3c+FqBUozmA6filejjxBZnVveBlNnfKcdTw=; b=MGTIyctvvn1+a2b6nsQc1+cFl7
	IQLeOEDZsXGmQ1KI1OIK62+r567bbwhv6aqcRpMFZiiZh45MHSEptFtIoWpSg2dX+PPP6a60ecRLF
	/VVDm4l6eZMGHBC/VrHZTg9TaDip1HGqjcblSYek2Ig6R5U8mSEKEfSz6OtpIJkCFynSeygQawFPR
	2LvGOH4SwiSmE61XOzjWWCo/HXfoXHkbjwN0i3+A9iDWoIU2QKweDMK+d1tBNcgTsSN3zhH3E52Pg
	pyEeQ/wCHRhQHvdcKBP5a7bRd7q1QxfVQfTFkRdvA5zikTci3HVybN77vB5u6kwQEuu63svQ0WgXe
	/rTc88+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zvl-0000000ENuS-0nDh;
	Mon, 04 Nov 2024 16:27:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zu3-0000000ENdD-1vzh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 193CC5C3ECC;
	Mon,  4 Nov 2024 16:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64791C4CECE;
	Mon,  4 Nov 2024 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730737566;
	bh=f5iSCQILu6jeNnRD4Vf1L+vnN1Nn64JnpecDqJWxg3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBttzQuhAUy4ws+HjxZVRBoFj/eTKphy4uy3qkLJPMlcWv75k+hTnlm4XSApl81SU
	 5zVQgL/c5CkwgeBxkrG1N4SJ/DyP7UL/6PDLozAnh7/KGcKf2X/bFJMuAQ9myll1kn
	 ZkrJpPgJjzGXhtXWEM13vPQjC6zNrtYFbGnNwMpXial/J8QKW42HSjT42tWiF50UNO
	 uV5eBbBSWPfbPOIz763lRZLdGtXc5niJov4gyiwJEFBC74ftQ3RUwKyELoLYz+UWti
	 sxcDoNUGI3hK9+kEv1D7CxgM2Nw7j/3FoYi2muYs12nCaULWSp3ksUsM4HRcMldjLi
	 GhO9D9/39zeIw==
Date: Mon, 4 Nov 2024 10:26:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <173073756401.397912.9689901882829044689.robh@kernel.org>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_082607_565659_FA5E3691 
X-CRM114-Status: GOOD (  12.71  )
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


On Mon, 04 Nov 2024 09:56:21 +0100, Alexander Stein wrote:
> BBM protocol supports a single power button, supported by driver
> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> using linux,code. Add a reference to this schema and add linux,code as a
> supported property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Added default value
> 
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


