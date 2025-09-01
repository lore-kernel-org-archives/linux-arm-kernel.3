Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2E4CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7K1rzNClsSWjPA/2Rv+TLKkFQyOQBMZz6S1mf81oZU=; b=O5HQqO3fiRy145ZMwuoJLlQTth
	/EL2HL6TWtxgczBWcrBB0wWdyj2XRFo60NMZtSwTH3P1HnOzqVjK8lTNE6hPrqs6sbp64S+A6M6uJ
	c0UvNIU7ogghew5ByK4lLIC14tJCBcLe6Vkao8oe8+WeydF0D4KPxD2RvRa/A8WCDPMxLCRdZcHke
	TcnwvQD6NCrWMuPcqoKsLqVW8ISmPcVxK0DyDNVULsyf6jL0NaD/8dv1LHnPFpry6T2MKmIKQUtIT
	ScjNXHIR3UYuAIUdL0qtrw9yapXfB8LGvJO1UWprPDWvG44qJg2nRH+xNQnQbYfOLJHrw3LaXt8V1
	Q2gTHaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGA-0000000EYLN-2kZq;
	Tue, 02 Sep 2025 00:52:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAue-0000000DkeR-2Y9b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:14:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04C3B600AC;
	Mon,  1 Sep 2025 20:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906AEC4CEF0;
	Mon,  1 Sep 2025 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757639;
	bh=xfKFW3dT4DK2EZgjD9Ro60zpauMsomYjUMvOcPcR4R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFPBz21SGiBLttw1RgpyCzlDm1CUmvNxIwlEAUxspRmU8G7dZPQ987Ws51uwR3SSw
	 UHZ2c/g45PxA1rxetxW7+cs5Bzb3TAehqj+jd3IesTqK53Nf6Jr1YGBmtmbQCJFFtr
	 3o45o6nqFqjA9VTrkATtiyv0NMZVDkQaBg36+iqIxqlAG1KkA2DE4+cDZotrao3te/
	 +x0IJbrTXO0N5ctf3UsQRWrIEGi5BkwI0JwsFd83vxV7CUlbPlC9SW1Kpfg4xKZeky
	 BsFHGEarm+QCOrn90NiFM2Hth5mlY2gJeNj96oQJryIrTYWqu8mpzVTjXfHLXWYhay
	 Nv7/unNEQMKOQ==
Date: Mon, 1 Sep 2025 15:13:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410
Message-ID: <175675763746.266549.18104876330796347730.robh@kernel.org>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
 <20250830103601.82046-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830103601.82046-4-krzysztof.kozlowski@linaro.org>
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


On Sat, 30 Aug 2025 12:36:03 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


