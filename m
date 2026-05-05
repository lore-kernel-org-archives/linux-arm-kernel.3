Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C896CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhEVCU+RWA12wE6SM4koi/FPATXZvpWES9LGLU/U2IA=; b=TI882m3NL589A2qv42QBxn98JW
	gI5wZzwWjTeEOgUdX8fPBRynqN2ExtmCREzMxE9u52Gevg9fE4Adqcf4nnq/WXnI/aYae/7fyiztu
	3baqSfd9t/sagRkQuh3x7JQSeWmGKKLnVMHHyOTXRnWhIxRcWl3XqAdhnxuMbto9d64pVrb/7SNyG
	UtM1TbZQnqWvZeoCZqwDn8o7/2AsrRbqVKDezbVRJ9RqEi/tKDaR/xK25BhCnYUo/uDxPuG+PfPn8
	qOopduwbHLMcoYy24hlM5uSdBTQ6PeeD8D+fT5w6r+7gFT/EY1k8ztHZVDqqD6UhfQVBgfjeYR4eW
	YXk17LwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLTr-0000000HIfA-1Rq6;
	Tue, 05 May 2026 19:30:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLTp-0000000HIeT-12sY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A27464081B;
	Tue,  5 May 2026 19:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E307C2BCB4;
	Tue,  5 May 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009452;
	bh=BSXjw9y3KYoAOtp4MKHJYGZVUScd4L94J8qMpikSXXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcS80M1XsfS2qDLN4lcCjVu+8ZIOi6RttY7/OiKj0iinJIwz6c1egpyZJMkc0ejQ8
	 AXMVO7dzRkBBFUGg357piGKkJGw3zVRPA3ey4w/zqop/nmC//IY/VnpMNbpl8A/iN6
	 35aCGKNViUVfgyiCVUil4skzo/qhsfg+ukEnmWd1mF57Mnmnm37stQt/f3O+8MI4GH
	 MZEQP5jLa5NA79rBik6NeX67i6m97WeFnBAIPKr2Hevf3/muI3k0xZUnCMaCOVwNah
	 3ekp9AOENsMy65i4fs+uFgV+qvYvWgQ4HjeQKgHstZPpgaztHpwsfO3ftE668YCrfi
	 HwfcSMd1Do2mg==
Date: Tue, 5 May 2026 14:30:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Lee Jones <lee@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Airlie <airlied@gmail.com>, Nishanth Menon <nm@ti.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 01/15] dt-bindings: display: ti: Move ti,am62l-dss
 binding to a new binding file
Message-ID: <177800944993.3784016.8382311748877095453.robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-1-f628543dfd14@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-1-f628543dfd14@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_123053_306504_269AF9B3 
X-CRM114-Status: GOOD (  14.07  )
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


On Mon, 20 Apr 2026 15:54:08 +0300, Tomi Valkeinen wrote:
> We currently have two binding files for different TI K3 DSS versions:
> ti,j721e-dss.yaml which contains bindings for the "full" DSS version,
> with four planes and outputs, and ti,am65x-dss.yaml which used to
> contain bindings for the "lite" DSS version, with two planes and
> outputs.
> 
> ti,am62l-dss binding was added recently to the ti,am65x-dss.yaml file,
> which only has a single plane and a single output. To keep with the
> above "binding file per DSS model" style, and to simplify the
> ti,am65x-dss.yaml file, let's move the ti,am62l-dss to a separate, new
> file.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/display/ti/ti,am62l-dss.yaml          | 136 +++++++++++++++++++++
>  .../bindings/display/ti/ti,am65x-dss.yaml          |  94 +++-----------
>  MAINTAINERS                                        |   1 +
>  3 files changed, 156 insertions(+), 75 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


