Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3F6C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+upam/VUkvaTlgRNWKqyGgiS+sgCcnkVhxoOA8Bs1A=; b=te1vl9CM0a5NkL2ILdIUviRcyJ
	JShB55A9L2tGBx+WasRa4/730RDzPxz5EEh3OIq5GQxK36Crmv10AR3dwjGtByN23T2QgrkRe33NQ
	nM9QXm9aVroX4776cuJsZcEfDjuEDAgBmK3M9C80oFpuYHyB6zYqqnfcFTD92MhqrkNwnui+D8fa+
	HfJmTq7onA2Y8D50W0ZyIj4oVJMhA0cfFPXfOcv1W/fRJdK+njS6uI4CSmWrguea3A1o1YUsTDQpw
	DKFLYa1rZyY+g36Navuq27dT3yKHsY1ITJHxcEiO4A7DPqbu+qEZgmopyaAhu9TFPp39cy17+oaSc
	Mt03vxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0g3-00000000zcn-2YKB;
	Mon, 17 Mar 2025 02:58:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0eM-00000000zEw-3EQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 02:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA7555C4CC2;
	Mon, 17 Mar 2025 02:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50527C4CEF2;
	Mon, 17 Mar 2025 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180181;
	bh=lAznnt8Ub0g0fJn7VAfYtR0EILvS7z3VrcFUWHbFZPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCOjgGegN08+3CvIjAYKkn0uGfactgTFFXxQwhTAfaC+Rpt23DsNQAXUxnbcCg7Gf
	 5DWTFTx6UIqkT26Uh/FC9erAg1/Bzmofs3HrRdJ0M+7YrH7QHnt30cfwTXg0CvqIIl
	 UpkwuOd0nbZzso6Nn7J22ap6tWqrSWi5SgaQ3JVP9KDKzrKiCzin5zZGXlSzyGZd1Z
	 rypAh+L4Qonegtz8VcNd4dtGCwuFlHwJ0Ny1s5XVfr7tNa3gUxzDMjQS9BxtG6c/ng
	 h5EKuJ8N9wCGkugfyULA74YYeZxx6gUEvftw9nQTmKPLG3H3PU/iD5tLdjV4DfmI3y
	 oUKM3Ke4KSHGg==
From: Bjorn Andersson <andersson@kernel.org>
To: rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/2] media: qcom: camss: Add sc7280 support
Date: Sun, 16 Mar 2025 21:56:00 -0500
Message-ID: <174218015892.1913428.13707146883622182488.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_195622_850596_153409C5 
X-CRM114-Status: UNSURE (   7.58  )
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


On Sun, 09 Feb 2025 04:21:41 +0530, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc7280: Add support for camss
      commit: d4da3adfc560fcb55578f8564d9f5a972507b118
[2/2] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
      commit: 39e6ca14ace9d138e40ddd42313c2649a6f3e69f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

