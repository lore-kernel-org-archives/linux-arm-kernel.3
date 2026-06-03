Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F65CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUbArMhatRkOlmiQUjI9Tf31kJ/6pDUsEK5wihs/FxQ=; b=Th4+yPX35qUQGoPZFhdNJ8flxS
	bfs59QH/PMyY5YLjl7Zd6ly+8ATun0EeQm5sy8m8Cjdfhh5CjbwIJDwbegHa+n0uFwa3u/HkI/+3I
	vYxNZZrpnpN4S3kGYX1ozteo3Jawu+rC7V1bXEjNWQgwyl9+s5tChGFYX57QFNaAIRwbIaautIJpj
	hBi2rt4kfVvFJ/rNO9LGddNevQ0wZIO0sL6p7Giw1Nrm0vYgPE3hZJEn1XiWE2GdtuHXf4Lmn7S0r
	KdkbWOHaGicQPX3zbqKXBY3C0HH/nYOWyniyBgC9A78cTR2OuaG/rGDrXyrvqjDYB9V8DTt/gMVDC
	q1CP2JaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnTv-0000000FPp2-41Jn;
	Wed, 03 Jun 2026 15:26:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnTt-0000000FPoV-2KKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:26:10 +0000
Date: Wed, 3 Jun 2026 17:26:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780500365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUbArMhatRkOlmiQUjI9Tf31kJ/6pDUsEK5wihs/FxQ=;
	b=PD0cQEmeE7cRnI4TGMBwLATUn0Wpc2HlOAAmRmkvN9v2jSSEU+ONmtinEWC55tNXZi2RKC
	NNUl/goguJx55G9f0HaHcCsmrvodbkPJ3KlfjiUJyBdXFEUbMsp6e7Cr0vlJ14VjeGME3r
	E7iLpSd84Y7Onx97sgYEHY94tEuNvxGPCuXIH895uvZL+JiiKvF8NvAswZ3C7Hqvczwsmh
	OiQa0FgfQcM8CUf+9p53KDY5bBNz/y9wUg99ayTaMUFzqrAv4sTih0G2dwCfnA/zyaoNKT
	qqUGdGIC7zHEnz9vGEs5gM7PGIOkllN5P47ZMPydsBDu+dFspYbwzF2SSl9Xag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780500365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUbArMhatRkOlmiQUjI9Tf31kJ/6pDUsEK5wihs/FxQ=;
	b=+ft5H0B0zB+qvZsgCto8fK+SXf9/FfUhkyg47hx5xXf3vywr0IhNxkux96Y3KdwbQ5kv0e
	7MqVVWsALoFikbCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox
 into the threaded handler
Message-ID: <20260603152604.lBbXa3sE@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
 <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
 <20260603132034.NxZoA4pH@linutronix.de>
 <944c6eaa-05f2-437a-88e7-1573b64468c5@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <944c6eaa-05f2-437a-88e7-1573b64468c5@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_082609_749764_2B49DC85 
X-CRM114-Status: GOOD (  12.97  )
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

On 2026-06-03 16:45:16 [+0300], Daniel Baluta wrote:
> I would prefer to add the explanation for this in at least one commit
> message to be there in git log.
> 
> Cover letter is not kept in git history.

You could merge is part of the series. But I could of course add the
rational behind this to the patch where I start adding the threaded
handler and move the TX bits.

I just finished of with sashiko. Do you have other human input?
Otherwise I would fix the one thing I did wrong, propagate the one error
sashiko mentioned. I'm not sure what to do about the long time outs it
complains about, I would keep them for now. That timeout check based on
jiffies is also odd.

Sebastian

