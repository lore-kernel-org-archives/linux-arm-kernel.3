Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE027D30CC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/Vz9LXhuABJu3g3Ouy4v2OSvEUHs4z1hXO5dyxm7Oc=; b=wrwHbuR1yipviVnsn3xjrMmt/a
	hLmWfqHGjS42WPZSGmOPoaPWLihavcwByEg4S0RnGeV6er9bj89CVow7uSYh9PnucOLw2f84VOXm6
	s0FBB3yiFLp8qsEly03f4B+QC5rldV3OpU6pofeS4h/jrquHbUJfuVUTYSPbMqBxtdwbqK1cFc2AR
	G/oy8KPkU+yHRuc2m0E5iOMcr79D8/ZjB6tvZn5tBrpYtdg4tbiroibQrjtbHvOsTxcPDMkfnmXW0
	eaH2ipTK6sIv5hwAyY+OglZHoMQuaY3VOTjILDhiF+ACYkaK4CsKk4l7xI4KHkRpel9Dagq+pFNlz
	O2KWJxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm4V-00000007lJN-1nYT;
	Tue, 13 Jan 2026 21:37:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm4T-00000007lJ3-3ySa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 21:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 425FA60017;
	Tue, 13 Jan 2026 21:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02BCC116C6;
	Tue, 13 Jan 2026 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340221;
	bh=XU4w/j4+oTl8JFHiK9oRl1AHI0R90v0EuhBItjD2d04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyxiyHomBr+sAPePMMZvDs0bX8l4EDroeL6W0KKCjd23hUnuoilujK0x0+CtmdicS
	 KvsbsjYXh4abeUoGdfSTrIkffVPmPHvxFwsKZshR5CtuJl7lBmh/EPEQx1qx53Fl53
	 rt0GWp9a89Wb77qmIJahmfVOLKVfvR+51khFvp3QJB+B1O3FqeUcWWskGZ+Gz6vxDZ
	 gvCAl/gjxPMhIafj0lD6n0paAUDf3MepKhLfvcmsV8HkoYT4wgxu2c2zRMLCpGD5xX
	 9W6DRnjeL0xoEQnpLUX3KrnRBHwqeMLLmib5cLgSmN0AQkr609REbaQrpTb7VTUJxn
	 QISNqnUPY34Fg==
Date: Tue, 13 Jan 2026 15:37:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	kernel-team@android.com,
	Michael Turquette <mturquette@baylibre.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Juan Yescas <jyescas@google.com>,
	Doug Anderson <dianders@google.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
Message-ID: <176834021822.198212.10109654358382228131.robh@kernel.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
 <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
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


On Tue, 13 Jan 2026 10:58:59 +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
> enhancer and compressor.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
>  - alphanumeric in gs101.h header (Andre)
> Changes in v2
>  - alphanumeric placement (Krzysztof)
> ---
>  .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
>  include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


