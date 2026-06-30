Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E49DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v425l5fGaj5j3I5wHq/+1EGFejZvpbEqVqanXS2RMfc=; b=IVIre0+n9gW71X14XdyW1yau0A
	d3QhcAEwVJbAkSRG3cfTbm5n9n3/tsljBw8ye5Vscy7PJ/9zPJ4cUODn4s8GWhSRNfH4x3cfj+jwe
	LXY6DQbynjn88cGpoT/VgsjaL0pWnifCty+fZtNHBBJfPNbGuh2Mdhrg38vuczJ17QAj5q2omEH5V
	u+c+mUT8Lt2Q7lDmECHsm9/1Bz6GaoBZ1p3qVlGuwd3OKWE1BgP7Fd1CbK37e1fDtwKfgesmz8A41
	wP2OA6/9SymdNNpS5vgEt7XZ9gIcLg4C/bRWRrI3hWNShl+Pj1W8HVtAIt7ebrb5g/V1qi8ueSvIp
	NK2BfA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webbg-0000000HWI2-2v8m;
	Tue, 30 Jun 2026 16:46:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webbg-0000000HWHt-05Yh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5856B600BB;
	Tue, 30 Jun 2026 16:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6301F000E9;
	Tue, 30 Jun 2026 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782838003;
	bh=v425l5fGaj5j3I5wHq/+1EGFejZvpbEqVqanXS2RMfc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KxSALCyI629JukeKdtSpTRRt+ptM+WSKSHF4DmjwoJNbE+l2cDMsWaMYW/ZEpvbvq
	 FQXXIvsyUxvGkxzjVV9UrPS+ppNeWPKdpOpSd2Xrkp1GLGAD82q2qcmmFZneTGSwIA
	 qnK6+V86ziQ61Uen9obJHFRyqBe3P17tpdeNubPgw01u1GmJxB4/qzZaqghgsyHtpf
	 6iF9W8Dn5fFF2qrq8VXq3nrajWsCcOuYieuHq2XqPs3wLAIjUfmDXbbgJTKrlF9Fmv
	 fjtoH+yEdn6jMoXDiRMe8euNkN8tvrMDW1gmFFvtchWdMza/wzNqNipeGh97nTxLof
	 xwiCREXuF5zdA==
From: Thomas Gleixner <tglx@kernel.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shikemeng@huaweicloud.com
Subject: Re: [PATCH v3 5/6] irqchip/gic-v3-its: some minor improvement in
 comments
In-Reply-To: <20260623020135.3584-6-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
 <20260623020135.3584-6-shikemeng@huaweicloud.com>
Date: Tue, 30 Jun 2026 18:46:40 +0200
Message-ID: <87wlvgou1b.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Jun 23 2026 at 10:01, Kemeng Shi wrote:

> 1. "If it some" -> "If some"
> 2. "by table by reading" -> by reading"
> 3. "reading bit at offset '62'" -> "reading GITS_BASER_INDIRECT"

Please don't enumerate WHAT the patch is doing. We all can see that from
the patch itself.

Something like that is sufficient and clear enough:

  'Fix grammar and replace a bit number with the symbol for better
   readability'


