Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140DCCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMUj0+qcDFuHlCbPtsC1PLzSfv9XJ18NOKhPj20IQtM=; b=FQnB4y38i3PYFvUuoHaZUlyWl7
	qNjWwKpi7F+tO8rurKWUTQlzwI8NY6lWHIdmMkmBt3Is87sSQvUU+jmOx+3e0HfMW5SlGGkNfcyUN
	7NqfUQtNlho4B3hwfPMWvg0Yz9U8GKsWZGculMy7oeX3msa4Y/nPGKfiHjU7tM1ra5ScOfa/q3urm
	1/viwlPPhOMWwmhbhuDl6x7ErOER0CkkNlAI7N84rGotkJC1uuRTX4w5M8UPk8IaY704Rlrt/YQkp
	TznDXiYNyFAKxJY9vHtZ8bZ65F22X6nfHqiizvXAIu4DZR4AJ7L39Y1bdUP2+mFPkUAnIH4j6v+g3
	12+aayBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0izd-0000000Av21-08mD;
	Mon, 22 Sep 2025 16:02:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iza-0000000Av1g-1Wes
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8B98434F5;
	Mon, 22 Sep 2025 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B668FC4CEF0;
	Mon, 22 Sep 2025 16:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758556937;
	bh=2/LizJClL1wBMVE5bMlfqc3v7W3h2uppscfEVfjjaKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLzft7lF6rvhOI4icdGvNJkM9UQviI0U8bEF7gne7g+Bvp3NY6JOzPpfSVrFmKB/g
	 aM7FWa1VE9oXcgJv2H1NrN5XhgfoyEEVGf0fiqK6szQf93VDiWO261HpnUjCquQ3oT
	 SieqwDC7RuoMOWm0AjYdLujrUr9yqdymL4/pccPNctf0vo7kbEp4Mj3RPfd2P8ZcEt
	 b9/3e3+TsWX9sv4lQFjLOlgYTkoMjeDW/KgAsQkt8Ix2DFCEbnUXLfpQhljn5KO2i0
	 sccL/cofSQX4GfDfvz5eYWVuWgp8xHAQ36dkxtE6nUDgGXJyI8QIQRbRPSs0mnCwUW
	 Bl1uSZjfoX/vA==
Date: Mon, 22 Sep 2025 11:02:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, arm-scmi@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Brian Masney <bmasney@redhat.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: clock: Add spread spectrum definition
Message-ID: <175855693542.119673.169928379758722249.robh@kernel.org>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-1-5a2cee2f0351@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-clk-ssc-version1-v4-1-5a2cee2f0351@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_090218_422353_28273260 
X-CRM114-Status: UNSURE (   9.57  )
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


On Mon, 15 Sep 2025 16:29:35 +0800, Peng Fan wrote:
> Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
> center-spread(1), no-spread(0). So define them in dt-bindings to avoid
> write the magic number in device tree.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/dt-bindings/clock/clock.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


