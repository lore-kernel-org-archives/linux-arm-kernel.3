Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2DC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI8Hx2/kxoJn5UYePkuY1ZsInIkTgL3TmQ5J5xbXH/E=; b=UTTqEPdEAtSTBNL1r88SE08mN6
	v8LWYKEJ1fDBUtQheRzLtuMJhamSBnEMPjGnfeKQUe7YnfmjjsbeNTFoCzwPo0en3nKa/Fv1+ykdk
	bSIF6N6ZFygKgZoMYva+zLEWLbxjMnGCA16udY22ongKeViHyGDWXefjxE2KXDXpUS0lyltElePYf
	rFiIn7U0TlZAJH/2dBOhPQc/1ICmmv8lEtJIZP0MQzgivs38CrVeERSsgSaDGYEk3wkwrc48Igm/N
	iUaKMzdevPW1Lc5aHhvxU6yIqJ11+KMZM1z/zZ9hbC009rS2QT2Vqk7chERGjbUXHHR/Zfor6wf3r
	ZZX46nYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZQD6-00000003ZM4-31C9;
	Sun, 19 Jan 2025 07:59:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZQBn-00000003ZBn-2J4R;
	Sun, 19 Jan 2025 07:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 682C5A4024A;
	Sun, 19 Jan 2025 07:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCF3C4CED6;
	Sun, 19 Jan 2025 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737273465;
	bh=WhZPPkqDkAojKGZjphwsBAaMUBDzAEWSrFqrmjWwtJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vElZ1u7QRlkEA9UcsOaPxNbdib4xryud9IhBPaAvkYyEcWznzS9WYlLe8ZiDySkJL
	 Jafje7xYAonrFwMc1IMvOs9xcw/yAup8rqHGkRoSOLXN4GEY36dljzY243RtN8CqXK
	 jM19qnyVfNW9JkrVaNZOM6JWysltI/lc+QTNsjAVqLgR+U4IomxMh8LPOb+zjQoize
	 L3y4jobUsg9/McnsAqMi1DdxNgUn0aXYoCDkIKo9lUXTBI5ZD7IkMxQxpAchleyvMJ
	 WLmc8x4cPCIBvBF9LcXqkA84rjWtBvB10YDCriCkUvgJg1pv29/CTvLIrKqQziyjHj
	 g4x4uYTs8k9WQ==
Date: Sun, 19 Jan 2025 13:27:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/8] Support Multi-frequency scale for UFS
Message-ID: <20250119075736.cyjgpglf4azrmprv@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_235747_742304_8175A91A 
X-CRM114-Status: GOOD (  13.26  )
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

On Thu, Jan 16, 2025 at 05:11:41PM +0800, Ziqi Chen wrote:

You missed CCing linux-arm-msm mailing list to the cover letter.

> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.
> 

But the UFSHC PHY settings are not updated for each gear speed, isn't it? Then
I'm wondering how much we get out of this 'multi-level gear scaling'.

- Mani

> This series has been tested on below platforms -
> SM8650 + UFS3.1
> SM8750 + UFS4.0
> 
> 
> Can Guo (6):
>   scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
>   scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>   scsi: ufs: core: Add a vops to map clock frequency to gear speed
>   scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
>   scsi: ufs: core: Enable multi-level gear scaling
>   scsi: ufs: core: Toggle Write Booster during clock scaling base on
>     gear speed
> 
> Ziqi Chen (2):
>   scsi: ufs: core: Check if scaling up is required when disable clkscale
>   ARM: dts: msm: Use Operation Points V2 for UFS on SM8650
> 
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 ++++++++++++++++----
>  drivers/ufs/core/ufshcd-priv.h       | 17 +++++--
>  drivers/ufs/core/ufshcd.c            | 71 +++++++++++++++++++++-------
>  drivers/ufs/host/ufs-mediatek.c      |  1 +
>  drivers/ufs/host/ufs-qcom.c          | 60 ++++++++++++++++++-----
>  include/ufs/ufshcd.h                 |  8 +++-
>  6 files changed, 166 insertions(+), 42 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

