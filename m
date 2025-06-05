Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C643AC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU5UlllXuNWaAnSVSBUBx19BVe/VXVZ+Jaq1SdI0KNA=; b=RSWRr+3OK0DQ08WGec3W1/Rt7C
	iwbyFRVRoxQr4BNLa48wdykMMC5d+DIycLYxED9lNVFo9FylOeMI2TM5R61X7RHFfSLYiUmOtkuDK
	pHirJln42770E1rxwmz7pB64xi8Z0tq+P7e1mCCbOGTWRhc4D81Nw1uqxNhhIRj3pB1AIWo1jaE+B
	mIq5sszDEANQsoxJwkBYFCC3uq50qub3jno68q0cFrgYsM6NmT5lFi2X+mjQpc4+oWQExZAXITnPy
	8eEtTSb5/hQxmkyqm+CNaJ9d94UprSLTx2V1OB3hQw70KR9yOn5Pps5a6bfWWikNxhCSfzAu0Q8a6
	t8UuNRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEo8-0000000GCFF-0TgH;
	Thu, 05 Jun 2025 17:55:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEhm-0000000GBMh-2NRn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 17:48:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E00FEA50965;
	Thu,  5 Jun 2025 17:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D5EC4CEE7;
	Thu,  5 Jun 2025 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145721;
	bh=z1alDu+OK3mBs+MEaKTan/LvOGCnBM4jHemIdBWdMAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEP6ipiAz3j1xYP3Shehu4INZBk+myzfSOoUlgWD/HkZ7bkyqPlHr60ZJb8pmQHxM
	 j6W2OADxRZN6HjdhthesXZA9OdZwMh//sSoG/1oR978hCvmxrnerimNwoEmjdOZ5ul
	 qIjRpe4hp4ds6Hle+xyGwbLkGOGN1YDKnXg4YQrD94GAtVy3lltaaQQNS9R9wEFLvs
	 1SmFsS9e/w33yl72x5GNG5gPuY7GQ+ZKmX/Bl28a1FlUODrYHEs5YsC3Qfda3u8yiu
	 8NCJi0Es2RRZX2rB9jcl/p+8AMOos8Zg3s5I/D19dqOhjLSLhTf3nMC9G5Jd9O1I/F
	 KIbOb/GZI/V9w==
Date: Thu, 5 Jun 2025 12:48:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: richardcochran@gmail.com, s.nawrocki@samsung.com,
	alim.akhtar@samsung.com, netdev@vger.kernel.org,
	karthik.sun@samsung.com, dev.tailor@samsung.com,
	linux-clk@vger.kernel.org, shin.son@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk@kernel.org, chandan.vn@samsung.com, sunyeal.hong@samsung.com,
	mturquette@baylibre.com, conor+dt@kernel.org, cw00.choi@samsung.com
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: exynosautov920: add hsi2
 clock definitions
Message-ID: <174914571742.2925706.2735159055400329437.robh@kernel.org>
References: <20250529112640.1646740-1-raghav.s@samsung.com>
 <CGME20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22@epcas5p4.samsung.com>
 <20250529112640.1646740-3-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529112640.1646740-3-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_104842_670877_B82B89B6 
X-CRM114-Status: UNSURE (   7.75  )
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


On Thu, 29 May 2025 16:56:38 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_HSI2
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 29 +++++++++++++++++--
>  .../clock/samsung,exynosautov920.h            |  9 ++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


