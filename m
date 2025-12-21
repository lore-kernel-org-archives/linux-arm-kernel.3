Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3763CE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuPiSAJtCYlS3QcES6kPkiVubxORCSEVcdODyeaKAYo=; b=SMgrTlcXxlNVgv1bUbH797o20y
	PXSpLvEaGZANognsiPiNw6KRKyTLsrDxVuRC7p0Iu8pocIebU5BfifNxia1dkBM0IMIqlEmbpbqlT
	lqtxWjqzl7wqzuMpEp7OQKYmHXyw74LgHZtCEfiebdj8ufT6dS0B98LzFo+g3AvjflxOSi07PBp54
	sky5uy6Zl8bYEWpSDynPmJFx3iFaY4xyLNulQxagSGa4zKvb3QZCnshgXWPlXXjflxn82iEH82O8Q
	waN063qXEclGJXddbNc7Ts7+EiHyyd+5bjFfhfoHujyIFkF0dIhEkVWLcSy08ImskDj7mDosru7rT
	e1MroDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXJrl-0000000CUCX-2pDj;
	Sun, 21 Dec 2025 13:52:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXJrj-0000000CUBb-0Dza
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 13:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C197943B78;
	Sun, 21 Dec 2025 13:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199C3C4CEFB;
	Sun, 21 Dec 2025 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766325174;
	bh=/24ODsP51o0qqTwmmiMCCQNi1FpJhNQSQeQadjdYgQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a1ujjf31SAsrUBQ7M2yuCs/P0ZS7RJJKJbOGYiIHW6kmA6ChF5MO+vqpX490i4wpr
	 AH1SnFBxv5FYiCsfAmh/ZyMAjUSitEbuB8+CngW0RNbi83TurIvL5z8zQio8iy/Q/8
	 C7fAhR62eFZh9l26tBhHh5YujwHRMuxltA7+bLiXr2bItLL30eJKDnO1F/0YqpN+nL
	 uodq8sOvNsQyfLC4nblA9I8S3s3cfgCwFsRYCYOD5aFYuMkESreXEXIUBALHtfHPtw
	 SKYPP699Jw5sEm9mcbAPNIg7DNpTa3EqcsTYpGHVoBZhsqe049NQmcwiBdI/7Bj8lu
	 jVkTnetHjIewg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
Subject: Re: (subset) [PATCH v3 0/6] soc: samsung: exynos-chipid: add gs101
 support
Message-Id: <176632516971.32657.9705305853301180066.b4-ty@kernel.org>
Date: Sun, 21 Dec 2025 14:52:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_055255_133253_5B7EA3E1 
X-CRM114-Status: GOOD (  11.80  )
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


On Thu, 20 Nov 2025 11:29:34 +0000, Tudor Ambarus wrote:
> Dependency
> ==========
> Typical dependency of the DT patch depending on the bindings patch,
> thus the bindings patch could go via the Samsung SoC tree with
> Srinivas's ack.
> 
> Description
> ===========
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
> 
> [...]

Applied, thanks!

[1/6] soc: samsung: exynos-chipid: use devm action to unregister soc device
      https://git.kernel.org/krzk/linux/c/1b3376d2167766e9f5ac05a03ca4625777090ce7
[2/6] soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      https://git.kernel.org/krzk/linux/c/8dfbb5fcb773a6481407ec890280cc3b1ff8e234

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


