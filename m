Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271D4CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynZ8IUf/pEUVOGGJBKA42BlZviS/Ah1UIkw8iLoEiFA=; b=lnjkybEHCzW1Igyu+9CtUtQvwc
	utGwaoCx8aSINMQH0YJA0C04OuXJUQ6yWNuhu1QhNy54egZUqRapDsgEGItNKW73wJcmJ/R2rYID/
	I79uIh5G9IXu2Jy+ILg6sQyqbfP9XLs3RrI4o7zW+ZeBIW1Q7aZTpc5Q8Ystp0YM+j4AohfjvpXRl
	8I1w+PRYw2hypjotAwDxtQ/CLlGpp4q+UVn2Iaef2kJbxFS1EvGu8yJXJwbgeBF8K0nntE0fO92wp
	tpOxxVmU7F7daKPReTg+sb/r6cg0LgVKEUOp3otg2rSa2m8HRYCL2atOVS0IDpi9g2ltZmZKNI3mN
	QBqIgXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZ0m-00000008YSb-0bvS;
	Tue, 16 Sep 2025 16:58:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZ0j-00000008YQv-3P6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D6CA4085E;
	Tue, 16 Sep 2025 16:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EC5C4CEFF;
	Tue, 16 Sep 2025 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041913;
	bh=n9jFZ8L5DsjRvc5S9GBCejk/BAUuMkiJFJJ3uBsLaxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5PnQyOrz/U7GSYW+Yzil7LUSbRZfJtqXjySaMyUzfspF8eQrY3Ao0ddfJW51V+8c
	 H5mzrCE12CWQ3VDJZLH+nphDv8NUUrEg2AShsPnyzxJEC8L+jyz97tn8vmXVD73Odd
	 ZzjiTM7XzcIUbgwTxunF57jT0TD+0BCCU4DTjHo5TqsV+fA+bl3i2Eby124qSo7Z92
	 WUJqlMLnHa9hgdAq4kwjmaYAfvZ27WQhW3wLC4iuY5BcCQL2sYmaQys7ItBgmOQGHN
	 pEgGvaML/uVs0ytdD4sGGhgx+0y3s6La7tILvglczLi692LCGn5YQRIjvtgos8CKR+
	 lTL82SU+3lEwg==
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
	Hans Verkuil <hverkuil@kernel.org>,
	Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	quic_svankada@quicinc.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/9] Add lemans(sa8775p) camss support
Date: Tue, 16 Sep 2025 11:58:16 -0500
Message-ID: <175804189856.3983789.9613227965968869684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
References: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_095833_865563_126B47FC 
X-CRM114-Status: UNSURE (   9.13  )
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


On Thu, 14 Aug 2025 15:46:06 +0530, Vikram Sharma wrote:
> From: Vikram Sharma <vikramsa@qti.qualcomm.com>
> 
> Lemans is a Qualcomm SoC. Previously referred to as SA8775P. This series adds
> bindings and devicetree to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
> in Lemans.
> 
> Lemans provides
> - 2 x VFE, 3 RDI per VFE
> - 5 x VFE Lite, 6 RDI per VFE
> - 2 x CSID
> - 5 x CSID Lite
> - 3 x TPG
> - 4 x CSIPHY
> 
> [...]

Applied, thanks!

[9/9] arm64: dts: qcom: lemans: Add support for camss
      commit: a19c879b69b12cc31ed59b50e743a1ef2e5b08b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

