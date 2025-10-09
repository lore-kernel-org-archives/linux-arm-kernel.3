Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9363CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJKiHQMyh+K+l7pIsNMdaDMt3/xvcJcHMc0Me8aBI3A=; b=qgxCzeJuh7Y9IGnMtmpp0Fa07a
	NBHcMD8S1FdxBqzcHLGaqS8jU/khL3S2bhLjoFRcxFfT5L2L3HM1qRFq7/ovHdGyDlNY4GqQzZOM7
	OdG1MKlTxQfkRYQ3IJ4YScyhhweRswkgyujXfLZ1HkVKwQRW1IbqhxZ5jD1jOsSbYSN8Z/GhRZAqm
	3gkS1fHQ2g5wm11uwuxguCoYMLuiGKgoCU6TCcVdXWOXpWXDQMGWScPgQ78Iz8/y2SMjP+TBW6QOB
	itsc+QsgfIhofvH7VzNsXg0tz+smWDLGMsswyj84iwQxZE5ejVLQ0/C9597dz1FCeolNr5/IgAkoG
	Pm5+L/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v2i-00000006su4-2kK6;
	Thu, 09 Oct 2025 18:07:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v2g-00000006ssZ-0YDr;
	Thu, 09 Oct 2025 18:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1D064057B;
	Thu,  9 Oct 2025 18:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CBBC4CEE7;
	Thu,  9 Oct 2025 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033225;
	bh=5NkPRLVl9HXuFsHMbdyDfRgNelN4F/MsHO6v49XOt8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drtpIj6X0q8pLe3CIfr6wdcGlSPou8q2gcPpvd1SHEfKYSU+AAkddIHUJjTrIv807
	 TGHGoPlv9WrWb25e7c3UUTfQghQmdmhQp3ceZeRiG8fqwhNRnWaNFqZ8rqq2ChzmIE
	 fA5v3m2PYEKJ8h9pN4CW9BYrXNPiFBAkOGflzu20sV5aRN0j6Zilt3Qu0x7Ahc/f4r
	 LmNWWZphaZS1/lmXgLQcDfvfyz1hPeuAx/rW0Uk0m24tueCmPB+oQOxBqDjWFftZLw
	 gzwFrSQEnfBoiAkkWTS9s+ElXAJRb2u1klQQ9iRaQolP261L5O7JVlA85DeWRoOGmV
	 VsVzDtsR76a9w==
Date: Thu, 9 Oct 2025 13:07:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 01/19] dt-bindings: clock: Add Amlogic A4 SCMI clock
 controller
Message-ID: <176003322350.2944342.8960430626570483433.robh@kernel.org>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
 <20250930-a4_a5_add_clock_driver-v1-1-a9acf7951589@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-1-a9acf7951589@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_110706_187236_1BB94270 
X-CRM114-Status: UNSURE (   7.94  )
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


On Tue, 30 Sep 2025 17:37:14 +0800, Chuan Liu wrote:
> Add the SCMI clock controller dt-bindings for Amlogic A4 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  include/dt-bindings/clock/amlogic,a4-scmi-clkc.h | 42 ++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


