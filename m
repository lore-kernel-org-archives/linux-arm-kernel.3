Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BBC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 04:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XxGmCX2ekXL3zSY/uKne+uElJCOAi5ipt9bPEl308I=; b=Jt+PaFGxFJfmg1727t63jJ8RZC
	Xq52bVmXJAOzOq6penRcw+N9EGbTsQM8mJTyzyq/bfJc6HgFVCBZEMp5oKp7QhhQ+nsu2YxPeiBAI
	GIpYJDIcriMP07yFGcx49uoWBLH3XRJ0ywQxcYPL48CKyxiRTQefxUdMueq77z80oyY4qSMiDFvbJ
	68Mn3kRyCvlKqn0AWR6qQdM10Dk3gCkimBJQNGwu0Ktj3em0B8JUFrWZ9ewFNS38FypAba6V5HEtI
	09tR0TVN62l3x3dzo77ROkoG4Yx5ozqNq2a5GtW0hJBT3EoGyN+IeY0O7t9E70wGwzasQlmCvfYKf
	7pnm7g9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMYS-00000008DMi-1dYq;
	Thu, 30 Jan 2025 04:53:28 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMX8-00000008DHy-10Sf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 04:52:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U4pn4c2292267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 29 Jan 2025 22:51:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738212709;
	bh=7XxGmCX2ekXL3zSY/uKne+uElJCOAi5ipt9bPEl308I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CHHOq9SRdPPC357R+DdipK+jjFMopZ2yJks3YTWy+thPkUtX4DyaSn6uGHi0YyDJC
	 vRmrSoufZNvwHsi6AMyhDB904MpZdWtOmOQmblKgHODGqwvjVFvG1kdl2a5fvWfeBk
	 EL+muRX8Ra7eO+P7UCVLCvBtL/Tr+JJQIwcNOXMo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U4pnq5036930;
	Wed, 29 Jan 2025 22:51:49 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Jan 2025 22:51:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Jan 2025 22:51:48 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U4plGF093028;
	Wed, 29 Jan 2025 22:51:48 -0600
Date: Thu, 30 Jan 2025 10:21:47 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ayush Singh <ayush@beagleboard.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, Nishanth Menon <nm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: defconfig: Enable gb_beagleplay
Message-ID: <20250130045147.ji2tnogbgxim26pw@lcpd911>
References: <20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_205206_414667_8560CBCB 
X-CRM114-Status: GOOD (  16.32  )
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

On Jan 29, 2025 at 18:44:54 +0530, Ayush Singh wrote:
> Enable greybus driver used by TI K3/AM625 BeaglePlay.

Nit: TI K3 AM625 BeaglePlay , no "/" required. It can lead to confusion
that K3/AM625 are different chips.

> 
> The driver communicates with Ti CC1352P7 co-processor which acts as

s/Ti/TI

> Greybus SVC. Additionally, it also provides firmware upload API support
> for Ti CC1352P7 over UART.

ditto

> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
> Enable greybus driver for Ti CC1352P5 over UART used in TI K3/AM625
> BeaglePlay [0].
> 
> [0]: https://elixir.bootlin.com/linux/v6.13/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> ---
> Changes in v2:
> - Add hardware name to commit message.
> - Use savedefconfig option to update config.
> - Link to v1: https://lore.kernel.org/r/20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da44155999b59aff95966f4cdc9107f2af46a..62309fd2482ab35e917aea2e63780c45a4347f43 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1270,6 +1270,8 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_XEN_GNTDEV=y
>  CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_GREYBUS=m
> +CONFIG_GREYBUS_BEAGLEPLAY=m

With that,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

