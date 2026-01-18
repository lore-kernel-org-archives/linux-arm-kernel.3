Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D269D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpxixMOeLl5XqF06wIovijqPFGiZ2VXDMVlJIcxjdfY=; b=24Nk6ZQT+aKKzqb7sjOKJ0X6pc
	Dhpx4rsvZkk44m08SU0zsgBF8eEmsqX6sarlX/U4VVopyZCLKUQ9KRG1+o504IIy5boIGLvU0QRdW
	4YrpqkWiRsxjqJPeKNJFV27IqbclUB/A+TSIKP+MsJLdYCasPOQccL7i0y0Xyxk+B7GDxoqibA1mG
	cHozf05klaDS38mzsbn+8cxVNJ9uWxaMrNJunI/bIwhZJ/VTTCmlp2rxpXvSttA0t6C+88eRXa+15
	IDZcYp1b2uu+tiCMr8DItTFU92qJ4+dH1h/zxs32U8hwmAiTgNMDvyF04usm3i98ovMv6XcFcxPeT
	pXNfk3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhMSV-0000000GveU-1dmm;
	Sun, 18 Jan 2026 06:40:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhMSO-0000000Gvde-39sg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 06:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C5E36000A;
	Sun, 18 Jan 2026 06:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEBFC116D0;
	Sun, 18 Jan 2026 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768718415;
	bh=J1shmd9ZBF8R2kobwL2x7PTcHhmwOR0KgYXn2xOGb6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZL0CYZIPC0SYkbjhXKxMy9b4QHDWX0zaqamPCMFQzKC8mkU+8eTH0U2X7HQ+YslT
	 HTUqePAXEHAdG6nDx2xRGLodpn4j7iYGg8xVXRMjE4nz0wcUBkdCjr0SSoxsKhWoj1
	 o1nstiQMS/ujqsxKD+OPLOlI7wK3IsoTjDq4VFRx1DHS9v36MS7/Mb9dAOv+2hXqIy
	 WLoULrnXTEOonlxGUdVA0qJ2kIxvKLSnwG1WF3yoLvmMxW5rAqPW1i1LrGgzoGXs7i
	 gKwvCIUSPwMFSS/32oPBdLOLc+4jrFmo8Is21SHXYJNDjkV+2O5+EKXiyhpaIujYML
	 uoIYjLoM7YJ1w==
Date: Sun, 18 Jan 2026 14:40:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lei Xu <lei.xu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	qijian.guo@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v3 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Message-ID: <aWyASKKyzN34xKyn@dragon>
References: <20260116-127-v3-0-3dc49545a745@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-127-v3-0-3dc49545a745@nxp.com>
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

On Fri, Jan 16, 2026 at 12:56:12AM -0800, Lei Xu wrote:
> The NXP i.MX95 15x15 FRDM board is a compact and cost-effective
> development board based on the i.MX95 applications processor.
> 
> This patch set adds device tree support for the board:
>  - Patch 1 introduces the DT compatible string.
>  - Patch 2 provides the complete device tree description.
> 
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> ---
> Changes in v3:
> - Add a blank line between the cpu and codec node definitions.
> - Link to v2: https://lore.kernel.org/r/20251217-127-v2-0-67cb12e56242@nxp.com
> 
> Changes in v2:
> - Switched from 'xceiver-supply' to CAN PHY nodes using 'phys'.
> - Added CAN PHY nodes for flexcan2/5 with shared silent-gpio, removed reg_can_stby.
> - Updated MSI/IOMMU mapping comment to match the i.MX95 15x15 FRDM board.
> 
> Link to v1: https://lore.kernel.org/r/20251207-127-v1-0-5a2eeb69f150@nxp.com
> 
> ---
> Lei Xu (2):
>       dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
>       arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

Applied both, thanks!

