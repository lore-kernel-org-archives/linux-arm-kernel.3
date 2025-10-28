Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89C8CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bK3jiDst9EuMzVRY6Pg60RWEks+MLAKHwEmu72HbS8=; b=Ff/ryBuZlDxoBNM8VGKhxN1fDA
	Uoj8Di8NBLEzo0mIOpswtAd94WWKw4JLUFH3bmRQvm2NbQLOsd2U+oiH4qSgGb2So7hqVDknKwbfc
	M/ozY+KxUmxoyh4h6tfDRlw0ecsIEhGjzoXqqjJ1x3L0Fz7ITVz9KzvOIaYkjHEaBYApZFLU7D7DX
	5RQ+udV33nCqKBdRLT17gqTupP2dBYZUIQhijPw5Fnm9n99WylUc+l+niIRLzU9c9PO8FYE9yo55y
	b1yHDYrVqaA1yDt/6B7S0szH4FCmXY0AEi1GFOJy2YkWjyO81qw5VJsxLDys7qxQPhOweBnH5fVOy
	tU+RooWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfX9-0000000FaTK-1Pkz;
	Tue, 28 Oct 2025 08:58:27 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfX6-0000000FaSk-1wOP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 08:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9bK3jiDst9EuMzVRY6Pg60RWEks+MLAKHwEmu72HbS8=;
	b=V+lOghLh5Yppr8qc0mSRZOKZ/ACHLi4IuqKbExuzl9Euk3xTKOmGEdldK0M7lu
	7lLVWkzbx9XPna/o4nWCjlG7aEMKoALvpEO7pqlNUu1Dv+VwnYzr+MTe4E1MtEKV
	38HN1frJ2LhoMN+jqTx6aTL29+urqAUHP6feEeSUrRGXQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3zxWOhQBpGivTAA--.44629S3;
	Tue, 28 Oct 2025 16:57:52 +0800 (CST)
Date: Tue, 28 Oct 2025 16:57:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bjorn.andersson@oss.qualcomm.com, imx@lists.linux.dev,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v5 4/4] arm64: dts: layerscape: add dma-coherent for usb
 node
Message-ID: <aQCFjuyMCTM9qQcd@dragon>
References: <20250929-ls_dma_coherence-v5-0-2ebee578eb7e@nxp.com>
 <20250929-ls_dma_coherence-v5-4-2ebee578eb7e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-ls_dma_coherence-v5-4-2ebee578eb7e@nxp.com>
X-CM-TRANSID: Ms8vCgB3zxWOhQBpGivTAA--.44629S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwmiiUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBDfRWkAhZCs7wAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_015824_898072_59386E4F 
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

On Mon, Sep 29, 2025 at 10:24:17AM -0400, Frank Li wrote:
> Add SOC special compatible string, remove fallback snps,dwc3 to let flatten
> dwc3-layerscape driver to be probed and enable dma-coherence for usb node
> since commit add layerscape dwc3 support, which set correct gsbustcfg0
> value.
> 
> Add iommus property to run at old uboot, which use fixup add iommus by
> check compatible string snsp,dwc3 compatible string.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


