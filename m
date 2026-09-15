Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXSEs7BTDlc8dKDKpzIizZkxrmFqMoEY8BMFcJ/xLxg=; b=Do356WL7FdCnfcTg2LtwOxi5dD
	8ddr2NDB+jXEMwPbb/LGlT7yOHI8kN1IXzcCCq0mjgAGfWK51g+90TeDuokaCjrJTBACbfwEiGBsM
	gdkDdX0vsQ/EKt/EB+zi3cSzTjzy6M0CfS2jhNfRvkuRH4q86fxO+Sz1LM1e+rYoxjN9brgibuJea
	uUN0sKJ3w262EYh7UlQkjtsPtMHVoMRcFpcLnRAgtHnqKwZmedQIvGGuZGYLO5S+YbNkF0OUorC6n
	AcKc8shvmKvSbusOIUxutZ9p9UcVpxrDTSi8WZv5DUpwhpzz2E7Dc0bbxuL79WojDza7VnJ6X+Uyc
	BpGFZBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PXc-00000005nF1-3bqa;
	Tue, 15 Sep 2026 09:33:30 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PXY-00000005nDS-2iLh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789464799; x=1789723999;
	bh=hXSEs7BTDlc8dKDKpzIizZkxrmFqMoEY8BMFcJ/xLxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wY1y8xTaVY9o71t68zZ8xxpnHJIDVB1JeESHBv+1cj7WISv5xrNPHU/dzNiNh6mI8
	 xtxbiTfFHVa7DJUXy5Ueyoex/ntihHchoHtjhDuihhcHlboLrbQnD5DAXiK/2jn0Us
	 ayWGOvjJNWs4OHILwjPVjXAmxgfK/9HnvzivI9seOo/T8tPB/Oe/zUDmXcMlwR6HI3
	 Qu/DN+XQoTr8bFHzKSJTuULS0SNgscpwOf1HZuirbSnVqbJs8UMRxnsTME3p/iieFB
	 U9ZxR1Z5qpEBA7eL5iio25/sYPfWF+4aLMvasr+m0hhY4Em5u405/lCMmh0f4rwSaI
	 3oiMy5SbdVyOQ==
Date: Tue, 15 Sep 2026 09:33:14 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <qhCDchmGeChGRGsaz37FafYzJowgCzD3tkhtgZCAmpTdTZ7MloVCm3SgJPxz6_rJZJ_HIxpwgQZibP1bkX2tRz-XkcPVwznUO7issd2PYmI=@protonmail.com>
In-Reply-To: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>
References: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 45b726ba5dba26f46e8487dde82dbede2970503f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_023324_842618_50EA261F 
X-CRM114-Status: UNSURE (   5.67  )
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

Hi Angelo,

Could you take a look at this patch? That's a one line change with a new
compatible string for mt6572 GPU.

Thanks,
Roman

