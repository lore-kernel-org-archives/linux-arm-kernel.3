Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A2CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6WKkXHoPT8Ngp0RSnEnTRpILsIWU0p7WgHa7MALkFk=; b=CCniP+HeVZHwNV6Xdx2BXT2brB
	HwUhOiqmIX8yZFLf3Uxn2ULB0pRnYD5HFK1pfOW5fRAgWoa1EI33+AMzc8o6ZxJy1Hhqztq0Hq69u
	1pUeq4kPjRZShVOUPiS3ToQM0r9aRa0FXf88Wpd2T6Mryv2LZMgYeE2HjrFMTovZSz/xMqMmv902K
	ZiVBYk7CJn8D5LnqfTVsP9wnbxMkiDAdoHiSF92/iEAzHlOPCeR0wUHJR9SCwNt0Wv1hteEfe7OPR
	68WIpyPPkmmgbHm5zSCu3Sdj5181q2+59gZ5iYrKYvpXg98LssRDc/ldj9uhOpgSLVWNtmlGbW77O
	aFmfOMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaea-0000000BLII-3Gqg;
	Fri, 02 Oct 2026 10:38:12 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaeU-0000000BLF2-3rhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:38:11 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0C14D20476;
	Fri,  2 Oct 2026 12:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790937484;
	bh=L6WKkXHoPT8Ngp0RSnEnTRpILsIWU0p7WgHa7MALkFk=; h=From:To:Subject;
	b=i+6jxtT4udfRa2RQQYwk5xppBrpPF3Ih8iAcTEqDcES4A31i0leM1CKx5avodBXOA
	 5YhkbMsisuMAkZPCJAA0IKXD5dttRhYM3jUzRj1cGXVVMjcVFQWDNl9dc3rgXGHAJL
	 r9kVX9tAkykFaOmWo8GyuGHBKcgFJStOD+s4p4EKVrcLzFhjklz1rb3dw/HfJEtkIw
	 k6rs9toZm7jTWAt4WZeCCtebnDA4n6v4pGkE67NQOGg+DGiC/aMvylEz6DT0hT1Fnq
	 fvvTRf0P3mf5VV7a9UceI2cYQf6iqKhyVLC9OqZ9nh+lWUnSCbd61PXphFQTvrpNo+
	 AXV4I41rA0W1A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: freescale: imx95-toradex: fix vdev buffer reserved memory node name
Date: Fri,  2 Oct 2026 12:37:53 +0200
Message-ID: <20261002103757.70065-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_033807_133895_51EC8661 
X-CRM114-Status: UNSURE (   7.52  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping and "vdev" prefix to filter
vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Same as commit 5cae743b988d ("arm64: dts: imx95-15x15-frdm: fix reserved
memory node names for remoteproc").

Francesco Dolcini (3):
  arm64: dts: freescale: imx95-verdin: fix vdev buffer reserved memory
    node name
  arm64: dts: freescale: imx95-toradex-smarc: fix vdev buffer reserved
    memory node name
  arm64: dts: freescale: imx95-aquila: fix vdev buffer reserved memory
    node name

 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.47.3


