Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5D4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3t3Lb0QX4DZoCWt9LWA3d1siT8cwMijsowcrVm/LP4=; b=NTghxllr15NmnXBt5SvSbZDYVN
	ikm1K4OT8nd4xa/4qeGX0OwZaLgMBfkCfeqVq7SuuIAiBGBmhVkdPTlq9dOYqBQGKCITmrZGrACI6
	G2l7O7cKjX7RAB3dFpE3RquVHltJzJJiEVKkeHYRqt4W0wkYkUeNaPvnXAtseTKShelQpG5amoYSE
	XTx0FxpPcfTPch3+ynfvRqldFAH/k2D0MyBWxBRQ/P5TakvGwrM3K0Th3cz9woRQoUY8cCI0LAPer
	lQA2fbOemMnRpDxrPVptV+ONCXgcyQfh6/XgiRlAZCmjl75oZHo+3bJsAorhL8KEKi77EYcsTyDNN
	GdwIQzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde5O-00000009nVO-3xYM;
	Thu, 30 Jan 2025 23:36:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde3N-00000009nHD-3Vkz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 460F35C622A;
	Thu, 30 Jan 2025 23:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FEBC4CED2;
	Thu, 30 Jan 2025 23:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280073;
	bh=SvCKCtR7UGZ+Y1cMYy78mpUqp9lj38t6CeQBwFBsKXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oi7bTeRGYhjjZ18m4ZMzEz8+kPluUSawHBr+KPFE+gJJnmbYesxr0DXPv30bzsLJ0
	 eL+632A5bvWYQqaSCPjYFFa/VHR6/ZTTBHO1fbaC7vqsTn7knmvoJNu6B9e0+vVF3s
	 U+THBvtXeADJ8FYCc9lwafYCa6XrBKoplVvusiwDmwZSDCVJZ7+NaYiLjj6COcDcnv
	 TDHYwsohbBDzJ58jqF/ug4KlucIOeugF01zvriktmuGRN75wPiG4qR4H9oKwOZtA6P
	 1FdU8innTFD0HPzJ8xFMRfduXI62PlGdgp1X8mRRSpsO13AB3AMCkxosHeCGVVcevv
	 VHi3gGxi2EY+A==
Date: Thu, 30 Jan 2025 17:34:31 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 02/16] dt-bindings: mfd: syscon: add
 microchip,sama7d65-sfrbu
Message-ID: <20250130233431.GB1868322-robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <c3f6fdf6a5b9e443e9ebbfbadd42f6d03a1190ec.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f6fdf6a5b9e443e9ebbfbadd42f6d03a1190ec.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153433_919492_95FA2EB6 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 30, 2025 at 10:33:42AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 SFRBU compatible string to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 54a6d5957e13a..25c4ed6cbf5d1 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -90,6 +90,7 @@ select:
>            - microchip,lan966x-cpu-syscon
>            - microchip,mpfs-sysreg-scb
>            - microchip,sam9x60-sfr
> +          - microchip,sama7d65-sfrbu
>            - microchip,sama7g5-ddr3phy
>            - mscc,ocelot-cpu-syscon
>            - mstar,msc313-pmsleep
> @@ -188,6 +189,7 @@ properties:
>            - microchip,lan966x-cpu-syscon
>            - microchip,mpfs-sysreg-scb
>            - microchip,sam9x60-sfr
> +          - microchip,sama7d65-sfrbu
>            - microchip,sama7d65-ddr3phy

Alphabetical order.

>            - microchip,sama7g5-ddr3phy
>            - mscc,ocelot-cpu-syscon
> -- 
> 2.43.0
> 

