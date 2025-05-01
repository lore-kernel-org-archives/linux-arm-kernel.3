Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16949C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9A0yIeZx30AwTBUYnnlBoGICiFj17jotAKfE3CiQ46Q=; b=kSjaEgY/1lebDCsdIzqaeWRy9x
	kCAAK7AdotBUKabvIBZRweu99wjEPzc21vLYUP5ckzWLeUnJ41WSpbCY7IUPO+rCujZcV1byrEkRz
	+tnacWDOEnlElALlS2JimdZ0ZyrF4kjIBoiZlORJSC8LrIQIelqKofNddBOaWf1+WJ2LpZ2QfXLuq
	+Y/5j2inErOnRtLXjHcJCicn/78G2ZVy8zacPWJHnf09yiqvl1QmJPzzAU9Avm8ODssqxYSetj70R
	ZvL6Iuvm7JXh90F8LaOoc/UDmffPQrUZK6Oh8623mpAXwhKyKbPRJiurwWwqemLgsGX2ZNsqe/XLu
	KcNgKUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATqP-0000000Fo75-2z4P;
	Thu, 01 May 2025 13:20:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATnM-0000000FnfT-0Xbs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 13:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53C9F5C5896;
	Thu,  1 May 2025 13:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72118C4CEE3;
	Thu,  1 May 2025 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746105463;
	bh=QtW8V05Ll5TgPFoRHUE1CblqZBs5rBw/y7zDbeCz2Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wl4GnDnwJXGlIGZ8fC5LMt1nsQT92up9CfvAsDJqGX0AZ/pSez6UWnMczBPvGuoU+
	 vJpRBXQawz0eZXmKgXOu2Tq/YZxgDuPeZmow79KAcR1JahN5qDmv/LuLKQbhMMfCS+
	 LJTiuotSAnjKbzRYkrU25861E6pJu8d28cqTYFUlAC66b1uEeJYG/iN0+0Mq3kCgQZ
	 2aapo/88irzFShq9xenYlP/GmqiMWYtnbkgsJb7ld6eWxYtIO694EfRe3zw2DtORNr
	 XIpfeePuaPPGbdQwnrz+ALQLLNDqCaEQ0T3b3ko8/jMdCY1QV9ggBZ6xX1YEDlSQaA
	 QBx3Syq6+lh4A==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 00/11] ARM: qcom: fix APQ8064 schema
 warnings
Message-Id: <174610545917.3855354.6995417813544260690.b4-ty@kernel.org>
Date: Thu, 01 May 2025 14:17:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_061744_211478_335BC602 
X-CRM114-Status: UNSURE (   7.13  )
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

On Fri, 25 Apr 2025 20:47:00 +0300, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> [...]

Applied, thanks!

[02/11] dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
        commit: 137d4ebdf6bd86ca6aa26ec4f9a1c5b579905c6c
[03/11] dt-bindings: mfd: syscon: add qcom,apq8064-sps-sic
        commit: 9f8af721495e04b6c3a3a5293fd8afa7e38bee1f

--
Lee Jones [李琼斯]


