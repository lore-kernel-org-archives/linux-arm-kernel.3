Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F80DFF60E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9kAiIHvRyCHNdo8mnRDLlqCYJ7U09pTO2WyByLtVzA=; b=t4uuvlZiqAQ0a19W0CZiDP2kP4
	CC2TZ/BCa6CVFSY+u+s3G+qQoY5l3pab8qk+hdIvSgNkbby4N62iTzPI5U53zpAnbn1/ksa5dN6yI
	DYztrZo5srjLYmrepwGD50YcEyFNyhUhNTScjbFLf7rNGsKAxZgHuaHE7AJLozkK+muoRnRj/6EEC
	rTiV3XWuQE6MKo7LK9U002Z/sCzffAtRvHpmQzwxC4zwZxWhe/Qhm3884LiMN5sf63mG2HCiAzh0E
	YvhEOzye9n1j+14wvikrvCkAmqqr4sqTbt2QQobJVLjESamkTZ7zEBAqwZyTCIk9lDvsRGfYmyMSW
	zCkGXfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UPq-0000000CaRv-1z7D;
	Tue, 31 Mar 2026 08:25:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UPo-0000000CaR9-43ES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20542600CB;
	Tue, 31 Mar 2026 08:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0B6C19423;
	Tue, 31 Mar 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774945535;
	bh=2gJfRtSBfXj4JRuylSNVBq9hSnCvKnDG0P+NVrtq244=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihjnBgBXql7h/5fe93awTa+yWd+6DPMXqWIdZEg1MG2gGESxwaQEUjhFAhe/AWs9X
	 AhKazAWnXUDgqa0S8cFAUc6Ma1jg830IWVPKdBHzXptRIVv+aHASXG9YdMQZDD3NF6
	 +pee5dJLS35pZIM9RIBPEtOJPTg29e/Rx4wU3eHW30K1WkDNwxR7LGnILDMYvTHzcQ
	 qzNjK6z6wko8l+WnOR9QCauH+0DhhIwnZdz6OMsBR8y7tAnIFXMPy2S1Bgi/kWQDp8
	 QEcZbSFW9viMSxzL/cnHtdq+cVNJrqxFdmi9srjxf85RaDugNIxmtJKIV57eyM9dRt
	 CUIIiJm8hGQBA==
Date: Tue, 31 Mar 2026 10:25:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB
 support on Versal Gen2 platform
Message-ID: <20260331-jellyfish-of-pragmatic-prowess-a230fc@quoll>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>
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

On Tue, Mar 31, 2026 at 12:33:01AM +0530, Radhey Shyam Pandey wrote:
> Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
> 2x1 Dual Role Device IP. Introduce a new compatibility string to support
> it. The USB wrapper registers reside in the MMI UDH system-level control
> registers (SLCR) block, so instead of a dedicated reg property, add
> xlnx,usb-syscon phandle with four cells specifying register offsets for
> USB2 PHY, USB3 PHY, USB DRD, and USB power configuration within the SLCR.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - Add blank line after compatible as suggested by Krzysztof.
> - Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
>   IP from Synopsys is part of the dedicated Multimedia Interface. The
>   Versal Gen2 platform also includes a separate USB 2.0 controller,
>   and the mmi suffix uniquely distinguishes between the two USB
>   controllers. MMI is an independent subsystem particularly targeted for
>   deployment in Multi-Media related applications. The MMI block include
>   following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
>   Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
>   Controllers, DP AUX-I2C PHY.
> - For MMI USB define parent address space i.e UDH block.
> - Fix inconsistent MHz spacing to use SI convention with spaces.
> - Move description before $ref and items in xlnx,usb-syscon property.
> - Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
> - Use 'usb' node name (without unit address) for versal2 example since
>   it has no reg property.
> - Use 1/1 address/size configuration in versal2 example, use lowercase
>   hex in syscon offsets.
> ---
>  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++++++-
>  1 file changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index d6823ef5f9a7..5e31b961aff7 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -15,6 +15,8 @@ properties:
>        - enum:
>            - xlnx,zynqmp-dwc3
>            - xlnx,versal-dwc3
> +          - xlnx,versal2-mmi-dwc3

I am not going to ask the same questions.

Best regards,
Krzysztof


