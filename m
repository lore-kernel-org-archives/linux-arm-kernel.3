Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CFFC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYWtrnA64enkyD1F8B0IP3sVx0898upZSmCQffKhadQ=; b=eM/1D6jStdcqd1zeCxACBRQQCY
	VYDx1EljWxa1sp/HWunkpxfm21dMtNpBqALncA3pDAU1UFd0LFbOGjUiCQsLndw0bXS3SBsdNjjOY
	vNXENWOWiyACQPmgPllQ/D6a6RHkSacjK6OtLgXtuW/P9b5GARZjsHCDmvdXY7s8m+7XSx2YeWwPv
	OMWIG9F6I49edix8cEh30P47n9nwVYZtTnADKAPHcxQhE0mu6/VQh5qyYqb2+b+0s2dxqXYau/mex
	oMAkQvfintz6nwIj1OHmbtfodrKV72uLAZI1k2NXr4aXWBP+p7j23tQ5imBL9RfL68hWZRgFt6RKh
	FK/2UrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzxx-0000000EzGI-404M;
	Wed, 15 Jul 2026 13:48:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzxv-0000000EzFe-3fjy;
	Wed, 15 Jul 2026 13:47:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 107A16136E;
	Wed, 15 Jul 2026 13:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED7B1F000E9;
	Wed, 15 Jul 2026 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123278;
	bh=MYWtrnA64enkyD1F8B0IP3sVx0898upZSmCQffKhadQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZxMpGCtZKRsLLteM57AhHKYnvv3wsGbatlI39VfYS+QGO4jl6EmU0Qt1yNac7NalV
	 92DZJFdnOxQYDoN6OWn3sD0wlQKZipykkuFR0R6kHKUpK2qosdZtNa68MLm+D2CD3O
	 KVTM38+ghTLnda2PxQqNWby+Ap8Y0kbEaH3Zb7K4QqtNQdJZ4aZ0ex4soEolyfcY3F
	 ns6uwl/COnAN+MXf2wrO7YTMrezPbAv7c3tC+jtHXH9myxA1ycdVGA6e0URYttyBXd
	 Q2Ou1rHTd6HmWdBeCvFPYYu6RmS5F10ao9FdmVBg1/rEpnJziqOctuf08zc/TfgNJN
	 b65g6+HbAVPuQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
References: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8189 SoC
Message-Id: <178412327376.143779.2537053670483422088.b4-ty@b4>
Date: Wed, 15 Jul 2026 15:47:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Wed, 01 Jul 2026 17:27:36 +0200, Louis-Alexis Eyraud wrote:
> Add compatible for MT8189 PCIe Gen3 controller, that is compatible with
> the one found MT8192.

Applied, thanks!

[1/1] dt-bindings: PCI: mediatek-gen3: Add support for MT8189 SoC
      commit: 068601b547da091d9f56131cbb25e40ad40f4825

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



