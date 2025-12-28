Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D94E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebddpHHAWsu6nh3aHuZCXEZNNwfqufX6cIVzI3ZPNII=; b=HufbJ213G23SVBQ6yyDpqKO7dC
	W9G2HJfFMVCQfa8OR1tDTRAohnSv8MEaBT9d4G2x3MOWAFv4whaxHK96JZKTYxZyYQ4RKgpa3wNRy
	IbkssQwLztyL73oMc0U9dSrdcDsO+lkKm2uwoY4MHcbx7y2Q68Kl7H8ptXcS84x+FM5hkJS4WIIPO
	k+VuXGmfKSXhNnzo1ljoX9JnCaOIuJG+L9dXY+tVg5JWrMBz7d7rDbScQmhlMX5UwHLQxnh8sErI4
	mF7ESiHGraBMBVSR7oRPHwN2+h0RREJ7KViDl+drr93XgbwjynKXd+56xUisS/WyTuyWF1+L6T77w
	q8HVm9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZp1N-00000002fKA-2Xk9;
	Sun, 28 Dec 2025 11:33:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZp1L-00000002fJV-1oQx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 11:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E31444439D;
	Sun, 28 Dec 2025 11:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE30C4CEFB;
	Sun, 28 Dec 2025 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766921589;
	bh=coWrLRzyfgo4h4Wef0U+sHZbBA/bDgv/7mVLJqnRQro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LEVNoW1WcQhaT3ThxDESqTT73nZhgozPhzCNYulfecLLWOkOueMwep7g/eBUI5Idf
	 +ymmeCVMjppma183+75Yn6BBdGZE0HjUpAKNT3kb0rYTWUpy1w77/Sa9Cw42L8Kpyx
	 F+vemiGvTdfkdejFO+/fBLLGUlwx3Rh3rWOCTUMnz7sKeHFmPc1aQ9SQrhTI41M4T1
	 yQ2YUNMQ/QOedivlS+Rh2O0P92NhK45GovpJ0g0n+dQILnw2I6tSuU8LvCn86iVY9t
	 UyNtxX0SZA7gD3mCP6BRsr5Lux9IY0KGIzQKPVjWBxewUn+u08twWqgMGKYOvTc4kl
	 arIB5uBXUUsmA==
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
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] soc: samsung: exynos-chipid: add gs101
 support
Message-Id: <176692158656.58608.1877617154747572001.b4-ty@kernel.org>
Date: Sun, 28 Dec 2025 12:33:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_033311_493276_25A71981 
X-CRM114-Status: GOOD (  12.03  )
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


On Mon, 22 Dec 2025 16:30:04 +0000, Tudor Ambarus wrote:
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

[5/5] arm64: dts: exynos: gs101: add OTP node
      https://git.kernel.org/krzk/linux/c/9afdf3e1a59e23180540ecb1fe3287c308cc8113

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


