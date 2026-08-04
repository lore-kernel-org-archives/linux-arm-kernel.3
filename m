Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89412C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq19xXoHf5uNAdn0tYddA7oZEvLFG46WEj0MtIKrUp8=; b=KaGvkBiGaPcYMllKbB/F562D7J
	Vr82oV2fN+okWiYau5I0ovb3UtMKnYbffGDBnFvQRnjn/4cH6B4yaW/VC1YfVlXNNRadjhNnaobEM
	yR1ML/bqbb4qREyAe4IyCeI7m4uSASQJK+w892zK9pTmD5PR6P9xs7EY99iZsHxFrr6EslvZWhdGx
	Rq18qsaPSyVwHSMH6M68UShR91QjQqPpB1ti1dDOD7BmL9+5DGzkeSplk+UbbFvSlmTuc8xE/jLVP
	1DkpKd8AkAeD1hLF5bm2ZMk0LdxBCmJ82oH398V+Hfkw8c5NDlQEyWFJTEmbFdwasNvhgk61jFzSQ
	OODzCMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8p3-000000018YI-38Zj;
	Tue, 04 Aug 2026 06:40:21 +0000
Received: from [101.71.155.101] (helo=mail-m155101.qiye.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8oz-000000018XZ-3oZv;
	Tue, 04 Aug 2026 06:40:19 +0000
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48af19290;
	Tue, 4 Aug 2026 14:40:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
Date: Tue,  4 Aug 2026 14:40:00 +0800
Message-Id: <20260804064000.1047278-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803-fractal-sly-earthworm-2fe241@quoll>
References: <20260803-fractal-sly-earthworm-2fe241@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcb803d4c03a2kunm5209684c2b0cfd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR9PVk1LSEgYSE8YTEMfHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_234018_125698_0156DA00 
X-CRM114-Status: UNSURE (   5.51  )
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

Hi,

> How did you resolve my comments from v1? You split patches instead of
> squashing and removed any explanation I asked for.

My idea is to add an official product link to differentiate them.
HINLINK H28K has this link, which I added to the commit message.
As for MangoPi, since it's discontinued, there's no product link
available. I will include a link to an image of the board in the
next patch to show that they are different boards.

Does this solve your problem?

Thanks,
Chukun

