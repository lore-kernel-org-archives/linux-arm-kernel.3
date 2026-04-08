Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B72FD5F8F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJkcrKpMsomWsfu3HRoQuW6Uqe86+81cvDsG/ByrGck=; b=Yfz7T4weJmnt//U/pXmLSqtXBX
	clFm28qtZyjyKUvfVz6aP3/4k25bZUudhWlm6L8ghpPLHOtVlFojKhbyVl8dfHgFh+jiphqs2NEtc
	01L5/inLLsffWsrQrPyzMtFVn6VZoFlHePFWtrpvv+cliQKe8EHSKWzu75+5c5v4+gDWu1yaTMl6F
	FvHHAMG7fTERhDAn4JomUVqc99K7GbhVz9NaRjBONErek/6WSyR3Ie9lTNbvbpIxsAYnxSM7F5Y8+
	+YbWx10KsBZ29RaTmMDurrifJeaOYuw4dcRaG3Kx3r+JA2f+pRhXu+DV83D+CNqk912Fvy5MSXIB8
	vG5KV73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANiC-00000008TC8-0nsx;
	Wed, 08 Apr 2026 07:52:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANiA-00000008TBq-2oUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02D35600AD;
	Wed,  8 Apr 2026 07:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CDBC19424;
	Wed,  8 Apr 2026 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634749;
	bh=xNY9tEvKoYhfTQH3M8/Q4r7s7A/d71rffbc/9uF1Xa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ih4NSeC2UtjrjEgv+qhj7RtI0dtNt/8E6c+4i94k1Sj4TamaIc7W7ZxK5Nm3QtmCC
	 Vd760WYlfNXMixdwpwsP9oZDAvw006FAcAu3INDBMcTNgYdsHgQizXVaxgh+9qQrDi
	 aEOoCclvi3jirOCzCYmkZ4X/4BZG7dPnqnX2ySRZSg3/gT+sH+q6ZQgHd/0VtTlVwS
	 H4dkYCWlUU8f9MFq91Kxjd18brVjj1jF81dUN5DG2ePwLMEu/HVqu+5IlOSSFpbBjW
	 aBNIQQthwmBjWJCTX63DLrRjrLEsatuBMFYVSJ6yGjFIvHfG9DgQMXmEwBfm8Y7xtw
	 LxCvoacfK38aQ==
Date: Wed, 8 Apr 2026 09:52:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, colin.huang2@amd.com
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: anacapa: add EVT1 devicetree and
 point wrapper to it
Message-ID: <20260408-glorious-vehement-robin-b6def3@quoll>
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
 <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com>
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

On Tue, Apr 07, 2026 at 09:54:33PM +0800, Colin Huang wrote:
> This change introduces a development-phase devicetree for the
> Facebook Anacapa BMC EVT1 hardware revision and updates the Anacapa
> wrapper DTS to reference it.
> 
> A dedicated EVT1 DTS is added for revision-specific hardware while
> keeping a single, Anacapa entrypoint used by the build and deployment
> flow. The top-level aspeed-bmc-facebook-anacapa.dts
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1069 ++++++++++++++++++++
>  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +------------------
>  2 files changed, 1070 insertions(+), 1063 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> new file mode 100644
> index 000000000000..a29b7fa1155b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> @@ -0,0 +1,1069 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Anacapa BMC";
> +	compatible = "facebook,anacapa-bmc-evt1",
> +		     "facebook,anacapa-bmc",
> +		     "aspeed,ast2600";

Test your DTS before you send, not after. Your binding clearly said
something else.


Best regards,
Krzysztof


