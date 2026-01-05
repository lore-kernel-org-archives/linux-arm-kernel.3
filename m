Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D81C79F9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3LepE16MVZjOynNAw7xxCvUPLurtue1TXHhwzBi4+I=; b=yk4OtkbN05xLbbCPBwFfkaYQ8C
	KkXxklbOj/LOwMj7xEw5oZUC+wI20oHk40RdbkaxlRaAS9tg6tF6854NS3bIcz9GB2ajCGHEORpdI
	GoGxqEx1hX7no5Ci2v7ILnEOTJ5QLgr2I93Sn01kU4XZS3wOji8qOre1L1IBrhGCnbXG+RT+3XkC5
	WcaFKKWrbfVhw7CU2u8QTEIgKWBZ3xJbYwsscB9IBkjikKrzr52YNuJ79+PcEIA/SZ/+IJDwGaXzB
	JE0I5byhRPp2JcEYspYOJI5ylGG7veU1KKo2H2OIPuVgmsOyfHzh06Dmk3eRVfLM2GGZcoPHr64Jh
	76AXl6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclGC-0000000BWJs-0Snk;
	Mon, 05 Jan 2026 14:08:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclG9-0000000BWGr-1QX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:08:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D88442C3;
	Mon,  5 Jan 2026 14:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38600C2BCB3;
	Mon,  5 Jan 2026 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622113;
	bh=lhRqkJCiNXB/Z5CTm0DjouaCzn5YbbAFUtBaa7SbiDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUb5V8Nq+E7wDEUQSZnxy0EkhZUz6L4b7PrbHKAE1K8RHbT3yRXt1WYNIcHpRlTDf
	 9kzCmAWZWTqL/8x3+doFRK8ZevmNuE2YQg3hhYoW+/QEu6wqs6pCUvm+l99MGyE+mQ
	 qlKioxCtyOQxZYOqf25XFhsjufqa1dYtCIF2FMGU9k8mN9fK7zDebkQjFjOdf9yZoD
	 jqIdA1979GgdHwkSKOXmP941pzu7Av9YQcrzCYGOY5jDO7F2LjZ2lsUBrB0FRgl9tY
	 FDoMy+Id56EWGR/PkZgWCh2nxwaWmcaOs+O5OuzXCyEDKXrukKoI1uuPgHSUeSDoMG
	 KvxZnRArgsscA==
From: Bjorn Andersson <andersson@kernel.org>
To: bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	quic_svankada@quicinc.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nihalkum@quicinc.com
Subject: Re: (subset) [PATCH v6 0/2] qcom: qcs8300: Add qcs8300 camss support
Date: Mon,  5 Jan 2026 08:07:36 -0600
Message-ID: <176762206420.2923194.7249195555946524673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
References: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_060837_397388_0F47FCE6 
X-CRM114-Status: UNSURE (   8.27  )
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


On Fri, 07 Nov 2025 21:55:19 +0530, Vikram Sharma wrote:
> QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree
> and driver changes to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
> in QCS8300.
> 
> QCS8300 provides
> - 2 x VFE, 3 RDI per VFE
> - 5 x VFE Lite, 6 RDI per VFE
> - 2 x CSID
> - 5 x CSID Lite
> - 3 x TPG
> - 3 x CSIPHY
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: Add support for camss
      commit: ec593a86dfa1bbb5ef02165711f7ed8bb1046e29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

