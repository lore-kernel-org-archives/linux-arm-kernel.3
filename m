Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CAEC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXUDp/2MWc9Zgcs/aIwBZ8FKfaDetZqTuesjivcVPQ8=; b=MqwBny6Ivepr7OLiaabYdCU9b1
	ZPRNlqKW/SvUoBF2faNzeZsTcZkONZZ4WbVxA3p6Cmbp9YZZXXMh6HImJFy1uSoUv1+uDaeyBBUKj
	9b+TmudNRJs4CSfSF/49Gm3MSVzfSosYdHQu3YRHhWnWYsqBTvLmwSu1Tx16Br11dhc1DVncnnOGn
	ldG/7KAy+UqWG+TmPPhfslvZDYL6hiR0Eaiu47txMKpK+JqDWEXZ+ClVagQPjsZ+0c+IQ8O+4fwsy
	/qaJ5s4MWJA6xLjYixFGggc6WZ4mKoWRU9fGfTTU6aDUhqOJiU4hiz1kW81SaXCAorytr1LdtVyTT
	8CGCOFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcry-0000000EjzK-0Asm;
	Mon, 24 Feb 2025 18:07:54 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmco4-0000000Ej5D-2tMM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:03:54 +0000
Date: Mon, 24 Feb 2025 13:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXUDp/2MWc9Zgcs/aIwBZ8FKfaDetZqTuesjivcVPQ8=;
	b=QHb7XYevWDc6ou8iTHrXYw/+/PbT7u/UCDAqUt4Tn6FKYAMSPA6Y/46u0eX61MreH05wUo
	uY2BM/JQk9Vh0Bowihp/4zl/aJG125Ng7VSzpI+39GCUFca7PWIsZ0RaeSpneisBBHxcTL
	mH+OVHdjqQ4BeGy+UQeYTp7kffSBJTqQ76vZ5xxDUWo6eo+U8CrK/eupappRZJ7YtMOGB3
	1yolobGSZ/PFOdLr51o8d5JmUeM1Hg1QSI289vCAJ0mb/MTEhSav2/xKj1hDmOK9HawGsP
	iBVZxtfOLHgedn1TDLJ1d1o51bSfunrymeCjqLjol7jVNBgbfznjGUIlAyr0xA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] soc: apple: rtkit: Add APPLE_RTKIT_PWR_STATE_INIT
Message-ID: <Z7y0gJPD5-OQvyog@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-1-1a3af494a48a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-apple-soc-misc-v1-1-1a3af494a48a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_100353_187445_006F6E9B 
X-CRM114-Status: UNSURE (   7.04  )
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

> -	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_ON);
> +	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_INIT);

Commit message doesn't match the code. Just adding the state doesn't
imply a behaviour change but the patch is one. How about "Use INIT state
instead of ON" or something to make explicit the behaviour change?

