Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AE0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdivMF2micHtrvkry4935zJ83xS7YFqQL06cr89Pw4U=; b=V/LTysZBp+cUkQgQHRBekLSvNG
	kx6tsVNhCjgodmMuTKOl6TERTJU2GwFD+9P5eTW8GlWAU7S9RVWbZKNVVMKitzHMDvwrMb/4ceV5t
	1qOPqCeQAn7BYsQy+trp0tcUFGcf9+y/MNeh2yk8eGBP5C3AGlQxK7DFrGnLYovRGCTYCKxdKbIWE
	x3w+XwsDbU71zXhXmrEg/u70mLIrZtK4cuSunHIigPiQWU/ZyGcohqL3RoPhPm5EMV6rCxU9XBEjU
	880vUZ/TYb+KFJTh1cOQhvVqdPaC8vwgqRrqQ/SQpIBxqX5uSxqchBYqXWfy95vJEwsQrI8AiOWyW
	NMtDcNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJcv-00000004NxF-0Wed;
	Wed, 26 Feb 2025 15:47:13 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJaW-00000004NPL-2fS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:44:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A59C612CC;
	Wed, 26 Feb 2025 15:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77086C4CEE4;
	Wed, 26 Feb 2025 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740584683;
	bh=VDSomwl6LzEXsr4LwgRvd++OnseNgFtQFF9SkT6kNt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qwf2gzjuhyX5kLyfs/3nK1bGOejn526NdZSpQSKHGdVdeSXCusUHJmcR/f1rXWosT
	 qxa9ekOZgGBgeGx+GzZ4t6eS2QvN3kKX2dseUf8vNZiQ01PJzF7AHxBj6XMj8VMy4o
	 kzOyfGhALTnNCCpfI6bYgaHWXHU78CY3nHpPHT4uPuDUqmuLc2Vok2TeAZNC6cC358
	 bcXBRrphtqMUbEOrphyUSfdf+efbooC+KConbTAtK3N9CV6AEHp2c6OB/yNJ5zZPLX
	 5I4AFe2CTIl5CcHfjmtJv2z1vXBgdHxH0EN05zMBE5J/EtafHgl6vMksVSVEhHpLnh
	 /71lJSbYWsDww==
Date: Wed, 26 Feb 2025 09:44:41 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: dt: submitting-patches: Document sending DTS
 patches
Message-ID: <20250226154441.GA2485697-robh@kernel.org>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
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

On Tue, Feb 25, 2025 at 07:48:21PM +0100, Krzysztof Kozlowski wrote:
> Document two rules already widely used and enforced by DT maintainers
> and SoC platform maintainers:
> 
> 1. DTS patches should be placed at the end of driver patchset to
>    indicate no dependencies of driver code on DTS.
> 
> 2. DTS patches should be applied via SoC platform maintainers, because
>    it is a driver-independent hardware description.  However some
>    driver maintainers are reluctant to pick up portions of patchsets and
>    prefer to take entire set at once.  For such cases, the DTS portion
>    should be split into separate patchset, so it will not end up in the
>    driver subsystem integration tree.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/submitting-patches.rst           | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

I've applied both patches.

Rob

