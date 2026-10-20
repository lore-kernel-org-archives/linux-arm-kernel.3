Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hxX0tH1Q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=lcmzmVQw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Lu1GRVPG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=hxX0tH1QLAcDVvqk1NJgJrHbmR
	WnQ00MdwEMxYm41fiwvIc//ZctHpJyFt5sOuMKmsP0jo00icXaX9hn7rIvScm/e4A4ruX+0yh4TWm
	qP6Lm8JzUaidEb1M9mhvtq288CYipScCantWuQ6O6Wuxbss+uoNA4PPZlfuzFtv4NqwzijKcYzgVF
	SA/ZFM9L6RoNPjxmct4wtWz7fpaRQCLKXoQ+EQHLtfu9iwbK53q+6LX+c4ZrPqPzqmKW0MDoCnVKb
	TAlAwLtpo+pmVnK3R9T1j4rt9zKBwAeTuPyB+MDoBgkwQrc4hKfnyne8RYKwgHL9J71QXvDDMklyK
	RL/nyiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ36f-00000008ugz-2nbE;
	Tue, 20 Oct 2026 06:13:53 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ36c-00000008ug4-1hip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:13:52 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4z7z.prod.antispam.mailspamprotection.com; s=arckey; t=1792476830;
	 b=rNMTOFq/c4IplGWOwAV4HAcmYP8EnHSon0xR76cQl6FLKPo76GdQLgBI7uhJXziKnZCqWRGp6k
	  B3Q453XD2W2MAu6l5A5TBTvnSkSj3UlsIChFobjyGidGP9ZWJ9gjfp97xfmST0GSjkQKJuXucK
	  2jpe3L1ZRvbvKhS4RgpJZdW/F2Js/my5IcIdAwlCzPUx0LsyR3skbGTMIRMc6CvlwuElhGXLLn
	  3/M+l5xaBxna0CV+7ogh181PGNLK7YNVfDXeRZOOD7GVI9a22QlGIUaIfFRcL77LRnMCvuyYPO
	  rVTnHmR3yN+mKt2s6gv4ovmvVbFjODNMqjS1eHukez38AA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4z7z.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4z7z.prod.antispam.mailspamprotection.com; s=arckey; t=1792476830;
	bh=BLyVi9noksr977RBj4Cms4tPuxnqjRaYZqn2pFov1I8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=c4xqAEYWo3LPIU1LOi2fn09wD0lc6yNQmryV9Doi6eS8temAV47JJUWRzUVpIFDlRVviOw4yIW
	  /Yb+rJI8w2Or1MeFq4WLLFyy/cxMRkYba671hpgbnoguUlPLcBd0yq31yOGFl1Cdr/05ZHeQHq
	  hMshU5r0GrO8Yj/Q5Day40OJXaq+tDv0tlCNvfCweaBNLfNQWe0ouLWzwBJIUpvkv0G8NbutDG
	  SIifESV5FdkE8fD3UNbwjmhbH6Or6Pst0E3TgrTLi7MRkOKMEJFH2w9jjzFc10E7DI+ZjLCyTk
	  ED087/uaBUrx7LwtcMGbR/9L8ouT2KA2nICHLWvJ0NeVZA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=lcmzmVQwVLscHU+F5FlV+nJXPO
	QR1vHMgG4dKX21oeHfhGY6/yQs3Mz0y2rRHCY+AqgGOKeXyV6cF+VpuwkwgLQFc6QEHdHCq6v5QBZ
	aus5idaweab76h+LSLh63xXigdoIF+kyRhqZM28A0cl7OodT0YSOfGa500OifUOyAd5g=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4z7z.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xJ36L-00000001afV-08Iz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=Lu1GRVPGNdmlqmsYH5zsLHzoUD
	w9j7LpHN9aAToa+3AdoDIDlTFJZuelB/VAauhlvvjFMElg6G+qCBXQO/Zf3+sPVC9QqpJ7g85SQWQ
	4xkAWIvKObsXe0uveYUhD1ZKj7JBvyjSPOIkiRw1J3crjBYNmE99zI+w5opamT2rKI3g=;
Received: from [82.89.62.246] (port=60683 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xJ360-00000000CBU-2RNP;
	Tue, 20 Oct 2026 06:13:12 +0000
Date: Tue, 20 Oct 2026 08:13:10 +0200
From: Francesco Valla <francesco@valla.it>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atcF6uQh0LE1UzNG@bywater>
References: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
 <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0c3d9daaa77ebffc59af951605f15325
X-AntiAbuse: ID - 0c3d9daaa77ebffc59af951605f15325
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xJ36L-00000001afV-08Iz-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4z7z.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_231350_881030_611325D0 
X-CRM114-Status: GOOD (  22.18  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurentiu,

On Mon, Oct 19, 2026 at 02:55:49PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..714c3615d1884 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -28,6 +28,25 @@
>  #include "imx_rproc.h"
>  #include "remoteproc_internal.h"
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +

The position of this code here seems wrong - please move it down in this
same file, near the other functions.

With that fixed:

  Reviewed-by: Francesco Valla <francesco@valla.it>

>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
>  #define IMX7D_SW_M4P_RST		BIT(2)
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 
>

Thank you!

Regards,
Francesco


