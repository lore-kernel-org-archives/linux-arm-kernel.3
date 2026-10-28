Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21944606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERqXVJla;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLWkqtLn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=; b=ERqXVJla9oYz8c
	OGdb7uHZocyo03D1bLz1n5wjcfO0hu2C4dE+3Tqnw59G0MtfGTHuXFEfKR+H/YNr+TT/UgO8ozoD1
	dgc7dqMjwPW8z6MGz5eJBBQTZfJEQIh0Zc8JJXi5L4W6h0RRv0TuDfKQk9SluNjjeoBqkZJ3+Z6Za
	h4vyjYv64W8HZ9h+POeMTLzFjLO09O1hggeE1SfpbFJD4qTYj83RmRDCr0yIIpYl72WGfetHpTxIx
	/aFPav9nyv5sg5K1zbUZGL1vzoL7x8IcFJalbuK6h37LbxfikvFPh7c/g9jTvqE0irEgBWoxmXqry
	mypaAyq2siZSlpnvo2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9ZX-00000007sQz-09wS;
	Wed, 28 Oct 2026 19:44:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9ZU-00000007sQN-1FJi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:44:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e10a70540so918949f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216665; x=1793821465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=DLWkqtLnEMUr3VDiPGKBSp/+vwl8CaAgnPRmMUQldU5UqIZ14fcSaBkeg5I/VmsEJV
         Y1Cs4TL8worDSiMhKo06jTJmgZ1p7da2uPamCZismgvfvC9qvTQj8Qjwvfl4UmpyyjJF
         7StZFRToFgI4AJp5s+a2/oGh4DjwH7oCsx/nYipLg1rDX3c5wEhfAhaitsPU9hL/AdBc
         kIOZZDtT/A7KpDTwvGaY9cc9ct9oSisKqs8bxz84ux5sdIXz8a8WWufIDJ5gTQjbBm0h
         lmQnxZaGzCUEegZC1sIZ0vYKm7x27ntuQmqHN0l/o49ecsljePw3phm2tLuZAcsn/5yA
         Gkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216665; x=1793821465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=Q+GePOREqTidrP7nazhbaWk82oNuyhtBNhu5+2Sgvj46sEWg8uWFvRgOZz4cMyji0g
         ZpIOxFF53DR59G/8wusX5wL5C/o3yPFFBzjlFndNMyNwvK3vVqt//n8riWotxQ3mS3wg
         mszRtS/VZQL9fPoolI39zDCb3dJc4h8M2Gul9MofFqBaMUA6FzY95fkTogBNe6LrXoGj
         jTaBK02x3wj7goh0KIq4YAX9xM6bo36UqooMVfzhtnaB1TKWVMfEaTDe3tMaK4ypzGfo
         MA5EE/WXfX3gn5Q3HTSSjuuEVao7LafrhFtC/4ywYt4ZDzeNyKMZEU4eJubBioThSE95
         RZ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4NGNRHZSQyML/Uudq1jBigql3+3tOEC6pzJZvQ3pQAtQM8r6SI541wwpq9bPZqXXZ7Tc99aPQJh+6UBtD9nEv@lists.infradead.org
X-Gm-Message-State: AFq9FYJzDzKeJJqcrRncFg7T5Zauvybqggz/ztfXDaA8uPf3LbpdyeUS
	2Xo48iXIm3LKo2ULgI+PqTrP1V/f97M/n5D+rrtHI80mCKkonsgHbSIj
X-Gm-Gg: AYBFou0CKgHOGcZdakLJgZdFQWGvUz5i4jX14n8JN+fNRcfgrE/gD7xjVvKr2AZPFEK
	jdvpkI/yAyEfJuiZyZXQzzlYohhi/ctBsj1lf8v1R60qytbLHY2uzOiM2Kezvjqu73XC5RIEYo+
	7ipnwLBv9t0abAFt7q7XD2nyng8DX+h/5G7FfW4F+kTrMgFCvEJ8pYVyYGiFPkkSdePI77h+d16
	hcgomxtLylilsM4hanu5RRgfMjpeRmxITaNnTPW2Zt7qTTPS5RrbFeQFoaWzWivJsmYqqxvrFsN
	ZARCaB9HzWVqAQzWxZT5HdCz3woKnMiUjcjsSlXpy4cypRpNHmBruyr2PUAyNGD1SPyIrzKE4ha
	ZGG+lgU5Fw67Bz3ENF6hIW6eeEHthvWDSe1VBSG2igDoCqWKRAPqx539gfMQtyEYDW0Evrw5gA/
	aCgCY2t91BybVyAJLHb6hlCD3gLh3bvYOsC6VNrLnH6HsGAqM5NCjMAgNcMA219E/JPWHeVseTw
	QzEgXwHubqxGHNQQar4/0QMSfuoVQlU0kaSHBIRb1biqBzQ6ze+/RUKS1NEstuJTLvbtmWabY3U
	OQmA8gKxstSJ0Anb52J/AhYTQVRdnXd8af5PJZkpTi/+tYseblIHPOpz06ME0/WNMpsi1oU9Yns
	OUIpHE3b82wqGXP+i4nXainSRKNFKY1g=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr6431684f8f.55.1793216665283;
        Wed, 28 Oct 2026 12:44:25 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm27766389f8f.3.2026.10.28.12.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:44:24 -0700 (PDT)
Message-ID: <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
Date: Wed, 28 Oct 2026 20:44:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_124428_358026_E40F7C07 
X-CRM114-Status: GOOD (  15.61  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add usbotg3 iommu information.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..1370a571153a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -32,3 +32,7 @@ &usdhc3 {
>  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
>  	iommus = <&smmu 0x11 0x7f80>;
>  };
> +
> +&usbotg3_cdns3 {
> +	iommus = <&smmu 0x4 0x7f80>;
> +};
> 

Hello Frank,

this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
(both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:

  xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
  xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
  ...
  xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
Reverting only this commit on top of current master fixes it. The other commit
seems fine.

Adding the same property to the parent as well, like the NXP downstream tree
does, also fixes it:

&usbotg3 {
	iommus = <&smmu 0x4 0x7f80>;
};

With that, SuperSpeed devices enumerate again.

Could you please take care of a fix? Otherwise I think we should revert this
patch.

#regzbot introduced: 73c3b40e536d

Thanks,
Emanuele

