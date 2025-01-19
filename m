Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF7C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr0mnQumZGnlCpIWQA0mpDkl4aN1a2VbtnBrth0+ZPM=; b=RELHDJ7c92ci26J33kJgJk2gQu
	lGLj7V7opnFEMI9LlTHhTQolhfnBH/+W7hgKgFHajNlOmiOhN5G8iXlXEpXMzK9gP1sl7u/6xY/6S
	AlIq8AC9FANRKkQypIqNaeIuQeLxL0txe4WxL7rit97YXjMqN5g6koPFSjSoXyAHl7PH6gZFQHvPP
	HvZORjn5iIPf47oW4+inO4gLYchYQzuEQ7vDd7XhlYNWEJik1k3WS/aQCaGryye85FJsZkBxBuvUv
	gdvV6sswGtO2NqRxye4EGN3j/F1/4jFvDKXLjRios7yKhZeTPzqOflee/Rioab0IKzleQ1QF8meqo
	MQG+VUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTuD-00000003qWH-2elD;
	Sun, 19 Jan 2025 11:55:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTrh-00000003pkX-1G2Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 11:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FEF55C3ED1;
	Sun, 19 Jan 2025 11:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25237C4CED6;
	Sun, 19 Jan 2025 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737287596;
	bh=Zx4a2qQW1UeVBYcKt9q9PDOT61DOQhC8/R1m4Dt6iQQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oSB7F38PlhZgv85QBNj9JHn74HXTvpfflGU90wuWTJUzaRNnTrxE+MrqeBXQwOI3X
	 VU77Qo4DYJBAvQqOaODchqifc4KWZPDtDhBzF1B+VZw+zgEvPrQJcCHzZCebwjDzjW
	 ch+IBZaSKKovZbkdN3/SURNI7qlveew5YD5alq+J/MRYbr5R74ZHcJAxNDkKb5g1cM
	 SUh8c2A2f1pNj+Uw2h2Ms6j3RE7fKyxVpWZokwQIsna+u7wC4JGQ4lA0ePaREZClRc
	 VU36dnzfpLVKrPOdgpy61Tpt2mXePCgpaOm1egQJb3bC6cl5ym/eIOruHy6/oXFkiz
	 14TcwGsrbZs1w==
Date: Sun, 19 Jan 2025 05:53:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-6-5d1bdb5a140c@quicinc.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-6-5d1bdb5a140c@quicinc.com>
Message-Id: <173728745662.810613.14087437002250228892.robh@kernel.org>
Subject: Re: [PATCH v4 06/10] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_035317_397226_91D1F0DC 
X-CRM114-Status: GOOD (  10.31  )
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


On Sun, 19 Jan 2025 15:53:00 +0530, Taniya Das wrote:
> Add DT bindings for the Graphics clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
>  2 files changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250119-qcs615-mm-v4-clockcontroller-v4-6-5d1bdb5a140c@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


