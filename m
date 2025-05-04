Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky+VW5si2K38VKBjM1cmUQOssCIftjxBmVP9lq5/l3w=; b=WP7p/awuPMFNNLxBmO3SUUMCkM
	55/Cr8LijCUv8ZuApHsmHTRoZVckCOzr6BOZgb7zJ5HIwBaGu1cL22e557ZdUmqgk1RVndjl/q2wF
	I3SSQbey7L1xoG8F1pv9WqCq9IKBU1F5GWDTolYjtakrkOv662+hQyHGW1MzHqkLLNx7W2FLx+dA4
	4prkZEhNmEQBjxJqpToNLynsY1/7IMNdVHPlpjv/kn7n7l9cp6VdRdzQ1TamBPqGHlfAyFNrn/YXO
	w5cgc8QbII4WtEKgawZm41s+DpTE2ZjxSURkkyqDgcAxxV6Z2yiwaBpR9lGQiDlrU5+3VKSCZtHSf
	nzzZ20BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd2M-00000005iHQ-0VvM;
	Sun, 04 May 2025 17:21:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBczB-00000005hy7-0HUz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFC2A5C541D;
	Sun,  4 May 2025 17:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCEBC4CEE7;
	Sun,  4 May 2025 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746379120;
	bh=ow67rl+I81AZmU/AbwWdAgXncW9WG2OxGDTYKSRV0SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZVJj48JcWEVDod/zwAnCXaGLX7Fa4O0OJ2NrK46tb/vrDCmldTX3YjiXDN6B2NJH
	 mp9hBM/EeOvUqyFSjjYQ/4s80JnVQ/AUF9+l4ZP/rARTTv57yOoGE56Ea7mhQ6OgSR
	 jSf4hj8R/zNkGpahF2JEFFlE9JoELzfKHg2YA2sReooOntc+AK10LeuYUwzZ4NIrbr
	 iY0GmuDKVhDGhMv+Gmlj6kj5v84RhQuzYzcXEUGtoBl+I1wVC7H6GaDVoyonS9q6Rj
	 dsN2qXN7ztxhhT09dOcegWpAMY61HYTpjD4A5ZhjIgA1uXr+eq7SMJ4wzq21N/fV4C
	 B7ErSixZpcFjQ==
Date: Sun, 4 May 2025 19:18:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwinfo: Add VIA/WonderMedia SoC
 identification
Message-ID: <20250504-hallowed-muscular-gopher-f07547@kuoka>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_101841_150523_DDE16F08 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

On Sat, May 03, 2025 at 03:52:31PM GMT, Alexey Charkov wrote:
> VIA/WonderMedia SoC's have a chip ID register inside their system
> configuration controller space, which can be used to identify
> appropriate hardware quirks at runtime. Add binding for it.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


