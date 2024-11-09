Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69793D5E364
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrYUUoqAMCRT4BslUbCaBrAXLK7PysXo2xTrJ7n7b0s=; b=PBtTr/v85yTkRlIlqBOo2WGkf5
	7AQPgjpx95qyB4FK4UyVuyAV1Jxh8slj1buTFBiflGzbG77OeqXeQjzc6u85eQgPPlNwDevaXXDCN
	apqRO3ft39I2PnF9dqmhzDJeFmS9tyW/cWyN222X+rtocEK5no4YKYVM6zoUuilvzh1Ti4ksQS10X
	9FK+rgkn5fYKc0735qBiKqaIYcciLjHuZm7nxYOp7pHQ1sjBWIbrK0XBNpbyO/aFq92DN8/dhJxbM
	nukvT8clNkUucURev3REOGdk9nIae05kyz8EkQbegS2BCq56DoEbU2Jhv5HiABwQv40XffFNWRIB9
	LntvWb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ite-0000000D5ld-2EeI;
	Sat, 09 Nov 2024 10:40:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9iqs-0000000D5aG-2lCZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 10:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4153CA4030A;
	Sat,  9 Nov 2024 10:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA19C4CECE;
	Sat,  9 Nov 2024 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148677;
	bh=O8bmZTnkzt/k76wgmpN7lbyrRgnPKEQqG7lovjyj04A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJs1L+shyI6Ycc7P7puwVKIizrQ8AKXI44qJmCsZdX25CZ8C6r4BJCX6HAlzHQNTT
	 3+e3EkPHdBk/O5KhXq2mJv0oDqcRDbYDIzwKLJZ+9aV7qwRxZqlzpm5dis/cvPkV4d
	 im2cDcY/4oTH8XslPvkd/Scw7dEM6ycAD5bWfr0a61wuCx/UZUcbLFLwfWAU2oaAPS
	 IS4gqarNrqaHjBrFondPbRXjyYWqnVh3Zo67BYrViV/1FY3WniF8UMp7ZB71pBdSxi
	 2Fbbc7u+THZx6tzcJcgkt2iD2rVS9yDtRtoYAaQhsGs2h3FoCRDjWokYtaiNuyMLig
	 mEJEXnhElHkBw==
Date: Sat, 9 Nov 2024 11:37:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: ti,tmp108: Add nxp,p3t1085
 compatible string
Message-ID: <vd4xjzsdfdtfybz2njsinvfgbb4vrvcqenegfrl26bahypucxc@2ic3adferu2z>
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
 <20241108-p3t1085-v2-1-6a8990a59efd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108-p3t1085-v2-1-6a8990a59efd@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_023758_782250_64E7133E 
X-CRM114-Status: GOOD (  10.17  )
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

On Fri, Nov 08, 2024 at 05:26:55PM -0500, Frank Li wrote:
> The register layout of P3T1085 is the same as ti,tmp108. Add compatible
> string nxp,p3t1085 for it. The difference of P3T1085 is support I3C.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


