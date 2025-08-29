Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EBDC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeBNLqaL9LavAQKA8RkUdldye2er8Uq2sV3MSZa9gVo=; b=1vBDW5OBam0xBXIUlozVl7dWqp
	qCF4ZRyjGrxuuYjv9VeEZtodgsDxbARNoZ4JN7t0ml+sSnGdOYB8K0fTmK8EAE0/SNeG9z34RIPxA
	7N4xwiTBhrXyd6NS5/kmiMh3BhO/sUdoxx6QV6JEclJ/xCkdCARlpfjmWr2gPa4zo3u1MQJ+3xwEl
	q5eiWOlFE8Iq8t/QU5YjEhy/HBkV1tFtPnuwDKYVcX2lyDKn+PD4K6eQgrkHH8j8gYSPjxF6KUh8d
	U4C4Pk/BU6wxsL14Lhj5saz+Z1M+iGhm9OU28ogqhLYkksLMQP/+BMCrPH4x/QOFQOXOKFzB66tTI
	g7+rfHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtt6-00000004pNh-27PK;
	Fri, 29 Aug 2025 07:51:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtdW-00000004miE-0TEY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4082A60051;
	Fri, 29 Aug 2025 07:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29321C4CEF0;
	Fri, 29 Aug 2025 07:35:00 +0000 (UTC)
Date: Fri, 29 Aug 2025 09:34:58 +0200
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
	quic_pavir@quicinc.com, quic_suruchia@quicinc.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/10] Add Network Subsystem (NSS) clock controller
 support for IPQ5424 SoC
Message-ID: <20250829-versed-gazelle-of-tempest-edfbf1@kuoka>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
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

On Thu, Aug 28, 2025 at 06:32:13PM +0800, Luo Jie wrote:
> - Remove the Acked-by tag from the "Add Qualcomm IPQ5424 NSSNOC IDs" patch"
>   as the new NOC IDs are added.

So let's wait for v6 with acking :/

Best regards,
Krzysztof


