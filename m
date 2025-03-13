Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3BAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otiuG/DUDKB+IeX0NW1iPawStHS+TeRO4UsrEuDZfQg=; b=k39EqTfdP2SsINb3HuIRkY1vRa
	Lomc3zOudAvq2Df43Q1TdWgawG1rJ6WNhH9D3TVJk7/mj9V6m+RjM0vGGfK7yF3Gy9vzdJMvUvDMl
	6WZoJz5tPsTrgN3Np1PBRX7nW6RZMEkmmMFwM6DbQzH2pfWHqUghg9dDKOCxjq9coAVTTmvhyZEjr
	QtoFIDTxADZAI3GsqjeOkvWgTP+h6vn/4KPk0plCMwkbE23JCRItSDBwuXaSQFWdK0hL4RMseHh9J
	MWo1EfOWswER+ltde8kXdMwcVr8wkSplOvyp78mujMtFMol0Zr4+QjeEDBHNUrEzBIkP6IZHnkQ2+
	A9SrqoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdtC-0000000AXn0-1tCY;
	Thu, 13 Mar 2025 08:26:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdrW-0000000AXN6-1pbf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:24:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 107065C585E;
	Thu, 13 Mar 2025 08:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9AEC4CEE9;
	Thu, 13 Mar 2025 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854257;
	bh=nzEoy2Dm6WdPm0bsSQMi/Pi0gl+x9sAMvCNvyjcf8w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnlCx8r5QwZudVcnRFXkQ1/mShMlI7S9sNXIJ4mIckmfuhk7xAEPAFGfSKILwYrJR
	 q2H3UNAsxYwuDi8A0LOMPV0du9lLjSGcePOm5ghr2wkIHFiOL/7zVi2p4L7Esi7/lY
	 kq5DF0j/MpU5EUsSEUN/hknlvSWobgVt7qaPJgvLWWWBQ9v1x8dBioVK5p8ezZJ6A7
	 k70YQOXiIsL4Z8ERTGw78t+MIFzSfp/DJsHBZCj+vHfZMOcyYTGgG8xIs7UOxWYdvE
	 SPUIMMHvzqwIJ8PRGZYN7NOb/sI11IjH/oykGoVY4w1JAU+NavEA/zxKhQqYQZh3vb
	 NbfeAfr+L8JUQ==
Date: Thu, 13 Mar 2025 09:24:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
Message-ID: <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_012418_532430_DE850A2C 
X-CRM114-Status: UNSURE (   7.03  )
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

On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
 +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +

I don't get why this binding is different than others and you do not
reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
reference.


Best regards,
Krzysztof


