Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E402FCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 04:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0PZLFViVM77rtQbM2PYed3f5pGtD+vgIpymZKAXzLg=; b=jeo87gYf74EX8wamCj7xDGHjc+
	57J+ubkHhvjZ+yL9A6xTyv2px8PIElxib9rMjNnTL+Ndy6PJU9KMTg7WUI+C9eP+6hgvcJNZ2b4UK
	RYeo0wkUHzpWX33Kmh3JNY3+8AhrEmJLHK10OBK5F/NuQliHjZXJmh/ZUmcM4AOwe6DKDRr/U2Xtz
	XhJjap11mQHhEEDERDeg+7EjSAyyUsDIjNU4s0nNw1tqVo8fmtxzoe3m6yM/9FExlh6tXJjNkzX8P
	9+dpUdtiSNvGwlZ3KuVMRnj7ht4O3OKY+V7LMBq2E7Q/MqjsbS0FUW/bs6nPr8KKAmSa/eLQnw2D0
	zYvk1yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTyV-0000000ELYp-2zqR;
	Sun, 16 Nov 2025 04:02:51 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTyR-0000000ELYN-355V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 04:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=i0PZLFViVM77rtQbM2PYed3f5pGtD+vgIpymZKAXzLg=;
	b=LShDOIkJZ6RvjkNd4b2ARGJPDO4RoWigfTTqqUuOjYMsmb8ApWCyLKHeF+sOVw
	+F7FRh+N8iV9TL19PhvHbuJJfKnDIJfbbplLbEYihplOZeVD3m72CLLBzfqwy0vl
	5hr6nGK7vcXd+Y7Pv3Rb1XXXk9RbyXTB39t9OUEVMA3m0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3L5LATBlpox02AQ--.7862S3;
	Sun, 16 Nov 2025 12:02:10 +0800 (CST)
Date: Sun, 16 Nov 2025 12:02:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable i.MX95 drivers for pinctrl,
 Ethernet and PCIe
Message-ID: <aRlMwJ_CKoS1rpPn@dragon>
References: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
X-CM-TRANSID: Mc8vCgB3L5LATBlpox02AQ--.7862S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDKFy5Xw17Aw1xWr4kZwb_yoWfWFc_CF
	48GFnrCa1DGryvvwn3Krs2gFWF934DJw1Fg395Kr43CayxZw18XFsrJayrZr13urs5WrWI
	gFW3t393ArZ09jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUblfO7UUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgLjSWkZTMJ+wAAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_200248_340506_7AEBE66B 
X-CRM114-Status: UNSURE (   7.91  )
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

On Mon, Oct 27, 2025 at 09:17:53AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Enable i.MX95 pinctrl driver necessary for booting. Also enable the
> missing drivers required for Ethernet and PCIe functionality. These
> drivers are used on i.MX95 boards, including the NXP i.MX95 19x19 EVK.
> 
> The below configurations were enabled (listed with their DT nodes on
> imx95.dtsi):
> 
> * CONFIG_PINCTRL_IMX_SCMI for the `scmi_iomuxc` pinctrl.
> * CONFIG_CLK_IMX95_BLK_CTL for the HSIO domain clock controller
>   (`hsio_blk_ctl`) used by the PCIe controller.
> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>   (`netc_blk_ctrl`).
> * CONFIG_NXP_ENETC4 for the Ethernet controller (`enetc_port*`).
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied, thanks!


