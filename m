Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7CDC636C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxS5zZ/9XfYJpsUSmxN9tZhLUEO+6vFmQ9aGT9cY1Eo=; b=RXyhfKXSVn+YW5SdcUGBnFrfVM
	zfk9+uijNYGzuoJ3+kNEnZqNgzrGPIwW8kQtc19jZmoA/aGvOivc1/JZwpqL/orY9i73s97HtUzb7
	57Q8ulT/p500w/zAIv/8CPia0TPdKL3+EgjVbAwJ8+hLRtwj3fgI8UvbYvSPdRrLO2XGK06frHY66
	3UTGPPBy5s7//waKmbUJhu0s6CSqWoGKxyMUEPh6am1ulW2Icu+jhLCYSpD/kekFHfszVxwx2midc
	WEiBr8PymyhDNdyJjZwsDfoXAG0vceUfVwfjazNpvW9p49TBpjMykGhx9fTZikh56NKbxTalsR3Lr
	bSprvSDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI7J-0000000H0Fz-1DcH;
	Sun, 22 Feb 2026 22:39:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI6o-0000000Gztp-13mV;
	Sun, 22 Feb 2026 22:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UxS5zZ/9XfYJpsUSmxN9tZhLUEO+6vFmQ9aGT9cY1Eo=; b=wW5fq8KNH9BXIpxG3gVOgnPEvr
	H2W15mJbguI0BhSkekqq1Pl9b5jxkAHTo/hai29gZ4qGm5vVIwshpfPx3Dax1nGDyL0P8bGUVU3Us
	nGSj5UyAqRz41LkdS4P9tIZD7TENVxChZAbdUTtHQHyndHd+fWMVGgtnKZ98vLg20KNHYU2bqUSGp
	75/OTUOH0CGgSCHjs40r17FLc6S/VzpQN6+hz24UG8RrD6n1+aFueuNOzSezjwSJ2HGBhqsF54wa/
	nd3tN9mliR1ftM56wFmOELQ2m2UNVkiHtPAKaunpFLnUeyXBRTkjhaazKtyOh9pXa3iFnI7NW//fj
	8R9hrIBA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Clean up NanoPi-R2S Plus
Date: Sun, 22 Feb 2026 23:39:08 +0100
Message-ID: <177179992307.1861430.8185999796329359321.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <94f66f34d6023887111884093f31a8980e993ef9.1767111968.git.robin.murphy@arm.com>
References: <94f66f34d6023887111884093f31a8980e993ef9.1767111968.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_143926_286761_32897034 
X-CRM114-Status: UNSURE (   8.84  )
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


On Mon, 26 Jan 2026 12:32:03 +0000, Robin Murphy wrote:
> Apparently something went wonky in the refactoring, and NanoPi R2S Plus
> has ended up "overriding" the GMAC properties from the base R2S include
> with all identical values. Clean up the redundancy.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Clean up NanoPi-R2S Plus
      commit: 1e6568db5a4e65ec60d2ccc1fd2ba38cd6db59bc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

