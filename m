Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miHMA89QgNtmFeAPrvZAVELJdGPPkwc5f7fXaKV0ywo=; b=rQJdvBAyPeBCy4U8i4LDu70gs6
	Cm1SbYICO8ct48P+xX8LutIsG5zHb5lKPyzaE6Glz0zp5xk9Exo9ZCcAval772DOWzl0b1F/WxK6n
	KMdCLezaNMQrC6c9p+4DLPYgH3PjLSRPgOecIznRhNH3CV47NJUU2ZnJWoUCdetRff89v73HZ4QtR
	7sJOQ1xDVfgv16jJNzZnuYZZQfTL19j2BF7SbRYtDLc0pkSvB6uoaFRb3tZ8q9EFSyJI5BWiGRzp3
	DkCk7M5DvaRoOtzJIR7hCkVRUaMdaFW267nNYz6JCsm6CtVUyYphRrvb6WIfQuJ+JHw6UDxG8sVUc
	LhJ5pRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEeW-0000000BO1h-3InI;
	Tue, 06 May 2025 09:31:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDt8-0000000BCeU-020g;
	Tue, 06 May 2025 08:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520972;
	bh=xXrV5sJy2YN03zB6YMQd1Drv9Vecw4PQ52fv42Y+onU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eazbjYt01MAGEISOlrnbDj5/vpoxS7MNfuRkBvTSeX89FzSK+5j0hFPlZ2niF5Sqv
	 H+i3O9fWpgEUDovXky/9V/6Eurm6aVf5WJmw32ux9KJr265QEdtBmlhPTInetnJipq
	 Oyn7rqoDLuNHzQM8qeKETx2oTexxGIjH4jgkBj6O1eJuhFKz12Pz3WEcAQbdRw9MCd
	 Km39RBJHjw1wt4HycVbvqRIHktEzoUWfgcYA9dpaVIgcjXUsMFlo2lFafxdjiNL/ni
	 zYn9P8nVSn7u02L7pObFIo655f3vu/e7ruoqhbTvkvSzrye/6qs02bP+7NvoLUaXmY
	 czXQt3FS7CXOQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAF9517E10D8;
	Tue,  6 May 2025 10:42:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-genio-1200-disable-backlight-lcd1-v1-1-c021d2c9e48e@collabora.com>
References: <20250502-genio-1200-disable-backlight-lcd1-v1-1-c021d2c9e48e@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Disable
 unused backlight
Message-Id: <174652097181.119919.737275230947353640.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_014254_189459_7C12335D 
X-CRM114-Status: UNSURE (   6.98  )
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

On Fri, 02 May 2025 08:42:56 -0400, Nícolas F. R. A. Prado wrote:
> The builtin panel on the Genio 1200 EVK board uses the backlight_lcm0
> node for its backlight. Though the backlight_lcd1 is currently left
> enabled, it is unused, and its pwm input, disp_pwm1, is disabled, so it
> fails probe. Disable this unused node.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backlight
      commit: 0eae9cee0d74c09f5ee7ccc0dcc6b7fbb669f68b

Cheers,
Angelo



