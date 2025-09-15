Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8415FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEXteCtbPUAHYhXHKTg32Ls1S4i0/kU3NJ4TY2NF+14=; b=FH6ra1mnjC6+HykBLyJMj90rYy
	QLmhqSmw7NuiU5KkmkDtU82J3rSlCGkWSfrQ6bWveMEz7L7F4w9TgKGwVtJKBoAdHxbGGPfd2dE6N
	Dw0NJStv6xNKdrsx1m3wCuXHWtly89GwtltSrwrHt5haXo0KK+qzIznbZKYj6Ur8IvxpnzOfPqEAj
	jXbCF03Uj6zm1WdXtBLcXPEAYB1yN32aTuCLk18r2PYgkYMkfrfVIRCkp8DNd8Mv7YWQU83V5/Cz2
	BEhFmNJ85Oo37HIsbQqQKOHsOW3yy0RYU3luBdOECBXGeOAZ0C+sLAMAhOe9c6kXYbxsjBh0CjB5z
	kUgYPyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9eX-00000004UU1-1XGk;
	Mon, 15 Sep 2025 13:53:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9eU-00000004URa-1sFn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A2B34346C;
	Mon, 15 Sep 2025 13:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E863BC4CEF1;
	Mon, 15 Sep 2025 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944431;
	bh=2L0TCLurcQikiy6LERWvyLU5Bo9wU2XgceSFsaPD02E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFo6SJFppr+gpyl9VOZqDgu6d5hrCbvUYTK2ilkYtJZt7dR2DI/w2VKQzI+VHxIyp
	 DxfNnnnB7nL2DsbfQlYyHDCC0YAHTmuH1i3HHL9pI6c70vyvJ4qO7xd5F9ETcoe5RE
	 HFveWnFpb3he3WPSqbmU0tk2AtKnem8aQhyzdVEP4vLe+55QrMRpVD5FOZ5UsUdmKF
	 96duNO/Jn70uu7Y84TN/ZWL8FhMHgKO+5H5/S5zzsNOD3AeK7RWh9AJDWKfJuqIFDK
	 nMlldIAsVz5ifxOHi551Y67isBPB2+xMiwy612mNXuW5S1Fo6sf96pnp3h9ExebYbp
	 QbY4zDeGQkziA==
Date: Mon, 15 Sep 2025 08:53:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
	Stephen Boyd <sboyd@kernel.org>, Neal Gompa <neal@gompa.dev>,
	devicetree@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v4 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Message-ID: <175794440092.2724212.9818605948916059174.robh@kernel.org>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
 <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_065354_502385_6E119207 
X-CRM114-Status: GOOD (  13.34  )
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


On Mon, 15 Sep 2025 09:52:24 +0800, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver for t8103's spmi so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




