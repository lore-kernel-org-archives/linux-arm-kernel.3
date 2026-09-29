Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA61AC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=mQ0Zfx0Dn73fkRI3/v+NQa0WPj
	YtOjhaqFjD+T8Y/O2VxV0GinG+XMKTCNPp52WgEqi6jv3iIvTH2K6wWsOAJQIFoiTVfP32IL9UOkl
	lUJSSQ6Yq2jfD0uYC1duKthpzcSyVG8b/bDQtk6u77m4IlRzBSIe9MDwawdaRA5Y2ArMScdJWC/Kq
	ervmmf38+J4NbKL9q1TUVnYuug/QsUHKEo4QTJxgZrKYPSsNn/dNYMF4ZyAdVVVURR2haHi04LNYI
	19I2k6oP3imOloFSvLdGKa9ey9pnymlTJ/FEJ6j2+Uz4cGr5ftxuo1Fyp0gmrAa+V0lTLUj2XkSqa
	unHVwJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSQ7-00000002dc9-30Xw;
	Tue, 29 Sep 2026 07:38:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSQ6-00000002dbv-2cP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:38:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3120342436;
	Tue, 29 Sep 2026 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFD81F000FF;
	Tue, 29 Sep 2026 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790667514;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fcSU90Adnp98yCJypomf3WB79+psLhtiUWYQ2ZPgHod2TnBC7PWDOGjmnQJakhUnA
	 xehASfu9CifQ8FjnnBACDMXF5XgdZmQJ1pt1fH6lteSzXpnWCXHiW2wP0vQTahX0xA
	 lOcWZksHU/+kw2grns45lRdWhootoyjgQ5KPVP1gxcd8+DXiSXtkR9fMWypZRUKOkO
	 CRAco2xaK+0XYpkte8QBNJbdFlRizCSdtXC/qdPCNJGS2YoKoUiT9lN0E2FX9C0LDN
	 eFYJSafWvy91n4hZBfMvTI/7CA1UQsxMh65Jl2PIvZwnPtRUrLulCb9KYuG96/g3MW
	 RC03Gv2ud+eZA==
From: netdev-bot+sinfo@kernel.org
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 maxime.chevallier@bootlin.com, muhammad.nazim.amirul.nazle.asmade@altera.com,
 rohan.g.thomas@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
Date: Tue, 29 Sep 2026 07:38:32 +0000
Message-ID: <179066751275.31693.16105226302048502437@kernel.org>
In-Reply-To: <20260929073553.4136336-1-zxyan0222@gmail.com>
References: <20260929073553.4136336-1-zxyan0222@gmail.com>
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

