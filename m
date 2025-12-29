Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B7BD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 02:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7wcU9JUwqqUiK2+BZmc8/Ti9tB11B9XThpvUtqkO2c=; b=D8+nPFX9nvsHV0KnZvqM3npcL0
	ig95zONd3+YhEJGaSasabjuCvGrxtK1HqNKzpnnTXNiLjdcVRDbsFqP3E381tRY3Pefhg0tIrDBKH
	mi4fTWnD5vAoJrQMWhf50UlhHz+RFZ/nR8xBEkqJMOP6cNxZoxDk8Pyqj9tgemm8g3z4u3XUfGwHq
	9Psfv9xKbqyxDYNmp25TszKDHr3E+3r0kTW6dYkVBphGbRqVxwMRKn3tvmwmX3v80Ee5q85SdbPal
	jQiBAJPYE95981FEY4EHZap//6xv/dB8FPfS95pOScW1cRdHJISAEi/59EUcnr25NhOjAYBTftkhu
	q2msjS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3LV-00000003FIA-2pkK;
	Mon, 29 Dec 2025 02:50:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3LS-00000003FHb-1CFs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 02:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DDD14321F;
	Mon, 29 Dec 2025 02:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE1FC4CEFB;
	Mon, 29 Dec 2025 02:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766976653;
	bh=yX7/3mFH08YrJExkfGIoYVyNQTGTYRax+BrGZPlAAYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oI3rPcoa1xH+lQ7hVZS9RVy5efBS0cVQnD4wC5Z0niim8Z8Thk9wRyKkL0mD0znYL
	 b5k9FbUogkRcRSHDbMjrfO6fw1S0d+/D2L+DEXGDmyOBDNfshFWGU7Hi+JG/6lagh3
	 jSWQ96C7QOErmpR4f9DEi6ijh5CIC3CSio/k+ZNak98D2gDYPDA8VdWKpehJwW/iyD
	 rSqs0l+25O1+UzVdFNDP4b5JHAvZFiO1MK6sb1Oka+S/xv5fIPvg6+vU9nmrJbQaGH
	 frBnT4An5I3w3/M+2hhRTyJU2y9UficmTCidBNmIMwKnoSWm3fG+uM5MqVsKCBpAQG
	 zmM1WIAxawSzA==
Date: Mon, 29 Dec 2025 10:50:41 +0800
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
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8dxl-ss-ddr: Add DB (system
 interconnects) pmu support for i.MX8DXL
Message-ID: <aVHsgSN5-gzJ4jt0@dragon>
References: <20251103-qm_dts-v3-0-2bfda8ee14c2@nxp.com>
 <20251103-qm_dts-v3-6-2bfda8ee14c2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-qm_dts-v3-6-2bfda8ee14c2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_185054_911164_DB2718E2 
X-CRM114-Status: UNSURE (   7.69  )
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

On Mon, Nov 03, 2025 at 04:48:33PM -0500, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add DB pmu related nodes. This pmu is in DB (system interconnects).
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

