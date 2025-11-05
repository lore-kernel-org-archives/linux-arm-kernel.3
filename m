Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED619CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93dGwHo8Ef8mHmmbKulR3DrZWjNHtlgF023o6T8h/Ew=; b=aezTPLyfYTU/kpMWOqLwtEDDeI
	8NYY25Sw+jK9qWVSMIiYwj1JysEHrxBbn0kdgm5nXDCQmGUcFyHgj+wN6ggvfKUnddeFp/NS/4zQm
	pZx134+towyDBDwn5+yKcTfZZnqdg+RwtjrlVSVa1pEFJumsHuRnq/B2TUV1wUIP5RdVuz4xJWeoU
	5CUmempvVsJS97dHMIAMQJznBQKxCnruQVp/JlqpyH5cGnXnhSwVOQOsM3LrUOEBy23mV82FeYavq
	qpyRFHUTsXqxMBFjSlrq4ySOuoUfiM3oLDCtfh637WKBfgY/i0HBEyhDFzCDn/kTdukZjpohQ3CCi
	kZsczjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZET-0000000DK3U-3JQM;
	Wed, 05 Nov 2025 08:51:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZER-0000000DK2M-2Lzn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBCF3419BF;
	Wed,  5 Nov 2025 08:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2245CC116B1;
	Wed,  5 Nov 2025 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332666;
	bh=bqAeZIBrgDEYsoUKavOSuZR1RUcIXXU179muk25cQ8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTAj8Sd+o5/noh9v7+A1raHbMoeBVWhksX+j/sOANpEjwXXNmjkcAaEOYSlUnQAn1
	 nQ1/vHYYeYmU47XRl9IjnoGnH351Ly1OsR/MaNHnK9V1VxyKFON1gN4iz77h5hkg5p
	 n0Se9zuxuAXAkJBP1/Qy1QqI9R6hrPa4pEMOSqMAFLNnZ5QmlCxVQ5ZiqbTIfP+fiq
	 i4U2wZuqQsu/fPzsngCeDq9XGoelwp78rHpuMmB1uheuV8+n9IwlyWlRwXE77D/qMy
	 d/nDTA9bUkWsaiXRL1sOqAf0daUWd6h6Q1WQNLGl+MshSK1s6icSY5ChD/2SrMl4B4
	 LPIEtizFPyiDg==
Date: Wed, 5 Nov 2025 09:51:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists
 sorted alphabetically
Message-ID: <20251105-robust-aquamarine-tench-c71fd3@kuoka>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_005107_615373_D6F2709A 
X-CRM114-Status: UNSURE (   7.45  )
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

On Tue, Nov 04, 2025 at 02:56:05PM +0100, Marek Vasut wrote:
> Sort the enum: list alphabetically. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


