Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AA7C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:Cc:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cOK72YPcxWKVeGOnpXw6RBXM4cFEe8takUzoN19ryU=; b=e4aSBfKzUjHIK67pjfeZdzwR7C
	8BlgdSaD79JTW/JGWv0nqEhl9e8eT+qkioQrO0TuJJRcXb76Y4AWpYq8/E14NOeulkmoAf4FdGO94
	0hsk00pFJYgBJehL0u46tAqZ7xxlDHu/yE8GZmg0b/f92FU+HRbXolCoLlDz92xHIa2yvGIjyblCb
	I830nrCd+yrXx2A6wAkcec5Td9jwjHM7OglRfGtIpuERrCJ7UZYovPiX739quVfbgqIAWoFpp7isz
	xEZ1bPBM/XQkFEH4WjlDbE6OwM6dRLyjFR1mEGWOfXVgK0UEmXAuUoN0JHJBkgILw3uI/yDwtFAR1
	7MGS1k+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuysb-00000009vsU-034H;
	Wed, 19 Mar 2025 19:15:05 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuymV-00000009ur0-2Rbt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 19:08:49 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742411324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cOK72YPcxWKVeGOnpXw6RBXM4cFEe8takUzoN19ryU=;
	b=H9jZ2K359uzwubWOxZhqIFjkympFHVgXw5gcPFu9B68z4JZ5NU/UPq93ekLtarpywymBUO
	8Rdj4Esfp7xlRsID+5eX6VzXtUCEVES0wXeKgg9FrlFhyv6RUDjTAw+2mDKY6Z+VWe39RU
	8H1eD5LhrVkEgF0iMpx16orixM6K1AgljRayCn/DlFPdjwa0y6Ht59EhEAYtAMJdo4CacU
	GFAdR4pm/PG8NSwWnKjc+Lx98VS1ik8xTuWL6KgZ3YQEc0EK9hnNaX3mbVMpYHAnEIg5kE
	nMbSTrv/OXZ6qQ9D/LNmrsroh8A8eO28KaHujgtscjt3QEmnKsKDPvHhceXXfw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 19:08:17 +0000
Message-Id: <D8KH97UKHPJW.300OTP897K3KO@postmarketos.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v4 0/2] Add support for Xiaomi Mi TV Stick
References: <20250203174346.13737-1-funderscore@postmarketos.org>
In-Reply-To: <20250203174346.13737-1-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_120847_768554_3B922F4B 
X-CRM114-Status: UNSURE (   4.70  )
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

Hello,

Superseded by v5:
https://lore.kernel.org/all/20250319190150.31529-2-funderscore@postmarketos=
.org/

Thanks.

