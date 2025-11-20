Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D52CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1H8bOqVKLIaOLXgja/jvI71ioogR1TadqMh80sW9pk=; b=A3VIjPDGX5qrxm8tdUpuq5vMNo
	uzyavZVwOrgutaFVGg51wgx+wZ3mKQPdwKV4Q0fPHq2hUGZuUWbNnNlaKfxTziUG+N6dGVAYow73M
	ywd/vhgqj8tL6Uq42UXBEs3seGSonnbxSfZF5L/NisZ9d63r3T49BZkFKzRruCobKMSOgc/A/mEy0
	DW/3fRLmAvSNkUgSh+ZiLsBixbbNYs68bDgRE/6peoh1TTagn2rLq8jxBlvpLT+Nrt/kug7h/DNM3
	KssjxOr+IJe9V+Rm/yJ3gGrn+AloKiB66QZFn1ocQ2KGflJPEk99F18dyb9c2gfTseI8xh9dSDi1u
	T1sp1NGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Fx-000000074wn-38Pd;
	Thu, 20 Nov 2025 17:15:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Fw-000000074we-2PQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 087E4601D3;
	Thu, 20 Nov 2025 17:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A19BC4CEF1;
	Thu, 20 Nov 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658939;
	bh=kVEUku+jmD7IM9oXhsKRMaGSp3Jgrbk1cacSxT7VSrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkQvZtHKcc7JsvaHTAdolGvLLHJRVpvSN2ohS8/bx54z2lf0hO/KqE9ebfnOUEqb8
	 MAyAKqDYWamfY2m5KJ5qpjzOKVNqdtXkl7KgjxAN01b/EvHFANtO0y8nj4xgw/4HbB
	 A3kyj9PS597tYkpLzDznRZN6ZqRRkkZ3AwZlmjK/KrKDgBHRlrWiPHWWYnSuEbmTVg
	 RrouGOs+LYPRDGqtTFYmkvMxVpSThqYq+AAWpwDaYwaQNx3wZu9jDBmNZpiMp+xapN
	 4foh92JIcaNu2Y8Cqq3equ+z07aAKUYiqIuU290cM1Fiib17tEg+6C3pyhlkakH+bN
	 CAXa0Qme8MxSA==
Date: Thu, 20 Nov 2025 11:15:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: imx@lists.linux.dev, Christian Eggers <ceggers@arri.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Document ifm
 electronic gmbh
Message-ID: <176365893738.1563102.3354522525163832099.robh@kernel.org>
References: <20251118121513.88352-1-marex@nabladev.com>
 <20251118121513.88352-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118121513.88352-2-marex@nabladev.com>
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


On Tue, 18 Nov 2025 13:13:11 +0100, Marek Vasut wrote:
> ifm is a manufacturer of industrial sensors, control technology and
> automation solutions. Document their vendor prefix, which is already
> used for ifm,ac14xx and other powerpc devices.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Markus Heidelberg <m.heidelberg@cab.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


