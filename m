Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EA3C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwsBLsiH8h/NS6Hq1U43SFNrzavo486149SkBkkmZow=; b=CC6O+DBrFxcKHWYUTz+iN/OUVj
	XwEuimiD8o7/bq5hcGWVFnVCjtluFXRvDuacnqco6Xl0flriTwKdfvvumC+3lQNtrhz5dh1/KXway
	lKLMgUmNSfmsu+rJcawGDkKRFUNLjpMPK5UmY1tguKleK+dMXM2+r7vQ+Fg9krMkWDajt9Md1At10
	C8zBlU8A598P+D9huPiX8vm1wzb2e1HH7kux/6Njehm1SN78zr1FKF1F7KvxPfwPUVEH4sb7eDRaZ
	KVZWaPVvVYOdppV5BErjpHHOKx9cRUh5JBBO9RyCDBb7ElY/7B0Ax9ieZzwYhCwRaADYJkbxcmZsX
	H6d/YBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnL-0000000ADaJ-1ZXf;
	Wed, 11 Jun 2025 14:51:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIlC-00000009cmg-2xIy;
	Wed, 11 Jun 2025 10:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749637965;
	bh=9T/pS302r+YbAj1tL/BAOvp5KEwiMpVKqcVZppRx0oY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AD7ZC+nyuYzuKei+lg7bcBr64bv6QxIUFI7GuPr8USgAixOJxD131Fa88tMfUBSNA
	 w1urdT41Azs1lVojYMoAWRXUCKd0I+7G6PsebqYSH2KWD6gxvCBmS4SNyUHkv4uOvv
	 I4oeM+A5q7Y5b3tke8kg4g4M64W0rp2VUNKRFsRKMedS6w9Tyb1bWAT81IiudSj/wv
	 fbcuKimdA50oOUFC6kqElNvJk4JEExW4+gRU9pC+JQAcvxpEAmXsov/NolRPSTno1s
	 l/q5Y4/uREORGawiT9Rgd0pVX8y+cFzo5EEnly8yNThQiCOtwj1IJGLTVKZ8SVA5pA
	 StVP2p+YsNg5Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BD6D17E02B0;
	Wed, 11 Jun 2025 12:32:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250526-mt8395-genio-1200-evk-sound-v1-1-142fb15292c5@collabora.com>
References: <20250526-mt8395-genio-1200-evk-sound-v1-1-142fb15292c5@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable
 Audio DSP and sound card
Message-Id: <174963796443.449275.9873675313892150049.b4-ty@collabora.com>
Date: Wed, 11 Jun 2025 12:32:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_033246_887369_AFDCC632 
X-CRM114-Status: UNSURE (   8.81  )
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

On Mon, 26 May 2025 12:45:27 +0200, Louis-Alexis Eyraud wrote:
> Add in the mt8395-genio-1200-evk devicetree the memory regions for the
> Audio DSP (ADSP) and Audio Front-End (AFE), and a sound card node
> configured to use the ADSP.
> This enables audio output through the 3.5mm headphone jacks (speaker or
> earphone), available on the board.
> 
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable Audio DSP and sound card
      commit: 9acb4d06fcb56edfb9bac0de705b4f295a18e932

Cheers,
Angelo



