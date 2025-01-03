Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857FEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB6HoB7xsc1uLjUkqsiqXQE+6Ay1EOlGdKzJA17qg3g=; b=znVOr+mkIjVejlz0JbowB9fekY
	qpoMYLRnR2NlnChMNOGmB1YbQ8K7wAudZk4QfpqRNkW4g/PqRCpQO3WU1oHSlspjwHjFBP7RhQ6u7
	8t6VGRbP9JkxZ1TFKE/liSI8+G484SKNt+qXsbwbzbeOhhok1Np/Y8Pf6jbuw7VlV+YiWDvdG3IcY
	rUYsiiJXly1LqcCdTrL+TUdj2bjb/DhHeszI4KcrI/vKFn0s6OsNLbXU9g/k7MepKMTzGQMWtYEEq
	Fs29G0dtqd0njn5sbl0z+vzL4PxTjovTp8rzhOeKuaheD3AYmNIjxbmjcJbCdzchyoaGNEyZXJhFG
	9RK5f1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmxe-0000000Dn5x-18RG;
	Fri, 03 Jan 2025 19:03:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmwR-0000000DmsB-3apK;
	Fri, 03 Jan 2025 19:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCFACA410AF;
	Fri,  3 Jan 2025 19:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6BDC4CECE;
	Fri,  3 Jan 2025 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735930958;
	bh=ROKm26zYjtVGso2D9k6xdXLPr8Xlhh6uzj4BFB9Dvxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmiqMEyipWsfK1pr6JNIIjBnTYXBG6JPlyZRxwEJJS3Hw0An40h7OVgybzdz81d38
	 k8ELYW88QGmKm5Itw9NC9dqeZ4tuQNY+GTsnnZnJPxQV/tuL4Ko20rBpdumfCp7guV
	 ILGU49EsKAdtdAINHROIGwZ9vHiyBfNusplgI7edMKzrQHfWxmiUhfhtLqWvFBPBl8
	 BNlDCDXdjuZoFwOPoEpokiYwET61I+K2cjTrwLkvKJaYOduhIgMfOst+zDcs0Ab3vo
	 Zfc2wxVvIx3jG6rjGVGrnxteMeCONnUPTBBMxCkOlvwIWF99odej6DOwNdeNo03TeQ
	 +qgCoVYfaqjrA==
Date: Fri, 3 Jan 2025 13:02:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>, robh+dt <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
Message-ID: <173593095558.2568839.4677596962650586768.robh@kernel.org>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
 <20241231060047.2298871-3-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-3-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_110239_960764_A2F326BA 
X-CRM114-Status: UNSURE (   7.60  )
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


On Tue, 31 Dec 2024 14:00:44 +0800, Jian Hu wrote:
> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  include/dt-bindings/clock/amlogic,t7-scmi.h | 48 +++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


