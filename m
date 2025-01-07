Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41AFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GshzZFcPZEbfFIWI6lA412b9A5ji+FcLhGUfvz/3qQg=; b=F58s6ps+Wu7uomoJhXLzJHNr1h
	YQiaPiPfpt/hI+x8LceNGpfmYwKvnVhjzalHBGT5E9XqUIcwU4XxkM8gdMZdYAH0IKoSdKQYkqGyM
	3ZUU/gyrBtZ9ygkXU2Vm5+Vl1MXvYdKyawUkd1d25XR+2PKmgM/n2zFXODZ3dsu2Nr7QyDmtnWS6F
	GddgpsdKXF833DVuJYdBqbXFhfHVn7v7waLH+N9W/P8/ovHo02dpED1cy4EV/NyqhU7adlal3RcHi
	gRiIqyqmstZt3ZrvksYnwtPLaBJ0+3t0NTF7MHSGNvacO1ywPbLTDHRBWP7KTI01JwmPAVdnbWp4z
	LqG+/uiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV33s-00000003dRe-4C1l;
	Tue, 07 Jan 2025 06:27:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV32d-00000003dJW-0fyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 701F05C4A4A;
	Tue,  7 Jan 2025 06:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C1C4CED6;
	Tue,  7 Jan 2025 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736231174;
	bh=i1VYhMl5MR4s1nJQqUvz1Lwf+9pDCILuHffqhNs/9YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YF75aOHWwKIvawG1oQFKksOJJjwP3615KtVZuJP4bvxjd60J9h1Y3KdW5oajbltS5
	 XZcPg2cN5GheV2gGP8tD4efk4phkh11Sna+N/gltVcuOOjFiDrQaTsRs+sr7uzxX1m
	 N+02XMXxI60yxYytZOvmxBQtDxmeu6NDSRFI6MwXxyJD3yPPFCa5wavgfIx6hHJtrS
	 9vsOAYAtoooa/1yqkGnJeUmgb/iU88iPoirWps82ZpwoWO2nu5CtypEMP0R9MMIQ8a
	 B0GSV1hU6jJbzKLd2FIAROC4PljZCzVsX1CTKG8jnkSWHBMnP1nSCiylSCtLghplRm
	 pV5wXJCSp5APQ==
Date: Tue, 7 Jan 2025 07:26:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
Message-ID: <32sgaptkdm53tevvht2olhhn75kyhwnfjbpn2547ttgonvru5y@c2nhzz7swlk7>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
 <20250106190703.4015-2-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106190703.4015-2-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_222615_245574_D31CE9C3 
X-CRM114-Status: GOOD (  10.92  )
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

On Mon, Jan 06, 2025 at 07:06:59PM +0000, Lukas Schmid wrote:
> NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
> or Smart Home scenarios.
> 
> Website is still WIP, but the Links on it are active:
> https://netcubesystems.at/
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---

`git commit --amend` (preceeded with `git add` if you changed the patch)
or `git rebase -i HEAD~3`. That's how you work on your patchset to
change it, regardless if you use manual process or `b4`.

I really have not clue what is happening with this patch - it is like
random changes appearing. Now my tag is missing, so probably the rest of
patchset also has previous issues.

Best regards,
Krzysztof


