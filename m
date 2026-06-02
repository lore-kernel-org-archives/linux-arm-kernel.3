Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65138CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYHYysqppdiy+0C79in3LcRu0+DMcwMDrDw+rHUi7xc=; b=lTq3Hwd9Zuy/0XmCSE9W+LLGuq
	KtiGlGFNhYe4ufpZm+HaHivN/veY2UOACTQ7a4u+UQNRltTijRslGait3WdufaAiaTZVv8YdU5A+L
	wUe6n6yFfYNoR83hMd4D8ym8mqQmINYdxtVRmfbe14Lff8RXlfN/HEb66ACzz7V3REQ5xPnyXx7CF
	q+tw0B9L8Y7Q5K6jHh80rnYzduKSwACkcvhoIW2RZYQsdBbqxZgp1TCFrvjyeaW8rHQTqPKTW+mjA
	K1lJ7M9XBFvYVRJ+GrgrIjLvZv/GoAN88qG+G7uYSaKMnHXrhr8QHmz9KtSCG2jqJ+xw2/hMKgetc
	eucrFvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUT2u-0000000Db2F-018F;
	Tue, 02 Jun 2026 17:36:56 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUT2r-0000000Db11-0GsZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:36:54 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E1C551D001C7;
	Tue,  2 Jun 2026 13:36:51 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 02 Jun 2026 13:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780421811;
	 x=1780508211; bh=NYHYysqppdiy+0C79in3LcRu0+DMcwMDrDw+rHUi7xc=; b=
	IdIEkmVLs0WYQjCtE4cWIYhom/vubGVDQmPVsWy+WsB9jEOZ5V/+3P3J1V4jV3vZ
	d6HBNRNgpwAutLCD4CO8m2mxHRIR06R9peBpZK1yV1KoQOenG38wc5wa2j9BJyNg
	ODjQ5x6RV7rT7mD7ymBpL2arI9obBh70cO3qZVIvVaYSs/O9osk/xSC3ywNog9me
	5dZO2FLR4WD1pbEC/25oYvVZWL/NAH6iDhFLfVqjT36cMh/IKxBF2bgNdfLWPP7s
	/49WtOX8AyljnTV1lyne6+h5szOjWZo05L84KB1HwRgUXGPN+sYFQ/pGOra6U/8r
	Ntba8OeGQmz7ECDP+huI5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780421811; x=
	1780508211; bh=NYHYysqppdiy+0C79in3LcRu0+DMcwMDrDw+rHUi7xc=; b=g
	8GkeDGbT8R1grKT7kUn8zPgCWqtO/DT6Bhm2MdZqlbT3aoQt16rZphGMP8HYYLse
	wlFzX7chdYyS763iw8+AYxULev4kZ6P5rwqA0tPlWRr0YX2r3lLbldOUNU0ztPyk
	q13yXz3pDAuZooDUauxsFfeeJJ9tM1J6T+qQctxGoAK877Llflk7fyuOlOPgBckr
	26hyXrdbjH5tly4s6WdfNhHaNUdpR1bXtjVXqj13N7ebTTW6WyPRxsHmhKTCHsRI
	77fCMGEmQiV0di9AtsLK4inN7yVKfn74NrZz+XL+iUx+/qF0I/KKdx7joRBjrgiL
	qXDS0T1Gjhn2EI06LeH6g==
X-ME-Sender: <xms:sxQfaipblXE4Eq2aXLsl0hXpXPGPA8P1jbOBQrVHiGf7r1Itu7JRGQ>
    <xme:sxQfardgxt6pMgDTe4fd-zpqxNkIXBK58deZvv0lMSY-y1wyD-3YSiwef5IbftnsF
    3zmzYTiMxSLlbi4Ivi5L8iyD1CS56wDLZJNsG4UQinVwYtG1VNgfBFh>
X-ME-Proxy-Cause: dmFkZTEgxIPPHILuLEuAopiSr+Qmcyw4pb55DsBJ5PhNektQUO4GR5iC0IdHd72dMUwmZn
    S1csBobcgSvaIQyA2ppcCLjdZv5vittOcgklQGjLrdupmNwPjEICIKStOlu55b2I7NJrOk
    Hp71apCqA6p6iFZHliu2sJvFmMIZovPzvnyvAuFnia1TkhfG/X2Y6VZc/IJSB7GCpU6j7v
    9CCmHwvolO32kjRCE6h2f2lqgaG5TYrT8teX4Nzj7pAW51nLGNe126D2MY8ikgxOVNeQ+D
    xanHXt6qkIpYwJyq62Q49YduUVFY4t0We8F2/HqekyXLQLbh/bBhXtejq3VLc0BXl+giN6
    7Nh3jY2M+v3cRw24NDoWrw8peUuPWAszqjayMbMnu03JmrYCYA/ACwHm2RZHBW6Ke572Bf
    aYdCU1Jtx1RxdDagufPve8Q82VphPK4c/723+ordLj9C7cIrnEVkdWe1cIQPPZKbQeuEoI
    MS65a0X0I7hjf2qhKJj4VdNSJsz6PNspwYz3dYVWf7WF86nLDtsJ6mE2Zzlso2PvFj0zbl
    o7XHuUAqqW0Qd/0NKXe5K9UcobBgHKV55AuAPnIQzpreyu9TGauwxPztCxEno3tr+6aKLK
    l2S0jl//v9T+7EvtU3B+Ah2qGqlk1FztQsPsj3bDoT+xm1iaJ3LSSERohIWA
X-ME-Proxy: <xmx:sxQfasVSjHC9nwmyP41RSeJnZgYhep7nWb7BzTXHziNw--UAz9XiEg>
    <xmx:sxQfanci5TxqgQx57n9OTRmfRpvDfwml9MxqMmKivXnzPPZhNEXMTQ>
    <xmx:sxQfaospTWWbHJ4Q0NDOxYVDX9QdVTkt-2syEjTZT0betqqHPOG35g>
    <xmx:sxQfam-88tD7s6EM9YcBE96eiwspOVWd9YIS2S0rvGj0jtOxCa64aw>
    <xmx:sxQfaisC3P3j-A26tX_libse7r_cin0qL0n-fjbvs_hCVzw9UPbAXt9T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7954B182007A; Tue,  2 Jun 2026 13:36:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcNZTq_C4ItF
Date: Tue, 02 Jun 2026 19:36:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <a4a9e96c-b4de-4c59-b6ca-6dd1d0398ca7@app.fastmail.com>
In-Reply-To: <CAHk-=wj=uJU0PFrRjqTuOKcYnN92V0FXyn_v+x7c6rWhLoJi=w@mail.gmail.com>
References: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
 <CAHk-=wj=uJU0PFrRjqTuOKcYnN92V0FXyn_v+x7c6rWhLoJi=w@mail.gmail.com>
Subject: Re: [GIT PULL] soc: fixes for 7.1, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_103653_149723_CE50A897 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 2, 2026, at 19:29, Linus Torvalds wrote:
> On Tue, 2 Jun 2026 at 01:03, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2
>
> That is indeed a tag - but just a bare one, not a signed one. Please
> do make proper signed tags for me to pull..

Sorry about that. I pushed a signed tag with the same contents now.

      Arnd

