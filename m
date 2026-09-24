Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97956C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 02:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7XbvKMmH4XnJA95W4aG0uSGr8///oHvo/2Qv5ZMyiU=; b=cHywZH1RnrQOtO7fLh/vA5CAlv
	CcjRWyxZEUk7A/8ePwWdMmCRQrHeSIX2VRgimtzvW9Xpk4gsa4tcp+vc8MgL36jmfUW0rX9414d/V
	e9n3i7fq7HFWeUULjh1xNsn6BiiM94nvU2hUvA3U990jl9f8UyHGpxnFWl/YqRzVEHKGig/8QW4UW
	0IrN/JglYrxEwliZiiIqRG1ncBwAOeUvxPNo9CbBQBC56igSXVACegdG9JEhwpRtfoPQxEKE3PKC2
	UXal713R6+CrP8fuTV0sf0stMPcBToLRugt7jAMBCyJ1wEhMo3p3mVzrUSKysELeGg9m+yvrOuQ7/
	Vgrpkrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZPO-00000009tEQ-2cHo;
	Thu, 24 Sep 2026 02:42:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZPN-00000009tE7-3XYl;
	Thu, 24 Sep 2026 02:42:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 351514477E;
	Thu, 24 Sep 2026 02:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A997F1F000FF;
	Thu, 24 Sep 2026 02:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790217721;
	bh=P7XbvKMmH4XnJA95W4aG0uSGr8///oHvo/2Qv5ZMyiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WveTC055i44OVEekAgscWWLflsQOelAgdxtNP/NTaT32BdM+0OstwmnjCzdYK1E7G
	 XrNGV8/fKf2Q6FcAIJLf1rnMOOOWDF/r96RKmAluv4DtyBEXIgpGCmN2u6oU+aRxUR
	 Yq+QJl1q46SCavln5tnf3wqKmucY9y+WGV/J9UwpZoCMU6eF3fiQ38EfefCOfc++mw
	 SLkigPAhD+tPr9U4l9NyeVBTU8wXIeqtRsY1yrSOogEGuG680yYG+GkCXQ0LXqLPHY
	 QY9iujeeRWYFdp8mCpoU2xPY50FyCOeRicKWTViphqts560LMCQNSIzyZPmE6R7iDs
	 3lLmd8vtZ5Q+Q==
Date: Wed, 23 Sep 2026 19:41:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: yangshiji66@outlook.com, netdev@vger.kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [net PATCH] net: ethernet: mediatek: only enable WED for ARM64
 architecture
Message-ID: <20260923194159.264ca04b@kernel.org>
In-Reply-To: <179009659284.2160803.2402786454793152027@kernel.org>
References: <179009659284.2160803.2402786454793152027@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 22 Sep 2026 17:03:12 +0000 netdev-bot+sashiko@kernel.org wrote:
> Is the Fixes: tag appropriate here?  The changelog does not describe a
> defect, only a hardware-scope observation and a prediction:
> 
>     Currently, only MT7622 and MT798x SoCs support WED features. They
>     are all ARM64 platforms. And it is unlikely that MediaTek will
>     release a new net chip based on ARM32 architecture in the future.
> 
> As far as I can tell nothing misbehaves on 32-bit today.

Not just the fixes tag, the whole commit seems rather pointless.
-- 
pw-bot: reject

