Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A6FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGBQFCX+D/9bg0zmhFY9cqT4/QYg/q0C53/TyQgmjNM=; b=RWw5lacZzeGtSAv7nz8WZt7Nfk
	9vgwys17JpxpPGHkmoD1On7sut8nmB4USRZlRM7JfHMUiebWUyWVUMy7/u/r+YdBipwi9L57z93KY
	3+lzEizd385ONJzvyjO4tnK7DpdYFcJE/S6biZcs5jFRHGxsi3vBvibU8SuwBPJSM8w3fSv+6tfGQ
	Y6nIAfXArhGUp7bPi9M0tMa/xGXDn8AGkb84tM5whOAC0AZc93EhvbeheyTHqTrtyTR6GvedaZcEY
	bPad5//aeGjPFiOheYTxKOrlprO9YuEle2qWTFA9lgo18MB9isC9AWVWca9gkNMxNXzXd6eOa7xHk
	/kICHWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHA-0000000EZve-3T7b;
	Tue, 02 Sep 2025 00:53:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC8e-0000000DzIo-0L1b;
	Mon, 01 Sep 2025 21:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AEA344074;
	Mon,  1 Sep 2025 21:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A74AC4CEF0;
	Mon,  1 Sep 2025 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762351;
	bh=XJtUW54wFVnqUN/GjGXLK8CdHk3O9QHu7uFpdEFxdw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODajV7gaIdI7Peny6U62Mdbzmn17K9c0n4WpKG92q5YyVAysBnZMEGw4Et5oG5ko1
	 rL9IhH1ttdwkSZdj3hu7eMuqcD+1x3Mp+xA1M6SfkZgn0aP5qzETf8UyPlPKZouX+T
	 nFY5rqZx1stDmtbCB/UWDJaeHMuoXq3P22KYL4bAIredkKjBmP9b7l/JJbJu13HESr
	 BYSlVclAMrS54rDQM7Yu0zQtdMFUR/KtdHhyqZ+DgK4U6/p8SMJecIlbC/5sKl4H/9
	 jAW7TlRg0vlEA8idVSL7tX4DdDEltK0kidhIG/jVqNtp/fi7bgmft1iIHwDwY9YYqu
	 RifmqcGWDUVhQ==
Date: Mon, 1 Sep 2025 16:32:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: WeiHao Li <cn.liweihao@gmail.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com,
	andy.yan@rock-chips.com
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Message-ID: <175676234944.379480.9026638393609375066.robh@kernel.org>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-4-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831104855.45883-4-cn.liweihao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_143232_138007_011BADC0 
X-CRM114-Status: UNSURE (   8.76  )
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


On Sun, 31 Aug 2025 18:48:51 +0800, WeiHao Li wrote:
> Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> 
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  include/dt-bindings/clock/rk3368-cru.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


