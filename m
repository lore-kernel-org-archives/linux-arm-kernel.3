Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83080C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQX698hxn3C0qIZ9h+t7i/by2l02GA/EGgvpb0ocGFs=; b=PSuuP/9sdAH4zB/SuZfYQ91Q0l
	jUWRWa8y1E8wQlueEI4rFM16h+Sy1zfHoQo8nFZFztqP6mbMUETlUvRBi/kdoA2hgu9grizvY80z1
	avxU60b0uiR5fo/CHXo3XGjrTBbYVjSXksAM9PZRjXmZDZ4Yn3D5/iT4Lmp9JanvOoSJYJO+JYPCt
	xOYVoo84giC/ZEY7bcv/sbMXwTPVqQ4nN3HZCmxRIeaHCoO0BJ7J2TjBco+0C0PU+dFjsfZJaFDi+
	qp2lV7qawI6cUUEN7UDz3iNMQPduGqD+U3tpM96cCbzhN1nJ1bRKGNJHFeRU79P0v7ijnw61txT3J
	eWWcMscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wial2-00000006hOG-40nc;
	Sat, 11 Jul 2026 16:40:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wial1-00000006hO8-3hI4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 16:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB351601D9;
	Sat, 11 Jul 2026 16:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29C11F000E9;
	Sat, 11 Jul 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788050;
	bh=CQX698hxn3C0qIZ9h+t7i/by2l02GA/EGgvpb0ocGFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XTKhlx7Ibk5O9aoBEMG47TEDPcWhPRYN7ttEf+azuSgyXgiyMszDO9+tAEcK6Dbgs
	 x+GVA81Ba0JZqiitNLoZviS1aDe5aD4rM5sbEgyW8wILl/+cHId4bCc0uhM+Im4qA1
	 vG6v5sVNcPE15cj34Kc9tkDSTjoBM3Pgd1kIp+2eL090/8eQoe80sgmSfI8R+gVkMf
	 /mBOhatCxh274YsDh3SvSJlHzTPjljgdcERIBOScsEn0b6h+wyaIAoWIF+VUq9qg8H
	 I4YS9JpJKDpXSgaT9d8dRoYjOGr1ooIxHUKQgohAmUVJwiVMYzDg7ed9rTkhwP+PA0
	 BIVTLRxMNGc1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] soc: qcom: Kconfig improvements
Date: Sat, 11 Jul 2026 11:40:37 -0500
Message-ID: <178378800460.138068.14941627413672684925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
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


On Sat, 11 Jul 2026 15:25:00 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> Defconfig change (last commit) depends on earlier changes, thus that
> patch could wait a cycle.
> Alternatively, everything through Qualcomm SoC tree, but then please
> keep these on a dedicated branch in case defconfig has to be shared
> with soc tree to avoid conflicts.
> 
> [...]

Applied, thanks!

[1/5] soc: qcom: Hide all drivers behind selectable menu
      commit: f2866e6a27f7cc26111ce195ddf00d4050bb27e5
[2/5] soc: qcom: Restrict drivers per ARM/ARM64
      commit: e10b198a94c66f7105dbd535f66631c96579c903
[3/5] soc: qcom: Make important drivers default
      commit: 9b3daac1d0eed2564e49a08636e5044c0bfac0b1
[4/5] soc: qcom: Avoid SCM and SPM for cpuidle drivers
      commit: f6540105e0aaf6c1d3fec6070217f199bdc351f7
[5/5] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

