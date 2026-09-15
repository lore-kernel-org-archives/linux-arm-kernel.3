Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D84C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eU+QyDuRh8rn3c7grMKH5arPf7g3bSGEarn06XP+mVs=; b=KLcF/ZZw9LNwp3U0eNhfa/JXYG
	q6maIhy7CDh7IcWH50MqPsdTplAodDxWAJ347TxNGDDlwAj7efpiFdwG+JRQS+B6RU+ffmqdyscwT
	gjq0GW4ONui/g3TgLgep8o6OrJ31E+Zr+kmvSX8RCCKhhSyN8O7TPrLB8LljizNifsAjWPTBliO6n
	WX9IV0H5gEBd2aCBLIrDEq63uE1imeR1K3dEOCONubP9OFxXytFbM4k0TdpWwbPEz48ROT2mX8EJh
	lJ6OyrQrIfGhjBzLoyIbO6DvscdEMVUmv46xcI6ifYswb0+GVkXld47B+d6qdoLAySUZiUOhb+egb
	A26m+OaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X5G-00000007bh5-2zaq;
	Tue, 15 Sep 2026 17:36:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X5F-00000007bgZ-0HLV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:36:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FBFB602BE;
	Tue, 15 Sep 2026 17:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4DC1F000FF;
	Tue, 15 Sep 2026 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493799;
	bh=eU+QyDuRh8rn3c7grMKH5arPf7g3bSGEarn06XP+mVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z3aNArZzqdTtvCK/RTJ427HuAB1eIEq2M1RjXoTT0sMvZhoeGiFGAcm1YLR6h4lUG
	 W/sIXfqynspCqzH1sQ9JtVcPK4OgxHQUBWdwfKFKh5OWTNu6d3Ao87IjkzY8q9b/YN
	 nU7HgD4lcQfe6MAqLLXsBIgCb48N8nzcYFS3c8d82oTko9pFHsjsnAv70ESvCVckgQ
	 77nRRT/3iZJQUZKSSV70MfEg7OOLgS+k8t92G5jvsy748MK0QjbsbbpHWEGO0InYnA
	 A8x0kFW04Wa5HVbFbC0GgVNff0l9AKl9W1oGThDiPemx9xVd4GWd/8YzKkeZKleVMk
	 OL3Lx+4Qvzz4g==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260913194804.39939-1-rosenp@gmail.com>
References: <20260913194804.39939-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: make gen_bd init helpers static
Message-Id: <178949379734.248239.352418063118190567.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:37 +0530
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


On Sun, 13 Sep 2026 12:48:04 -0700, Rosen Penev wrote:
> bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
> the PSC wrapper functions in gen_bd.c, so make them static, drop
> their now-unneeded exports, and remove the corresponding header
> declarations.
> 
> These had use before commit 7d3ee229ea51
> ("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: make gen_bd init helpers static
      commit: 1ff9bed1b5547259f67e58b03a83eda934d78735

Best regards,
-- 
~Vinod



