Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF99C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQM4Mm47yMEmIT6b1wnTem0Gf2XFWVVbiJS5sqXl9oc=; b=EKl4jtvBz2rvG0Rb7xh+TSFHJ4
	libFnAoxZwZ45EIlSHSurLABqzFhJ0ROD3v8tMAH8I0pjf0dK5S9u5mGPwsbFmppATI1A7Bxyt1Uq
	j3Km/Q92yFkqZEt2NqO2D/GOu9Qqo5/LcoC3qJnPd9zlugSnkRFsOzXhIK4YORw//ZwjlZQCwS7O3
	Qk6CStU18X74K8SncX9da183P+l72kuJ5qqdr7UDpJ8CckFFymay8tWLiR+15JsSMhETFI58hcMVl
	/Qm0LdQaF2OiLp5AdsrrFUQ/Y8iQXZxQXRfTWHBMvGM3LiQtV8Ke41mf7VwxLhTolMH+ZaVTIgE9m
	YqZSLXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmALl-00000009VC2-1GuU;
	Tue, 21 Jul 2026 13:17:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmALi-00000009VBB-3pRQ;
	Tue, 21 Jul 2026 13:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784639846;
	bh=yp3M1gHt3TXHTEHMMHAEKyTfvSrpHVNKd7x50BdY3rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JUCMIfT6jo2EwwguVRvnzjZrX906A1e9E0WM/Wa18e7fj7F6ZE4kQOYJnj8YJiWg+
	 Qn78jg84qkqn/i2KqsUlPQhHFE8mhN9UiEq5xmzJoAqh6AifkBGShwwYUQguC0+4rY
	 lC0dOaRoDyuX/Fa5YzUeiOIUZveF8ZFz8h6Ut/OqZ9OnlaOVSIjNDFqKnVRR0i4KC3
	 m0AwHElNIHm7la9dMa5xRgkGn18bCqWun0i2p45Yve8+RXXcp/wIs763gUSObioDC3
	 5k2JgS7jpRe82Rgq9dXKzRMD6SBMZbj+z3CRSP44hUYlFQAb9KLE3Wg7Oahu7pGCHd
	 bWtF+2L5X3giw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8640617E0912;
	Tue, 21 Jul 2026 15:17:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260701-mediatek-genio-mt6365-cleanup-v2-1-78e3d63b8c05@collabora.com>
References: <20260701-mediatek-genio-mt6365-cleanup-v2-1-78e3d63b8c05@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt6359: use proper compatible
 for rtc
Message-Id: <178463984650.189936.3448118682583676840.b4-ty@b4>
Date: Tue, 21 Jul 2026 15:17:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_061731_109027_8C04F3F7 
X-CRM114-Status: UNSURE (   8.18  )
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

On Wed, 01 Jul 2026 10:38:21 +0200, Louis-Alexis Eyraud wrote:
> The MT6359 PMIC include file uses directly "mediatek,mt6358-rtc"
> compatible string for the rtc subnode, but not its own compatible
> string.
> Now that the "mediatek,mt6359-rtc" compatible is properly declared in
> the dt-bindings, use it with "mediatek,mt6358-rtc" as fallback.
> 
> 
> [...]

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt6359: use proper compatible for rtc
      commit: 3dc552c1bab6e83bb45af0a49f3a900845a24495

Cheers,
Angelo



