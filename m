Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66DEC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWahUvJ869KYcFwOImwjqm6rJ8smONrk+DtdT/9DldY=; b=P/giasrOH0U6fQTtSVAMrpfTUY
	DvFuIKYzrzVk/qGMfiRw32osVxHoHGwxkFUTQ00T1D3m5KYTF5sttqhzKipOFDD0k/35hzWuABsA/
	2SPUXG2QpxQmeLXhQtebbxM3uoJfns4xV+fYL9kV9Xx1Wu+otyHdM6ngQOPZcUPLDc6MLSKa9jh6N
	JZ3enoLZkjchyBobpxhadqNPsY3ePBdIwTiUc2sbJAqbkHFo7V38bLSR0X85LiZpMO0EpFqhvbpgA
	bgGEE0nG3u561dHu8OIlGX+QTQ0gvAvOo33ImQyarqlj9QU4rCV24uGn9xwFT8gn3MtgNrjhh+9Jx
	dgl15W4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9sv-00000001GMo-07dW;
	Tue, 04 Aug 2026 07:48:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9st-00000001GMe-3JQA;
	Tue, 04 Aug 2026 07:48:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DFAF560A6B;
	Tue,  4 Aug 2026 07:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8A51F000E9;
	Tue,  4 Aug 2026 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829702;
	bh=NWahUvJ869KYcFwOImwjqm6rJ8smONrk+DtdT/9DldY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ec+VVqvT8ZS4ECZoClUqLkK06Smr5R69Pq+jFikyeNXwxq30k1s/kkf41IHV3yruF
	 jR2uOHklLLgd8iT5y92wawagNy/Nm9X1AxTxktqc2dhOzrRrHSaCLTiHZ16ArNAu2/
	 /u1t0JDwkn632r1L4wyKEtR6a4ELqVKykRe7BnyX/47IGx+GvVMtqJvkmqWQThYBX4
	 DZjNFVbxugjj8BqaSum4J7YE7ESsYLRCrAewPhe83IKkpb8c6Ri6Yq7tnXC3QXeW18
	 1z5RdpEL0+8gLnV0p+mZN2h82cj0ijuTUkNIkbZvcv0fv3ZKfJUAsDM5EkPkVFmnPe
	 tpGlg/33rsLDA==
Date: Tue, 4 Aug 2026 09:48:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <20260804-unbeatable-fluffy-galago-bfe282@quoll>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
 <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
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

On Mon, Aug 03, 2026 at 02:09:25PM +0200, Gregor Herburger wrote:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b".
> 
> These two steppings are not compatible. Booting with the wrong dtb file

Not compatible but...

> causes a crash at boot.
> 
> Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> distinguish between those two steppings.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> index 127be0fc27c2..11a38cd53401 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> @@ -3,6 +3,11 @@
>  
>  #include "bcm2712-rpi-5-b.dts"
>  
> +/ {
> +	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";

this tells they are compatible. If compatibility was wrong since the
beginning, you do not have to preserve the ABI.

Best regards,
Krzysztof


