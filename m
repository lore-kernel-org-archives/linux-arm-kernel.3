Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96666CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFx9klrGphXMuQ0Ni1tPTVbcnMYOSG4/RwPE6ggaLbg=; b=lmmX8g6nUkV6jGwKrrQTUVP5zs
	HAxe/ZlDb2WzQVFVzCJ1mB9wNpDkKOZVTukjtZTqADYhQg/ZP9WYHvlDUvKTpI1XxyMsui73wgZSX
	5M0L7ptnZQpCy1GeuJfxdetg/BIH+MZiXmhVzAj/n9yBluimzdAxL+JSjGw6KZNW6SJ4quTrVh9FE
	2HPFflFph789U8AXgHc28Cwal4nHMQq+b4Dje7WbvVHgDGnGHgun/XXbjE78oOOpXgYASe5iWR6fj
	A0+ZcsMTjuWiTSSl6sKmJpD3dkosXvoj4TFXAL170aG2fLND3UTiN4j2gBzW7VPqPXbrzWf3a7IUc
	QO86ry1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAFj-00000008naC-3O0Y;
	Wed, 12 Nov 2025 12:47:11 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAFg-00000008nZf-41Ht
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:47:10 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5EDF6203D9F;
	Wed, 12 Nov 2025 13:47:06 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 518F52015AE;
	Wed, 12 Nov 2025 13:47:06 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F511202C9;
	Wed, 12 Nov 2025 13:47:06 +0100 (CET)
Date: Wed, 12 Nov 2025 13:47:06 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v3] arm64: dts: freescale: Add GMAC Ethernet for S32G2
 EVB and RDB2 and S32G3 RDB3
Message-ID: <aRSBypL8JpsSPRtX@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251103-nxp-s32g-boards-v3-1-b51db0b8b3ff@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-nxp-s32g-boards-v3-1-b51db0b8b3ff@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_044709_129412_2B6C877E 
X-CRM114-Status: GOOD (  13.81  )
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

On Mon, Nov 03, 2025 at 10:24:01AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for the Ethernet connection over GMAC controller connected to
> the Micrel KSZ9031 Ethernet RGMII PHY located on the boards.
> 
> The mentioned GMAC controller is one of two network controllers
> embedded on the NXP Automotive SoCs S32G2 and S32G3.
> 
> The supported boards:
>  * EVB:  S32G-VNP-EVB with S32G2 SoC
>  * RDB2: S32G-VNP-RDB2
>  * RDB3: S32G-VNP-RDB3
> 
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
> Changes in v3:
>  - moved compatible to the head of mdio node
>  - removed redundant cell size declaration
>  - Link to v2: https://lore.kernel.org/r/20251031-nxp-s32g-boards-v2-1-6e214f247f4e@oss.nxp.com
> 
> Changes in v2:
>  - fixed correct instance orders, include blank lines
>  - Link to v1: https://lore.kernel.org/r/20251006-nxp-s32g-boards-v1-1-f70a57b8087f@oss.nxp.com
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi        | 58 ++++++++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 18 +++++++-
>  arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 +++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi        | 58 ++++++++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 18 +++++++-
>  5 files changed, 164 insertions(+), 4 deletions(-)
> 
[..]

Hi,

may I ask for review or merge?

I have another patches prepared, but there is a direct
dependacy of having gmac node included in dts.

Thanks.
/Jan

