Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6283C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OADxrFJ+t4Dx8VgY9XZpFEf7YPrxIZ1wR6HGIT2FrNA=; b=QArja5OqMkxrVsbyL0RxijnRCS
	p2IwYUB6i5666ic71XEYte0fUdyhcAvnW4OMQaOBycMlEgx5RRhrhSq/QUn3ngMJD/yyw9NB9FG+G
	fY/Jwxi0cK0FQ1b34DJqR1BVEHU9mKJgwRByUmBes1bqVnRk6u25iHxnx2R09ZABSKS7r0ATgIb15
	PjtjC4dtIC72FvKVRWiXuGS6nthIogMZYdV0Nen/kQnaJ7lQO+oQR28VQRoN5jFEiP/Q9rwNHiqgM
	2Ahyk3Jy/NBTcFvktZCZKY8Nh7AoyKIhGJAT63XnoAIE1sRfpgTlLymkRu0O2Cve0cv8SDtc3hHIM
	IU+6BZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widiK-00000006pL9-29YL;
	Sat, 11 Jul 2026 19:50:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widiE-00000006pIu-3Vxx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 19:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E536B61371;
	Sat, 11 Jul 2026 19:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7201F00ADF;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799409;
	bh=OADxrFJ+t4Dx8VgY9XZpFEf7YPrxIZ1wR6HGIT2FrNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HU677xkPvltNInibF8s6G8JYgYtJocTIpDyXLUFACvIVvNkOFcQaxjFvWcD/DytJQ
	 9evA707BQqf0wpHB0gKhGYvgO9cqsKmcHK4u3Z1plDllAiNITFiHpcRrZzxDlX2JOC
	 c+WWEZxB8sz+Xbv8FLBO4e/rocl5EswesUV+KJliZkdoAJEA6N8qt62PqUgbQx1RDV
	 jxZLh5b58Ps7pQ+7Ir/MZSDqKabWdv2YGeEzs+qSPeLG+rlt9AD4ge+7igCDrpu8k2
	 av9qoCKh/ccu+lQ1BVvuSejB9iFVz/3zxO8amhk8AKMao+apTY/+08OyGEm/tqNxCC
	 P23bUYBuLJuBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Sat, 11 Jul 2026 14:49:48 -0500
Message-ID: <178379938596.163099.9873273386152252307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 03 Jul 2026 12:03:58 +0200, Krzysztof Kozlowski wrote:
> Merging, Bjorn:
> ===============
> All clock changes via Qualcomm clock tree. The defconfig can wait a
> cycle or could be applied via the same branch on Qualcomm tree. In case
> of the latter, keep it on separate branch in case this needs to be
> shared with soc@ tree.
> 
> [...]

Applied, thanks!

[1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      commit: 2ce505b437e98adc3c009d22762f491cd2cb15ee
[2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      commit: 9904402cf417140f0dbdd0b9b3b5f5fd0527a447
[3/7] clk: qcom: Make important ARM64 drivers default
      commit: 5c38f9b7df7716c2ff54418d6a0aa4328133a58e
[4/7] clk: qcom: Make important ARM32 drivers default
      commit: d643934c275d83470a195a115cd16ac13d1ebbd6
[5/7] clk: qcom: Add defaults for desired arm64 drivers
      commit: 6b150572bb76dc508b0d9fbe2c5a56a67429e376

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

