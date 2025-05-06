Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B5EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xzr9O9lBLL1Ak8tGMo81xUEwLf9gk4b4yLz4HfzJ8Q=; b=gAMWmHuDbcW5Hk3Ib6/eJtcfw+
	zLD0+teviJlJv9txIVUe0fCKZuddYYEwlRlUemya11CPCSglwJjCmzGzInen7B4wwvU2Epe1Hxx34
	Don518csgyHPqBWBO+FaIogM2V2TipfbVY45AOITzFBzEJrWC/egc6bdIFe0avlW/g1E0WmL7OhwR
	4UvULHTogv3QUYlW+hTCaWmi0AYlpR8cMKX1Ju4KvFfek2av+G/JQMcd/k0+c7l+EJq4MIvi0q0z7
	c+hroxG3uwuQDdDP2T1mlGDGXpTowIbYKJO7wr3RLKSBf9H32mP9drR05dlfC757h8EUfUN35w+m8
	wPuW/ypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEcc-0000000BNfx-3CcA;
	Tue, 06 May 2025 09:29:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDt7-0000000BCeL-16JZ;
	Tue, 06 May 2025 08:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520971;
	bh=EMYhFFoARHbzfZzkwxynOmrqp7PVvZyw9myvGYU2tS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ewqCs6aBBMsq7wxQW6Eings7oKZ52Kgg//eTpYBL7BBLPZwNxRH94gISSRfocq9aq
	 QudggkamKSgpxeSv043iUV8Gxk5HEHPG9VIU3UvQeddW9PJKLEoC5nXQebe3Vb26dd
	 sgq+x42XTuSGhsgiOVTuiUZy3tZ4nbs/RxvGjmvJbg0IGFhKFRp4PayQmuLJ/n4LLa
	 lvjvQ2J1k/YcDgbb/uQ2E7RdkV54Ojx5JwK9Ks6U3guJSGchFZSvoQKPTPnZ9NQff8
	 UGbPnyYiGBS1YJfBsV1vBphRvKI5bYAtA8fj0/1rMDzLJpTxaP7w4rS80t+wKv2aMB
	 wTUD57GVCaSDQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0088D17E0B46;
	Tue,  6 May 2025 10:42:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
Message-Id: <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_014253_449095_F8B4A53C 
X-CRM114-Status: UNSURE (   8.98  )
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

On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
> regulator-fixed, even though they don't serve any purpose: all those
> regulators are handled as a whole by the mt6357-regulator driver. In
> fact this is the only dtsi in this family of chips where this is the
> case: mt6359 and mt6358 don't have any such compatibles.
> 
> A side-effect caused by this is that the DT kselftest, which is supposed
> to identify nodes with compatibles that can be probed, but haven't,
> shows these nodes as failures.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
      commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb

Cheers,
Angelo



