Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F0D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoNWOnWWkWkJJ4MAu0bjK2VViS/I9YpwweumM2Qo6dM=; b=0X5ZiCAklizpuW2AnQFAgBSB/J
	2KJl2dFzl+5xK248kROHNeQu6UWDp+nI1b/OgxSFOP090Rm43Ng9oPfjtvce7x6doLuSBA/4udJ7U
	taaqlKlkC59Ztig3AVD89wBdmkZHyxJ5O4yIDSJAl+UzC/8162vqCrqgUBiYBo4ouVKFTGTb/KaLq
	g/h9gpOn/hdoc807/V22w2IiEQjTmqZFBFHliXjB9CG5DCS856pGR0QgNcG+ovii92MF6ustTr4lJ
	+5rSZqmyu6HJQRbhs4tbKXsmiL1qymHx3paFYk0OyxTQISXatqfutizRc3Gts5redzPmRc7qVUafJ
	O7llv02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vescv-000000047rK-06az;
	Sun, 11 Jan 2026 10:24:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vesct-000000047r7-29dZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 10:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1CC060127;
	Sun, 11 Jan 2026 10:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054ABC4CEF7;
	Sun, 11 Jan 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768127089;
	bh=DL3GzmlN0hpFYtlTU8ZWZz/MqKZSEvQpUMZJcmQG98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTMdyW05wdKcPjfsldkpS87bpuAbprWbOiOF3d3Csqq6KrCT2yz2qcjS4QnFMnA61
	 RZWBh2UTCUZboDoWk6UzfLQv3tKpx+ML8v90seABJDWHIdbsiGJ3qgxJXkz9VDz/+R
	 a6T3JHwi0BkmNUZ7iKnkze8V+lXR7ge3FEfN47s8+ba95fhzI2LCSTU//Y29/YMOOr
	 iPx2A7hNsMxnLySNuSMARMrjSpRwhHirPICephofhf//DsM21k21fIToF0tQgeAxOu
	 11qpIG7udBkCjqRGYxSD5cXSVlVrTfKvZABt5/X9EyNi7VspdmXJfzy/hBOPBwGIZR
	 n/zf7sYlbplBQ==
Date: Sun, 11 Jan 2026 11:24:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chanho Min <chanho.min@lge.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Kael D'Alcamo <dev@kael-k.io>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: lg: Add compatible for LG1215
 SoC and reference board
Message-ID: <20260111-magnetic-maroon-quokka-c70b0d@quoll>
References: <20260109082214.1583961-1-chanho.min@lge.com>
 <20260109082214.1583961-2-chanho.min@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109082214.1583961-2-chanho.min@lge.com>
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

On Fri, Jan 09, 2026 at 05:22:13PM +0900, Chanho Min wrote:
> Add compatible strings for the LG1215 SoC and its reference board
> (lg,lg1215 and lg,lg1215-ref).
> 
> This SoC is the next SoC following the LG1313 series, developed
> by LG Electronics.
> 
> v2:
>  - Switched to "lg," prefix

Changelog is not part of commit msg usually. Is this expected style for
LG SoC subsystem? None of previous commits follow such style.

> 
> Signed-off-by: Chanho Min <chanho.min@lge.com>

Best regards,
Krzysztof


