Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874E1CF8553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMeGw1+CVRr6jCf0oUmE3QI0ZYmp6w3a17kUwBI2g4Q=; b=P+ys1DCN8Qg4oQV2PDbMptBlnT
	Zdbcx6pd3aqj61SOYdu3DNxUe1nK8a/iyoQLlgG5L0EIeDcgSz54q0fnho0lihb7oToqBJ4bhoKxo
	4az0TY9fPPN9eBx5xaUfcxR0cluflfEBhRJbftNQRurwpZLAPkGHlvc8haxw7LFukspfx09W8kfLm
	aN5PlfHZggpA5pnZ0w0CJE45xS0GcMjfmd4DUD9KezcpJmNBXQkl3ceU3s2ovyColzndUXibX30hG
	xMAAY9/KDGLUXjnpnNA4NAaenltdeTyma9YMUZyGpySOYKZqOlV+SWASz+LpYAgMJFDq5AZnZ2MSU
	V3sogxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzrW-00000006LCD-2SJo;
	Thu, 20 Nov 2025 08:17:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzrU-00000006LC6-2fIv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 08:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE2A26014E;
	Thu, 20 Nov 2025 08:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1C1C4CEF1;
	Thu, 20 Nov 2025 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626671;
	bh=vCh0Nf9ol/SJ8LORneyZFWOq+kGqweHI+LiY7Sod7EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpW7Ue26N0TujXycX/gjDfNHp8Uup9OzwpT01gMm2Ae9M94LKOK393piRsqZVieED
	 Ai2yZe2evN3jXQG4g5R9DD3dFp3Tk95SdGBB8zpau3tLuvsZF86ieQwxfWrpCvuHnl
	 Hy/vvTpE6d7VLJ5oyQ0AEieg148Qb69/T2/T3GfnF9yK+Mam8qEADjAxHQHuALTUw+
	 AYA8os2aXRWfVaQZJ/Obg45FEndp+3bgiyaty3W91Hm2xAKE/QklRqoM9YYeLtdwqi
	 bRWF8O1X3V39DLllsfceQ5sdmHTI16jae3zzF+1VRnLOFU40krHrTT7kgSWLB7vi0l
	 sK4WQOi/kxAmw==
Date: Thu, 20 Nov 2025 09:17:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
Message-ID: <20251120-affable-markhor-of-authority-a9e63c@kuoka>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
 <20251119193036.2666877-2-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119193036.2666877-2-radhey.shyam.pandey@amd.com>
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

On Thu, Nov 20, 2025 at 01:00:34AM +0530, Radhey Shyam Pandey wrote:
> Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
> 2x1 Dual Role Device IP. Introduce a new compatibility string to support
> it and make reg optional as the register space for USB wrapper IP is moved
> to MMI System-Level Control registers.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index d6823ef5f9a7..502294649a6b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -15,6 +15,7 @@ properties:
>        - enum:
>            - xlnx,zynqmp-dwc3
>            - xlnx,versal-dwc3
> +          - xlnx,versal2-mmi-dwc3

All other cases were calling your SoC "versal2", not "versal2-mmi".

Add here missing blank line.

>    reg:
>      maxItems: 1
>  
> @@ -37,8 +38,9 @@ properties:
>        A list of phandle and clock-specifier pairs for the clocks
>        listed in clock-names.
>      items:
> -      - description: Master/Core clock, has to be >= 125 MHz
> -          for SS operation and >= 60MHz for HS operation.
> +      - description: Master/Core clock, has to be >= 156.25MHz in SSP
> +          mode, >= 125 MHz for SS operation and >= 60MHz for HS
> +          operation.
>        - description: Clock source to core during PHY power down.
>  
>    clock-names:
> @@ -87,7 +89,6 @@ patternProperties:
>  
>  required:
>    - compatible
> -  - reg

Hm? No. Block without address space makes little sense and is completely
different device.

Look at this binding - there is no way this device can be programmed
anywhow, because mentionned MMI sys registers are not there.

This is a messy, incomplete and confusing change. We ask always to post
complete bindings, for complete hardware, so put attention to this.

Best regards,
Krzysztof


