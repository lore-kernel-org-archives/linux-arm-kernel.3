Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ttBDXvL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f1mDrVd/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=; b=2ttBDXvLz/JuNo
	rGJXfQfCbBDo5wOWfU0T4Yky3mZs8TQIyFk/8VrxJCAF1crq6ZibJuyr6nVeo7ScoHfjns1x/OEAM
	PayRr49mWeMpGds6sA1AFqpCWCSKIDEFE7WtlkVZ89dXvkSAwDGL+3xCQ5gbIgVlLvTBecA1yfD/c
	R5iVtgqHXg6s5efwBJPmDAqFErL7YNO/0CZNkZqKPGAz3L83bEMQvVkZT758iAxBHt+QVqT7y9oWS
	thgOEg/1dbJH/gBN3+Y7J3TV/cG0iC2COo3A2x65kL5xxEXG+asGoYKoOcPHANPZg8MF4FGg8GNtq
	t8VTs4AlIPDnSWPGwKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXPY-00000003frV-1LJh;
	Tue, 27 Oct 2026 02:59:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXPV-00000003fqJ-1Wwm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:59:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ea138a3497so23648775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069976; x=1793674776; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=f1mDrVd/0Jz+nQ5NV/nNosKvUOrx6n1EBtYScxkvqCsWcdo2OEUEpwqx0XhG3p5d04
         eLqy1RiXcTssbLj+GSAsGbDaVA/1gYBvz3teT3Q4gOiF1MVoITf7I/d2uLN1Aikj3KEg
         gHWPPzlCTZ8BYt/r1TVkuhP0qcM/7jwHhOJkhbPaTdxEqZC9A8b3EcDZhKp1CaTo0byi
         4XZWQRYdA86FQVrBDs7geUr39TEU5Y32Hppk3SyxTrTdNwXQMI1TL4uf58m0Lkb3i5cl
         wzoIqtEne8n2goOOgtQQxuFLKwjExpXTUJve6HhsmDhTYteBwxVyc2WtWKuxN2lxnIhB
         CZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069976; x=1793674776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=bIIpyAU2qnttt0HFowxVVa2fNS3Yo0GxvTcbva8Gie1jgqm7xsCTCjfbnulg5YEroP
         wh2SNTEdBGEQklbMbeYHBaJnkgiOXElSGUXGMfUB0U3SLzgQ/3FoxG9WE+UBcAbLHdFX
         AAoiSWuJ54yPPYlSoT0CffAvvrfqkxf7cBUi1oTYKd1EtczA7XJIZufAdsGXAfqn5vPf
         4DzhlJqEUgNZ+ydCFpk+wIrm1Fnhpf90T7q9Sk3ygipemEuA9GrFEukcRxxbHyyC4pmp
         5be09uUh1A0i3es2b0w9F+O9JsTB2ju3TBgwlNftVQ+yE3skK5dpblWN5TxADFKo43FZ
         7i/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8h1ZlUonf37Mi14c0WgN540pC/C4NhoYF/jKHV2A7ejQ4Cdbd1HtICDqgNR7smvOkbyUjduLoYaal7HyA1Bcj@lists.infradead.org
X-Gm-Message-State: AFq9FYIZJPOeibcKU2eDXjy/0zXH51iAhP10KMR4ZBesJT1eB/8InpM4
	DudnO7arGkanoNk5Xqlpv6D7eI9j8R+3SkF8ZxYNbniIxmuavbyfSAeF
X-Gm-Gg: AYBFou2Tkb8cvj6z5FM6dt+Ml8iTalO2vQ6Y0K9Z3OTsNqBhp2ttpNBvWUObqmTEB8L
	H1RmnZT6EIw5f2Sca5zdJElf1ok+lsDZ3ZUoDycRXwx4xK3NjEQ7SHe7nF1XLjDIIoKv4AIvTEb
	F3bMiYCNOD2w9qahNvgO9ab5EsZ2OxhPkPDuVmOKaXG45vhfCqWpMsPXKX0MjHjr2qbtJzXLduw
	UU/4KBoFTOKQtoLeuNYI+JqR1VffLujMGHBOjfOHtAV6t1hFg9zxjRVSThDCaf86rEbtx25GnVw
	lyCw029FD3L3nzGcxggxySONQ4BK4XXwxzxDBKEfLJ9tNF2l3KuQHWTs87TV4kE+wC7Q/EpSmYL
	RpUF4Wu6q00lTbUxzukdo7mGdi/QHRWg023F5/ZAkfWsUvyD4mYIcFT2VFkbaK+BN+AVWCaasTg
	vYIhNOhRQrnhECWiPx2kutFHm16BE1Fm1LS4cTbNqvCOX29ZGR+pOOKXw6sZwmbHj8Bgsms3b9z
	/n8Fw44tMg+Xfke5ADh3yeJBwbbFfktYLyUORo/gq3CLHwzJjxLkkU4ofmaglzhAOFkXKcGIWYZ
	QyVu5WM1+9BxO4pI1Uci
X-Received: by 2002:a17:902:d48e:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2ea9c9875fbmr71515405ad.57.1793069975922;
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c912f9sm2255465ad.60.2026.10.26.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Message-ID: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
Date: Tue, 27 Oct 2026 10:59:28 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_195937_418582_5AFDBE0F 
X-CRM114-Status: GOOD (  14.73  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> index 7785eb1a68fc..750046e1a5c4 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> @@ -222,6 +222,12 @@ cpu {
>  		};
>  	};
>  
> +	sound-mqs {
> +		compatible = "audio-graph-card2";
> +		label = "mqs-audio";
> +		links = <&sai1_port1>;
> +	};
> +
>  	usdhc3_pwrseq: usdhc3-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6416 8 GPIO_ACTIVE_LOW>;
> @@ -390,6 +396,70 @@ &micfil {
>  	status = "okay";
>  };
>  
> +&mqs1 {
> +	clocks = <&scmi_clk IMX952_CLK_SAI1>;
> +	clock-names = "mclk";
> +	#sound-dai-cells = <0>;

Above 3 properties have been defined in dtsi node. No need to add again.

Regards,
Chancel Liu


