Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8083CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihFpZK8Kweu8myYJpFk/JCzFIlJuPsYFn1vhCIEfLGM=; b=Ezue0x8c+9TGanPWTqK7Mh8cnH
	S8JEXq37gfZwMgTMe2sPvuY+wq1I8DDDpqzWRXxZcboYOSVs42rvF8neDA/IXrYjJcEfT05LMSy0+
	EKFqHoAK5hCyMYAjtLND3U9igeULeiddCxZOdmPuHJobD+SNxz82uZJ4KabI/ONq7rasiCVn4Jwt3
	YrZ5xKoeCHY1afC4BkEveG3Irje566/vw1bFdoDjHiLKT7+iwWGiDbE3mNnsYVL4mrboskrWStKV6
	MDvvTCp5gu9Bb0JoGGbSqURA2rkkLxeW3JuhiFYWvG4jywMpSKAGBv3Bnlld3Bng/mmDvHpTkp48i
	nUn6mAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTDx-00000002uqi-1X8W;
	Fri, 22 Aug 2025 14:58:37 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOHt-000000025DC-0FS3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ihFpZK8Kweu8myYJpFk/JCzFIlJuPsYFn1vhCIEfLGM=;
	b=lfBTSx1kHGgbahgmu7uyxhXzEjK2ENgY0l2K9oOt/sRitUvMIAOaMjPc762zAg
	38N0PZDK8KP5tAU2sme1f1qaB+WCp/3AVLk1/fNlKH4iZ/VfCI49wvamYLnPyZg8
	gj38z2SxqvD+LGtpOHwCUZDDrdev56xaSDij0LlCogecI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXd5JjO6hoMRQWAw--.62618S3;
	Fri, 22 Aug 2025 17:41:57 +0800 (CST)
Date: Fri, 22 Aug 2025 17:41:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/4] ARM: dts: vfxxx: add arm,num-irq-priority-bits for
 nvic
Message-ID: <aKg7Y0sjZtJpYLT_@dragon>
References: <20250819-vfxxx_warning-v1-0-080930d8e1ea@nxp.com>
 <20250819-vfxxx_warning-v1-4-080930d8e1ea@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-vfxxx_warning-v1-4-080930d8e1ea@nxp.com>
X-CM-TRANSID: M88vCgBXd5JjO6hoMRQWAw--.62618S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWrCw1UXFyrKryxWw4kJFb_yoWkGrcEvw
	4Ig3WrGF4kCFnIqr1UKwn3J3sayw1rArZ7G3409r1UJFyaqayrJ3ZrKayfJrn8CF4UKFZ8
	t3ySqr4Yka4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzwZ5UUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwUskWioO2WmGQAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_024221_422609_96DFEEC2 
X-CRM114-Status: GOOD (  14.72  )
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

On Tue, Aug 19, 2025 at 03:44:09PM -0400, Frank Li wrote:
> Add arm,num-irq-priority-bits(4) for nvic to fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi b/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
> index 2bb331a87721000880cebeb81dd3c00febfbed3c..ccb5deb4e9528fe005a5691347d4a3852fa52ca3 100644
> --- a/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
> +++ b/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
> @@ -52,6 +52,10 @@ / {
>  	aliases { };
>  };
>  
> +&nvic {
> +	arm,num-irq-priority-bits = <4>;
> +};
> +
>  &mscm_ir {
>  	interrupt-parent = <&nvic>;
>  };

Should probably add it here in name of order.  Fixed it up and applied.

Shawn

> 
> -- 
> 2.34.1
> 


