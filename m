Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21752C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fOV800jnOKSoFYPaGTsNNOvmETFEXGzCdIRhc/T47A=; b=VczIJNEV8aPXgYnhzttU4cAksa
	p2eowkqczuI4NSRF3pmQC/4rpVQVNjX6o7cG6tMGc1I+K7rqn6wdHzyz3dWnaE9abSNwM/OdXRMug
	yZn9k3FU1BrdBfOxKGtrI+O8mfBP0asbn6l0meNaSunhwUkBMDLimwozWudwWRd6aNrqYxedApsI0
	n8fvv/pT0o+eWUNC7SLCaI2B4YbsrutdKJIQm05yRcZtuNghHb0cXwm6uQldBBKaUukSs165kyr2c
	ZkhSV9et9FENmwekoLDdjZx3ylGlj61lO/80IRhPSMTDn9GPe1c3s/1TqP265sEwCNSrnvvIabxBg
	vrvHPKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnunD-00000009zTe-3lZs;
	Fri, 28 Feb 2025 07:28:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnujA-00000009z4J-30HE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49EAA5C6545;
	Fri, 28 Feb 2025 07:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D68C4CED6;
	Fri, 28 Feb 2025 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740727447;
	bh=hiaw9mQvo3JNGczetxHm5CU3JKRJwSl1WWGYscMRTzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cM42Wz0Tyx+szs3B5xpHrdNi6e8mNeh2nqCIey8mMx580YQnqexgntoucF2Hftb7g
	 3Ebcd8kAblSXeQB3WC5qT/OCWfVXorBcDUizNNnRGE+mA4vTzYsNLDhqb6ggE3Y4aS
	 jk5AP/o30b57ud3c3yWppFxW7GkUIu0o6N81OVgHuZUBrpTTmRwqjmsG69JA3ZtNUw
	 8RkBuyzRFXZx6NRCqdQ5gslLcFCO8rnXqB+Bw1OK/rI/YA2TF4KmqaaRHZ6HEzvJvK
	 NIju6ddXrEUkxSWuV6mJr7zvq2KYNfPZVaUXtGxK2GinTR0k5HwDv3ZJ0EBC1Q1mkq
	 CVF/xxPxH2ijg==
Date: Fri, 28 Feb 2025 08:24:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <20250228-rebel-honored-donkey-f30e1f@krzk-bin>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
 <20250227120619.1741431-7-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227120619.1741431-7-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_232408_807735_2B2B0150 
X-CRM114-Status: UNSURE (   9.13  )
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

On Thu, Feb 27, 2025 at 08:06:19PM +0800, Peter Chen wrote:
> CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> and Orion O6 is open source motherboard launched by Radxa.
> See below for detail:
> https://docs.radxa.com/en/orion/o6/getting-started/introduction
> 
> In this commit, it only adds limited components for running initramfs
> at Orion O6.
> 
> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
> Changes for v3:
> - Fix two dts coding sytle issues 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


