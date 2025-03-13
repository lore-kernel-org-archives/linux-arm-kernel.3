Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08924C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUzi5ZksSJYWS2A9I/7z/iOgsJQtHu27+81wdqO0VsU=; b=VCkTavdNXHJn0nk49WmUXQS5pa
	PPpM1EpMWcPX867ezxlAeuMugTJ9bQIYbt/BT8Vdz+8G6wW6GzVGSeMDrUwEv79h5CfMdcKskfmYA
	Z1P5wTUIJi+ZBoc+a+hscJBXz2Q96VcZe9Q2EX0XlbOu2t97tfjKN4ivxMs3KtZUBdI9qw4QN299L
	Zlt2EvGy/lwzWjCkr8KvgHk4m85PHyC73PGSk+masf2TQPXuaomrKKPrnDlaNUPZ8FzNV1CvJgvai
	T+zclqg4ZH041+5y1ETuGyHd82WuGpkgFjAMJfSpx166dvIaoiXzD4Zw9jOgZ/VgUjrlFwCT2VDsG
	b3/tkBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdQv-0000000ATjM-0yx2;
	Thu, 13 Mar 2025 07:56:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdOF-0000000AT3c-2ndC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 07:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33A3F5C5934;
	Thu, 13 Mar 2025 07:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC868C4CEEA;
	Thu, 13 Mar 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741852442;
	bh=Oy727npOYrvDbZWrxWnM9zWO+qFg0rFlevRSA+NrZME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxpC1gHLTs+PecJ+hInrBRCCE9ad6XT6umULdnQR6nEsT7gW1hsq/BfMqI2JKiMQp
	 EyqfK8Bi0Dixqyk9PM5o1EcaalTWMaDw+82hX9azT/zfTo8PPRKU6bVZza0H2zMush
	 lhSiwKUpeYJ3UJ1RjN7jC6kC7YVIKSeHjiMQ1VY/hljnwEuFikzd7Hc8lMkMFz+bzS
	 i3/TO82rZmgJU2oRMsHZDu9ALXvQMhUgUYoaJws4OMitVwXA4wdv8AGYOVljeQsiBf
	 fC57gOfe3yxRqhUZmElgauWRVyCFX/Zrb3vMBfhJrzqa6FRkykAjHv/xiyCJt8LWE0
	 L6Q+99qAXpocA==
Date: Thu, 13 Mar 2025 08:53:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <20250313-noisy-hopping-poodle-c51ccb@krzk-bin>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_005403_758566_1B9D216B 
X-CRM114-Status: UNSURE (   7.62  )
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

On Thu, Mar 13, 2025 at 12:29:41PM +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>  2 files changed, 125 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


