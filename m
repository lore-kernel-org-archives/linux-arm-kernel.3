Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B01E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Msw7aJ/ypE7ud/0M7CvDLxfFb+vZkMxn1YjWyDvem5Q=; b=gAT7c1d5t3ZjBMjl5JNeiGBKvf
	3EdYsqLrmhxagGHy27JyfAaltnInvmh2BP9AXLgr0MwBtyqSrwL8xYUldo/HqNalMkoLgAKkA81f0
	rgR5CEGJK6suczti+x3jb/W1r/FOjiB7WhAgwtgDGsPP0w5xxzvj9otgoTNY1BbGGfb1yXRbMELIe
	4BppqaKI013GI7JdXA5ADY1gi3dsH2G30paEeZ/z7lw38fiNG18N2Imyua/Uc9pmyqIFdbI8d1Vww
	GEdiRDcfg+eSmG59uE1SmI/ip1Qa/JTESuy+Pxg+9QjBP8rPQflhcYidIZL2w4g4ZztEz/jxVfwdG
	bkI1uK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeAQ-0000000CeUT-04ee;
	Fri, 03 Jan 2025 09:40:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe9D-0000000CeJF-3VIf;
	Fri, 03 Jan 2025 09:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735897154;
	bh=9Msm7urfWmNv8ZxyLygweTvb0f3GK8S+lwILMU1gONo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vd/fojMUkqc3pci9V0p9a4e5ZypBAIKFt21Hi47vWe9WwmW8DE8NBjngcvRJ2Pq2B
	 0lZNOWQayr3GNIo2vOkLMOhM3iIZalo++KKetQXTqIX1Md2gZd77vitCLq0pzNiAAg
	 iJDf7yp2DRFDlLFDZo4lDxvvMlCdulEWdf/sorYH1mH0gCNfbvamzpAeOqg9w9wdW2
	 Rx0Ysx/PNvy45qw7j3FHkOrvlCRkLBv6Kf2jJK3lHvv9vvPQ1fD10HTcIYUFZ04Frf
	 EFQXrFJhxX+M9IZksTC3fr3yxRNSp7Ehj734v4InxiZs9UcEsA2rDrycu1HX3/iIzq
	 10ko8r2dcm5HQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B71117E1543;
	Fri,  3 Jan 2025 10:39:13 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241224084839.2904335-1-wenst@chromium.org>
References: <20241224084839.2904335-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: arm: mediatek: Drop
 MT8192 Chromebook variants that never shipped
Message-Id: <173589715347.61173.1219826071003156854.b4-ty@collabora.com>
Date: Fri, 03 Jan 2025 10:39:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_013916_067369_CE38CF7D 
X-CRM114-Status: UNSURE (   6.72  )
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

On Tue, 24 Dec 2024 16:48:37 +0800, Chen-Yu Tsai wrote:
> The Hayato rev5 sku2 and Spherion rev4 variants were designed in
> anticipation of shortages of the headphone codec. This never happened.
> As far as our records show: the variants were never produced or
> shipped, and no such devices were deployed to any lab.
> 
> Drop them.
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that never shipped
      commit: e43525fc7eb90eb8e12acb2e82729827023f77d5
[2/2] arm64: dts: mediatek: mt8192: Drop Chromebook variants that never shipped
      commit: cb6450fe891c892253f9b835b378f53d0a39fc7d

Cheers,
Angelo



