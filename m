Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9E1D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7hKsobvDG/3U4LWCFX3SfrD7HHfIElTWKhTIZISx6A=; b=WfwmM4RAxqyemVbYU7rv/TRtlV
	ykfLYtnc5dyUVxcINqi7Xteo9Q7Av0S5PzKLUVFBgWk6b8ODV+V4JqFCRNrl9fkub5nBWvnCaQ8ro
	gT8rLrMATqEeek0x6Kpq/f1wouGWHOkUW8EeUluREwH8DnMbQYSu4Ps/yeVQd1cbC4n+4cNW76B7X
	Z+2hE+jSwOPSFDXHC4KEFlKHMxP3EB0sHvib2gnPzQ+CUqSozvvCHzkoPhHlYHwK4bHmJ/4MNM/nE
	mmM8g/IichHiKtdKC4AXplGIM+m3gVMxtetvEP2g/iE6tnlqOO9tD6h4QxdoVd9C3aOcJNTicPa08
	VacJQ31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3L3-00000003FFB-1Q9j;
	Mon, 29 Dec 2025 02:50:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3L0-00000003FEd-497x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 02:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6A564402C;
	Mon, 29 Dec 2025 02:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4B8C4CEFB;
	Mon, 29 Dec 2025 02:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766976625;
	bh=tEUU9KDTuNA8oyvyIc3IfREIjFjW8VKwcSqtRHWh6G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxjevTXBWePRefYXPAcmpg6nWB2PERBnaaSXxAnbcUgBOMdnZyQX3wguDIQTjkTPx
	 iIr2SHgja13dH7+zAsyRTx1dEEe0MuxihiN1J8NzChiVkpM/mHUZV71rwKN7m64YZj
	 ot3zhLFNeohvJx4F4Ae7tHq4obOz/vzWRClrMMd/6Qj2HcGx/o58w3gQP3iWbfsBRk
	 faP9iW0H1PLDsuKfnnLuNCf4Cu/+G7FZBOGVS9YA3BLLAd2OpHLlTPw2MOtPo+t/PM
	 NeMOxHRLOO1r9JwtjWi6DWiuC72pHznV8FI+CXX5FS8dAumnaNywC/nG5ezWbOIaFE
	 vU/V3Y80oUSMA==
Date: Mon, 29 Dec 2025 10:50:20 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: imx8qm: add ddr perf device node
Message-ID: <aVHsbK-HEfYqpS9G@dragon>
References: <20251103-qm_dts-v3-0-2bfda8ee14c2@nxp.com>
 <20251103-qm_dts-v3-5-2bfda8ee14c2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-qm_dts-v3-5-2bfda8ee14c2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_185027_052675_79B5170B 
X-CRM114-Status: UNSURE (   8.17  )
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

On Mon, Nov 03, 2025 at 04:48:32PM -0500, Frank Li wrote:
> Add ddr perf monitor device node for i.MX8QM. Change imx8-ss-ddr.dtsi's
> compatible string to fsl,imx8qxp-ddr-pmu. i.MX8QM overwrite to
> fsl,imx8qm-ddr-pmu. All fallback to fsl,imx8-ddr-pmu.
> 
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

