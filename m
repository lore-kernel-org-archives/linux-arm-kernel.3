Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6423ACA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBZu3H0Bx6rtd/133+q6MGFZh6JR1+IEl9gcErsM3o0=; b=lPdaxElXxwDW/XHjPLk6TCOxCy
	qZsdXzcLpdlA2BhBSqNEcnJXeiT21LlrYZos/xunno3VkXNO+kYxYZGhLQzi9Inx2gjwOlrmzyDfm
	aYskag09F/sMgMSXqIhDSFuYldkgcQr66crCY5IFRWekkxkOz2zjqDr83pylBVyrd2DaRrE85UNIv
	x+NuCDLcpoKhrPnLvttqWq8SpYVghKVQtIYvbzZb2mN0zdlyvIEh3zeJD8Q28fodYavzIaTkuLajI
	Cyok0gLFtq9SkMIBzAX/NLSd+Y2xzhqMDfbCF3C9Td6qHK29VmTf6GeUPWSv6f0admlWXUh8Xpa8V
	A8KOsxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoU-0000000G9br-01dP;
	Mon, 05 Oct 2026 10:20:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoS-0000000G9as-2b9q;
	Mon, 05 Oct 2026 10:20:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1446B60A7F;
	Mon,  5 Oct 2026 10:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADC41F000FF;
	Mon,  5 Oct 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195651;
	bh=BBZu3H0Bx6rtd/133+q6MGFZh6JR1+IEl9gcErsM3o0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YA7pMzaNehf2X3TgCxFjiGYJ0RwhihrvMCma8vPnk7RhGH7AW3mNejHHBHFDHDygG
	 kLVoFtnxBgPRAqIgsaIQilj+UyrfNTPMKJ/Ru5Why5puNFxN19X96OmlAZsOus8SGY
	 1VAmmxrtoQxBtd4khvhKfiDh9BVJ+vbW4VWYdOiKfQ3U/DWy6MkpmCJlYRhzmQf7Xk
	 u7PATVwyADCqeDmRt806why6ke38dmb2lTQpruToK2nCchYlNK0F7hnBKm7Inkji/U
	 VOoEzP5hye/p/kLz6kNE/DF3a1yBq9N/de4QqJDFGqCP2Kt/hFsfkRpigZN2NT720t
	 t4PWXR7HFnFog==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Message-Id: <179119564860.316652.15464320957974464041.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 15 Sep 2026 12:10:20 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v4:
>  - Mentioned MT6991 in the commit description for commit 2 (Mani)
>  - Added comment to clarify that if one calibration is missing, no
>    calibration should be trusted
>  - Changed Kconfig to mention module build (Mani)
>  - Changed header comment to add "Author" and change indentation (Mani)
>  - Moved cktx_impsel, tx_impsel to the top (Mani)
>  - Added pm_runtime_no_callbacks() call (Mani)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
      commit: c5e6a552846b253294d0b37f447aeea20c1938a1
[2/2] phy: mediatek: Add support for PCI-Express Gen4 S-PHY
      commit: e9434ed4effaf46351fce729380d3c8d7d918f20

Best regards,
-- 
~Vinod



