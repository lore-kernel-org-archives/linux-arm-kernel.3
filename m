Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB19F01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEG+sFh6hS3Lo5XygPH4pot6gpU5B/3Iic8KNdL4OPQ=; b=LjwbWbSuJeJBJUVcmhk3D68dcg
	n/sKAeYsl39UrhAEMkKhVY8u5PIHaYZq02lLRSiJqUYdXTBtYydp0+r9uoTiMxDOCA/mqGZdj3+mB
	gzCDlQ//jdRpbSrCBA6UnogEWkA2ZnCQmiE/5RpiOPCsOuvmcBhu5vn+EBoJ6uksZEnHL09zhwLrN
	qClEtcjenlZ2PNDRV2Mi/d4ccJtFV4qW4R6AXozwqeyk5H+bGnhvr0SLR2CoEgSZuovs92SsB5Igc
	0xk0Kyj02ZL7h0jeavKM7w0keS3h7GO5f+bKtUuhdgJo+9djdw7Pkb9BAvcTtqPhXrDoQmu1nap4c
	IdbxKY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQm1-00000003H5L-0jyg;
	Fri, 06 Mar 2026 08:43:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQly-00000003H4z-1Ggy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 08:43:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59C5D43B69;
	Fri,  6 Mar 2026 08:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B5FC4CEF7;
	Fri,  6 Mar 2026 08:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772786579;
	bh=UGYja3lVWRxfQoH8Vo5RvHgm78eLeujnG9mrnbduk58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhH2CgVaeGN71ykpuN7WwkKtEALvHzvNWMFTMc4qNRyTkQd2rO1eMCubmXyRYRmZL
	 a5f8IDjxHoZvcnon9gyKRJPlTf8nZNnd/RiYFadefuT7IBhrSsbFseHXIb6GxPjSMm
	 kvm/CvguEyxdx8gXzNYCRKX31iSqaS44q2iUumeYw04glkGvR503o8Svb/3U0glWtF
	 vZ7W4mYItaBOLaGSi/PEDpcXhQOwRIB5MWis/0S2WajnfKpmUvdoE9S3CR76JbX2A2
	 r2u1sUGOMv84toxBQJPO591twnYIsFWoFbzl4llbCaQiTjJt292jDNIDjlLgaPv9Kt
	 yUbDpX7tl3+RQ==
Date: Fri, 6 Mar 2026 09:42:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Yongjun <jun85566@gmail.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, nsaenz@kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: allow dma-coherent
 property
Message-ID: <20260306-phenomenal-hamster-of-memory-819b2b@quoll>
References: <20260305234703.38490-1-jun85566@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305234703.38490-1-jun85566@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_004302_385065_A8E2AF8C 
X-CRM114-Status: UNSURE (   9.35  )
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

On Fri, Mar 06, 2026 at 08:47:03AM +0900, Lee Yongjun wrote:
> The Broadcom iProc SDHCI controller supports DMA, but its binding
> schema does not allow the 'dma-coherent' property.
> 
> As a result, dtbs_check reports the following validation errors
> on the Northstar2 SoC:
> 
>   mmc@66420000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
>   are not allowed ('dma-coherent' was unexpected)
>   mmc@66430000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
>   are not allowed ('dma-coherent' was unexpected)
> 
> Allow the 'dma-coherent' property in the schema to fix the validation
> errors and accurately reflect the hardware capability.

So is the hardware capable of coherent DMA or not? Entire commit msg is
silent about this and says how you fix warning without actually telling
us that it is a correct fix.

Best regards,
Krzysztof


