Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1B0E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPejERJl4XK7d4IeT4SKRyoz4LEppn+mSkxv5WuPWRE=; b=zJgPUZkKEaj+wBsal+MVnIFJK9
	WQK+5mFRhuajwQcusDLyrsgBddwGjbZl0+ETRozOt1hXvc58IWUXXBrktCIIXaBzpvPtNmUXC/BvA
	V7ii4oPqXVTKJ+9f21xhDGRwoyM/Av8anghUXmxRfa+G3m4PwRTb+at6/s9sKbEgUyvAvassqWWa9
	KczjB3mvC8uLne+9p8nvbM39Gtzt7TpuLbdXvmiWOI50dBymz8qlmamTwiOwdFNCYU9fTkCWQxlAj
	R2Q5wWgD7maMyB4I4IbZSd5iSy6diNGcqaXco48W4VkXwY4AiUd11iSY7gTsiisRHrLOnm6iKFqwv
	YSIoi7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsPd-0000000GTqf-08WI;
	Wed, 18 Dec 2024 11:40:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsNP-0000000GTQl-3diy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79282A4260E;
	Wed, 18 Dec 2024 11:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4680AC4CECE;
	Wed, 18 Dec 2024 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734521882;
	bh=XQjXoklGZLGKHVmh53VQtpS6HSx53WNxCAeG99b3Pz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1Y03UVe5NAFohukaodG2wZKOo5F+/HiMdfV7n6d2uLUH2hjHUCDOhWGlW9hzPLkx
	 EXZJebSep5DCQdI8ecnw97/FRiQbgAVUslZdRWGs+wJNzsnb2S2SA22gK05wf7sya3
	 7fAEKLC2q9bHMKriScKcNC2X1fk0Gzt0lxrTNaOiYiMgt0xCsxjXTHTGRnBzAi/tTk
	 fQkUUjq6UCzaOtT/xalfUGxctr0BFUPabZBzycn0Eyp4M2vpONGuVqa4rK3v7J4zBm
	 lZENAXrSqQZkXsPH+E+pOK2Cz2nHsoSdPEc6+NJ4laSh0NAQyfhWKHVcznugme4/C0
	 lCO/k1H0lAS6w==
Date: Wed, 18 Dec 2024 12:37:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controller: Document rev c.1.5
 compatible
Message-ID: <2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
 <20241217194439.929040-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217194439.929040-2-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_033803_971181_FB8C7996 
X-CRM114-Status: GOOD (  12.80  )
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

On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
> Document the revision c.1.5 compatible string that is present on newer
> Broadcom STB memory controllers (74165 and onwards).
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
> index 4b072c879b02..99d79ccd1036 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
> @@ -29,6 +29,7 @@ properties:
>            - brcm,brcmstb-memc-ddr-rev-c.1.2
>            - brcm,brcmstb-memc-ddr-rev-c.1.3
>            - brcm,brcmstb-memc-ddr-rev-c.1.4
> +          - brcm,brcmstb-memc-ddr-rev-c.1.5

You should use v2.1 fallback and drop driver patch. Or explain in
commit briefly why different approach is suitable.

Best regards,
Krzysztof


