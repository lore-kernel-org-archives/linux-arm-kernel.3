Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE1606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rR5p8kqF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k48znoj7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fN2eeG+zPzKpDfLyb8v4rr3ueZKYuXgrlC7Wm/EpsAI=; b=rR5p8kqF8n+nA+
	DGTWTqouMww3VCAEy2BZvCDkSvhIN2yaQbGVqSvCgl1gwcQN1d9ZaU45pGw8aglaVgIXI27NukRBy
	2bjTxmaueSJeA2lqu5GrJH60HgfVpywzI6PnXn9+ByHWm9pb9qFI6r7e59akwXNBt11DKnewK3Gwm
	NdhP3aPTpDM1ZN8TH4O3ATscMJWt4tJ7BNWu2+R7fv+173NpGBFGab5UV3aUnZeze8WByVDftB85S
	ISGE/7M40TdgS2O0jRVps5JTlcp3gzospnD970Y0hKhn/ezTJYC+bbWbaKey2wLY/9tbJdbA7Tqsc
	CLKSoG0KG6AYGDVQ5v5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Ln-00000000Xgt-17D5;
	Mon, 02 Nov 2026 22:17:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Lf-00000000Xf6-1XkM;
	Mon, 02 Nov 2026 22:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0D6040A20;
	Mon,  2 Nov 2026 22:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FC91F00A16;
	Mon,  2 Nov 2026 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657870;
	bh=fN2eeG+zPzKpDfLyb8v4rr3ueZKYuXgrlC7Wm/EpsAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k48znoj7UTrSU05Zu4sJqDNcyMcW3R/uAuxE2lZRaV9mU5uMMrBqMHbsr7Kb8HAIX
	 keTsKaxY+6SnakiXCUe5RVgo2mbQReXlBungVjzf9f0DJiRKM654FWyAX4hy6XPTiN
	 5HVmLcYIeV39LJ4Wa16iEPPm+9NaGfgxCKA4Jd5KQGNIJ8HTXdM2UlliwMEaJiWJBp
	 qx4rVylSQoiVZgApICnYztb0TaORncJbV1Agw9W323OaEq8OlQPDKlLsqHM+S+cTkn
	 zA7zANmS4r+NLj6IR8xWOuhdK0/J8oPO6TYXmmL/MHnMXZMiXjbINVeTror+6fk9GX
	 z3d6u9tNXktSA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3C9322413105;
	Mon, 02 Nov 2026 22:17:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261102142812.2743578-1-robh@kernel.org>
References: <20261102142812.2743578-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Fix MT8186 child node
 names
Message-Id: <179363993107.2092401.8362129164558129787.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:18:51 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fwgjm/VuQu6K+pEP1jSyFPLSORFoYuS0oYdG/YL+fb8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8vC8rfj5uONiPPPX+1FqZmbbBQTKpTnjeBTurQtbM
 amR9X99RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZSxMrI8E+sYafNl0Ov527Z
 03Cf3y4vvD99ko2rIpN04smACXaHvRn++/fOtXMNf2NwsXTXDv6/as9WdzfPXmxsNGff+wtL5Co
 3cgMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 08:28:11 -0600, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: mediatek: Fix MT8186 child node names

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: dt-bindings: mediatek: Fix MT8186 child node names
      https://git.kernel.org/broonie/sound/c/25a38dd4ff95

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


