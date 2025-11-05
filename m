Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82ACCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kHGJcgxXA2m+dBzaF0yr8plMLyL3QJy6q7UOn7QXQA=; b=GPsMQjuaUDX8VOLxH6JXcMQH/I
	9NMrkvMSFrF9/+l6kSN+xHfno2vkHbD5WUdskRuZyicDGYCOFgH0JGjIBPzP0zRHPiFdQDGWSdy0F
	aLxQIfAJgFrVb+FpZKs7XYC0v0e160oFPnQneHhP4LlNneCgpQSEO8SrbeKHmlyzuV6rMCl4XuBTG
	UDKAJ2zIaax+t7YHJjByHIstz7+CMkMbICq/w9YX/mI/CsW4CMVPVZ9cpl0fl/Kkel9+Ax2lAZJLC
	dogBaA+LA1AQV9qnaaI53ZGgEarjSDMqDbGNgzNKB5VcKoDoo00OEhSlhAFT+WhfXxfdvZRIxjkhF
	b1kaXKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZIa-0000000DKW9-2ZRu;
	Wed, 05 Nov 2025 08:55:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZIZ-0000000DKW0-3sDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2122060205;
	Wed,  5 Nov 2025 08:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644C5C4CEF8;
	Wed,  5 Nov 2025 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332922;
	bh=q2HC6BJNcGczMQ4oM0u2Hv/pTJcPtCPZlJD79dhiWOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYQsUvuFU7j6zma2SH7ae6HUyFpK2svx5uMUr2Ek79kxlgEHMA04WfdZL7BGa8Mja
	 IJM2vMMgSq1MRGlUiv4VxZzEUgkiN6dlH69DPvDhoEG8nzqFZeJIBE5a45CJqPjcvh
	 TKJbqUkiI0/L5E8Ye4Ecny5fRPy/6NuvHon6Vr/fUhsVb6kdSvk4c/xMuvxmUlbel3
	 bGmzjB9NJyGbl7M6Stc1AP2QmhMZBXCll7aMFci0Yq/YJ9ctaH1fFvxlUf3AiWSuof
	 sl4BXH+wZOt6HZD6AS8PXANkZ/pWTsAHjGOyshy7wg/myyovBbN5SiM6G/ONZI9/Cg
	 ZAzBTMwwQQQJQ==
Date: Wed, 5 Nov 2025 09:55:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
Message-ID: <20251105-guillemot-of-demonic-courtesy-6127ac@kuoka>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
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

On Mon, Nov 03, 2025 at 08:03:10AM +0000, Peter Griffin wrote:
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> Update the bindings for google,gs101-pmu so that the syscon compatible is

That's an ABI break...

> no longer required. As it isn't really correct to claim we are compatible with
> syscon (as a mmio regmap created by syscon will not work on gs101).

... with kind of a reason, but then the question I have: was the
standard MMIO regmap exposed via syscon ever working for any part of
this PMU?

Original posting here:
https://lore.kernel.org/all/20231209233106.147416-2-peter.griffin@linaro.org/
did not change PMU driver and did not express that the syscon is broken.

Best regards,
Krzysztof


