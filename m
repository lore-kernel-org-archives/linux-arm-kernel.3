Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D2606A909
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wffSF1la;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zW/sSDZW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=; b=wffSF1labQl7/qstoCwItufxFm
	pH2we9qBrl0ND6dwcIlZaR7Pl/+jPUh1jq+5AETjtb64vWtvRLqQ4RXQo3TKW2VH3wR2JZ4Zg2ZaE
	7qSb5JcCEhJ2fw+VrUJDvPWpHtRripyOTqobS9BJ3OPbCJHbGHcKM9j9rLWHLzXe2wSwHy40zXGm4
	5D3jJnE7J6ofSIT4s8oXZ5my6KcPyyH/6K97MOMHuLL+/xkwPViepRkI+9PdhbdwW5ySf2VTU4qJP
	sEew8G7ZdaDeRKKq+sSzZrvSUTv8DfSTomLdZSKx/PW7tv+Y/aYn4WWWmpuIRkVymvjQ6aKGo5Dak
	7u9WhmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwMn-0000000HYFN-1oHP;
	Mon, 02 Nov 2026 18:02:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwMk-0000000HYEO-1YDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:02:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1599698a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793642561; x=1794247361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
        b=zW/sSDZWBeLgqv7YiMbsoWn7ClOfEpbxtaiNy3nwu3HARk+5y4e+pjWysDxe7IE99w
         swK1sezU1k9gU3LfX+8Ci2+22ZOC/lsXMRg0S8l7028w024YUsy1LYAwEHB5DNFBpXi2
         J8UY+9CPZ0aNgiYHuPdQu9hC7HJwbcCNvW5PVCdUeUFFaDe7GckLSPKlfizaQIUWVYLQ
         uElODxQYW7Ilbs4wEwEmCt5CikBDWNbaaJqLEO+gqpw6W8evzhWVMwic7fbZSI9f/ZzO
         4FJdlsDUUVZsjh5ybuJGN4SbeEjtSqOT6kqxVEvs4WS6lmDDwH0XNTAIOZsIxkB35itK
         gG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642561; x=1794247361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
        b=Uq+ENyXh1lkTF/l6OT6ElgXyOvAuaV3ip0XhqOakwqDzGqdCG37tpEM8UckIaJbCLc
         wIUCsu3lbdB2mGyLQQF0TXsVG3N6kQ+2euEyxFQtkI2H9XCZiFuIzKr+rXg7vpNb28qv
         iP4WPdVz+q4f1IxO6276HMqZeDbUQgilqn6yz6LenAv5WqJ7aDjV6X3MmUnfXD5+X5gZ
         Qbfn5DzM7PcTCibovzZs028LQwrJe32mETVc5Arb4n2FxvpBRAqFnIynxr4EufvYGF+x
         FmaByxFSqn+yHXCmp2Gnvk7l7kwwMbCUCwFaiItR0e8jpZcO9crPyq91o7QTge+fSSsX
         BREA==
X-Forwarded-Encrypted: i=1; AKwUvBx5JTyXtv2NUyrX0DvfB90MDwJP9McFyDQXbDdPlHO4gFnTf1GTlKPwevpY5ZUgQuWVxqNeas3A9rU+3TFKJphv@lists.infradead.org
X-Gm-Message-State: APuU4Z/Tn3xleGk27Gmo+/cCIbrvCupggXAD8qzCgSrgVYw+aOGpN760
	DR37BLBY54RM8C+noFEc2xnVQ4RNkYKO5vM4p9T9muTtKoLTRWo9QM31w9viG3zrpd4=
X-Gm-Gg: AYBFou0h8BPjNkpefz04uw9rv+Cqr6YuFADBzoSVdO92U0Qf1wvTNAvLOrtB8eGR1vG
	BgG1O3l6JGdjHqWhBMztgzio71fA9wCdG+1yjY44BhFBAGNrHCkuizfGFYi9nMKbkW3XIZs5562
	YW5425cGcRpp1n3gm44H2axI2pj5qWi11fFSmtIXfFetbm0qx5UdmCxJEli6dybsd84vfiBX0fw
	+xF4/QAmxq7oMi4/Tovf5olCjEafVY4XFTQwCPpgrKSL595gpQItrHpcwONWmziw2v3FIBg5q7m
	7KN5qTkh//p0vqtMyE/HexswakZkE6ZMXkt2s6J3Td7pMIwTtc1aldht8k/57peO1upvSb/Nh5W
	kSJMavx8nf9n3fMuRxfnETujh7/vWdNeONHjaTF4j4QtMnE4ZYGbsMAh6M8ldPWefafuQ2H44E8
	eVxEmql56XAEq6S62DW0IbYS6QFZWTh+FBMRymm3B0Rtcjq/8pb9YB9LGjjlzlpFVAhfu1vXR5m
	fpaNniFK64hboKLRbEXHFswcFLEjLTFG1U4TbAsWW0j3XLEXgQqLCH235XuSH+iINoLBlHzVbBJ
	/jftFPp3j1nFwfoQYPO+e2BX9wl5Ceo=
X-Received: by 2002:a17:90b:53c7:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ae89559e5emr5539384a91.5.1793642558875;
        Mon, 02 Nov 2026 10:02:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm8969537a91.1.2026.11.02.10.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:02:38 -0800 (PST)
Date: Mon, 2 Nov 2026 12:02:35 -0600
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
Message-ID: <aujQO2gXhYx8NTwK@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_100242_420547_C5B58CAF 
X-CRM114-Status: GOOD (  22.68  )
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

Applied.

Thanks,
Mathieu
 
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

