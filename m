Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651A2CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SKJ2DOUnv0ju3m2fzI2NEnnUJ6bjzNIYaMHRG/U5d0=; b=DNfBkgSWlDzGmn8STXEFOfHjDs
	aa2ACLFzZGxbwv66V8wYmSc2+bqvvqHSxAcg10kXRsYRFwTzxQLLO/a3SFb3VI4CaT+FhwOv3957J
	VR3qQVUWit+YbigI5eEeF4GeaaylL+eDPMeiUU318Ljm8QC90NQht9YclnFvfizcM1Wugb9V7WxsG
	Ug5sA+l+kI1pJh6k4ED9HX39wA4V7XAosCTTMxdaPLahPJMwWUZDXSSCaIGOvsQSBrdXY2h1QW4e8
	XlO6e2wBp2d5XSYHaBFfTti+w0U7xprSkfw+wephn6bw2PZeXdeBshIIAQuPpr97MvIempfRzN4gv
	D0Y1S/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthkF-00000004zzb-0w6D;
	Wed, 03 Sep 2025 07:17:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthgI-00000004xyL-2BYd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756883600;
	bh=+SKJ2DOUnv0ju3m2fzI2NEnnUJ6bjzNIYaMHRG/U5d0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bXhMGpGcvrD3ixFoy8jvslo3iAJXogAk94gfIIvFFVj1de2p9FgC/vf5/POKe6Syj
	 nxxTdvMzr4VnovLF2eSUuNrXUUr5c1m36Tpy7b0ioL3PuRqTq4UEMY04n7seQX6fYq
	 eIzMmkXixGU9NhG/jShBOyf726SUtmW3ojaX2hjyzruvVAV2VVj6ne7mZ08Rum+Tny
	 3hD+U1cbT8nVea/WZLXNEnco2SkNMzqtwbpz07c1mu69zWt8WhR94sMO5IxG8scl5m
	 PNQK2r9wcKupbD847qT0eV1lqYHMyXp8EpL1YaOVvNtTPxfUzQiGPw+hBLzekJhx+n
	 wp8lEpQ1rGSmw==
Received: from [10.209.99.88] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BFE386445D;
	Wed,  3 Sep 2025 15:13:15 +0800 (AWST)
Message-ID: <613456d8ec80c29c6332c8a047bfe2a108dd2e65.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed,ast2400-gfx to DT
 schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 16:43:14 +0930
In-Reply-To: <20250829230442.1495926-1-robh@kernel.org>
References: <20250829230442.1495926-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_001322_747393_3CD17077 
X-CRM114-Status: UNSURE (   6.84  )
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

On Fri, 2025-08-29 at 18:04 -0500, Rob Herring (Arm) wrote:
> Convert the ASpeed GFX Display Controller binding to DT schema format.
> There was a duplicate, incomplete binding in mfd which can be dropped.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Rob.

