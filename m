Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F233CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dpJixL1oHRcv/3jNzfC2XXZ+aqq6CYkmZdArMOuDoY=; b=rjvxtKaA3i3GIAVaFfqEPCY2eX
	4Ef/sIZxCcoiO0Xru5/4+0ONFFI1qbakSEgcVWzcjgfCKvaXek7tcIsjjJBj2ofXt8qzltEDquIAq
	Km7k4MztTPto5P7h2ecalqf7Vh3BHUbYKWbBZJKfsuXv7kC5WBeGydtpmRm9EOLdNI9an5T8oNfp+
	0PirUDU82voeP4r8wcQ5yYI+tObqG0++tuueII8Hg90zaTzby9Y/Z3r/ewQDD8UBRcAoEvmr8IXqO
	EdJy3/IFQf86bEJ2Vm8AYtO07wI7BETfQeZHqErwbid6eypZdeipg4lrayAhfBscVyFaJWyrLOZXP
	40BwHc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iQ-00000008AOt-11CL;
	Mon, 18 Aug 2025 17:32:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1oR-00000007vJ4-418N;
	Mon, 18 Aug 2025 15:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B027440CF;
	Mon, 18 Aug 2025 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5706C113D0;
	Mon, 18 Aug 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755531007;
	bh=0dpJixL1oHRcv/3jNzfC2XXZ+aqq6CYkmZdArMOuDoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TUiYRhv3OxN9v2yoois/MTIq1RAg66QbGVeqXLXRna6GBPLoitAfU5+gXIHywbugf
	 X00aRZagGj9JZAY1UHWYYLwyOEvGPaEDCXSjxOUFCZGppHCl7aMFZJAad4zXTPM60L
	 xbWShtgAz0mK/6jJ3KdipPypAdeKan6efrcwQQmg4X3T3kv6Gt3/SvT8MuB4eQxdo8
	 QDfRYPP2/DNbE2/jpeCouKXiUG2VlioTTVLH2uiay+gJXqJd4ket+v10VHMyy+J8wv
	 wZkV/l6S+UjE0cCmmxpqSVeeggjFJpsG041Sc40Piu+wxpBaoLWkX54tO2/f/Tmwqt
	 ONoyPbr4UUJXg==
Date: Mon, 18 Aug 2025 08:30:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: patchwork-bot+netdevbpf@kernel.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, djakov@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johnson.wang@mediatek.com,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, daniel@makrotopia.org, lorenzo@kernel.org,
 nbd@nbd.name, frank-w@public-files.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 00/13] further mt7988 devicetree work
Message-ID: <20250818083006.0f277b5b@kernel.org>
In-Reply-To: <8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de>
	<175218542224.1682269.17523198222056896163.git-patchwork-notify@kernel.org>
	<8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_083020_020898_777D6CC1 
X-CRM114-Status: UNSURE (   7.03  )
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

On Sat, 16 Aug 2025 08:55:51 +0200 Frank Wunderlich wrote:
> Any comments on the missing DTS parts or can they applied too?

You should probably put the maintainers you're addressing this question
to in the To: header of the email.

