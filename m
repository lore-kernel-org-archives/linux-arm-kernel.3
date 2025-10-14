Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3526CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 00:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKZANYTPs3wk+jHkdVOhm0yZgFra/Chux/yFUit/GHk=; b=ctXpY1HL9az4tGqHTEfM3sAtJY
	EOycS8Mzmh+7IQ8H78H6CTXYdUkcfqx+bMYZQxLhugrgEJegVPjVPl6g2w/XyUqnv3bRIS/g1twkz
	6cTeaoLfE2wzSzb0AGJQ4Zg7Pa1MoZFz7S3Gh68qVwWEyZMhwPWAIC8w3fbJG8JvFa0szXzMpkA7k
	GQ/MTeKCcfZfzOUB6m1qVRcU+iAkf1aRAByNZSMC9g9EeBNiiG/PNPYkJPnA94mFAb0Mt18g0w9oF
	bnoAw/cz8iNBe9rumN3xnGV/QOf7aSo83QcR3/kpFTeqo7Bt3/P+rK0CA0xv2p5hBRexEQhAqqVPA
	PkNhzycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SyY-0000000EqFi-2FTP;
	Tue, 14 Oct 2025 00:33:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SyW-0000000EqFQ-0siq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 00:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9152456A6;
	Tue, 14 Oct 2025 00:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41E9C4CEE7;
	Tue, 14 Oct 2025 00:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760401991;
	bh=CONMfOkpLR/OR0Vcog2SL4bQ1cVtLbXbZRDLxFGSDjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uX1qN/6t8Zx63Cp7nxsMUxh6BMAYZfNzi+SFdtReZPisgOlQluDaf0ovqyKJgt1oW
	 dMw3mT7kIfwEpqXgR8PiXrAG/5mbUapIeyhMAjnineOLuKSH5g7Ef+FaGAwZfWmCVO
	 cnJKxqfMy1sz+deEqI8jOB2RhyjrnvJurrVoOCPiPqs5Lb1lsjVvxQngPBGuWBACJw
	 gzQM9xyInUc6Pp2Lll/8+vTMyEnT9SJDxxSF4v0ZuZzjy/1wql08+WTMfQi+yY5XUe
	 wMtnKtMhxhZ0BZYmbOihLSqP776rZXJ1Kbjr2Rwlw0GR2hYAgydc2svWNOLHdw2WXf
	 B+1vRixraSGPA==
Message-ID: <50eb0743-8b6b-4d6b-bf22-46a428cbe26a@kernel.org>
Date: Tue, 14 Oct 2025 02:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] arm64: dts: exynos: add initial support for
 exynos8890
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_173312_292306_B8762D5B 
X-CRM114-Status: UNSURE (   7.37  )
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

On 14/09/2025 17:03, Ivaylo Ivanov wrote:
> Hey folks,
> 
> Before anything, this patchset depends on the following ones being merged,
> either for dt-bindings for compatibles, and/or device drivers:
> [1] https://lore.kernel.org/all/20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com/
> [2] https://lore.kernel.org/all/20250914114457.2610013-2-ivo.ivanov.ivanov1@gmail.com/
> [3] https://lore.kernel.org/all/20250914122116.2616801-2-ivo.ivanov.ivanov1@gmail.com/
> [4] https://lore.kernel.org/all/20250914124227.2619925-2-ivo.ivanov.ivanov1@gmail.com/
> [11] https://lore.kernel.org/all/20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com/
> [13] https://lore.kernel.org/all/20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com/
> bindings only:
> [5] https://lore.kernel.org/all/20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com/
> [6] https://lore.kernel.org/all/20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com/
> [7] https://lore.kernel.org/all/20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com/
> [8] https://lore.kernel.org/all/20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com/
> [9] https://lore.kernel.org/all/20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com/
> [10] https://lore.kernel.org/all/20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com/
> [12] https://lore.kernel.org/all/20250914135652.2626066-1-ivo.ivanov.ivanov1@gmail.com/

This dependency means I cannot do anything with it. Please list ONLY:
1. Real dependencies. Driver cannot be a dependency for DTS. Dependency
is for building or LOST functionality comparing to mainline kernel.

2. As separate list, the non-applied bindings used in this DTS. Bindings
are not dependencies, but I cannot take DTS before they hit next.

Best regards,
Krzysztof

