Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A5BC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vitaPJ1/0YLkHqTJEs/ZTCtg7eWB6JEZx0pV0zq63EE=; b=bt1TqrJ6e7oh2cmNLtSrw/t7tJ
	YqFD74RjqdvyUcOxsC0WuaxR+YuJFP+z6FRL3kI6ygHUf6E0edgt4M9b7oth2qEQsHNtS15a319vJ
	xu8f2ikRFgy9FEVTLYMb9DyMAl4Hiwa+ZGOT+kUiezp78jn71qRxEnIeJiO64ycJ64xLK9L4LTePm
	xVdG3HzDxWDPSknA8yu7LjtYfZjFjNbNFT5mQ0IIY069eLI8F1K2y0v84LHoS9EcFwjJ+yacBNw67
	GZzA4vbwhBWgKJbByJm74wIsFjMhnLgxLm3PbQRbqkdmia5PVbQLfeMsEpfWH/c9SyWFmgl6o4oaT
	EL0sVDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk0d-00000004bfU-0zf0;
	Wed, 05 Aug 2026 22:22:47 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk0a-00000004bf6-3oes
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:22:46 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hFlKC5B74zMlL8;
	Thu, 06 Aug 2026 00:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785968559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vitaPJ1/0YLkHqTJEs/ZTCtg7eWB6JEZx0pV0zq63EE=;
	b=i5Ou1FbNhMzgKOeo4jhLaG9cFgV2Kjht8KosjinmjyxoETMalIeRyQMlxXYjH7D+kUN8AI
	iXrHH2sdLDVm31mSlNMbXtwxD7cKRRodigjp95P7FPPu02G6asRC1iGQTc9HDt+zoGVD0E
	aU3sC0Co6YAcj0l+BktbDSqAOfORG797rsGz0Ywq2p2g+5B3ZEzNkE+AjUOKFe7dUm/DPE
	pCSVHsFLdjuVuvxXE3Wv9ncy8KZweJnWuJHAl+bukaIJZc6MY8DY6wz+FnPjAk1CJ5aTkn
	qVp7Jbsgqo8Yt5e9fVeSLTiVtLPCxPGgfce+UZDOemet/YD9Uow8NV/KbhlisA==
Message-ID: <42472bef-cafb-4633-bd7e-7e6f707fdad5@mailbox.org>
Date: Thu, 6 Aug 2026 00:22:35 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/6] clk: renesas: Add R-Car X5H CPG driver
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1785941595.git.geert+renesas@glider.be>
 <3f981753722de1ba871667be63460e89d299d635.1785941595.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3f981753722de1ba871667be63460e89d299d635.1785941595.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 00ba4762705b72c2803
X-MBO-RS-META: 45u7qioqppyfd15eaa44f15u86pde877
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_152245_098201_ADB21E15 
X-CRM114-Status: UNSURE (   8.25  )
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

On 8/5/26 5:20 PM, Geert Uytterhoeven wrote:
> Add a minimal Clock Pulse Generator driver for the R-Car X5H (R8A78000)
> SoC.  For now this supports just the few fixed-rate clocks that are
> needed by the current minimal DTS.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

