Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD46CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcHgwG1umZziWxLp8w9eGy5YxpmQ5JmqA/xiQqJwoVU=; b=4nwok0aWQuNoJRRtYPUgQWiwX/
	n4RFIpUv/iNmjh7RAXxhr5Aln3J6YsU0XWNUVz8pWvEFA4lBDvroVJJHNi7lbQejFJmF4HmH8I7VR
	r3NUIVivjEwoC+2ZX3//xQMjPP07vG3Yrs5YDuW40hwfUmig3/jKsu8fF5eljZ4AISTweQN+yb53J
	YcPWoCFCHTq43RIbD01Ez/VICKg8/x9VA2+TbI5Y00Bd9CHZJUI7bcLH6KMzmK5k3kqEri1GLxtZC
	s2Y7H5gNPOelTSZn2rkHu3nsr8b/ngqeVSapDgdsp6LbJNnNOy1yA9j6pDlL3Vrw/LwybPf96TjYi
	SWYw+RjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtwi-00000005Nll-1YMR;
	Tue, 09 Jun 2026 10:44:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtwh-00000005Nla-1boc;
	Tue, 09 Jun 2026 10:44:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA57143AE0;
	Tue,  9 Jun 2026 10:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897611F00893;
	Tue,  9 Jun 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001874;
	bh=YcHgwG1umZziWxLp8w9eGy5YxpmQ5JmqA/xiQqJwoVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZxKk0NhAgfC/rpnNb9meaPbJtZFwLJ5gf8rVMBOfcs8Lz4+ny5LbnR1C32wMv0Fq9
	 rpFGYzqmC0mbJvq9bCY2oTghknuJKeowtymkV9m4jOdgIDXWuneLLhlsdiYcuVBKra
	 SUL4muoYrnZLpsI1j1Aqdla1mIFnRMiSbbCRqtZoxFVBuQR3hYzpA4SZdOlCUHPysl
	 4EGOMcAZBjTZkWTMuxQ+tIzzRFc2jyOLvCgxO9JkW7eq5IAzn8sfP0oOgvpAt6y4eY
	 kg3en7ThRCNS2/MPRxBHRi75ttjhGyYFZuve8gfwZtSizZdJJN936N5q9QQWV6MMq/
	 lkKGU/e5rPghQ==
Date: Tue, 9 Jun 2026 12:44:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.2
Message-ID: <20260609-innocent-durable-dinosaur-b11dcd@quoll>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
 <20260601091225.5223-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601091225.5223-2-angelogioacchino.delregno@collabora.com>
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

On Mon, Jun 01, 2026 at 11:12:21AM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.2
> 
> for you to fetch changes up to ba6afff1d9b70028a5fc3df2d3acbee501c20a53:
> 
>   arm: dts: mediatek: mt8135: fix pinctrl node name (2026-05-11 11:39:02 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


