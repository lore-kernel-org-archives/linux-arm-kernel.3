Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5D4D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or12i41DwtBHyiDj4tY+0moZH5Q/ZIYY4xunL9n9ldY=; b=5EkjzF2RKRhuFFbvIRtxg/tmX8
	LhB50Qz842IuMVhmTpa7vdeQbeJet8II7SHf4uTiYYBSzKpxb8zLVm3kkacwIlJB6CKJz7rW3FcWO
	BVKAvUSvVRCVjaH50bUUUXYOFo/4nfg/TXBYMAJncGaBKBoNSEO3jcykLyNaTtcFI3XAV1C/qzjDN
	Y/yRpZ/as3BMsAn6pO5rme54cuavhX5gIjaG/bEM7IKhUjyHqLxgH8mhsyjCANk36IK4eJYELceNP
	d6pTr47ovEsoIjhCZSUfMPtCWACIgsDcmF0mr/nsEV0MeUfz24c6f3y0ZBu4qMU7CFAHltHXO3PnN
	ZeXkX+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj5e-0000000GnwU-46t7;
	Thu, 11 Dec 2025 16:00:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj5V-0000000Gnqp-08oL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1569660137;
	Thu, 11 Dec 2025 16:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9F7C4CEF7;
	Thu, 11 Dec 2025 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765468815;
	bh=tWm4pp9IdFxUH810SQiXnaXzZK3H8gSPlK4Uk4k3lX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcO3NBxtMdynpjom17YQeJxXaBc2oKdYd/bYhNZikoyCc0oYEQ/0u+Url0SIuyYua
	 vm/Am4GobA6FaiuZGd+z5h+mpLJNRnxSHpy/7Xu+ZMFejygTi3HU3X8ftpaXo+KVb1
	 xKODMRpc7wkPinmLVWpugfg+fF8nSIfQ0WnoL5+eCp0BfGg1QQVWZPJW8Cs9E4n57P
	 j1BdoqLPY220li3kcu2jar4uOjjaAvxj7Jf+MU2voHRT4PDFjjmLt5FKOwoK2Ut32y
	 L11wicXjpu9zTpWJ3XpXVgz2Z6RCGEfFKe9JaQ680IX9Dvpa1NK2AdBTekEv/q4Dx4
	 MRpW1c0UNba6A==
Date: Thu, 11 Dec 2025 10:00:13 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Parant <c.parant@phytec.fr>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	upstream@lists.phytec.de
Subject: Re: [PATCH RESEND v2 03/11] dt-bindings: arm: stm32: Modify
 STM32MP15x Phytec board items types
Message-ID: <20251211160013.GA1485420-robh@kernel.org>
References: <20251210101611.27008-1-c.parant@phytec.fr>
 <20251210101611.27008-4-c.parant@phytec.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210101611.27008-4-c.parant@phytec.fr>
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

On Wed, Dec 10, 2025 at 11:16:03AM +0100, Christophe Parant wrote:
> As Phytec manages different SoM configurations with different STM32MP15
> SoC versions, modify the phyBOARD and SoM compatible items to "enum"
> instead of "const".

Change to enum when you add a 2nd string. I don't follow why you would 
do that either. You have more than 1 SoM for stm32mp157?

> The description concerns PHYTEC SoM equipped with STM32MP157
> ("st,stm32mp157" is "const").
> Also add comments in front of the enum items to be able to identify the
> compatible string with the phyBOARD/phyCORE names.
> 
> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 408532504a24..fbd3d364c1f7 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -182,10 +182,12 @@ properties:
>            - const: seeed,stm32mp157c-odyssey-som
>            - const: st,stm32mp157
>  
> -      - description: Phytec STM32MP1 SoM based Boards
> +      - description: Phytec STM32MP157 SoM based Boards
>          items:
> -          - const: phytec,phycore-stm32mp1-3
> -          - const: phytec,phycore-stm32mp157c-som
> +          - enum:
> +              - phytec,phycore-stm32mp1-3 # phyBOARD-Sargas with phyCORE-STM32MP157C SoM
> +          - enum:
> +              - phytec,phycore-stm32mp157c-som # phyCORE-STM32MP157C SoM
>            - const: st,stm32mp157
>  
>        - description: Ultratronik STM32MP1 SBC based Boards
> -- 
> 2.34.1
> 

