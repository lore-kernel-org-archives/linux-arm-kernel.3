Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0E6606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3zIn966J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfBhKtajucyvfmmNTsKe2Ab7sqyhk9L3hh3VIyXeDhI=; b=3zIn966J+NUDn3gAEPhg+8bDaq
	aph3cIygBeTfwOqyISORMvqQQPOKWflT+U0xDTVaabtYnjiPo7YdlULKcVBavyPuneHLoTHLxseG7
	R3D9cctzNEFFGWU19bizLM/v3TYkDlErqc18wQtidTPfjXSTkLW7/k8wA1eFwTOvpjrLmUfX0IuXm
	GQp6x+pTtQryRwE32+r5JO0T4KkOvBjm8F83MV9hHE6t8iFD3++tOidNl+i39P6BfI2dN9dVogoqK
	wX5ND3xYcWqSvbTajd4psWdivioYvB0TNzWrjcfS2HbIJEHm7DB6SISR99UA1gUmFyDGUe4STPStf
	aFK0CD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEPr-0000000AQ7g-0u4v;
	Tue, 20 Oct 2026 18:18:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEPp-0000000AQ7U-3qvN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:18:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B52843FBE;
	Tue, 20 Oct 2026 18:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D9B1F000C9;
	Tue, 20 Oct 2026 18:18:24 +0000 (UTC)
Date: Tue, 20 Oct 2026 13:17:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: krzk+dt@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	Thinh.Nguyen@synopsys.com, conor+dt@kernel.org,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: amd,versal2-mmi-dwc3: Add MMI
 USB support on Versal Gen2 platform
Message-ID: <179252027211.589421.5653120976811914326.robh@kernel.org>
References: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
 <20261020112636.2661087-2-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020112636.2661087-2-radhey.shyam.pandey@amd.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 16:56:33 +0530, Radhey Shyam Pandey wrote:
> The Versal Gen 2 platform includes two distinct USB controllers. The
> LPD controller is a USB 2.0 instance and reuses the existing
> xlnx,versal-dwc3 binding. The second is the Multimedia Integrated (MMI)
> USB 3.2 Gen 2x1 Dual-Role (DRD) controller, which natively supports USB
> 3.2 host and device operation over Type-C in a Gen 2x1 configuration
> with a maximum data rate of 10 Gbps per direction.
> 
> Introduce a new compatible in <vendor>,<soc>-<subsystem>-<ip> format to
> uniquely distinguish the MMI USB controller.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v4:
> - Switch to flat mode and rephrase commit description.
> 
> Changes for v3:
> - Modify commit description to explain that there are two different
>   USB controllers and difference between versal2-dwc3 and
>   versal2-mmi-dwc3. Suggested by Krzysztof.
> 
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
>  .../bindings/usb/amd,versal2-mmi-dwc3.yaml    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


