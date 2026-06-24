Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74078CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxRZgMMcXld1GewrTn/+Bpz0RNC0eo+0XsbHRMtaIMw=; b=HYGTCMcqfKZZUou67EmzeODVbh
	FNpjYo5vSosAzizOufImhuvVs9OqeX1urO3BU41+LIOPUZANS/MhvQrBkZLVggvFHAAaSCCB88ymd
	zE7a/sgUMBPX5G4KeIkLm5xqXru0vJ/Wpy02SymVVtyW1owF2dEgivPliCD1OT8HGRS3S/t61YzBp
	qvYNJqqyzsacAxk5myhPUidUm0IGKtXb2Km+u96KNuqoeg97cIfPZacRx84D+1n+/blWxdfIA9Fr4
	103thcLv0Zd+oIlGbW641h58aIqqn5AvuUD6ZIzGsTUMb4bjQOCH+zjWcmuP3BrBVt2p/IpTw6R71
	NNKQwUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUxc-00000008MKI-2PYg;
	Wed, 24 Jun 2026 21:16:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUxa-00000008MJ0-0Y21
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 21:16:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5CE71A094C;
	Wed, 24 Jun 2026 21:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 884E9601C5;
	Wed, 24 Jun 2026 21:16:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79617106C8468;
	Wed, 24 Jun 2026 23:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BxRZgMMcXld1GewrTn/+Bpz0RNC0eo+0XsbHRMtaIMw=;
	b=XTaTgVlKy08X8NDZtKOCQMu0BDALNDA0VYnboGRbodz5KICDzsoe4bn0H5ghMcfYsNHzf7
	QMT8V300UIJts32vRAKK3n2sFo2SrX3dkNMMy4kNW3ZcWTiYwg455hdjrmmZSwa7RdIiR7
	Etdi+5yxsda+qPlla29otIKBa2fFVLaxtJTit1ZpM7ILtmyrvF1ka/ptJCXh10z/j2Ee06
	yXaN2S8hPf4dtbjbq7roFJHxyv/6TVa2zH4at9ce7yyJKx1KCjDwRzQXuSOiYOqfYxVf2B
	gnr2CF7QMCoYoKGVEZR4R7tZQv4JfCKAtcoichw7aUXYzB2Nyqz2/jyQM2deDw==
Date: Wed, 24 Jun 2026 23:16:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tommy Huang <tommy_huang@aspeedtech.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 0/2] rtc: aspeed: Add AST2700 RTC support
Message-ID: <178233558822.1517260.6981271146090179790.b4-ty@b4>
References: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_141638_306667_808F524C 
X-CRM114-Status: UNSURE (   8.50  )
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

On Mon, 01 Jun 2026 17:14:05 +0800, Tommy Huang wrote:
> This patch series adds support for the ASPEED AST2700 RTC define,
> includeing dt-binding in the Document and rtc-aspeed.c

Applied, thanks!

[1/2] dt-bindings: rtc: add ASPEED AST2700 compatible
      https://git.kernel.org/abelloni/c/5e7f746bc106
[2/2] rtc: aspeed: add AST2700 compatible
      https://git.kernel.org/abelloni/c/3319cfeeb8c4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

