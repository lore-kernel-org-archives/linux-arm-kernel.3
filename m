Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC4ACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=Rc8NTwa1m6zX5jHqmIxvL7GR0R
	ObxCsl4OM+j5MwBU51x5Q6MAlMpMX/+yvbJIZzbDFSAd/l0/GoK0zPll4lI0g8lSaVzN6cjpXZC08
	JpCpjNJIOaXw918mtw8yDtbr7UkT6u5p7U4VPpW8rUL9xluMr4E+ViT+EeCTdgkaLF/sY2wIzhvLh
	jFbB5Q8bCYFeJ1jRfI6mjn7YSZx1skMZ0D0rWL0JsWjGXMhGFejif1+ieKF8BCfiyOgBmFvSDfETT
	YCy5PjetC8+bHzZFTzqm2TL+VdfoI1bpJD6S+ZR4IZiIwERmpkPqtVefh79UA3FEuZfnNlk6BopEU
	yKLAAogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDL1F-0000000EmHK-0MqU;
	Sun, 04 Oct 2026 12:08:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDL1E-0000000EmGz-0WZD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:08:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A184A6020C;
	Sun,  4 Oct 2026 12:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE9F1F000FF;
	Sun,  4 Oct 2026 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791115717;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NZutm8njI2v7VK97N07h9qgy6qxGWip/seTajVlknDy/BU9gYfcU7gmqE1Kqh4wJm
	 xtQxupntjNEcw45lswEWMoouzK7ejY3tvI5ggyLbn5GjfgRVwde6L+IaoudsZo7RTN
	 Yn1scpQiLTS2BIWuH1qE04RuDuJ+/AAlEw0y/ie1FJc8AaTHWdncvVs3gcb3CddXUo
	 Q90g6UXVH6WwD8oPf/mR/oOkZ2ogR+TR2fl//PrAnbgLRd9VzcT+nf5DOxwT2SaOuG
	 3AtPvNWx+/+avJLf4/1fzzo10l4tINCJYV5VurRwcIySeH3PFm+FilezYAy8minmz+
	 vnqtBmXuZm/iQ==
From: netdev-bot+sinfo@kernel.org
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 maxime.chevallier@bootlin.com, muhammad.nazim.amirul.nazle.asmade@altera.com,
 rohan.g.thomas@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v7 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
Date: Sun, 04 Oct 2026 12:08:36 +0000
Message-ID: <179111571610.1402591.377888819234151971@kernel.org>
In-Reply-To: <20261004120526.2728564-1-zxyan0222@gmail.com>
References: <20261004120526.2728564-1-zxyan0222@gmail.com>
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

