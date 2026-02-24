Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B80FEF5862
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC/ymCJjlKjlnRcOmpCa6zEsBctkwYrDYhbroiBDD8A=; b=RKYrE0USQdnGl0Hc3ORR0eATCR
	JA51WgtLgbl2OOJ5+VxAMyft+dpAZdhM3W65irwhqXUsUblcuiQwKRlBkg9a4EI28sLF9zVf+n0qm
	H/fk5xFg9oXh8UBMzPqs0+PrfFT71fuD9Py1Avm3e8IiOT1JQMNCRQew6+9UI8Rzlu2XYSM6iVqb/
	ehTJAU5f3RGTLzI3NAZTLjsIriN4ojojuWkBKpOm4cwMo3HNIs+ckeMA05e0qhBdrLLhGWMl3UG6j
	OHma6oarE+cdXn8DClS1NDS7kjnp76NUDMWRDqlur8lhHxjoiA1RSNsv0h82m6vQ3BII2shIpNe9g
	uKsVNLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoo2-00000001lWp-1vfV;
	Tue, 24 Feb 2026 09:34:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuons-00000001lOo-2Aye;
	Tue, 24 Feb 2026 09:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771925642;
	bh=bju+bv/VR4hPKTpxBKpuapRP9tylBhD2c/qGUd2VY4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hGerxt/XSoTQd+FMhU1QxHgBLYmHXoEpWq/cCAktT6qA3IEz/tHuG6bnRVMK/SKsz
	 4e2LJKQSHFoPPw7sAN4zPU+FCoPOCpch0IZelFDtlBIUbiryAZ+aeW64CaqmWRV+uj
	 LuZLrPSMkLKL6cZAKZ3ptIja/Eeomm0DQjG4unSEmGyukNaS0tU1iamqKHWn1P+Nc/
	 rZvtsa4ComEmuk8qXH56ysU1MfEJpL0+JsIw9+Z4XlMaFyiMW+Jlmy2aY0lWxJzPi1
	 QWXU/vy/YM0fvgzGyfJ3FvC+BvrLMToU0aQHIs3oztyLm98gUCsbDZ0W5tUoktbKKK
	 OanmGgRsUzdUg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9577B17E0D33;
	Tue, 24 Feb 2026 10:34:01 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] Add support for mt8167 display blocks
Message-Id: <177192564156.11826.14547610643774213696.b4-ty@collabora.com>
Date: Tue, 24 Feb 2026 10:34:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013404_701084_6D306308 
X-CRM114-Status: UNSURE (   9.14  )
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

On Mon, 23 Feb 2026 16:22:44 +0000, Luca Leonardo Scorcia wrote:
> This series adds support for the display blocks on MediaTek mt8167.
> Tested on Xiaomi Mi Smart Clock x04g.
> 
> The first patch just does some reordering of dts nodes with no other
> changes as this makes later patches cleaner and easier to follow.
> 
> v3:
>  - Added mt8167-dsi compatible to driver instead of changing the binding;
>  - Resolved patch formatting issues.
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/6] arm64: dts: mt8167: Reorder nodes according to mmio address
      commit: d51b7191f2072e11259edd2bff88385891d0ae56

Cheers,
Angelo



