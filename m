Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3D9F5A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9Xg9obUfBWc0Jfz2hi3S0O9X2O9shbr+J8WdWbUYlM=; b=Q8MS3ZeQBXbaII32jrAUiAOAFx
	Fv9Kk80XzA8GvffqKeoxsRtdGdWQwjPnsNZsztc8j30CWtk/MGPZ2HtgPuzL83du3Df6dHied5m6N
	p/I8UW2/9xviHZpAUrRXlcY9Ah+dXQgHVzbJYM1eKgUPcUMwzE1x4hoPBD5FMdjnSELkKs2VwUWuf
	sf0bbb5A+o3Nb068Ob4BRf30xB95fVfS3Azer49Owc1DL+izRZmCVRdDZPC1eHz+H2qonz4edcHoi
	EmuWB18lpeO2uz4H+i/A1WRUrEwEGvIOr3qMHjRX/fTGR5JmsQ0HgOuB17TWHumoDCnCC8WI66h/D
	DaHDaNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsHO-00000007U1G-2eTy;
	Mon, 20 Apr 2026 17:19:26 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsHL-00000007U0p-1R66;
	Mon, 20 Apr 2026 17:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=a9Xg9obUfBWc0Jfz2hi3S0O9X2O9shbr+J8WdWbUYlM=; b=DtGipo5zQuAgxrVkU3Ovu9jrWS
	Xp7ARurRPAjgjxcTF30RUGQHoLl8TtrRQ1HM4ifA/Nj0GvyBF8VxMp+iET7OZO2C3nNEd0neabb/5
	XNg+6IivARfkkdt2TJT2TsOTbjSmXwR/qsDnmIITwACjA2lVY0DboSK8iNMUyil5OjrQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wEsHE-0000000041P-1nGn;
	Mon, 20 Apr 2026 13:19:16 -0400
Date: Mon, 20 Apr 2026 13:19:15 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-Id: <20260420131915.9f3eb48e09d403dbeab27639@hugovil.com>
In-Reply-To: <aeZe7XoDbOMqMG_c@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
	<20260312180304.3865850-5-hugo@hugovil.com>
	<aeWtDA7snjJmiF9K@google.com>
	<20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
	<aeZe7XoDbOMqMG_c@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_101923_407365_188CB5EA 
X-CRM114-Status: GOOD (  13.62  )
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

On Mon, 20 Apr 2026 10:16:02 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Mon, Apr 20, 2026 at 11:01:59AM -0400, Hugo Villeneuve wrote:
> > I tested it on the real hardware and all is good.
> 
> Thank you for testing the changes.
> 
> > 
> > So I imagine that it can still go into 7.1 since it is a new driver
> > and not a modification of an existing one?
> 
> Yes, since this is a new driver I will include it in 7.1 pull request.
> 
> Thanks.

Great, thank you.

-- 
Hugo Villeneuve

