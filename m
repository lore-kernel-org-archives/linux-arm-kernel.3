Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD453C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZlzTaUTWuHW5xBT0sVI85B5bgiEOliqUztFBmHrmSE=; b=rINs+mkOBYVBKDEbzpGxofvve6
	BsnU3IqRBVp/xTWKDLkxrpp1qq+YErhs2QNtnuXk8xXyk9pvDie1sqexM7QzpBxQABb5MmzHqh6v1
	hKv8F/4RAfxuezb8g7MjE9KE1/YdfKpGC/B+nW0UnKfEFGs6kKt8d9b4w09cFEsvESZ29Bfr+NBl9
	RjFI1qa3wInoHIxewNUIu6YK2DuMSMb6CimcsCUnsAOflcvzZf34Q+corf9WKgI1cUh2eJGoNF2dh
	wKx3O8AqWHexLsNhW5GW/pbYGqRFLRKCj3y1ZXFBJ27ekbrBuAZdjqtdm/CBSPf/MQ5weINwqQHKk
	0yLVsOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I9l-0000000EWGJ-1LEI;
	Fri, 11 Apr 2025 17:27:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I7w-0000000EVrS-0Urt;
	Fri, 11 Apr 2025 17:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A71B8A4ACAB;
	Fri, 11 Apr 2025 17:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B2DC4CEE7;
	Fri, 11 Apr 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392314;
	bh=wKL6klck+zBAXPJH7vpcgxZNxZBcOAkRLudiLM2Ns3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up/PWyhT0eLoiCHQaOrBL9cHonTnfSQPtDomBOSEM813K7ZiLq985bQklbdSym773
	 O33EAI4T2+Njvk+qfa0JE0ZeejoEy/Cj3TNZBSC93t72tKBK2oJlx3vOOBicD+54QZ
	 HL+PXJj9CO5w9qIBL1UZ9eooKlKRBkM8b8H08rCP2hOeB+EBdHusZ1mY5i2LYIQKHu
	 QxcbmgnCsbkTILHGHUBtrIdZTvXdVR1Nn8ukV5CaFUIzNAWMTC9rgxnULBvDwgfd66
	 HhSrBtfoe+HiEa4iLQrQYRJ8gjwbhbwEM1m9YNGcBVGRM8Fd5dmKFev/Chf+Or0bYy
	 9B3MK0o/cyIgA==
Date: Fri, 11 Apr 2025 12:25:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lihongbo22@huawei.com, mbrugger@suse.com, linux-kernel@vger.kernel.org,
	y.oudjana@protonmail.com, devicetree@vger.kernel.org,
	fshao@chromium.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mandyjh.liu@mediatek.com,
	ulf.hansson@linaro.org, kernel@collabora.com, krzk+dt@kernel.org,
	linux-pm@vger.kernel.org, matthias.bgg@gmail.com,
	wenst@chromium.org
Subject: Re: [PATCH v1 1/3] dt-bindings: power: mediatek: Support Dimensity
 1200 MT6893 MTCMOS
Message-ID: <174439231282.3566165.14821715325780672996.robh@kernel.org>
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
 <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410143944.475773-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102516_217909_3847B498 
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


On Thu, 10 Apr 2025 16:39:42 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the Power Domains (MTCMOS) integrated into the
> MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  2 ++
>  .../dt-bindings/power/mediatek,mt6893-power.h | 35 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


