Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2550CE67A6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtxoukHEIkhZVVL9rpnOwDMkwNFJFsk/7JwREu+NQQ8=; b=128IzCgi+HE9ZaKFfJ86p+JqCP
	m6d4M7A5tR0q4N5RLm+YP8x0jBMKmgDc/iSInu8Irl/fLByYDavOz/p3vwcbi6uvHUPZEsZErcsWv
	z+X5nM/NBIZFw9nZNJiMaDcgW5CT18X932XgeCE5AJrCD1tgOoe9Fxqu7tNyZBBkmDcnN/93MrpGa
	KczhNvPlqsHCoDtakGG00V58E8qUTdhjoCNhrcGdq3ByIy2E12zvxCZb4Pd2KpMpSpEqwA22TxGKA
	ABOhxlssgVRG7AKC7Ev7Yxo6Y6Feo8JwaOsx2+l5NuTGT5lr5VdrW27qTUDQ+wBNPrrhMnw/I/Ik5
	4EKg3KHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJG6-0000000EcGc-42lD;
	Tue, 03 Mar 2026 06:29:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJG5-0000000EcG5-3WWH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 06:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37841600AE;
	Tue,  3 Mar 2026 06:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEB5C116C6;
	Tue,  3 Mar 2026 06:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772519368;
	bh=5abjydbR2o2kDpt9qy1QsvIxQSJuSadiUkyd9a52o1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNs+Wm1pc5cSQBhGTmMJeP7pavfldunco2Aih3N+eGceVA3U7npiyV81leybAN0GU
	 MCLVi9Mdbhqg7nhK2E4ZXakJHzzWnkxaVXhSv7fZYjA6U//gvxFbm5xU3eYWcuy/Ea
	 ebpFgoBfDii/MFIzDDelqTh94svGWkfFdX11J+qc7GzmHnIrBei+vyZfg2v4dzT2SI
	 ZtkllWYg988D+4Ql+ejikRJ7wc1fqWnAv2DAWcZGFryzdtinPLSBv7/fGeFKfN8tLi
	 brK7KPVSPjs1p5z4bTkx5AF46Iks3eRt1p0ZprZECqptsTzL9mMUm1TmRVpZTEKXS5
	 v8r6RLOdLwVYw==
Date: Tue, 3 Mar 2026 07:29:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, peter.chen@cixtech.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v10 1/3] dt-bindings: soc: cix: document the syscon on
 Sky1 SoC
Message-ID: <20260303-blond-oriole-from-jupiter-f1ab6e@quoll>
References: <20260302064407.1914014-1-gary.yang@cixtech.com>
 <20260302064407.1914014-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302064407.1914014-2-gary.yang@cixtech.com>
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

On Mon, Mar 02, 2026 at 02:44:05PM +0800, Gary Yang wrote:
> There are two system control on Cix sky1 Soc. One is located in S0 domain,
> and the other is located in S5 domain. The system control contains resets,
> usb typeC and more. At this point, only the reset controller is embedded
> as usb typeC uses it by phandle.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      |  42 +++++
>  .../reset/cix,sky1-s5-system-control.h        | 163 ++++++++++++++++++
>  .../reset/cix,sky1-system-control.h           |  41 +++++
>  3 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-s5-system-control.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-system-control.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


