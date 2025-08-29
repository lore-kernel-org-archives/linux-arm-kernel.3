Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B93CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptjlGZgTdPCOh6dkjPgNmAOJiLAt93Ol0kY+5Yd7gs8=; b=z7o/nsewlNUaCFY2bpqyqJUqOA
	CN/Cne1GkdZdXwAwmcNY2x59IF80BD8qzYei6edky6IOXgZMxqKGpj7hZva52I9yQX+rUwkcbBuQf
	ifJkXQUdwvij9RplItYsqG6/+34XEimF6wJ/HtQL/PWcn/WeZ1Ggb/aHyjQfnt7qQ8CuWUg3JOCrd
	ItZPFtUoZ2BnwdRcefEoHPYxY9ONSZm36fuoZphkQoqXU1qGNxd/ZWkrEfAGLuYypWX7g/eOFfDCY
	drul5VerxKFQzpC3BtAwabuCp6jhDDJcDv4sX+vxEr66n8ZqOYes/B3u7ltH0keMoj3OObcWwcqrX
	7CNRG2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtyX-00000004qpI-0lqE;
	Fri, 29 Aug 2025 07:56:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtgT-00000004nDX-3rAO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FA7C60051;
	Fri, 29 Aug 2025 07:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B299C4CEF0;
	Fri, 29 Aug 2025 07:38:04 +0000 (UTC)
Date: Fri, 29 Aug 2025 09:38:02 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anusha Rao <quic_anusha@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Devi Priya <quic_devipriy@quicinc.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	quic_pavir@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH v4 07/10] dt-bindings: clock: qcom: Add NSS clock
 controller for IPQ5424 SoC
Message-ID: <20250829-quick-green-pigeon-a15507@kuoka>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-7-cb913b205bcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-7-cb913b205bcb@quicinc.com>
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

On Thu, Aug 28, 2025 at 06:32:20PM +0800, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
> devices.
> 
> Add support for the compatible string "qcom,ipq5424-nsscc" based on the
> existing IPQ9574 NSS clock controller Device Tree binding. Additionally,
> update the clock names for PPE and NSS for newer SoC additions like
> IPQ5424 to use generic and reusable identifiers "nss" and "ppe" without
> the clock rate suffix.
> 
> Also add master/slave ids for IPQ5424 networking interfaces, which is
> used by nss-ipq5424 driver for providing interconnect services using
> icc-clk framework.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 62 ++++++++++++++++++---
>  include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 ++++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 +++++
>  include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 +++++++++++++++
>  4 files changed, 178 insertions(+), 8 deletions(-)


Are you going to change the binding in next version?

Best regards,
Krzysztof


