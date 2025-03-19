Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F07C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SV1ACe878lmcNnl5s8vqOkvgsmK9A/JbH1HH9hF0cZk=; b=2F8kmizuimhQmgxkEd1ycyNjG7
	Lfd8iQFy6X59nrTYbvyd0swJuW4DW/GuNaUwxDPneOHZbGaYRk+yVvsOkQuUMgtwV0maCZ3Vd3W+f
	dX5OaAnecaIF7SmnIhv/0BJ3JfmEcIuMBKt4vtPTHgTLzTcODQEpVahiBjtplGuLPXkneOTab1Vju
	+DiArXWo26wVm07KkTzyDlgp+KRKp38fIPpAvH7zrjjxAnj7Z06s1SSO7+QrqS0BY85fzDlAKyy1B
	/uY3alUCMVrMnGc7E/4vgweOVAP27A5vfJfDI8SmHHDk8XLppqTSEkvNBghGP4cJxf2Qq54eRaovv
	7UGBOpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuNQ-00000009CgX-2lR0;
	Wed, 19 Mar 2025 14:26:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuLi-00000009CN9-3zLo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 668EC5C0689;
	Wed, 19 Mar 2025 14:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A545C4CEE9;
	Wed, 19 Mar 2025 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742394290;
	bh=V/SLhvo9gcRcf9Q62gLBwK9RH73pmO1Sb6lYQDSl+Wk=;
	h=From:To:Cc:Subject:Date:From;
	b=iXGLAktPqySm/IOVownGzFPBorVEpFDIFoz1zL57oLU4u2TXJasxt9ZojKLE28i7v
	 wAu6Oyq0+zqM4HcZQ+yrSwM2CHwNTcp+i0s6Dbh2ktUODtabONDNspV6szP07pNu1q
	 N5GL0bhfgqP07AXCIUGL5EDQL/N5jRGivHTNZqXIvVoQDCkHjM0RRkHmcD3riB2Gle
	 XGer4OTQD9MvijoWPJYxfKrh2JQKB9Kwn3sZ0lBT/KupP+X8v0RTk+eB7BKIG4SuTR
	 zGO4l7SrNxCVPDZ7SldoQZEQjFcMkRJzY2BqJAVFnJzwpypA2jhlhawXnF635mjoDi
	 ON0MsVARpJIxA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Rayyan Ansari <rayyan.ansari@linaro.org>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.15
Date: Wed, 19 Mar 2025 09:24:47 -0500
Message-ID: <20250319142448.2279164-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_072451_031734_43934DCE 
X-CRM114-Status: UNSURE (   8.69  )
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


The following changes since commit 2e14c17a2e3d697bef6b5bf49b253d6e52f3d186:

  soc: qcom: Do not expose internal servreg_location_entry_ei array (2025-02-14 11:37:30 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.15-2

for you to fetch changes up to 65f330ade7daec740ed8dbdf33ccfbfcc5fbf5c8:

  dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible (2025-03-13 17:50:04 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v6.15

Introduce Devicetree binding for providing board-specific firmware-name
for the GENI serial engine block. Add SDM630/636 support in pd-mapper.
Clean up and fix error handling in the SSC block bus driver.
Add missing msm8916-acc compatible to resolve a number of Devicetree
validation errors.

----------------------------------------------------------------
Alexey Minnekhanov (1):
      soc: qcom: pd-mapper: Add support for SDM630/636

Christophe JAILLET (2):
      bus: qcom-ssc-block-bus: Remove some duplicated iounmap() calls
      bus: qcom-ssc-block-bus: Fix the error handling path of qcom_ssc_block_bus_probe()

Rayyan Ansari (1):
      dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible

Viken Dadhaniya (1):
      dt-bindings: qcom: geni-se: Add 'firmware-name' property for firmware loading

 .../bindings/power/qcom,kpss-acc-v2.yaml           |  4 ++-
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |  5 ++++
 drivers/bus/qcom-ssc-block-bus.c                   | 34 ++++++++++++----------
 drivers/soc/qcom/qcom_pd_mapper.c                  | 12 ++++++++
 4 files changed, 39 insertions(+), 16 deletions(-)

