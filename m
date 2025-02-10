Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F13FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9DLRZ0qU+2ZbcBORnSXjCBvtxIqhUuc8Y7yicFr4ec=; b=JjQuITuYR6+vOlTyIB1oKpogtE
	PYJ//rSoqTfC2Bd78NvEPNz2YpngkMDnRQ31+MFaT1D5ZjmYVbNCD9A94hQsuLPZyyGM4Dwdlp1LS
	u+sQeGoBnAxWvHKcgDCBL30jx8FK5wBo2AF9mK4dv6GptTQu+KnZuzSDRboNoQQnlvMIP+zD/Wuq+
	13bfbOoOc8gcqdo0ZJh0ew5LJrbp5smVt9LNTkZNJAstbtiE3RfyQtc+bPvQ7DbaB+JsQNQj+B0Z5
	UCa6DBgg9dvcba3RrakD/3h6jR67pbn/0AyALtahnsDcn/dXGxm5UhmAmV1y7BGpsVtDpemwJG2ZA
	bsK7yS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thNEj-0000000GMiH-0ifY;
	Mon, 10 Feb 2025 06:25:41 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thM93-0000000GFCL-2LhU;
	Mon, 10 Feb 2025 05:15:46 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c05f7d9ac0so55898885a.0;
        Sun, 09 Feb 2025 21:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739164544; x=1739769344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9DLRZ0qU+2ZbcBORnSXjCBvtxIqhUuc8Y7yicFr4ec=;
        b=WRRO1kAgxWeiW9Tx7O63adHNziTMax52wlRG/fS0XOc5si5YgGWd17LpSMau3n4q1b
         /fpKllHdOpjkEpU5sO2yFMuEPfDBrBhNYvSix/28burwNprstdjKPPeeGJ9dX/pClcgW
         1vD6o1xPT3cD6NpmUhViElxlYC/2g+W9Oh0aTyeZg0j1soG7ojjg7S2fqKv7JVrzvG5P
         6wX6vgteqKkhQifYor9AEgkqM7dsO74RwoKSbzkIGloAM8V3wcLfdTLz/e6Syb3Mq0Aj
         lSJR1FsosjHlRojB9QOJK6QVtss+w+JQnUq+ntYVAJwSnvRxjnq0BRJCS680RB/tIZgm
         EHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164544; x=1739769344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9DLRZ0qU+2ZbcBORnSXjCBvtxIqhUuc8Y7yicFr4ec=;
        b=o9u6fid/elJIg17Gkbc63PUc2GfnZTAsi9WIuJezMepAUIOTeIAESR+jhqDP3EUk0Z
         4u0HIIusWkkvpwLx0EmrgESHl2c/vBOaIeK8rq6otTpjJxhTQZvHQwqSsEKAd9mnO6OW
         5z9ouTrr4rHgimJgeyHypLKz2dXY24LZCbQL3GiGoCBVXZxT35Ifn1Dc0JWvsEx85EU2
         58AS4aDaKaCGiTxqOI0EwNhrStdkIQ6zo4vJ2HcX6xFKeu1C84SvhUGDlchFkI2HDram
         9UAJ2ZSnLhTkExadpDO0zOuSNSABgQDSG4KYzpLpDRtA3SXLxOuhlzwQXCtHjsly/6k4
         NRmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9OiUpP2rWZ58hHMIeaz/bt2J0u+p1+el5yF+UQ+0MnC70cedSgdOZBIvp4qriHfOwVrU77fNrAA34Uis=@lists.infradead.org, AJvYcCXPhfFsN4s5Ml0DTPmW6eVAahRVMZHjInjcfPeZKwLWU0bC9zlbPYt8HURnAfR4X31Kyf1AMlHd4o5FLTAF9iF3@lists.infradead.org
X-Gm-Message-State: AOJu0YwvZIWQ1MsKEeQhQvyxFzItRJKM4fm+QobnSQzvBryuyhAZ6xSK
	BMfPHidTVBJTNzUg3dd2wqmx6ycErbDO0ZBAz2l2BqECBV+C/H8G
X-Gm-Gg: ASbGncunImFTaLr2S6vpGJEnLJUoSjSySGHqFKhnVEMcnDATPxm8taUcHW9S3bmHYL2
	NsNThlURZw26eUp5N3X6bqQlnqtNXydIvTHEGls6A6tf5EcgpS8IMWaA+Ok3ejDWZx/YR/dpbIb
	yobCH1sPbFkaJN8XLz2Mi0Fx5PS1UtuZfIcAd90OGqEF42AUpcl5t/7ySh6fxOV41yLCTZO5TrZ
	DYcq14IoykZ3KoKwjP7+6nFSkDnXMQDaA7XuS8RR/z9oJuSxZ6YmJCOjJngL0jaUgg=
X-Google-Smtp-Source: AGHT+IGPRpX+BzWoRnQ2ghPlZC6fPh5J0DAxWKcAyO1DOBNAeBgJVLAvp3g9A/FBncSgBfpNJ8wavg==
X-Received: by 2002:a05:620a:261b:b0:7c0:5aa5:87e with SMTP id af79cd13be357-7c05aa50a21mr661627785a.44.1739164544167;
        Sun, 09 Feb 2025 21:15:44 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e13863sm484740485a.60.2025.02.09.21.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:15:43 -0800 (PST)
Date: Mon, 10 Feb 2025 13:15:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys
 core and ctrl compatible
Message-ID: <uhvm34h2edevntc6uw3u5qiuiwfaolf6iqlhuutfkqs42ievdg@abkygsjiajcy>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_211545_601559_1F5BB0ED 
X-CRM114-Status: GOOD (  14.21  )
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

On Sun, Feb 09, 2025 at 11:06:31PM +0100, Alexander Sverdlin wrote:
> These syscon blocks will be used for CV18xx reset driver.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 4d67ff26d445..5a0b102d1bd9 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -108,6 +108,8 @@ select:
>            - rockchip,rk3576-qos
>            - rockchip,rk3588-qos
>            - rockchip,rv1126-qos
> +          - sophgo,cv1800-rtcsys-core
> +          - sophgo,cv1800-rtcsys-ctrl
>            - st,spear1340-misc
>            - stericsson,nomadik-pmu
>            - starfive,jh7100-sysmain
> @@ -207,6 +209,8 @@ properties:
>            - rockchip,rk3576-qos
>            - rockchip,rk3588-qos
>            - rockchip,rv1126-qos
> +          - sophgo,cv1800-rtcsys-core
> +          - sophgo,cv1800-rtcsys-ctrl
>            - st,spear1340-misc
>            - stericsson,nomadik-pmu
>            - starfive,jh7100-sysmain
> -- 
> 2.48.1
> 

No cv1800, use cv1800b as the base one.

Regards,
Inochi

