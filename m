Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62BDC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah7akZoMl1sujMBaEmjcTDpMpRFLs33NH0oQHW60O1Q=; b=uH/Qme6KOX84yp9FugYNjYZM7W
	dPofkm3F7QmeruVBwjIJp+zvqEYaynWPJZsD6zUtwua06q7JM4iJ3IOn1OPfPrB9I+RbO+K3DX3BM
	GOYervjdpO+7NFdEDlHLdzkwYCrWIG/JD3ZDXMIDSlw564EBC0CASjrDJ/g9rhaulevOa1XvTAfyC
	aVt+mWAlZ/gsngkG6aCP6A9Lz6xx5ZP1LXwzJ6xnD1SsoJ8GPXE6h1ZdO/eH+7yiEIRDThNP5TvjR
	V4nBJnYfI3h9TBrtmB7YUL2F9QS2IxGeGBHEqTW40Gze5qjnswEIiiCGfgKcMTOgGXBYI/mg50Pou
	f3kfDXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lTo-00000003SW5-0iuY;
	Mon, 21 Sep 2026 21:23:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lTk-00000003SV4-2PMh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:23:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 934194E40772;
	Mon, 21 Sep 2026 21:23:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3635F5FFB2;
	Mon, 21 Sep 2026 21:23:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89C7F10328621;
	Mon, 21 Sep 2026 23:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790025784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ah7akZoMl1sujMBaEmjcTDpMpRFLs33NH0oQHW60O1Q=;
	b=VWzy1U8RXTeRsPgYx51KGB2hi3riCE+J52BsnMPrj2TcQsGWc+C1ih6pHnnF3d6bkY4noA
	FVWCABixTqso4iYVob9JHrIjN6Gl/hNuCazocOYiU66AhG6sEBvcMb6YT6p1hsPQMaEZuT
	IYRVbi2Ui3w3vvfGm4zsjVjMxeBBfK563rn14JeGxitXzkLYTbY3b88wGOteoA2YtFaIas
	M4dkV56KG5n0a7RgoUNFFwI3TzB11GgDBTSIMbeyf6JpNo4Ybr/UO701yjZfAB4FhiphkP
	zXXanee1zJ1J7iz79ADs9mOdQGyN2BvH7A83Rocw5b3JTzbDXZ3SPqfJF9n2tw==
Date: Mon, 21 Sep 2026 23:23:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH v3 2/2] rtc: Add Raspberry Pi 5 RTC driver
Message-ID: <202609212123007fb25aae@mail.local>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-3-sander.speetjens@gmail.com>
 <20260918-outrageous-myrtle-giraffe-80dfdc@quoll>
 <20260921185949d6debd17@mail.local>
 <9dd42965-f39b-49e5-aeef-5d03647b2005@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dd42965-f39b-49e5-aeef-5d03647b2005@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_142312_758984_1770811A 
X-CRM114-Status: GOOD (  14.48  )
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

On 21/09/2026 21:36:27+0200, Sander Speetjens wrote:
> > This was my comment on the previous revision, I'm not sure why it was
> > ignored.
> Looks like that email got lost on my end, I found it in the archive.
> 
> > This undocumented sysfs interface has to be removed.
> Just to make sure I understand correctly: does "This undocumented
> sysfs interface has to be removed" mean that
>   a) the attributes themselves are not wanted and should be dropped, or
>   b) they are acceptable but must be properly documented under
>      Documentation/ABI/ before they can stay?
> 

This won't get in unless the ABI is proven to be useful to multiple
RTCs. As-is, this can go to debugfs if you think you really need it but
I doubt this is going to be used ever.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

