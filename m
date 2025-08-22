Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536F8CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0H7eWI6XbSubtchLLYle5o/qTdCGwy3vl8S3tVMSUQ=; b=a1PxCr4h/bYpd3uAceWtdjmJTa
	IxX3F1oqJwJCy0bQ/6fnW5jv0WdXWerXFTIJRsjdk2eYp6oVd8ab4vLyWBUVsQeBA4TZBYdXmPoz1
	hnBn95eBkZ/w/6rIny3Ta9A8COiYghLdqjFX/WjIsaYhVCkWrfIZgqYHjLQwVvruc/VZJlWjymi/L
	1fwzNP6gcp9tligXUt91BRvmPKiFq/i6eqVj+GtFk+PyTIa+nZguDZuhniiYmp/YrZxpnHlI02u/S
	loIqR/EqYOBf0NtJJZZ2GGmW/sFLULg5HvBl15ugasxZVwF3L3+vIhN3asPlThKiQ8vd/PpNML91D
	5bjZFMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZbZ-00000003XnR-3nHo;
	Fri, 22 Aug 2025 21:47:25 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOEm-000000024aV-3PtO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=l0H7eWI6XbSubtchLLYle5o/qTdCGwy3vl8S3tVMSUQ=;
	b=UhkiRzGNmJIrB+P3HlxAvrgqc0kGw8nszom35do73cxuOA1dcPOL/afy2fJC10
	sis+r5O1wIRuwhAp0Kd0jKPmU8Q7xdObn8FlI9+RgDO/OB1aQXXpfRiPAg1d6w+f
	a374bxAQpt78c4ccAH6kkdf/4s6gSkSwtdFEgXQFk2a9k=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3tG6lOqhoRwwWAw--.12680S3;
	Fri, 22 Aug 2025 17:38:47 +0800 (CST)
Date: Fri, 22 Aug 2025 17:38:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/4] ARM: dts: vfxxx: rename nodename iomux to pinctrl
Message-ID: <aKg6pYNjxZvjkJq6@dragon>
References: <20250819-vfxxx_warning-v1-0-080930d8e1ea@nxp.com>
 <20250819-vfxxx_warning-v1-1-080930d8e1ea@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-vfxxx_warning-v1-1-080930d8e1ea@nxp.com>
X-CM-TRANSID: M88vCgD3tG6lOqhoRwwWAw--.12680S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAn8YmioOqkPXAAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023909_210349_47712A5C 
X-CRM114-Status: UNSURE (   7.18  )
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

On Tue, Aug 19, 2025 at 03:44:06PM -0400, Frank Li wrote:
> Rename nodename iomux to pinctrl to fix below warnings:
>   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> 	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Fabio beat you to this one ;)

Shawn


