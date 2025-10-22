Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1293DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4udklW7YBFZqhzfrGrA30C1K5al0Ehr8uBrCV+N+5I=; b=3Wx4OJ5nUrRKwfZTnVVZn2ri2G
	RGsa4Ex1OiEq+PqbgsbWhzTQu9IWK/CCS1OfqS5Roql4wKe3WJalmuu0SlFKfJ/L5vvAVwsCiZWMd
	USUltOioX/L8XvsienBcBQWSs05BncWHh4I6Kke33u9QP4TT87q/6ET6AdgA14Q3PgG2DFAbFlqEV
	sdSWb6x2VzKZl8RtaZ1/EBcBUmWPMCLRf2hSyjf2Jhg5QhyZPgSbAe5uZImj8peBSKLU4fYbaXnPt
	oQvJctXmKZ+aSFfxh/V7JHQcyDmcy08mJZaSoh/BwPvx0mD2f1alT+Lyn5DUG0WzD0TJzoSQaNYmf
	1hBS+oLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSNi-00000001fpK-0keO;
	Wed, 22 Oct 2025 06:31:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSNg-00000001fp3-39MJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 331506030D;
	Wed, 22 Oct 2025 06:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCEBC4CEE7;
	Wed, 22 Oct 2025 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761114691;
	bh=yn7iHw37wbzqcytch/NvZNH7Eur25QgbUSUmlbsIbMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwALxt1pgdU6zoZPDOf2lAkz/PILJ+A2gI20pNiQsuNyY5zr66DBosRt6hTwBziiE
	 crBoLGRHX7j8Mm2064nvlSFosRMxZYLqE7vqYkyg6nnE2ePBGG0tQzFb57Z6Gafqod
	 ZNNdejCZFc42MlrWfUs4Yp8kOpxfONGnma/bOIGLCqO9uIC1oxGB1ql0MxUZeoywue
	 7a8F5NGXMqWj9BOPwHg5QKQyoqDaHG8b1PhGEqYPCz9TKFJS5jpVeBHI3RRjRuo0Ck
	 6E2grmYy1Zsz3UfVZj4PfwOD3Aa9InGqb3lnsaxqhtLk1k2/9lDHLVwQChE2JSj+CD
	 RBXTnNwpL+Q1g==
Date: Wed, 22 Oct 2025 08:31:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: power: samsung: add google,gs101-pd
Message-ID: <20251022-impartial-optimal-grasshopper-d1f392@kuoka>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-1-7b30797396e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251016-gs101-pd-v3-1-7b30797396e7@linaro.org>
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

On Thu, Oct 16, 2025 at 04:58:34PM +0100, Andr=C3=A9 Draszik wrote:
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed.
>=20
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


