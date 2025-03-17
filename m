Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AD7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02Zgs68QL6qWU8EJhKTi17TINTHjpaUGRV2Ha5ZSAeQ=; b=BJuikhsl4FVQf8vOkmCsj7HXib
	fYiriApPvrD9aMnd7EB2WVPfug3+BKJO49DEm71Q4JCsOZdFMHpGSI+MojFAm4g3tPiILDa0Fw1e4
	+6FI6Ux7U/iRLmkJPFqjvulpNCZw3Hxnst+whGj1IbzTLpDWqrRMuDUO/emENPZLGenway+P2rStd
	te1HzjxYm/FE8BGVHyzZrbpFx4xyHR74iCZwL1j/NrtUDvGwnLAiIPeLTKuJklBPvyjvTAILt0+hR
	t33VATC7PSvuAdgfo9fAQjWjPI5uZo0uvlhp6sgmVQLOaejHuvg+aEZUXYPNyp/xQIEXlCM2BjeLo
	VzsByIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu89P-00000002HD8-1hYQ;
	Mon, 17 Mar 2025 10:56:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu83n-00000002Fk0-3NWY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 556175C10E5;
	Mon, 17 Mar 2025 10:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C537C4CEEE;
	Mon, 17 Mar 2025 10:51:05 +0000 (UTC)
Date: Mon, 17 Mar 2025 11:51:03 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, kernel-team@android.com, 
	willmcvicker@google.com, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: exynos: add dma-coherent
 property for gs101
Message-ID: <20250317-gorgeous-wrasse-of-aurora-82ee0c@krzk-bin>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_035107_897785_4F45EA43 
X-CRM114-Status: UNSURE (   7.79  )
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

On Fri, Mar 14, 2025 at 03:38:03PM +0000, Peter Griffin wrote:
> dma-coherent property is required for gs101 as ufs-exynos enables
> sharability.
> 
> Fixes: 438e23b61cd4 ("scsi: ufs: dt-bindings: exynos: Add gs101 compatible")
> Cc: stable@vger.kernel.org

This change is a noop and fixes nothing, which you can test by testing
your DTS without and with this patch.

Best regards,
Krzysztof


