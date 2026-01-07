Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBBFCF6BF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FigPlX3K5oy2QgJR3iT5xHJDK/QU2qpXIhcThUr9nKU=; b=q5ztK9dkPl97GLkvu71S9BQ0Bk
	6du6aQPVRh5tUXoT3Bvlgisd2T7iNgX223AL7jyJmJCewA3VvgwILewe8KK4+It1QU6RRiuuFiF2V
	0hfFhfjavfk1OYAQItfu1SITgBeb/acR6iN5SFZbXNnSoZxuonMTaGh7WgrJWKUuQal4gBThw8xK0
	H4w/fABUafw3cKFQZpBiRsXqRjn4JSs5p5hBt66eLvFrTMzU7hui4V5/P3sWsPadX60sSV2gnsbxe
	IyQ69IhqKjOkeBMuVfb3kCcyi0xWIdtHPcowcllvln7LjbbRNIRNQdduC5HvMEPyASS1huE70Obve
	UVEww2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOUu-0000000ELk1-1IlM;
	Wed, 07 Jan 2026 08:02:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOUs-0000000ELiv-15Sa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C251435DE;
	Wed,  7 Jan 2026 08:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC51C4CEF7;
	Wed,  7 Jan 2026 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767772945;
	bh=DiFqXXAVH3dPVWjI5I+jZNWn92Ms+skONWcK14qKhUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Be3ZtXSN81ERsHazYcsdBODBq4DwMkOekC1QcoriNRSz1bTBkiwbG2KXC5L03a4r5
	 /oNuWfkzG4c8xXx8ATOyXN4vShoULb5kssGr5asZB9rmxBX3DzZdY/0E1N4Is5uEO5
	 YNvVWTEwGyjq0ry63b9jRgEJwaS2ah4Q00taNup+kCYyE4Z1xShjJsctMW0X38nkFN
	 Ps7rq8Y+sBcEZkNjaJScRT3q0gC152bxGcFKcZrSGVH/yKmguEx5w2XL0PhAtHzqrJ
	 xbwII5wCSNn05NYCnfB2qMx758kdLwoBjbpk0x2HiXsjZsEWsrOkRd/wIXITfIY+wR
	 SmeFDG0RNUttg==
Date: Wed, 7 Jan 2026 09:02:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: Add HSM M4F core on TI
 K3 SoCs
Message-ID: <20260107-nippy-doberman-of-growth-164f2a@quoll>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-2-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106104755.948086-2-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_000226_323611_6F138A9E 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, Jan 06, 2026 at 04:17:53PM +0530, Beleswar Padhi wrote:
> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
> core in the Wakeup Voltage Domain which could be used to run secure
> services like Authentication. Add the device tree bindings document for
> this HSM M4F core.
> 
> The added example illustrates the DT node for the HSM core present on K3
> J722S SoC.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


