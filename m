Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07372606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L0acUUJy;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=srnfxztL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=; b=L0acUUJyVBsMxj3LoGHCd/J4R+
	atoCfAPcMhUkkn262+n2rAZBRIP9A1yeTOmB/OtyzTcYm2np1rRP230mC7B0aAyJN207LSGlCyfWU
	iBHLB6XpefkS+VIoyX6VH7CMOtSwKjYESb1/WfdPxjnu2Q8W7M0eyYsgEm/7fybiSEk/29/NXxqkX
	rMxjZXyoXBagx/x1lf7y0UND+XjVTWDyHIbbK3L+MrEz1m+MjbkaQjkh1rECEqAcUFwvhKICp9kDX
	3HfWkyU2OyNGHtJYiliMjPbaYGMtvite0ij78IxQHfre+7iKsk1/4iAkoffuFud4TfcppI0XrU4Q6
	aJuvLkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJBr-0000000GjQu-1XeB;
	Fri, 23 Oct 2026 17:36:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJBl-0000000GjQO-2agy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:36:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b40fc523faso1142208a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 10:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776979; cv=none;
        d=google.com; s=arc-20260327;
        b=U/bHQBwvhX5cMWlOeXqUqfPLN65z72DXT/ePTX6nVrYeDwZ/vmMF3kNVklowxb4nZA
         Q3c8arcbLE/C+Xw5sOxvyljtYXy73hzzEHTFoY+bci2jMb/tIjgd+1YfRWw0Yg681CAN
         UQTB5hJQHWU9DOoV0ClXDSS+tzb62hYz6BP/vRtxDIW44vISfWXBqPWp4sH64djMnsyL
         O6RPbHWr3THxzwFUKgKtWhfoC5Et2UpgDBi5zLR3sNNZlK7rac6Ci8USBiZ50ncAEuuO
         BR/PDwTvRNmr0K6bwT6Zg3wZzG+W+bkXW+jTrCh7W7tVCC3A5jv7wUdeayaxrIm5k/EV
         FjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        fh=l4EzfDnc63tqssxsqxqQ7QiD2i0jIrfpZwUOEDuHZbI=;
        b=JJT5xi4ACiPP+HyOyPFP1i4jk6Po1Ve8rl/pOepl/nniOykLrcTa6Pcx+NuOGqMhWB
         0mrghspMF5fIAE/kL/BfzzK58Er0PtrEsOyL2IpJ+Nns+nJhbwTYhgUn0RnhNKy3mgIB
         WY04QwgCW2W/94Cqwh2DDtMLK779FpVaBnij3MjcjnAY6YU+C/6rJmdKBwNRB3QJz4xz
         +4rEzQBHsRSeLVoRpXdQV+mstsVveTrdKzgxrtEpS5pHu3kuSS9CMqRDMce3xQxZdnWD
         RPw1rkllJsxdHqezs/N6tNfupf+IxITchQHuhOqgBlmju3C3Oil/+h16ibVky0vj7lYA
         /ZqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792776979; x=1793381779; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=srnfxztL4Nj0AdzkSviPaXDPRtDTCXpN/wWxtINA4/TGvsWTsNQs+rmvIWO0lSWQGQ
         JIQlbkehlO3m0lpU/0TnM26yrSY5HxuwZdgJKIkuudbKRadXI7jJC+312sat1y6dvukl
         1TIx+YFUdRAlkEGKFaQDCvmAjr8AjucfB1mYdXTZ95L6MgJgKPmU8ndJsNxa3gGJEOyP
         nezxF1d8n3J4QseMkvCpg1EzRzaEX8T138/MIl77dcyKU+9v5gY1R3l6nL5JROGsm0Lr
         7Z4AQlajNMM8KiOaS1tD071t/gfPYWmcQ4A656JnFw5CNwAbU1uJpDjMP9866pGgJkYT
         RnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776979; x=1793381779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=gSuCJylWL+IGpcaivgPxfhcI4jkq3zFktqQl/cF4kynJbhidjmXhFwX+OnmNJ+aAGa
         +IPy1l5XJOCv+4kb2J2RsQ+Xm71l/BLh1Xul376zCZ+r3VTfqSVB2Ph2HeFldIJB9A6p
         PzSVGEv128XquS1iTyVlDBk27qMWXwu9++GI4qsD5+oudehbDVD4n6oDyi2ngBDNLwKV
         Q6iY5x/K2D3iVPAw1SC15P3boGa+01pQHNjjVFJaUNRTcTPH1kcMZbzj7drnlA097U1G
         MU2mQZI88bNtRoRsNRpBrndWX/fKrbJLK9YQgyMq8/KHrVdGJCEGoriXUoSNCDU8S3gW
         G/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBySZY0SCbaf6Xni6qEbgf8O1lWcMCr81zuTvkPid3hreZVle9VbWuTIk0tlr0+CqTruM6k1eqsGYNilxZ/BCDMI@lists.infradead.org
X-Gm-Message-State: AFq9FYIBV8JHPcjszGhMbXTD+PmFdb82voYXwSIVthzlCxoJueve5hKT
	SUbyZNI9jNNBUF+O/pWu9vYM3zDFgWwprGTTdNyb2eYC1tQXppDuxL152Y1dHUEqxmC8pEPWlo6
	hzsTAWEZUwQF4GQJZD1MwQnJyli6yOIopA2zJjFQtcEem/GA4J0J/
X-Gm-Gg: AYBFou1SqLB56/5pNuvhBlUuSoR0K4OyU3NQhBzsikbUcmD5qfNumgN7+iSoHXiNoPg
	GRrUux3VCmUA8N4PZsDRni6ZvNB1sEYYwwDGEXV0CENCunMG1/tjJ87vtyQHJs+G87NUFMbhSOu
	x9Btal09pkPelVndTaug98gecVaNJgVId6AmUTuVXcJFKvXM/AulPA+yo01I1NXQPC+boZcPDnm
	ViqywsWY705cq9ggXt/zTgEomq37ExZqJohv1ihFbc1I7OMNBC/VvplHGgLOrBj50peXBj0Zc83
	1F6m5KhxhUcDSaBfMheaCRVbYm6pGTA6GMfuuuKOeYUi+/jb6Wce6AyiA3+wiph2yV+Fv7BMh5q
	wSzClnuouYAs/a7sIv3ihqBwDC38W5gaYkYKWDhod7azYMqLEnL6hX8SaQO1Wy/o1ZRBYZeA=
X-Received: by 2002:a17:906:f595:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c46a8fd5c3amr423797666b.14.1792776978822; Fri, 23 Oct 2026
 10:36:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 23 Oct 2026 11:36:06 -0600
X-Gm-Features: AclHuK9m_F_bGO076TSrsT-kULx7SuWcQOcLAgoXUR-ZcTiSb4Ix0VHIuC5OZJE
Message-ID: <CANLsYkwTaeuoKWvCuK-4ctLa9n+7xCJe_yo_E9mDZL8ddY83DQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Francesco Valla <francesco@valla.it>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_103621_706908_1E11FF84 
X-CRM114-Status: GOOD (  22.38  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 at 13:05, <Frank.Li@oss.nxp.com> wrote:
>
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
>
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {       ret  = <0x90000000>;
>         no-map;
> }
>
> m4 {
>         ...
>         memory-region = <&rsc_table>;
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
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
>

You have ignored my comment from [PATCH v7 0/3] so I'm ignoring your patchset.

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
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

