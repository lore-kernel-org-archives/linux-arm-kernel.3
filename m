Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6191BCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=2S1Uj2eYpT2OROKmFUwdZLPxBE
	KnLBZeIqmVZVh+FfUIhkhk409eZXwYm040DhZKsfWliSplAsfYNs3C34wgF2XPVSnyhQN+UftyOHv
	7WHGzeSkf2HgUHlKL46QFeM0zplsIiusrPMta0XhelNNtzjJtpgDUY4K5KuT/d+unXTvul+qCVEiJ
	w+gMXOO+lhBPrew63QUijWDwqZdotr1jNUEzvhoDbxN+CkXzGtO/7n0EMEesZQ+benEE2q9UcElqn
	R8WjJdL7Bld8C+jWmco1W8vnr4eEZoveC4h6AuuSFo65hSUTxhWQAMnG2o9sC8iglhimE8lcrfTtY
	fQlxzz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTIY-0000000BtBC-233L;
	Tue, 13 Oct 2026 03:35:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTIX-0000000BtB3-1h8e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C953143790;
	Tue, 13 Oct 2026 03:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30981F000FF;
	Tue, 13 Oct 2026 03:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791862528;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZs/kjZ7jcoKPf+cXcBgrB8NxAisaSe9ecoO8t6iqWXhdwLveEGgvOIguo6hW0OPm
	 SNAuZg4GhTTvMH+VyZTO86Wy+yL4Yylxn+gzejLPjqn404zIuD7eMoC+UIemNNvQLr
	 yQJpQbn6uQC/6/HcRJCxsM3jyp1VWlESvBt31H6ow81d0KUcWLnvf+UoFyGYMft4fI
	 DVZrKy/rJXChGPi95bjk0Qr9vUnRJSzQbZdyS//qDeNdhkSQefmkuuZ5MM5vKcz3e7
	 kZnlebzOIEGrrfUMCKLi/soMVLS5YZ6II9csoNf2s6WD88eHev7pr4bvdbAA7GTO8k
	 h5gJN06hHtC/Q==
From: netdev-bot+sinfo@kernel.org
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com,
 rohan.g.thomas@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v8 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
Date: Tue, 13 Oct 2026 03:35:27 +0000
Message-ID: <179186252726.2527009.521907325702590777@kernel.org>
In-Reply-To: <20261013033207.1684328-1-zxyan0222@gmail.com>
References: <20261013033207.1684328-1-zxyan0222@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

