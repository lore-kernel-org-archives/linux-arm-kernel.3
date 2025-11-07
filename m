Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E219CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SysL29AptSwZP4t3FoJ8+fvcvpUTHqpmLXW9kTsQgpg=; b=hGFdF7zhqWVU+RlV/So1cW4xKL
	F8iGRo4coPNudY2jGv0pm7kcAs/Py4f0grCNfCI4ryVJklK68NczM0MADq9wiQjnatn0HjmiqnjdK
	4qpjNnbwnUq3/odtzWTYCuohZytuTKO0uoeosBXm5eYjNXKZGi8bVXiLkEPWcZJY2/YhH9IoW4ktr
	a4QaffSdtoySKmxgOLuo+NoLpspyXRBOwPFR5DGRGJqFuhoxFmEHUZWH3ds/X0K4qi0FnF4o9pwa6
	zIx7nDT7H8dnh0oK7Som+ZTJ1XRiuENam45LnOxJkRkG5HUTxtgFQvh31+6et18QFhhURQnZlY9c7
	+pfaoyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHMW-0000000GpWx-04Db;
	Fri, 07 Nov 2025 07:58:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHMV-0000000GpWk-11ru
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7000E6013B;
	Fri,  7 Nov 2025 07:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A34EC116B1;
	Fri,  7 Nov 2025 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502302;
	bh=uxmerTTcORrb6gRQpPcQTSUxVg+OYTqzzOK67t9Ljfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhsmOxEikENFYBwdf+QqUISutA2BoruiWARHigdan/AxkZTUXkU+ZqsqaU7o1SG1e
	 4caM9k/Jj/yL21kTkVVLCEMkgZyfsuCWtTsPJYV7La0A6Uj2AR+Bw+hkxgKzU8IwYW
	 m7HaFfbGNI1TQkcDV58H6g12DVxcxD/FicE6z6OUeaXS2WTn4+3zoGnW8LeblQ429o
	 Jb/tR0rLSyBEgM7ffHI/dpIaZzmti2MaCugNYKWc20KOKXmXVMGIz7/DVCzF7rvDFk
	 KBWJ3n3Y896rujozkrKl7ah6fbj78rDeDkgKu/d20yqim7cxliO1VQjPPn2w4uLuum
	 i1O/GVVp9i9NA==
Date: Fri, 7 Nov 2025 08:58:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, louis.chauvet@bootlin.com, 
	aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 4/5] arm64: dts: ti: k3-am62a-main: Add tidss
 clk-ctrl property
Message-ID: <20251107-congenial-quaint-tody-dddcb3@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-5-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-5-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:26PM +0530, Swamil Jain wrote:
> For AM62A, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in main
> device tree.
> 
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 9e5b75a4e88e..15a9ee35dbce 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -77,6 +77,12 @@ audio_refclk1: clock-controller@82e4 {
>  			assigned-clock-parents = <&k3_clks 157 18>;
>  			#clock-cells = <0>;
>  		};
> +
> +		dss_clk_ctrl: dss-clk-ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;

NAK, you just ignored everything which was said.

Best regards,
Krzysztof


