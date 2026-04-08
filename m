Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBA1FD5F9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcYXi0HSt80G8E5bmhPXMca3ziGGfmlRDnx5zCjKzOQ=; b=lhDgwZYA29/d4/AV0K9e1XL/4o
	mw3XTB3QVwH35raEgsmYCQtgaEfK3gtybYq3LDNCmhj6MCVOtQ2xv+APa4c6lsCCImPucOkLVejLY
	H8VkVCsWNvW1zkVrDhYazwNsBL/KSNbmQXGj2wzbnPxNTx5A2+VYf2Fs+hC8zhbaMnfVVArlnAHwG
	uf/HP4UFDK1ZGNSMr/6GZEskeiaiYLA9v6a3TBwtLJj95gxpD+k76K4QxiE1N1YFU+ZJxBx+q+O00
	Rq8P4QGfO+CtbTxQTGBe2eozMoBpuImdAGl4wV1wA0Pgl2wlxlVpLwCv9gmnr9rj61bkw7MTByIeM
	CAIKQvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOwD-00000008Zud-39hT;
	Wed, 08 Apr 2026 09:11:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOwB-00000008Zt0-382L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5F1243C45;
	Wed,  8 Apr 2026 09:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BDFC19424;
	Wed,  8 Apr 2026 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639462;
	bh=2VV+jYCUy1KUMjQ952zuke1nZqlR8VBr0ssTABOVfMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+PJ0We1keeJf67c5ymP8UhsDm73D9gznBNPMNOK94g18/nMlL8u80sz0SxjrwH15
	 FRLmKlDDEtJsIVGJ14D3fKPHgqRvJPrzfMA7rMJfVRoiYajWlsMSG/GJ6XVtqXRd+d
	 Omz1tiTCKhdvoDdwyXJsuDgC0DL+P48QCeU+YCUKbW6pSGNvldncxlJVkPg9F6+sew
	 G3StpZjKFHLV0FaB6vO8NnDraDTXr3mXY4UqbDXsA+f4ckRp2wmVFzg7/HuDYwlrNE
	 YlZ8m3cCcT7/PvX41ffwecnU3iUUWJLjdhmvrADnw7rSmKxk04yKCoc/RWmS6AGEub
	 zh+1QiOyTWN1Q==
Date: Wed, 8 Apr 2026 11:11:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:PIN CONTROLLER - SINGLE" <linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROLLER - SINGLE" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: pinctrl-single: Add
 brcm,bcm7038-padconf
Message-ID: <20260408-crazy-efficient-ara-05233f@quoll>
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
 <20260407235611.550515-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407235611.550515-2-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021103_822976_759EF12F 
X-CRM114-Status: GOOD (  14.58  )
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

On Tue, Apr 07, 2026 at 04:56:10PM -0700, Florian Fainelli wrote:
> Add the "brcm,bcm7038-padconf" compatible to the pinctrl-single binding.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> index 9135788cf62e..afe7329a1df2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> @@ -38,6 +38,10 @@ properties:
>            - enum:
>                - marvell,pxa1908-padconf
>            - const: pinconf-single
> +      - items:
> +          - enum:
> +              - brcm,bcm7038-padconf
> +          - const: pinctrl-single

If there is going to be a new version, entire block should be placed
before 'ti' to have some sort of sorting by compatible.

But no need to resend just for that.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


