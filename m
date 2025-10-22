Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AC2CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srTQ5ouNoYQcEfjHqNfqVffMmqDs5Rw0MlBdtzT2GUc=; b=dKgshrDwo3OC65URcjM3uk+Hex
	mntF0YsS9IrJJ2Xi3TqWQ53g/ueBNDg5KJkfs41ermyV4sxZ5AX2oZjW8fS5QBtia7ChS6bFXUhgl
	1duADSvof4tPVa4g2TAoh3Uub2hnxoROYe2LV48Hy2c9gQaY6l9gxID5Yb7jZuA5kL5ect+1M3VCG
	UNdeG1ogZ1qv1nu8nupGtQIcD5MWVNx49ZFHWfRExZMpmFxx7mg4CpoBBi8r+KA63p73V3xuxTAUE
	h7+pQhTzI8I3mdoqrwK02DxPMpomXlvOMllNuNcTeldUhtJfM/nUxkbqX4PFECJdkrQ1Fv6nHa5Zp
	y4xSRSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSN3-00000001fcy-12tv;
	Wed, 22 Oct 2025 06:30:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSN1-00000001fcp-1Hfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB3756030D;
	Wed, 22 Oct 2025 06:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC2DC4CEE7;
	Wed, 22 Oct 2025 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761114650;
	bh=KEgp4fU5XhMtbOPuc2WyIySNoZ5jLcw+J/DU2i8WbJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMAHiKg78Y1C7Fkm7JWfmXWxkP7AX1nnigwoF0sQjnZWuHnFs853YwIBqLKNCAtbM
	 RbHksicBdoVVUgkjng/Nti9dFYEvhuvCVtRXpff61yi92WWQJc11wNflrRLhvuJ7Lx
	 5CsAcsW9Bi0E+2UvfmJoXo+gKmZKRY13+YZTS6Seacn0kSb+XcGKEusPdg0SmSvXWN
	 v9HSP52xcR8KN00zUaxAm6rNNYmvrSISAY+Fcxd+7CS0UuNAoPv4jWoxV6f6lvfJsS
	 189C79XSH6oHA8Tv7Hc+BaBObhNbMtm11VkmCVsQP3Q0zhU59WDmohC3mnUogthTO9
	 GnZSDbJA9Sv2g==
Date: Wed, 22 Oct 2025 08:30:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251022-delectable-gabby-hedgehog-35f7d6@kuoka>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-2-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017233459.2409975-2-royluo@google.com>
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

On Fri, Oct 17, 2025 at 11:34:58PM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation.
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,gs5-dwc3.yaml         | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


