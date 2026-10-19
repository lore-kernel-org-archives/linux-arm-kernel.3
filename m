Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA9CCF2E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXPmcy7AdXFpnAmDj+N72J6TLEbbaVjr3MnNqMyP+CY=; b=EV/d9dPCXOFALp/fVkA3YKu8Sx
	wfehX2zVjK55VLEphctxvT0Sk4haERTvKDyZLQlEDbzIx16fm38de+RGD6VmRijno4kUSQdrcv4yI
	YsUsrYiaqYtS7oMdiZbpD5xbs4ffSicj0+MtscbglfVKiCBS4+HnLxbBMlKiHl83Ao6vcIX3JN5ln
	27sDtIdwwbrj9wUWiYkSKuuxoZHTCeGxQl64FEiKNXHMqLfYV9+utgtTmEqm6IVV60sLt3cCxK6Cw
	6uN8VfZn+zQhQj1f7EHzWULfVMQ30ssAOnwC8mfn7U+NXoxkklJ83EnQtD6S8L4iVvygWazan87KK
	zWs80BbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo06-00000007gfc-3Gk6;
	Mon, 19 Oct 2026 14:06:06 +0000
Received: from out-242.mta1.migadu.com ([2001:41d0:203:375::f2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInzx-00000007gXc-1f7v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:06:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XW7BceGWPY9WiX1upsARm8MUVolkmVHvz8rIGu+9G9I=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792418755; v=1; x=1793023555;
 b=TE+vxoCEf3stLXSEjVEUNU9n45xc88Ps16DW4AoK+qdwVrHUyg+myOFhZEjYfjekhMUPiop7
 U/1pHMarY1sm3fnKfRUqsk7hhxtsC52MHbKKMihjb21YemHHzBFo1s0Q/WvKLmwYJ/qIK8Ag4r0
 J+PEMZbBApEWCtrXaGZK4/Kk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 6aae6aeb5c5dc7b9;
	Mon, 19 Oct 2026 14:05:35 +0000
X-Mizu-Trace-ID: 6aae6aeb5c5dc7b9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 16:05:32 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Message-ID: <20261019140532.GB26863@localhost>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
 <20261018124459.3026-2-pepe.schlehofer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018124459.3026-2-pepe.schlehofer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_070557_596745_DD356234 
X-CRM114-Status: GOOD (  13.40  )
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

On Sun, Oct 18, 2026 at 02:44:58PM +0200, Josef Schlehofer wrote:
> Add Hardkernel ODROID-U2 board compatible string.
> 
> The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
> computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
> MAX98090 audio codec.
> 
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

Best regards,
Henrik Grimler

> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 273464400477..f863803c84f8 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -86,6 +86,7 @@ properties:
>          items:
>            - enum:
>                - friendlyarm,tiny4412            # FriendlyARM TINY4412
> +              - hardkernel,odroid-u2            # Hardkernel Odroid U2
>                - hardkernel,odroid-u3            # Hardkernel Odroid U3
>                - hardkernel,odroid-x             # Hardkernel Odroid X
>                - hardkernel,odroid-x2            # Hardkernel Odroid X2
> -- 
> 2.54.0 (Apple Git-157)
> 
> 

