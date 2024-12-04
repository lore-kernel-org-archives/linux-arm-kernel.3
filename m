Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626DFE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkfoj+pgudhA38FUwobh2PpIVHPT/yT4qHHxT/fMCn4=; b=1aYlyHQJyFwFd1dtkmRgb3gnaT
	tZva4LieYROjQgwiQosGk/fTcXDmYWcN2fXIb30ehkOlQ9hZ5Q6Br/nwzdJkH/YIy3OkAPLptxy3R
	ZDYYGtzK5Y+L6+fNWU6ZXYT6kbTE//ZaSLAskSUW5Zn9ecSDxdjy61qLI6WRNb4zLj0vIvqIKXk4J
	X6aMseNqBBpQNzsEj+imdgjSOQAEtcfW8dpOWLVfg4CQi2mpvZl4bI2r5CxJbZavJ7px956f2BA4u
	SDiQOCXAXH1rKb12qJa39r74QVB50EJCyJA5eQrL4dfkM3spPIA/z0U7QN/2pIO/oWO8TxewapHzC
	zyEJGpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkxL-0000000Burf-2NUH;
	Wed, 04 Dec 2024 08:41:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkwK-0000000Buji-1Tvg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5C645C681D;
	Wed,  4 Dec 2024 08:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F90C4CED1;
	Wed,  4 Dec 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301655;
	bh=fkfoj+pgudhA38FUwobh2PpIVHPT/yT4qHHxT/fMCn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxPkaIPw2wQ9SXnEsHBeUpencemRB/jkmhd+lpvcgVcCEe9ZXfhmDOclwJf4yltMF
	 yQv7XefvKEyGWfVhft4IBsxsRzMw2CMCArXfEN3fuKpmkbBGfZwN31AugbVG8eMHGL
	 mG+XoOtFfwgXxoNRujsi8k0uuPoGA40GekrPcm6TQJuh7puaTIOqYxo89rXwW/losJ
	 VlfwYjRgu5hT7WJ1rRyxMmALVHkQUOr4+oRwbZkKj/6gP70DTxcQG8ijgEyRz4TPc1
	 GZrsvJKT/ufxVMvNrS//ksP5rxQzZJg1FVHLDYZREvD233Aie5/d+73WrKwg0WCdII
	 1qGerqiUblLDQ==
Date: Wed, 4 Dec 2024 09:40:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos990-pmu compatible
Message-ID: <yqdtp6gllg4x5a4sysmgvgyd4y6z6h6ly556bzbuafkkaba3e5@pgnuhlbx7e2j>
References: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
 <20241203211344.515431-2-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203211344.515431-2-igor.belwon@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_004056_433847_908FB7B3 
X-CRM114-Status: UNSURE (   7.74  )
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

On Tue, Dec 03, 2024 at 10:13:43PM +0100, Igor Belwon wrote:
> Add a dt-binding compatible for the exynos990-pmu.

s/exynos990-pmu/Exynos990 PMU (and here goes explanation of PMU). You
just copied subject and basically copied patch contents which is
obvious. Instead say something useful about hardware, e.g.
is it different or is it compatible with anything?

Best regards,
Krzysztof


