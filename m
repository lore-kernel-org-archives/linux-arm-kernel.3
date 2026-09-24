Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C72C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMidZAi/lkVTYdE4CaWIwRpCbA7uNkOiClBSJMQKjbM=; b=JGYphBE7VEl4KD+z4O1O75OKHo
	lOMkmBRnw+Ot0BGfLxkdXETK/M+xv2qPtmYS2vKN/Bsqw7Ml8Jmyy6+zjjJJ+ndwR7gPiZ3rco44d
	bYCxCDvuruQUX70/Ioazc09nwg+aawnJMmco4HaQZaxAbzOYOlDJE7wPtzP6u6dHilhMm7ktsxEY/
	dLp5tQrrtBeOAUrG1IvFMcbzyQ5Ga3HXaAfUDlYwbh8qZKYiire02flH01gTxeps90FbCJWz599XB
	53++Mb2Dnx2xIOlC6wuD4votqTF4IUq6RTopwwlAbvhPKFZSvTfCoi/AeZq+hN+kHgOnsVe3304ZI
	RD9hyROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jIm-0000000B3eP-46w9;
	Thu, 24 Sep 2026 13:15:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jIl-0000000B3eI-2OQR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E72EC41B3F;
	Thu, 24 Sep 2026 13:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C96C1F000FF;
	Thu, 24 Sep 2026 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255750;
	bh=hMidZAi/lkVTYdE4CaWIwRpCbA7uNkOiClBSJMQKjbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h4ydg2YJoRFeMuS1nHBcEzHcYbknpqacxVnxqqGZm+gINrHzxk4X9IAEAK5GGYScG
	 JHkpTgleM376u/iC9M714sJeuedOnIzFubzF8W6yhEMZ+OKFmtPVpXsAUcdM6MGL+v
	 eVJcINuBcp816bJhfOVDo/Bl36+3Mpz3dBRlL4ucJdcX7nYfVGhToAuz2b3vneq6r5
	 DH7+WHVy7FVHanWgJjLUzG4aePGwtmC66fj+eDecVdsdVkL7nyhyIvRympFXzHgDIt
	 r/47Zaf4H9VCxAF65nmGmneJkpFjPLYb5TV/IkSGCCsj1qlirNBlMgb6/KkFSzcEKY
	 392RPHFezEKZA==
Date: Thu, 24 Sep 2026 15:15:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Message-ID: <20260924-great-aloof-pheasant-cdac27@quoll>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
 <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
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

On Mon, Sep 21, 2026 at 02:26:42AM +0200, Nicolo Giuliani wrote:
> The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
> separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
> SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
> PCIe. It serves the front panel ports through a Marvell 88E6193X switch.
> 
> Document the compatible string of the NPU board, with the CN9130 SoC
> compatibles as fallbacks.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
>  Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 7 +++++++
> 1 file changed, 7 insertions(+)
> 

I don't know which fallbacks are right, why cn9130 sometimes has,
sometimes does not, I guess Marvell maintainers will sort it out:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


