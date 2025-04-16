Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF4BC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw7kA2q6zYR7yJYZmDFH2xX3JGW5ovJzPDT2W9t7uiw=; b=Pmj6YG3xnskq14z5zaVjmn3lUD
	kjOJjqdkeNeYjN8gZ3B6HQU71WNoMXGOPVia0eVKqu2bT33w8ZJ+62fUzI8cJaBPMB3PALY+ylSAr
	OBgdT6Kow7CkXQyy3rFqhQC4KiOY2qYSOc9Ebvvf0vSFkQPzMIet64UGCa7At63tonG98S38khdHr
	Bl/8Zvg+76nuouK3eKzEONp2gCJdzZ5lmXFaPER04lvvLAqhnIptsqXi1vxEuSOamMDVwkuNiUjBL
	V3pQT2RUkKrpeEg3ZPwMZs1qQSP9u5xc5ElIzFU4H4augGH/MfEEzYEVZae3juszrwYdyzvkjB4qz
	rdIy33kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57OP-0000000AYAd-2LUL;
	Wed, 16 Apr 2025 18:21:49 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Ab-0000000AVsU-1tU7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:07:35 +0000
Date: Wed, 16 Apr 2025 14:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744826847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw7kA2q6zYR7yJYZmDFH2xX3JGW5ovJzPDT2W9t7uiw=;
	b=yxAJ+8cvmevoryFERuQEeI9/0J70C//Cc3pfmwRnpOR1OHTh5yuWhPGCLuWa5V0IIgtPnM
	mvS87vabxR+KGNJQx3cNmk6jtZY/BwpzAUPtoVGJs3J0VzNhJi3xtIEc6tyj8w43l1bvrV
	EJPRHac3a6NueGjFsaFcY5qVVWWp18yixrmJ+Z99ywleuE9qbm7+RHO3J4qxznkVDjB+dm
	sm9NxQ0noZJ/2gBLEmbHcktJqrWByVsZsR4YSdomV8J/VORMrfv1T+BAkk5lMRrn0GTl4O
	Yeq//7xW1lpll0dj3G/k5SIfluHcKhXyeWSQVjOPyCoq28WlmZp+Lg4jTZRQYA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sven Peter <sven@svenpeter.dev>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: touchbar: Mark ps_dispdfr_be as
 always-on
Message-ID: <Z__x2hboc3RQC6Je@blossom>
References: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110734_016573_E6CDA722 
X-CRM114-Status: GOOD (  19.08  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks for debugging this

Le Wed , Apr 16, 2025 at 08:06:18PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> The driver depends on boot loader initialized state which resets when the
> ps_dispdfr_be power-domain is powered off. This happens on suspend or
> when the driver is missing during boot.
> Mark the domain as always on until the driver can handle this.
> 
> Fixes: 7275e795e520 ("arm64: dts: apple: Add touchbar screen nodes")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 10 ++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 2dfe7b895b2bc0a913e73141e558fa5124a13b2e..e2d9439397f71a93c28b75a7eea589f4bcb3e374 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -77,6 +77,16 @@ touchbar0: touchbar@0 {
>  	};
>  };
>  
> +/*
> + * The driver depends on boot loader initialized state which resets when this
> + * power-domain is powered off. This happens on suspend or when the driver is
> + * missing during boot. Mark the domain as always on until the driver can
> + * handle this.
> + */
> +&ps_dispdfr_be {
> +	apple,always-on;
> +};
> +
>  &display_dfr {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 3d73f9ee2f46a35a3b23da5b233ef316c7372ef7..be86d34c6696cb47d31696541266e504cee8ce10 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -40,6 +40,16 @@ led-0 {
>  	};
>  };
>  
> +/*
> + * The driver depends on boot loader initialized state which resets when this
> + * power-domain is powered off. This happens on suspend or when the driver is
> + * missing during boot. Mark the domain as always on until the driver can
> + * handle this.
> + */
> +&ps_dispdfr_be {
> +	apple,always-on;
> +};
> +
>  &display_dfr {
>  	status = "okay";
>  };
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250416-arm64_dts_apple_touchbar-658cd974de97
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 

