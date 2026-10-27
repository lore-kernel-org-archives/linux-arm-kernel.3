Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2394606E6F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UJoeKqjt;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SBS8Xs3Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=; b=UJoeKqjtlHEvJ03VBO0cU/tFW/
	PVJkxuBnQ8dntN7Td+l3t3ee1WCI/33gNqtVXTlIrzo2bcJJd/q4HmAHGt1K/7vaZPxfp55h6+nNH
	Qy4LSG0u0BILTX2L6HeVdg299JfFa5dVOEaVPwPtcI8V9ZpvM8Podlg4fWh7z/90ASRWpg9toouEf
	rdbYD+07K2wpCIIOp2IklU7ayCL/upS9EZUEyW03EpFKgDaRVKNcmvnn7ZEl8coXwNzF4bLfX4gdB
	hNhrXV3xyMlmbb1tVQPMvM0tMCFZqxlHKZCTM9JiPJ1zLLEp+sXe3Gp1+RcmkDv5h4k52Z7crCIe9
	pyK5N6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjRo-00000005H1z-2hI3;
	Tue, 27 Oct 2026 15:50:48 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjRm-00000005H1K-1z6h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:50:48 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so58929a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116244; x=1793721044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=SBS8Xs3Z8LVQhixr5k+zGH5kU7eP6L627KSyUzwiLNoAFwFdM31O1tJr+aYsYAdQgw
         NTRjfRo0zgjylHzB+5GaEW9WK7YCE9Z8BSVvJ2n2ZMWMpTflrwrLViL9xU0bWu7R2XWB
         VcC0IzuUuTHml2/8cSAiN6uOfm9JaTnFjLpvqf2Nr+mNCLnU07B8BTi+6mbGVYN3G4V0
         PNUkpjxPijdWm2845gkY+tbJqS3QH/zXT95W4ir8vH/XX+l2qY9Ara0L9tm1UZDpsRXF
         bXz4D0GuddTJzeOZvS7FCAgcxFtv0Zpil3qoF0X3fu543L+QKpANvJ4u7LJKoSLsm24K
         kMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116244; x=1793721044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=PhAMM9Y8XhhoqGAODxbQ1jgfgEZCmA+8rFIVC8ixMlHhxav/XP+O5yqjoJduLKKfnq
         sICFjN4scQsHDACDvUuZWYdQk9GQoScScMbVmjji1rpYz4KCwsu81PuU7ruuowFXMop4
         kfe4/H4yOWWBo30kSq5MGXnhQ9xKHE7eGXndbfp4qvxsG20/ediYmbklwU04BH6wHbMr
         al8JS50+vC8rHSvgbecb3yH7xMUZZhn3Awk1kaqtcduynKk/7ajIvy9rTUM8ivGaIOO1
         2Ev5V4zvHgfGAc9WvmzyXq1qrXZcyjstg8fdyfi/dI5+Timm+X2XEFHLFhZ8aFlKc99T
         Y6PA==
X-Forwarded-Encrypted: i=1; AKwUvBxU6M3cQIpf4RCCGkRnVJCo1yyWdoU3X3nchfaXLBUfTikhNFX4XAu2dEHOB2z18f0tmtMuzSFEM1Lx4Okwz98P@lists.infradead.org
X-Gm-Message-State: AFq9FYIClnIwrk9N8HJOvBOYNMVULqZAHFGx5EfFQdHv2iTuSnE0iFb1
	MKEpkuabf8C/n4bdjGhLrcCkCSq0KJED8eNqehzG50RqzmL3Qm5/OkXek3CpGg5VY/g=
X-Gm-Gg: AYBFou3Kl4wflb7kTFJFIB/posjQ0g3vlguB91kR0Yr+vrMEH26k4SzSumeqHCYVDGl
	xdlvU68TfQA3/qyPlMAR4zMkoomfgXZAUws6EZwX1tXsjebAS9BrDZmYeHknCyKcx0le5tg6O2H
	X1rrl3VrLg2fHNlTugqwrrCRB81i1dVoEjxuA3fr1Xx9NyTbUKFmIGMY2YJqe/uRKCCUBAlJv6T
	CkjrBp4N2g4WYCQG1E2OlTXSCGk9M/5b4Bcfx1dvVJt+q0A2H3RzwXRBfgmHrgrg+PscKYvaIZG
	6RTmVWAW01HIZIO025s9qKY+TZF3Wn0e9/N+0mUGML+U+Zr7oP6H5wY52e0bw0tCYfqmDHtExdz
	74G+dpCkf22jxG5WJ7K8GO5gNCiQwC9HfN/0x2+8ttVANdLIgnw6hBaV9MEsbgeDp1qzN1GjmOo
	bZqD+AdyPHB+DVj7moO7LEjBckd3fPZEvXoIaVroS+pGsovHABydtb4hlVc//2hIEbn8EHZfuR4
	3l0Fkm+QRIsV/j23cB+mCQgJLJm92u0vyY9rzGjTkei5cAXCeKiQCR3cuo=
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr6742323637.68.1793116244485;
        Tue, 27 Oct 2026 08:50:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2943517a12.16.2026.10.27.08.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:50:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:41 -0600
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
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Message-ID: <auDIUf6Vx3VdeXcz@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_085046_548063_F0FB1369 
X-CRM114-Status: GOOD (  21.81  )
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

I will apply this patchset when 7.4-rc1 comes out.

Thanks,
Mathieu

On Fri, Oct 23, 2026 at 03:52:48PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a implicit DT ABI.
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
> Changes in v9:
> - s/hidden/implicit/g, sorry, missed at v8
> - Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com
> 
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
> 
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
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI
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

