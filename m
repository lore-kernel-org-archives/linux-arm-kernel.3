Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23849CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xj7B2PRphBCSW5txAx3fHoca1CHI12fyV9l3tUHc9zs=; b=LaVoqmYXP/lsafThwdKTUrHK6U
	gQ/y9GvuppEelNghGRkywLPxLUn62ZovIrURgqiBMI2KWYx6SdXMJNHPjKHgLMcTckOtshmQAKowg
	p4mlWUHv3RBaP0XudlC0Dpn8Cjwwxw0QXQio89Ad4JDE/A9TrIZtCKTEsYQW1nSvQSD08LHaHCwrM
	xniF5Orui7nY/TmqEicV88wQwnIKphq0BUmxPpYObeUpnZx0/hFeHpzoWm9Qt6rySkNcKyuO0c7lq
	h1NgyopT+t3iwa6Fi3vrxltYmtrJAeeb5AKpfQ4jtdp831/bpStMfBmRY4F/4JhVe671B6GKtQ2hU
	vtKJn7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lK-00000007ACg-0lTQ;
	Sat, 30 Aug 2025 00:48:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2KH-00000006SDF-1wfy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24B6A40B83;
	Fri, 29 Aug 2025 16:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FA5C4CEF0;
	Fri, 29 Aug 2025 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756486305;
	bh=03rk891EXzQgLlR+ox/B8qZcUcPShMCfgw1IOgKY9fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcfMFq2AC6QTawhxyDXciuX1Yxluc5AxBWNNeSo99EqnpfVKb32GzxpbzDqpvMcLr
	 Jf93jPIOVlZEW/cwlqG+TAJ5+OaW8DlF/hL/KF8WF8BKA1UCZoqNoPB9BvtAM242oz
	 Pzy8iEx4MUbMj97dgJ/WdNu9NfTX4mXIV4uzvYXj6a1yLqslGDBq6yhhWYET62Y8NK
	 3c0lY04UQU0KUDEW1PIRxT/pTierHIiOafwW+nhLfidYeZ5gM29DAkkjYytpmbn1hv
	 OCSgLghKAOHbT1tNaHgwP7pNbj9b2V6QEXkbXgfthvDKccBnRBYp5OEo7Oymp3QCfg
	 4biL16bGUS6XA==
Date: Fri, 29 Aug 2025 11:51:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-clk@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>, willmcvicker@google.com,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	Stephen Boyd <sboyd@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
Message-ID: <175648630368.1002473.16179265827004487782.robh@kernel.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095145_524231_2B25754F 
X-CRM114-Status: GOOD (  11.61  )
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


On Wed, 27 Aug 2025 12:42:11 +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the
> Alive Clock and Power Manager (ACPM) interface.
> 
> Make the ACPM node a clock provider by adding the mandatory
> "#clock-cells" property, which allows devices to reference its
> clock outputs.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml          | 11 +++++++++++
>  include/dt-bindings/clock/google,gs101.h                  | 15 +++++++++++++++
>  2 files changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


