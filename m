Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C6CCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB0Ang0gzGA1pUc4qPtxsUwqv+sxhCltRPOjm5oPndg=; b=s7P3I43a2qbk1H7nJueCDbcKpb
	Jd1Wv8BQvjc7pJ577Ih5wD+hWS8A5P7jpAWjJKXFyyCw35NKhosyARwJa8MttIKtMz64qfSHEPHsS
	nOMo3bzXYoUdkfTDgMgnmsJ05pYghRGQObYud/EBJxxJHji0QGwduNMSRBPcAqr+g9Ohhga0BJRnS
	55t6qBst+xwMPEKEVE9hhP85tZHYtQ/FwsGz0uh/kyU0DQIwkV6oi8a1VAp+f/urQMcY3d/tgO1B4
	CJrrZ+HsJdDWEOP1XqnjKuKpZ2FlJ/uKGkZq+hQooE3yR+YljXMcH0aDQFEdRr5UYNzfZRlNMV5Fc
	JEc1KkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ifD-0000000ArAq-2w0Q;
	Mon, 22 Sep 2025 15:41:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ifD-0000000ArA8-0olH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FDC46020A;
	Mon, 22 Sep 2025 15:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27802C4CEF0;
	Mon, 22 Sep 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555672;
	bh=NjOxxgw2G2HtP4z+tFDKo3O2KiZzVADLJNb1vGrq+zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VA2s+MDPsMa5SPyJHe17nMnOt1oqosfBHM2Zc/RjmVhCT+8m7O9M/44hd6Uym2dtK
	 xsrVfRYPjd7ETzCCuujgOcZY62Ei5RkUfXID33hB51OaEaQd/U2xigL+re67jqY5g/
	 GLMI4kDmC8YRrB5n3iy9XokE8t808gGMguGw6li+ktkarZQV7sODbVge0nEcS6h4sy
	 mCNgZDr7807xW+HxT0Z0VlH2OEszwlP1WT5XrzQi/LFJ/2yVwRWWbtpdN9ZqnTwLPv
	 BsXhziJ7B/DECiizElwS3BHXOx7BGMu+NAuN5aj0VRXpim4cM0TG3Y4+Jc+zl9+3Wr
	 t4CxkqVKK13CA==
Date: Mon, 22 Sep 2025 10:41:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: samsung: document herolte board
 binding
Message-ID: <175855567004.25808.182745298436415730.robh@kernel.org>
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914150321.2632019-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914150321.2632019-2-ivo.ivanov.ivanov1@gmail.com>
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


On Sun, 14 Sep 2025 18:03:19 +0300, Ivaylo Ivanov wrote:
> Add binding for the Samsung Galaxy S7 (SM-G930F) board, codenamed
> herolte, which is based on the Samsung exynos8890 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


