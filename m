Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE9BCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=EZJUP51WU4iJZaVKheW9YmUEnO
	NoSYBmHggy5oMu2Dwv2HLUfZte3oD8FDgkcoCVkhDVAZ6DzBiG0JEAnwMRa84Q1KNBTqViS+vP8ha
	ThVT8u1pezUlXxew5CvsCc585hbPnQUQ8xhqFCGHZ6glpP3Hz4pa1HFhplXxRj/Mrp1IN3/R5NgvW
	fi9PQ5cSveBjqS1aQs6mSh6At94up7aYBZW174WItm2pf1wRLuXmuQKZmD79+KP4eI46oRMAULQjc
	4TO7yQ7LHeqMmkR19j71xj0q/8L4UdnsMM1oVkzJdxM4CSSJuh8giyTsKUGaxCFOP17NneyrwClSA
	9CYhsk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWdc-00000002yU1-1BqJ;
	Wed, 07 Oct 2026 18:45:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWda-00000002yTi-0AqO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:45:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57DD143E0D;
	Wed,  7 Oct 2026 18:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A351F000FF;
	Wed,  7 Oct 2026 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791398709;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bk8TGR3C0vT/A4vcYA5XqVzKi7dpkyNLedsQS/yg6GGWPNAkFA5BNxA4i95JMeED/
	 BtOBTeInt4zRTlHtTNobHgZc2WnWin6ZhJBI7wxW90sIqjNKyiiVR5tDUpNm5utTNq
	 10sLCsYjdWggFwqQtYUxixMVHUTI1YUdotD3ydMqIhwEYDXNQbNXJDSBoTOrATcshm
	 wpAeiDnIcZVnWrW67XEJD7VRQ9f3/lwApnRh4jvpngVg/COR/AW6253McfjZmtkACs
	 1wD7Mxq+5qmwNhojhP5Cvwkjlkk41PIZFE/2vMIrf5Ev+rE7mmKD0Fh2NAfqOVtbny
	 vY1fhrYvN2Axw==
From: netdev-bot+sinfo@kernel.org
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
 Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
 Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: enable L2 split header support
Date: Wed, 07 Oct 2026 18:45:07 +0000
Message-ID: <179139870780.2527009.10360336120395360082@kernel.org>
In-Reply-To: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
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

