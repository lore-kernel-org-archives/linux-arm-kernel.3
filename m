Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F40C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns+L0aOm8q4XI8tdY0zbGpGXoWoyJjIZ1B6rDiXbX30=; b=vDasi2rQPfCfUzC8Twsox3E1D7
	knLTs0VS2jHl10PqPzjYPe4NUVAzAf/P9ZcfAaFub0Z4FmsxDDbiTmzW6g9tyCVC54AvNqkj7vfq0
	j3q5JYxJiS/LfPZ2DOPqoD7t44Gco12LL+Rn0qvKopj3FiQT722ekDg20PkWqVcqQsOkOcxJ8li8l
	BuY7LpTuekYQU8JZvy6KBO7e11PhgBtlc54WkdrkKotWBJFrfFRDvN6oB/O9mrP214LFl+moKDmW+
	oRozfm0NJcmBuQfISt5jihV0pbHpY/VEo0z2BDcRwc0ujY9UnklhxdRtDWy63VNdlWTZ66BAZhNXj
	QdKclBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89Xl-0000000FqOk-3oy5;
	Fri, 25 Apr 2025 03:16:01 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89Vv-0000000FqFp-2OBn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ns+L0aOm8q4XI8tdY0zbGpGXoWoyJjIZ1B6rDiXbX30=;
	b=SKRlq7iImJSm8WSOqSFewc3xuRNOOHQvEfFqd5/qWhssemJdgOYpsRvR8vgppJ
	Lcod9RJv/UYLydErZV9zePUAfDLqC37XxNuhpNq8mMC1IIQ4U5jLTplbf1PDkd2v
	D0azbviE8xSXZxe75QPU3OA1y5Qsf4FrBWyaUSVbx8tvI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3zEXr_QpoCyPbAw--.5525S3;
	Fri, 25 Apr 2025 11:13:48 +0800 (CST)
Date: Fri, 25 Apr 2025 11:13:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hongxing.zhu@nxp.com
Subject: Re: [PATCH v2 0/8] arm64: dts: imx8: create common imx-pcie[0,1]-ep
 overlay file
Message-ID: <aAr96tBdflbAyKSb@dragon>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
X-CM-TRANSID: Mc8vCgD3zEXr_QpoCyPbAw--.5525S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kr4fuF1rXFy7Xry7try3twb_yoWxGFg_Cr
	45Wa1kJ347Jw4fJ345A3ZxuFy2g345Z3y5Wry8Xwsa93WfZFWYvr4kJr1rW3WUCF13Xw4D
	CFn8Xw1xXw4rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08cTPUUUUU==
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARs6ZWgK0Y3JqQAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_201407_914058_560AF663 
X-CRM114-Status: UNSURE (   6.54  )
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

On Wed, Apr 23, 2025 at 08:41:22PM -0400, Frank Li wrote:
> Frank Li (8):
>       arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all chips
>       arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
>       arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label
>       arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function
>       arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files
>       arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overlay file
>       arm64: dts: imx8mq: add pcie0-ep node
>       arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes

Applied all, thanks!


