Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69644CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCaoWzQZZYJ5HrMTb4wHgOTXwSO+AIoqNwLYxwe8Syc=; b=xtp8/etO2Vb/NINjyBOef7t6VJ
	S2mTMZOw/7IuyOqaa9UJpv/XGDfRni1OqPVBlUuHEsNlzgSSBh+H63UUfcJKQ+eY3uF8xl2mVxUuM
	JjV5NSpzN3NMvsrtbtLdulde/o8w3eBSuBBhB3S9kh7NHYbvSp+Ou9NjAAjF44OqP4DN3h3NPF0dG
	YeYQb82DeLxbAbfDKo22o+uwFttJXW1YB/MjIkJoioosd1oDORgUmEISknt+mC/EVINgkbkxNi7A3
	rXib0E9kJ2F33GEAmUU47mKQDFW3fMMCpKlUUsLy0Ew983+mjp5b5U2sjL05aVeBbyLlcGzGNTO6c
	Um13TafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7lu-0000000BUhF-0Sb1;
	Fri, 12 Jun 2026 19:42:30 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7lr-0000000BUgt-21gn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:42:29 +0000
Received: by chaosmail.tech (Postfix) id 80FA01C962C;
	Fri, 12 Jun 2026 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1781293343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCaoWzQZZYJ5HrMTb4wHgOTXwSO+AIoqNwLYxwe8Syc=;
	b=en68+gmGmIX+JwO4AQIZGwNJeHwJmwpMxEtdB2m6A5NFGX9e5Ct7FmS3PdDe/1HIofXECp
	OIyg9oZkWUBLvbknN1GEwf2CG5b9aeHftMcDPpjPcGf8/AuDt9Pyhho4JHVrOaUck0JRE/
	Bs6SguVq6ZwB210LJQ1AsdNL2hfIZgY=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v2] power: supply: macsmc: Support macOS 27 SMC firmware
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260612193353.GA7993@robin.jannau.net>
Date: Fri, 12 Jun 2026 21:42:12 +0200
Cc: Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>,
 Sebastian Reichel <sre@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <18396D14-17AF-4B43-AD6D-A88D2E7C44D3@chaosmail.tech>
References: <20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech>
 <20260612193353.GA7993@robin.jannau.net>
To: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_124227_993560_71964E12 
X-CRM114-Status: UNSURE (   9.27  )
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


> On Jun 12, 2026, at 21:33, Janne Grunau <j@jannau.net> wrote:
> 
> I think the following is slightly easier to read
> 
> {
> if (power->bcf0_1byte) {
> u8 tval = 0;
> int ret = apple_smc_read_u8(power->smc, SMC_KEY(BCF0), &tval);
> *val = tval;
> return ret;
> }
> 
> return apple_smc_read_u32(power->smc, SMC_KEY(BCF0), val);
> }

I personally prefer using early returns as much as possible, as it makes
it easier for me to read in linear order and due to line length reasons.
But no strong opinion either way.



