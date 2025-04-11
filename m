Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212CBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 19:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4l9P80HkM2pBw2TF9RhUnXGBioQTcMnMND9lG4N5G2A=; b=mKj3rIg2hIj+i6tTiYyMMoLlVp
	pY8m2xIDJfzVhIcNs5HHxVnu9ABjKP6jvfL4IMWdEXvgmIIbJMM4jHHvHutxEGGow9OWnL9BNVuOb
	tIBG8VftmEZ47xKI7m6liYOtSUYDbvpKRkpSakyINgnONyULtE4ginVJ74P7jFkMvGXqnO7ZWl5kp
	EKFxEZlCq96cDDYl1RdtjRjCLi5j7yOURj5BD0YhAcfVmTKSTJhg8DIkl4fHcG9tdfKm+wx+7xmRM
	lzfZKc3S1z0V51jYI5VG9xNzKmdgJ6Z1AIdesJyANORhEuwqr00FVhQe+vRc2N0rL1TsgYLQmsNi2
	L//tKJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3KIQ-0000000Eksy-1RWM;
	Fri, 11 Apr 2025 19:44:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3KGa-0000000Ekav-41Ki;
	Fri, 11 Apr 2025 19:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DD6BA4A954;
	Fri, 11 Apr 2025 19:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFBDC4CEE2;
	Fri, 11 Apr 2025 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744400539;
	bh=GIcyZThvoYXaHxUFa3uu98idbETsxCqqaZINj5bP1Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bx69LwlN4gDJwXWMTiGjpADgGOkfzd6DpRdh3i2THAnBow67TMqLPFbO4HOP5i0He
	 wobzWvKUHEoOAJcNuiK8Sm6MaP7ffQbzasARcRWK13LHUmH0xkEIScK7/9xVuhLbAG
	 pkIrHBOpapVCoLZ+jODtWHwH4Dko1rjr1iU5oPENOw4Lm94uC2pbH7K+7/zheP95SH
	 usTcfyQ2uav6fw3pR3xAXK/i3s3P3llCGBLimEAZEhuAf0skxxbqg4AwnYxdTB4eEK
	 i/vdgOG4Ot0YCr2gL2wH/dg75Vk+KgMU7yyFrpnBY4w/mGtKTnygugNfGPd8cA+zU8
	 sY4ksq2isZECQ==
Date: Fri, 11 Apr 2025 14:42:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org, srk@ti.com, yamonkar@cadence.com,
	sjakhade@cadence.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH] dt-bindings: phy: cadence-torrent: enable
 PHY_TYPE_USXGMII
Message-ID: <174440053779.3778537.10228186490743369615.robh@kernel.org>
References: <20250411055743.623135-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411055743.623135-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_124221_061265_E893BA7C 
X-CRM114-Status: GOOD (  10.18  )
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


On Fri, 11 Apr 2025 11:27:43 +0530, Siddharth Vadapalli wrote:
> The Cadence Torrent SERDES supports USXGMII protocol. Hence, update the
> bindings to allow PHY_TYPE_USXGMII. Since PHY_TYPE_USXGMII has the value
> of "12" while the existing maximum allowed PHY TYPE is "9", switch back to
> using "enum" property in the bindings to account for this discontinuity.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on linux-next tagged next-20250411.
> 
> Regards,
> Siddharth.
> 
>  Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


