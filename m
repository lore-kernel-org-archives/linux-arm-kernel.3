Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E1EC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85OFlzg3PfxyGmsu7FM6wtJz//OB1PuqzKjev30hWek=; b=wJlHkVzRG4FcwFZ8N59fEgDq+f
	tFrh7fYbYPv0hvwXpIu2VAAadmGpFwQV9FXhOmPis7gDfJttUxZ63n66RGPIXsW0MFAPetzfDm0yu
	UOoLJ/b3h/XHNUMy8bX417KNY/9gLFTuwJaEOxnPFN/vvJknAY1t1I0jWJrEp75MmPEzv53hS5phM
	6D9x+pe89GzGuI+bD4qDKxlbgs+NLSxQLqkd42M8z8b4w2MVHS+OA8GaK7P36dB1mAQebYCYk8Vbg
	IyRc9iFWFmDdre0LhUGGvOc2QAFu1HRKzXOrZ8WuFUCqHUNwdoZ1Cs+7G52XQHNuw2kBniiVnuDwP
	SU1eBa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZWH-0000000EVoQ-0llH;
	Fri, 21 Mar 2025 10:22:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYs8-0000000EOwV-0oMe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14431A457AB;
	Fri, 21 Mar 2025 09:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77739C4CEE3;
	Fri, 21 Mar 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550059;
	bh=ZUR3lzcRBOLhjpUcQQNzMmdrN44+Szn9WQ+beag+iII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWekec6kxiYnlS7QZErXiNsPc/l2TByldwfMbfk5qxHUAVgfeyqbcy/No4TD6IzpW
	 RPKF5LBKYJsHslyHY0Bzz4grHOOD50zPUyM/uSddpo615o0g4GUAgkenCW6q3wpPDk
	 UAzZvSOJkj/s+iN8D8GT1SDzw4pZ6kzp855K5UF8OheTgbsMsmAZu0CHcBmV7JC15m
	 Kq7RadEydjN8AudHG/NHMC1n72vg/6XWa3vTpVB7e713qzCx7q5nsqiGHRwRbQ3AA2
	 6XYde8EJUS3Frl5/iEzVLcDKK8L94ffbnoigiT7PkTqMhfyQH4HD5JjNaWQaA0r23L
	 qbDlQ3Jfx7O9g==
Date: Fri, 21 Mar 2025 10:40:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Willie Thai <wthai@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, kees@kernel.org, 
	tony.luck@intel.com, gpiccoli@igalia.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, tingkaic@nvidia.com, 
	dkodihalli@nvidia.com, Mars Yang <maryang@nvidia.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL
 BMC
Message-ID: <20250321-romantic-gentle-octopus-4aacd4@krzk-bin>
References: <20250320164633.101331-1-wthai@nvidia.com>
 <20250320164633.101331-3-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320164633.101331-3-wthai@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_024100_293382_0CE627CA 
X-CRM114-Status: UNSURE (   8.71  )
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

On Thu, Mar 20, 2025 at 04:46:33PM +0000, Willie Thai wrote:
> This patch adds a binding for GB200NVL BMC.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> The GB200NVL BMC is an Aspeed Ast2600 based BMC for Nvidia Blackwell GB200NVL platform.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Usually this is just one line. Commit msgs should be concise. "Add
binding for foo bar, an baz based board for making frubies".

Best regards,
Krzysztof


