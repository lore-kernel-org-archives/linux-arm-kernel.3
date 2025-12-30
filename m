Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A53E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVXQd+3rqFeg/oAzfLwGZVjc+R0s/+DNUok6j0txZy0=; b=jbebyX06Zmw/t5MUT6fM3+I8Ry
	f7aOPuci6JPu1QuFimpKLqb09XzIeMERZUncjt0OUKEJz25x8j2FKzfQZ2MhTpxR3ox0YdWvBAfvm
	trP+CuORle4XAO/Cb/YbuI6kbsfUdnGFaavX8+VouiCKuiL2Mf8WbiSugJqcFVGc02Df62OJnD4k0
	xlrlT7EggNdFBvIdj6dKAeEk0nzYobd0nwYNYixMHqgDmBfxTu7RbLsoLRShVbY0X2GDSBEaj/HSb
	qCzOwjAq5ltAjs9g70aSTwe3GBqmvKAhqiOMNQ9+txyi7SZyMcoIdSlGNNi+QldD9Vy+0tFf3YG71
	q2QB8/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPTP-00000004J9p-30Vx;
	Tue, 30 Dec 2025 02:28:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPTN-00000004J9b-3rM4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2E8D60017;
	Tue, 30 Dec 2025 02:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3841BC4CEF7;
	Tue, 30 Dec 2025 02:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061712;
	bh=8+W0fvrS/czvT+s0AJ2IGHiiFjpn43Trh/HJCg0TrkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Msge0uHdNE00bchjVMUQgCzs1OeC4zALsvwfwzo34n8DPU/bLsWLnvTSZWYHDNrG+
	 M3zzRxp14lz1IjRJmgytWQRGnVBHFhwI5Jdq+nRNyuO1OVgUMlAPW1iQ/zvE0xYyZn
	 rOQQJB3g6O+Hzu5NuyHlE/XP4DO4e2Js7oekQcWVXClki6M5qAxDNe05byUkX8eMA2
	 CiEnTW6+2D39FW7WG5foIGwiYuhRi2DlkBvRGCW9FRZyF8cD4wRrggKW6lT31VFyW1
	 MA2GekNkFcYwsedsggB7mvdNY2GoWRkRMybl6f8y0c4ZJMjmOCJgINph71nqNwgaWE
	 zm+gOPEkovvQw==
Date: Tue, 30 Dec 2025 10:28:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com
Subject: Re: [PATCH v2] arm64: dts: imx93-9x9-qsb: add CAN support overlay
 file
Message-ID: <aVM4ywIkJCsRdy2U@dragon>
References: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>
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

On Tue, Dec 02, 2025 at 02:04:33PM +0800, Haibo Chen wrote:
> CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR
> to control the connection: put sel to high, select CAN1, put sel to
> low, select Micfil. In default, sel keep low.
> 
> To support CAN1, need to put the sel to high. Besides, CAN1 use phy
> TJA1057GT/3.
> 
> ---
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

This line should be above "---".  Otherwise, it gets lost.

Fixed it up and applied the patch.

Shawn

> ---
> Changes in v2:
> - change commit title
> - Keep order by alphabet in Makefile
> - Link to v1: https://lore.kernel.org/r/20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  2 +
>  .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)

