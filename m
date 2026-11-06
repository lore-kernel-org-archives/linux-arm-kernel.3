Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3E6606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iW2MIDGB;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KXGSaWym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FGh/a8NZBJfp8mFK/MC4MYiJPVVpSd8mLxLJrAV0sTg=; b=iW2MIDGBsKtrRN
	CLtdtFN8xpFFu0+NHvColfDg41qIfnkJrCxaKtllPg88st7hIBEhMmNkBg+Akafuui6tgGkQCVtEg
	cyQjpHn6Ait1BJtKaDEaVsZgzTl/Z11Q9P11stC5Bvd9Rqqm8UWw09G7zYwEtMN15UiTHAa7S1pDv
	N12M+HFOtPaLpMlrL5lgpqGFxXkTrpcvdFEcUYGMHu4wkWG1J1pBjO1RMWKE4plZHl0dNkKoAK33x
	XzUCB3gO3xGPh5MbjsRm+wLH7dn38/dyh52a2tozrL3bG4qoXVYQYdsd6pqXn/2Yia56YClJEQUlV
	XTXAsiKBcBRbj2vPj/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK05-0000000CQv9-2AXA;
	Fri, 06 Nov 2026 13:29:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK00-0000000CQt7-2O1x;
	Fri, 06 Nov 2026 13:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793971733;
	bh=Zbw4Pdi7/7yO5hBdNSUYXrfRS7EY1BsSPUefMzufvO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KXGSaWymhy7vDq1ttAqgN//6MlUzMkvBRQ9TGNFIUu8N8bF+aJhjxYkcOykxTASZe
	 dXjkFbsSyC3pB9bg00QGoDlehTyzk3MX/feiNb1UzSi6jB1kqnL2pTh4a/tj+vagM/
	 aq+wt5I3zRIPZ19jauH2NmtFHgxwxCE9Emf1r6LB6VFX5bwBQ85fngNYVHBuWdHoY2
	 QgOCY+AuyzqjASUSPVIU5ieCo+n0iZNrXJ+S0XPNnBs/J5YrlV04UshV1yIojc9sae
	 +zUBMzi2QNTupSQXfzy8eYXJ8skF+ZKYIkK4O/F+Sxsqd9aAzuCN4uGzLfKzJtawXh
	 u6eNZJHg/RJOw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA49317E031D;
	Fri, 06 Nov 2026 14:28:52 +0100 (CET)
Message-ID: <a22410c8-7ee3-473c-aa8e-9c71c8555bda@collabora.com>
Date: Fri, 6 Nov 2026 14:28:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: Validate gamma_lut size
To: Fei Shao <fshao@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20261106103932.1219696-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261106103932.1219696-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_052856_777293_46AE740D 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 11:39, Fei Shao wrote:
> The DRM core checks that a gamma_lut blob is aligned to
> sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
> shorter blobs still reach the driver. mtk_aal_gamma_set() and
> mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
> read when the blob is shorter.
> 
> Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
> not match crtc->gamma_size.
> 
> Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


