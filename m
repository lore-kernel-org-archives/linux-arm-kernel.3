Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1935C3601F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3anVLaybc7Q9LxTXFWiupqpL66C9SB/8x/0EIFOjI44=; b=Qg4vc6VXugCvEyDjF7qlmO1P7c
	3nQ1eoRZU83otucZIe9xn8ZCnXYtEUX06XdJyt9hHKqpBhY9VMcQCnR/uBuu+mJQnYlC4pvSGs9kN
	yWwM4ChlH2gkoqICgpebqwMyOz49VMqWkDVBx5XoWkP2v7KTR2SRb4Jj9ZC7glMEtZMTRLCGfyfI9
	VOwCzOVVDn6HKNqsE25NcfYCB4vtdBNXseDPIBLdL5OBtLnFcn86fSZA6OTP4MYxFwLcNLp3O9UFm
	IwSDRoHSjvAI4zge6AR78V1xjOkAOVRNwggI1ZOBvNjyPeIqc05V7c4fxb09SeLXUnxP+/ULheOYN
	M6e8SylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EHM-00000007xZc-22bV;
	Thu, 03 Apr 2025 06:42:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EDs-00000007x5P-3eGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E6FA61362;
	Thu,  3 Apr 2025 06:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A111CC4CEE3;
	Thu,  3 Apr 2025 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662324;
	bh=YxNQgOwbq/vG85PIYBP1y2DGiGETcPpm5tCt19Qss54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rdDW3wZC8xXiJzAIqacq3AFyhV8SPL68kl/cC3n98UPqJaEyMqxcsIFykpUpS2qQX
	 4sdSc+FGzw9BhHakkWWvvuXP7JxZyQR0g75qSEBS4iVubpp5eBw9rX5ID/8epJy+05
	 /xo8CcQNgCzSgs5ejS7jBfvglyxNu34h6yUdFl1d22Nkd08exLRJYHBKn7HuEzZG3v
	 TDLyw3sEM8PuS3ZN48IvXVuQPVX5UxnC7AP3Pj1pjo+VpZDj3T7hba+7W6tCittmBL
	 i6zzVdOhsmwr0giUHa2HcuH5vjA22qXOpy/yzC9+QY5YF94R+796LuGY7DBleOF6y8
	 kIEdrT7oOBfbQ==
Message-ID: <4371c835-205e-4ec5-865b-ae01d87b7b70@kernel.org>
Date: Thu, 3 Apr 2025 15:38:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
To: Mubin Sayyed <mubin.sayyed@amd.com>, cassel@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, michal.simek@amd.com, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, radhey.shyam.pandey@amd.com
Cc: linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, git@amd.com
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 4/3/25 15:08, Mubin Sayyed wrote:
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
> 
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -
>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> index 6ad78429dc74..c92341888a28 100644
> --- a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> +++ b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> @@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Ceva AHCI SATA Controller
>  
>  maintainers:
> -  - Mubin Sayyed <mubin.sayyed@amd.com>
>    - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Fine with me.

Acked-by: Damien Le Moal <dlemoal@kernel.org>

Not sure which tree will pick this up though ? linux-arm maybe ?
If noone volunteers, I can take it.

-- 
Damien Le Moal
Western Digital Research

