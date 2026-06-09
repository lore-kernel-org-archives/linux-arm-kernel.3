Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD61CD8CBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAPy2awkQcYnVSy1fnfZF/v+f5XqDfdm+3r4Ry3/eo4=; b=1K45N+7uBliFKCeKt+4wfIDoLO
	geRwxqHl488IZpG4N9yVCnDxrVqlSduxP/t3yHGoAN7i+0VwjCsjnbIq0ESWGXQ60MA2It4ekgkih
	GEq76yM4rNrveNUNjOGS0jqOZ94y2/riCu639EfwrZ4AKDYZ3EQqL1z1Q6Hrl3OooSTxiZRBmRini
	WoWe+OLyovX/uzhfojeSzuTBNcbS4sBtV5sAjUhGpHL+pAt7PwX29aYAC9fgJzfTFVw+zauUBL4xE
	avNeinP+0at3lrYdKiWc9GG7nvPs2J1183oM3kdGnEPNbT8JYopr+PR7sS2AQiWgqI5D3HqCyekpZ
	qajFS/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrqy-000000054MJ-1z5I;
	Tue, 09 Jun 2026 08:30:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrqx-000000054MD-2rMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:30:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 496F74428A;
	Tue,  9 Jun 2026 08:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6863C1F00893;
	Tue,  9 Jun 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780993831;
	bh=vAPy2awkQcYnVSy1fnfZF/v+f5XqDfdm+3r4Ry3/eo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SuiDaMZaogYBR8IVKecr1WRDmd0oh7gOCSew3JZXv71uXuTavPzO4IU4gRbQsSmNn
	 qQetzE7dOzFT3erHs1SLTkF04XuKJ2TW2CPaleBL6Uv2QcFZ9Mbf1vDelfu3FMIqn+
	 Qy2S5RqNGtNCgJi58UkuQZlRHbe2qHkYtlm2c0lKlCsBycvw5fm93rh/+vxHqFE4pN
	 xgH49PxObrEDObWNR5RF09uykuJ/vue7yrvMkrNUm+W4AmxAuTtKtp+TfiFLfRUhsj
	 gZKRud0Z8HoYdKIeKhfjJopcMyxn1H5iuKfsDpSOQCPF4s9UZYHq0qspNc/CDnCM1k
	 UbI7Eul1/SgPw==
Date: Tue, 9 Jun 2026 10:30:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <20260609-nimble-beige-swift-eb1846@quoll>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
 <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
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

On Mon, Jun 08, 2026 at 12:31:42PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


