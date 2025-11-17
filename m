Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD6CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ru0z9ROYImKtsAHGHLJCxvP3kC01q8N/ypSYeKT8uJg=; b=kErOBpF5zkzEDDUFg17OYYDZTH
	LZlB3z8Lrt9Dy+zYdCgHRwOawzcj8PmmgaaHiSB991DbZpEQjMx7RqiwORqkiGduuZztPaxW3ZGgG
	Tp4ATiuafO5kv90LOVtlqrYFtFMiyvzUCoQ+A8hn2vcfxK90sBgvmpGiWa84R30RhsJFglx22SCq4
	w3GTXbYAiBJm1AEG/yO+3L5CN2KAm6KTTnlrGmngm3Hb+haF4G8zKpF1Zhx7dcs2BKh+XvlPdTpLZ
	Gb/3AXFlQ2y8yGyySjeIjeeOe8x5USj4Hd68vwJRkmNp5/l6YJD/EyEAx7YCpCMjZP0YWRsDWejmC
	jL1bPPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7z5-0000000Gy15-2owO;
	Mon, 17 Nov 2025 22:46:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7z0-0000000Gy08-14f6;
	Mon, 17 Nov 2025 22:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A759417BD;
	Mon, 17 Nov 2025 22:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5ADC2BCAF;
	Mon, 17 Nov 2025 22:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419561;
	bh=lkWDRMjVGIhRXjYODF4NGeavO5+MliWUeaJhzdHGjpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8ehKzTdEOposLsvgoWshvL/XdFjL4Xkh7uAxoW3kr+1C2Uys/U6eggblcIeLjU1N
	 AGeS7br0F8s7KGmBDqQA/VNZ0Xmn7exZmDD6Qkq/sLnY0fAja0OjHd7Hp7ObTLdfMq
	 vMY0EV6NLm0dw32r6u84XJ/bs+9p35DZE8MkkEOcYFka7Lf+Fyza0JBWxNXUn4vH0y
	 OE7uhfofHxQkMSWY8/DVI4lfUTF2nIK5AsDXx0n+ZEjJn2ANVMMPjm/uVbmg3v+dvH
	 NFMi0F5Ogapns/98f51SFH2tYbq3zvBVGVNSt0lQGmUdqpjtohUVpadjzAFQtg1ZPZ
	 8Faj19KonXhkg==
Date: Mon, 17 Nov 2025 16:45:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: document syscons falling back to
 atmel,sama5d2-sfrbu
Message-ID: <176341955828.856915.4185012775143891739.robh@kernel.org>
References: <20251117-aeration-smock-5e7ac06e2942@spud>
 <20251117-marlin-mustang-5ffda4d211c7@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-marlin-mustang-5ffda4d211c7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_144602_331488_66D7DBBA 
X-CRM114-Status: GOOD (  10.83  )
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


On Mon, 17 Nov 2025 16:29:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The sfrbu on both sama7g5 and sama6d65 both fall back to sama5d2 in
> devicetrees, but the former two compatibles were undocumented. Now that
> syscon.yaml has easy support for multiple soc-specific compatibles, add
> both of these undocumented devices.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: Lee Jones <lee@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


