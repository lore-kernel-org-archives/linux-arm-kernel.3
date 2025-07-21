Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058E5C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kY/qVqyukbmYuJU8aGt4dNrPbq/KEcARNTpYBPYTnzY=; b=AoBUIgOzTZwO4nF/qbJ5jjc4e9
	ex0orBONAnpUNIci6ikDiW4pM0fLwcSLebOmSSFVX9wQqmSuUlnyHzLUFA6g3b1HC6vG9dlln3IHy
	Z2PKeSHsMety0KinWzu/78mlkHZIMvA9tYGo4MgXPodDwsmBKgaLHFCc/AWiw3a7Io/vWYy9Tqjxg
	6BMlv/zS0/z7WZ8CUiTMcmAgb+bqGLop5yxB8zIaU5W6EdpeWfNzKiEzyuetJwB6NILcdglWBCv3E
	JyPF2XKJKmcru29RoV3mozWX3CzeD2SJ0TZn+CyLXjA/i47svClHcYBrBk3fPgH93pgdElnWSap6I
	95SHKbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlCj-0000000GXGG-0M7J;
	Mon, 21 Jul 2025 07:44:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlAH-0000000GWjg-1u6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 07:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86BC1601DE;
	Mon, 21 Jul 2025 07:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E87C4CEED;
	Mon, 21 Jul 2025 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753083744;
	bh=XYtXJcSx59acBjNpYrTcaOZ+McBebEu8GwQdfjrYlxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqw0Vu6cS5IaBiWbim5p6hULKDwdbtHJ26JLb4fSYufdL1D0VYixws+yPTzF8Fhne
	 eg6YXEPS6EnKMjn4OeT0TDyP7oCF7oqeGz9DcklGt5n36uc1mFN/f5NXo6ihTmacFl
	 zJlB5duUWRDI9Uohc6JfFlPqqpsLR2bw0qc8YJULxmJ/3O6IcaqlvsmJKDdhWcD9d9
	 Vhwtzfh9sU6u8oOaTG2rdUZQQdwTMeNIrkx2cbLktSVpHxrQclCbSzkTlWsGrtM1IR
	 DgUUI1dx065lxFQtYNnOIoWejKjCMuTfDhog7oC8XKb+Jyz3nGmcLmLA+pbJ4ZT6Lm
	 WXxj8IOMIXSLg==
Date: Mon, 21 Jul 2025 09:42:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] Documentation: devicetree: Add binding for NVIDIA
 GB200-UT3.0b platform
Message-ID: <20250721-auspicious-uptight-parrot-b1e19f@kuoka>
References: <20250718231118.3330855-1-donalds@nvidia.com>
 <20250718231118.3330855-2-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718231118.3330855-2-donalds@nvidia.com>
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

On Fri, Jul 18, 2025 at 04:11:17PM -0700, Donald Shannon wrote:
> This is an Aspeed AST2600 based unit testing platform for GB200.
> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
> differences, additional gpio expanders, and voltage regulator gating
> some devices.
> 
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

With above two:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


