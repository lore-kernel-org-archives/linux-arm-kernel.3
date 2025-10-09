Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8656CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 19:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30OZbmXA2SO4K2t3uMjob+KY2Kd9p1ejooXSr0eSl50=; b=EuYOi7yU47Co7t8gLe2nGke+nT
	jTRGnDMKdZIBtoApZPaNU9IttUVcGHIl6oR69GIzjRN1INZvsTFi757LsXf3pFEaf6g8lZu6vpWXE
	z/J49Sh6WBg57WswGXkOW7XtQ5eIQxuYoaPDjv3HbFr50Sl/WKEUVmXPilosVmSynzJAajy0fDG12
	7gzufCXR6InE075vrjwnmwIqapKM5MNevA5lD4cMzQmd2bVP0kud54MXvTpb2IM4/Zb3esBu2QIhk
	KSqoin5BIXRYh7AdKkSoDnfo59rnC9eQVpxakswo2jECRMtW7j8kuWOpBEhTgVSSPO46w+MXjI9dF
	TBl+E5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wCX-00000006zpA-3tYT;
	Thu, 09 Oct 2025 19:21:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wCV-00000006zon-1x8U;
	Thu, 09 Oct 2025 19:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A66143CA5;
	Thu,  9 Oct 2025 19:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A745FC4CEE7;
	Thu,  9 Oct 2025 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760037679;
	bh=18fHUWDNSQljUoYJI3Axun2o+ocQ6s6w9YhkVRAnKYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lub3eKImSDaH6fKkT2fEr9nTCW77I8rs1WjqxYF1qPPPSZmnKKkoZkX0r/tsjgkOa
	 lGSqoyXV81hvBbPUYdOBqp9zb6mdDE1QQ7srLMOcyH5tN+L4jzD02ZeSPjKDqjUWGN
	 8mZHtT5suKNHwW40jlCQj0yun3dG4RT8Gu52UB4W5+/P2V5Kqz8CafKSksKx2RNq37
	 ZUluDGJD1+JG5RDiMtl5aAIuGiCbulv6gPfc8ovuJEtOYiJ3oHav/wzDGkw8E+Qsw0
	 N8s55eRJASysIUYx9SZpKhVzmKayXmr+wEStS/nFVlQUUXOhTac2gap7af/fZ4sx9v
	 qcxKuXwGBk5sQ==
Date: Thu, 9 Oct 2025 14:21:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenst@chromium.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	krzk+dt@kernel.org, lgirdwood@gmail.com,
	linux-mediatek@lists.infradead.org,
	igor.belwon@mentallysanemainliners.org, broonie@kernel.org,
	lee@kernel.org, kernel@collabora.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/9] dt-bindings: regulator: Document MediaTek MT6373
 PMIC Regulators
Message-ID: <176003767679.3125300.4178985670134779144.robh@kernel.org>
References: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
 <20251003091158.26748-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003091158.26748-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_122119_523097_DFC6BB06 
X-CRM114-Status: UNSURE (   9.44  )
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


On Fri, 03 Oct 2025 11:11:54 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6363 PMICs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6373-regulator.yaml  | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


