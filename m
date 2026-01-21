Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA24D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P0JX3xThF3EUdvfUoqh9VeURr09+ojeY4lRHnuXznQ=; b=28xZmvXr+gXxM2EkZ/ZALVSqUC
	1a40Agd66aSAqCJ0W8B9JgTGevl/Wt/LMJuLrLOWU7DgWhgSqg1HGKlYg+QA/iuNqmeA4OqC5PNKz
	fQr1Yfhy6ZuqW7rl5WyPdhZ7b9B4FjObb4VDnbSnHaV8cQ/BGAzgOfz3ivJqaXAIfs/rrD/W0mbGj
	yM08cQi8UnR4Q65N8Uz0n6Q9fEMuW/uxkKdd2DvoB6Qkin63u3aeX9dwCGD8UVYiHFha+Elug1wbs
	hoIdtSBo5K5aB1tKUOJg+3HQTgXf4TdNLYrdeWAqDYAKaWLXHr1/c6J10Dwe/HjJm0mHttEAuIUXu
	vOyFLmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT84-000000053BY-2Jyb;
	Wed, 21 Jan 2026 07:59:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT82-000000053B8-3YMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:59:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 703D540628;
	Wed, 21 Jan 2026 07:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19E6C16AAE;
	Wed, 21 Jan 2026 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982390;
	bh=lVIWh4J9elC8/GQ5p9OTBhZ3dYWROl05hspT5Eh9jUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgM8GGSmTqWHJFpegeG2+oUmnmm6z5KRc+iEZY7EKuqzS9jjDWkkIEYjBS59bJ0G9
	 AZBf017wyEGE6D9Cm8xLFOKDs/GvRvujbc2udpU/OVaNGTlzpaTvrc4OCU5QAysSHB
	 T96kur/kbzI5zLzcVl6JzarBgfDhxrbNO83tEbsqCHDgt8m9OJ97NHry0ZwM2G/O9g
	 iCpDPG3XS385yk5vQEZJADykqyaQfqnHggcm3tdYaCs7TCjuwMr2qc6VWyH5tG62f8
	 dwfSCnAVCmh9FgPf+EmOiiH0CUkz0C924vXyOrm4QaHBbYPGUZZCBFqHOciluZizDO
	 d4BQ6AS6TkHIQ==
Date: Wed, 21 Jan 2026 08:59:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260121-magpie-of-wondrous-tenacity-6cf6fb@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_235950_908821_874D7A8F 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> There is no power domain defined on i.MX952, so make power-domains to be
> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>

With changes to commit msg:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


