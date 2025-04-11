Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925E0C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnOj9Ysi85JM2Vl9+b+K2X5CxuIeSICcmgb03Bwopuw=; b=RbwVZm5qGdD6jtCILBM1J1iIfG
	TUMDOvrh+6Efv4IAudT8gK3zS1nIDg9tP9Xy0WY7/PeP3Z//nVvI+sTiTlqS4Qd1nILXMrGKZ1EaI
	5ZON3kbSfyerH3Igbg5ZY7LmuUREsSc1h/G9uMvnaeZSdj4SAiGZiohzvop6kZGJntFAKhXAC0Ydv
	EcMnAx1JyUNwiPRNvr/y5wdznHKCBxAsvQDsMMlXD5ZX9K0cYRbUww6emSac2NAS+5gfZqwMDf6Vf
	JLaJ1Fy4q2GCSEq3Udx6hTABPT+PLMBoHBG7Egt8N4ycVBjfXG6Y5ciDrJzglGGnUBk1rPXtOOcKW
	BfWnB5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3KKE-0000000ElES-2Toe;
	Fri, 11 Apr 2025 19:46:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3KHM-0000000Ekkj-2HJi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 19:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C70C5C68D3;
	Fri, 11 Apr 2025 19:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25207C4CEE8;
	Fri, 11 Apr 2025 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744400587;
	bh=l+zuBJVUVXugPuAtOEyHQU4jkNgPH01OJPZVhK8ffEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEMe1x//h+7hOdU8H9mh/6Lbl1reu5FKI11OMis3mRIA5yScPeyHxXukfExTrZYU2
	 Cv5PqMyVVCR5va+D/Tkwi2SO2L5zJzRluueGWig3qBg709oDPEVK6tHGj2nM9ZNdtP
	 jVuI2CsCFMOWCWi9H7FG0xIexyZt9z4nZIJFQfcwrzpxVQ4ntDC0+Bct0UxhAs9pUG
	 3wfdoielgPaIBg78aG1Hb17RbJ8D1rwwhX+GeWKZRq8kguQJHrz/gEibrk6bU1aT7I
	 +A9GW0tE+N6OQbpMlFh5zrFzPGX1XudAIFlGhnt3j6hgzbmo6jI9ZcnYOtgT0Z6SSm
	 LkdUrAv8745mA==
Date: Fri, 11 Apr 2025 14:43:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, edumazet@google.com, devicetree@vger.kernel.org,
	kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
	rogerq@kernel.org, davem@davemloft.net,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	conor+dt@kernel.org, srk@ti.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add
 5000M speed to fixed-link
Message-ID: <174440058556.3779501.5440005311652027542.robh@kernel.org>
References: <20250411060917.633769-1-s-vadapalli@ti.com>
 <20250411060917.633769-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411060917.633769-2-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_124308_635553_5FED7C7A 
X-CRM114-Status: UNSURE (   9.25  )
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


On Fri, 11 Apr 2025 11:39:16 +0530, Siddharth Vadapalli wrote:
> A link speed of 5000 Mbps is a valid speed for a fixed-link mode of
> operation. Hence, update the bindings to include the same.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


