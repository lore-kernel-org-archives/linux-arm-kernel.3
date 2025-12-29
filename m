Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FBEE94100
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNgYyCpMJvlkYiYRHVv/wF9yJ0tD4sV2bfJTpVnFanA=; b=t2fs3H0p/VJhPHRHb4yQYr7m+f
	MjQKsA2UHHttKfcrLJBLN0XzMeEPsQu/LBMFxnoSqM1jx2deuMTAoh666cUHUV/DHjQOTAR0L7cpk
	0Akt2G/YcEBAMXAc6aZvSSMhsgNzw1Icn+0+JAl8gNBdI3hrhkLnCghqaxmGCZn8wpes1eF5C6FGj
	qYgL99wKsjdQJxY3j6fMnDayCE8PGgrlISTTdQ5djWQ4O+eQgRzqdNvqCGFXNhhdQhKIbMY/qPztC
	YwlGGJQy6cW+2Sggi5uX87l9rZxfEShFLz88EfI73nVBgMiAKiZLuebnjUi22aIxycOfZlkUhvTKG
	n9jK7s8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMtA-000000049i6-1Mie;
	Mon, 29 Dec 2025 23:43:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMt8-000000049hr-0pTn;
	Mon, 29 Dec 2025 23:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6637160010;
	Mon, 29 Dec 2025 23:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1396C4CEF7;
	Mon, 29 Dec 2025 23:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767051777;
	bh=TVTtzPN7iGU0L+GxB2qxYDseMAg9L/Mo6+0/69YF7QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaAU3kYonyLKqBlk2yQcvrsXmXBRDXwlss3iMtl/g/bdjc2V4TprMqHIdbAf4cCnf
	 rfDpukakTcAxhSYh8aejRjjr+tkCWIk66WYwTzXlvQDELDvKoUlzP6iFQawWIR+0fS
	 X6urplCS5qqQegmBAwbVRSEHRiynt++7B8HFtVUd89DUMv/gpml8Ar+BI/lfoF4yi4
	 KHLXOkPwGfDFSg16lG4pppm7t6lf0Qa8oc+Ff5FABaQOWW+UGSbLxA5Mwg4wG3T07J
	 ZEv7Hj5PMoyqZ9LJ1a+hGu6XNBSvaqQDeyipWGQt4ozT8VZ5nq41TDKGkvI7q1nNg6
	 /9S1jkrAMEq1A==
Date: Mon, 29 Dec 2025 17:42:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mediatek: Drop inactive MandyJH Liu
Message-ID: <176705177359.2804367.15136995230648619621.robh@kernel.org>
References: <20251219074035.13001-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219074035.13001-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Fri, 19 Dec 2025 08:40:36 +0100, Krzysztof Kozlowski wrote:
> There are no emails from MandyJH Liu, no reviews [1] of these bindings, so
> clearly no maintenance is happening here.  Switch to Mediatek SoC
> maintainers.
> 
> Cc: MandyJH Liu <mandyjh.liu@mediatek.com>
> Link: https://lore.kernel.org/all/?q=f%3Amandyjh.liu%40mediatek.com [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml        | 3 ++-
>  .../devicetree/bindings/power/mediatek,power-controller.yaml   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 

Applied, thanks!


