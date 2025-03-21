Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC5DC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKjZJue4+eEfWMLaCSHuw1uzcfl/F3NY4dlAAT+5/Vs=; b=dLcHhHflb6UUppGwVvtIxr4uaV
	BsoP+nvEnZ3RQPqEisx1gz4NFcOOOUrJViafv3RhKWeRDowpcc5GMtRI4nh+fwMPGLz9KvDal80Im
	Ttux9GuimTZSMy1o9aGxfsXoUZCOU/sxDoZ9SGU2sDDmXJTQ4KJY+dtj1SVlUWOisePB/O2E07NwG
	kUtvFa2SEmA92gsTp8GidB8lt0HduwBzf6DuW1DhYupHgWeR7uveBp3i03QRQJ5MIrs5j2kT1Q/zY
	I/UKv8z8kI38mKcqxmULtvOnXhyMmSbnlPyRE1WPrn0Fpvdezidrx2w4glqLOwnZsDqn7gZWeD7t3
	n5GYgmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvadX-0000000EfsV-2wEr;
	Fri, 21 Mar 2025 11:34:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvabr-0000000Efk9-3mrt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 332C8A49102;
	Fri, 21 Mar 2025 11:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2458EC4CEE7;
	Fri, 21 Mar 2025 11:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742556738;
	bh=1Wc2vlIwYcC3jhY0Jz7QVH4Dj57VeZG15hR+/aWfVGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SN/Rh+b0AiUEHVonJTT7heYqUtvzSbzZ+WcqLqrV33B85TPzFlYoKXLHjhAHgUX3N
	 wUtYQoLI4scGp7UQNKYrv3S6ZXk5hFIQ9sX/aq+/JCiRitw1G3zIOuZj7IMSsKow3f
	 WfypeOdSLl17QKR/rUY0mFhNuaEsiQGZbhdXzwH+kMSsxUDmrdet3Msv+uq3d9b5kb
	 yBQ9bsgFXPZpvv9j1GE6LYqEgBEZGAtZpyWGAOgYbt1U2XtHx3fVj3NdlFRSUkA3On
	 zQ+NyQPJ3iSAgEKxyUVqfmyib2Y0vS7gTnKRKLGhLeicrZ0tEOGmcP3SJEjAErr9ZQ
	 5n7JQHtYcNKmg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, claudiu.beznea@tuxon.dev, sre@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 p.zabel@pengutronix.de, Ryan.Wanner@microchip.com
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c5d602b7d4c29333013ef3f75544c2eb7e4b8dab.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <c5d602b7d4c29333013ef3f75544c2eb7e4b8dab.1740671156.git.Ryan.Wanner@microchip.com>
Subject: Re: (subset) [PATCH v3 01/21] dt-bindings: mfd: syscon: add
 microchip,sama7d65-ddr3phy
Message-Id: <174255673486.2091509.9339030316768600844.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 11:32:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_043220_008989_BEA9CF9E 
X-CRM114-Status: UNSURE (   4.63  )
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

On Thu, 27 Feb 2025 08:51:48 -0700, Ryan.Wanner@microchip.com wrote:
> Add SAMA7D65 DDR3phy compatible to DT bindings documentation
> 
> 

Applied, thanks!

[01/21] dt-bindings: mfd: syscon: add microchip,sama7d65-ddr3phy
        commit: 2b4d2bdc07a152b3869f7888f64f37d4b09ae58e

--
Lee Jones [李琼斯]


