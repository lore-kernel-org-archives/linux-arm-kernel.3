Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5jPDSot6GIyZa0pxLSy/mfsciQ3sKfW+p/ZIWAknIg=; b=kXEvTb9Mhy1tXO/5+/UQh+BkgO
	AmYNR5mVs2z+j/a0heG4rQrn2xPWVtcahl33/8zDYirNJ/AWoUXgLlC2lxNtg+MS2qu1My3hZH8dW
	pRjDQThFAwddvvAJT0mpUSt1BB/eG9+PHcWyz+KVfkkxZDGW2SAsilfxh0joPK6h5qko4IMtJhtGg
	pz0XcNculV3MjXnTv8vzmHvYUfxTY/d56fOzdsPuNMNkDhQEP/fYb97MQRpbLvW0Nlk+bbGrtNWzJ
	F3rMXgO8x1bwNYRPCa8kx1DbIA1qQPxD35Hisd094595rnCMQT53na6RXvElaJs+eel5q6zoINhhi
	MilISw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJNm-00000004Jtm-2Tyz;
	Wed, 26 Feb 2025 15:31:34 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJLV-00000004JQl-1fdQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6822612E3;
	Wed, 26 Feb 2025 15:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4E2C4CEE4;
	Wed, 26 Feb 2025 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740583752;
	bh=sKRVeYhyukm96bknDTD2EmlHYAe8l6aWTLbHIvrVzXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CirGU35GPeHlxtFxKVWIE3cm0UoYzCuquO3h/VDCvPTp+BHhGC8GVW3Pgox2M42uc
	 pJ/XDGdkxEYY/xbjHsQxYn5WLK22RIpxH2+qFUYBfpJnkAj9HnFowM02iZs2oMXUPi
	 Becd8q3gjyMj8cOkzkSRnNMMIpAWedAvG8KBV0/K2Lf64Lh+TLEE3tr+knjcYFkIEb
	 nV0kR2ir+IKcpDBcw4WzDZdqFg6O6Adoa74d1Ul7U77SZ0GgB3NsZWYsLVPb5n9PXy
	 4Tt89qPuxThM6u2Aqk61Sn+WSqu9ErO+3MDEQ39+kL5kNalF2YYKuh88MqJvwBh9GX
	 ZQGfDH6zN4bNw==
Date: Wed, 26 Feb 2025 09:29:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: process: maintainer-soc-clean-dts: linux-next
 is decisive
Message-ID: <20250226152910.GA2447540-robh@kernel.org>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
 <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
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

On Tue, Feb 25, 2025 at 07:48:22PM +0100, Krzysztof Kozlowski wrote:
> Devicetree bindings patches go usually via driver subsystem tree, so
> obviously testing only SoC branches would result in new dtbs_check
> warnings.  Mention that linux-next branch is decisice for zero-warnings
> rule.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/process/maintainer-soc-clean-dts.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
> index 1b32430d0cfc..5423fb7d6047 100644
> --- a/Documentation/process/maintainer-soc-clean-dts.rst
> +++ b/Documentation/process/maintainer-soc-clean-dts.rst
> @@ -17,8 +17,9 @@ Strict DTS DT Schema and dtc Compliance
>  No changes to the SoC platform Devicetree sources (DTS files) should introduce
>  new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
>  results of issues in an included DTSI file, are considered existing, not new
> -warnings.  The platform maintainers have automation in place which should point
> -out any new warnings.
> +warnings.  For series split between different trees (DT bindings go via driver
> +subsystem tree), warnings on linux-next are decisive.  The platform maintainers
> +have automation in place which should point out any new warnings.

I see a lot of warnings due to dependencies (both bindings and other dts 
changes) not be applied yet (or applied but not in linux-next). I've 
been filtering those out, but maybe they're useful? Some are things like 
missing labels, so dtc fails. I think that gets run enough a failure 
report on it isn't too useful.

Rob

