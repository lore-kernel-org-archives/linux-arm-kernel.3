Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2BFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUT90jokY5NlyqstyZMgghFd9nYKEbYJnjOH9XLfDUM=; b=0K+y348Pet1VDwn3IdVb0bWX4t
	yG2fqtCBnUjP05DmAsnZ6Ww8tVwVKi/ibEz1KgtLqz3myvZRnnmqRAvqnhh2t67X//L7V1NMtHhqB
	QtBTF7B6akpPOnicAbhnb0bjmLrTRn97kCA1q0xKKqRJAv++kqjk8JLsuo+KvTgf+X757/jVYxSI5
	ScJa6O4AzbGq4ANGbg9z4G+PK+uySmA5+5d4q4SEJd1hGOIxdeiTO6jFZeyPB4btymgEaA9QO/Lro
	MLol7yo0311Wbc5M6kJs6EDwvQwi+ePvqomKQ8I/ux/+rjzvSssX2CjbqdSWdNh+CJhoE0nBW7q8p
	pCZm/vIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgYT-00000000I2X-1Bt6;
	Mon, 06 Jan 2025 06:25:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgXH-00000000Hv7-1Lhu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 06:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6828B5C4871;
	Mon,  6 Jan 2025 06:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA98C4CED2;
	Mon,  6 Jan 2025 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736144662;
	bh=YkgbAC5CRsMi0k47cxKMsJvrVQ6LTAH+bVM+P7Q90K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYJCC9mV/w1jdAb4p8E+RnPI0HLFJcyAN3GpVx9fCGmRbko/qfjKmJI5vivIrJHEs
	 ioyaM6rnpgtuDdGBgtQtsg7KANdPKUp/+LcGYgj15i47wMMC0LJUGTMqjoe4RKyVu9
	 KBvgGHZ0pyr02dGSRW+K3++rs5R8KmR6/XXZiIxoOHgKqFtprhl1pbhzJ6RasjylR0
	 UabTP5SrELU5qWwa0ZRUuTdlNzbOcM6Dn8GHFCfpijrrhsZADxVjgzNKk1Xw1AVgGg
	 3e0HCRYhLUKTZ7WucurRxIJcCMEAQOaTecjtmQEMdZcXsa2Fd/g8nB5fTN3+WSrNFY
	 2Nj3AaCXx6qVg==
Date: Mon, 6 Jan 2025 07:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
Message-ID: <lvi72dmucagm6cxotqxmvc2yjdin3dvumivrfxjcsth2djaf54@n3i36ul3zkvl>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_222423_441531_618524B8 
X-CRM114-Status: GOOD (  10.19  )
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

On Sun, Jan 05, 2025 at 06:03:43PM +0200, Ivaylo Ivanov wrote:
> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
> index a01af169d..b7c1406f3 100644
> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
> @@ -9,9 +9,9 @@
>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  
> -#define USI_V2_NONE		0
> -#define USI_V2_UART		1
> -#define USI_V2_SPI		2
> -#define USI_V2_I2C		3
> +#define USI_MODE_NONE		0
> +#define USI_MODE_UART		1
> +#define USI_MODE_SPI		2
> +#define USI_MODE_I2C		3

This breaks ABI and does not build. You still need also:
	#define USI_V2_NONE 		USI_MODE_NONE
and same for the rest.

Best regards,
Krzysztof


