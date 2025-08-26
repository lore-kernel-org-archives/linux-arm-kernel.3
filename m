Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC17ECA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSQKWinp8EBSOnw7e+g2R+jnv52sAgzwofOs6Br7QXs=; b=G8i61nLHfm7AR6lePFbYmiCZqX
	s9uwzmegCPkcuVnuU8Tep9XNC/h7Fs+Kcq/J6wVwfrjLdKerSXpzmQ9VtMoeglQot9kCZu5wQTMpr
	l4cwYbP7NlUy96SRPaRAjEG8enppXiRMbsL2/MPZbyynWwaMtS96XGNjZQprazQbvC7lT8CmgrC7B
	/vriAGqvYmCM7FpPlcbQDC2pEFW4g2lmuEbpAQe97Izn2QDlb+/NDxBmawUWE7jYzfAE1exFfSsWR
	/fZykLu/G/VnvUEzNgs+ITOwvybB9rpL2Buagz3+WvgsDwopwSZEGw9NLcgvPJ3S8JrJ88jpr+OD3
	bgqmllrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqs0w-0000000BorL-3LT3;
	Tue, 26 Aug 2025 11:38:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr5k-0000000BeCt-3anD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 10:39:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 103BF1A00;
	Tue, 26 Aug 2025 03:39:44 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 208F63F694;
	Tue, 26 Aug 2025 03:39:49 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Nikunj Kela <quic_nkela@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6] dt-bindings: firmware: arm,scmi: allow multiple instances
Date: Tue, 26 Aug 2025 11:39:48 +0100
Message-Id: <175620475405.1763115.5520957460369024353.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730-8255-scmi-v6-1-a7d8ba19aded@quicinc.com>
References: <20250730-8255-scmi-v6-1-a7d8ba19aded@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_033952_940319_9F4B0E77 
X-CRM114-Status: UNSURE (   4.90  )
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

On Wed, 30 Jul 2025 14:30:00 -0700, Deepti Jaggi wrote:
> Allow multiple SCMI instances by extending the scmi node name to include
> an instance number suffix.
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] dt-bindings: firmware: arm,scmi: allow multiple instances
      https://git.kernel.org/sudeep.holla/c/a4d5f63d4384
--
Regards,
Sudeep


