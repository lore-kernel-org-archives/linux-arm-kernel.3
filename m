Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7700606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3fdMjH5D;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EymjIcxj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=; b=3fdMjH5D+nBmcFvJX3lRkvNc/G
	ttcVwetUCHQcWLd9SPDtNUkrORgoscCrJDDtaofARdfSTlPk/u1fx15zMLD3egh4Ve41g4gHeIB7n
	ncgTfdBXQYMs+H81YedcmYp7aRjvbttxNr0fSS5bRw2z3ufNQ1+OQ6/8ZdytIvofLA62fVfO3jrgb
	FizsuAWFp9pGjE8hqSc2FLvSv9F11zw3l6DKjOv7rj0glqPWkDi9hHZ1iBDsTJ0st7jCiA6fHzFjD
	2ZTmaTOgbXQsw953xlXF5AWwBuelmnbK34uArKZRiEgQcRPTKErWhv6hkoZn/ZGwHDjRXYVxWE8ER
	e21rA4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwSd-0000000EZpn-3Yet;
	Thu, 22 Oct 2026 17:20:15 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwSa-0000000EZp2-0MIu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:20:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so704921a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689611; x=1793294411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
        b=EymjIcxjtL9ZsK21BdH/edjfYSX9YdWeTudwUvvOtFSTk2Xv4GLxGwlKs3fGWZ4o/x
         m5iv78JWomgvGClGemilmnoQXLLf25UOw7SF9xMAPp/wR8GrLRSU6VNAzzhwSn1xMH/i
         Ij4MPubkYODWFfsIGdwx8yC0d0NaqovwfVQFpIOQjIHAwR6i6Bpuia11DAhwBbe215qh
         Tf3mUnoJjjZ2P+EcBzq+qDpKI/ttrmnZxfml8Vqc76rPvjR7sdWpA/NUQbCm6qjVr5t2
         OqVLKq6oMmCoWMKTmeoTKJo2hVJGmos0B73It8VGo6xrJ1kn8L/pz75bPwNzhyb8Nd6h
         s4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689611; x=1793294411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
        b=M4masc2LQjYXyFmRlncp+ffv6LVx7nD7ZuWPZkQBuq84USFB/VCYF/7uyv4GKwRFN6
         +GVpQP92xfUELc6PtYZo6FVO6cR0b5EzUFRYCj2etbjZpP2xR0XpTN68yynlkzq4Gxd6
         yC7HLaN7y6CV0zkU4Z9vVE5iXkQYBzJozefe89h2s8/irAPfB4QXwWVXmAzNWt0jY8Fv
         62hJwBFFChgUPx83Wsfz4o64ciROMwKuNLa+3bctiBeHlWirKQmyDQv9Ha9z+OXvVW/S
         kgtKrI1KWjkIRC/yUOR/YvtmMk/XZgMngMU/lJ3BOYK0EWyuEBYKwe73YIVj2jV9Kneb
         198w==
X-Forwarded-Encrypted: i=1; AKwUvBydIxHQX/8j9IH50a/4wyKxv1+kr/Ux/EDggfkaoWm0q+tQTC/Omr1qDo+dhdODotiGr5I0YQm5j7YFZk9crrdx@lists.infradead.org
X-Gm-Message-State: AFq9FYKiyIE1hJuW240zrnLwTgvQqamt0etJ718kwl33MRNCgNImuHzt
	0rXKahGxOSl0vCwDQNMeOMLFokrL+lFYmStamB3kqhHqkGMyjiMv8ilRCrF/LeAc/sU=
X-Gm-Gg: AYBFou14dWu/2CbxmeM8PIT+/2euYZ81WV9A6+KSL4L6+sP3vgpn23LBN7PBpM/pQvD
	wOKEeB98PUPHEQ4CUKwn3j1+21PF8CgxDxmhdK7Ly5jWgeA39w+N/F3WYFxYH1xcyvDcjyVaDul
	ZW3sj3ZW1rtlJxen6zGtPsWLkJMPcpUtE48VA18WhjJs5dR2FNriPw41ksWmV2wBZq3NYoQ0KYW
	pvkLvKGp7dM3+XYWBF73IAS5yVNwfccKxMUILPhgP/OJG9/31BQyqlY28wh3HnQdDd/dKT+DtcP
	2n+VR2vKXu7z3WnU1bBUK6Qh2uwo80wqeOXaFRsoID2Ul4XQ5jFKHGI+OKCLkpPJdVRwdQjYsjv
	fxuRzqavGx/c4DGeYCFE2TRXfUfG34ms/U6n9mBWo9cpNtIbykEf3MoP4qsCjoTDmMsqjCnPVLb
	ehviDTFz56/Z8hNYod89dv5HTkCOsy7Jjrk8Mhro9XUYxJaNSO4U7Xy9IsUamgBVJDUu93DyZ1Y
	lO3ulnZcxZeoDNm4xY0KKm38UMAO3Eq42+yganOED5OOwQVqmuBU2B+qyg=
X-Received: by 2002:a17:90b:5109:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ada6c9d358mr1613182a91.33.1792689610544;
        Thu, 22 Oct 2026 10:20:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bcb45sm4942014a91.16.2026.10.22.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Message-ID: <atpFxtFoI7IUR9fS@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_102012_198462_602BECA8 
X-CRM114-Status: GOOD (  22.04  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please change every occurence of "hidden" with "implicit", here and throughout.

On Tue, Oct 20, 2026 at 12:50:20PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
> }
> 
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
> 
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
> 
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
> 
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
> 
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
> 
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Laurentiu Mihalcea (3):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>       arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
>  drivers/remoteproc/imx_rproc.c                     | 32 ++++++++-
>  5 files changed, 125 insertions(+), 33 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 

