Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D419C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fjKAhslNglvYZYv0ye7T1kfLt8KwcsoUk76FCP3Nyg=; b=xMUWTUj2sgp0VLEf9gdERQ6ZhE
	RD6u7nWXkyhXbL+k60bGG52vyRm+rawFq670RXtoiW9Si3UCw5EBPm0hXKj5mr5Ua+WJuBXxOBrk/
	rmvSAon3h8a9YZBjdfl/Lm8r6JhOHNQY7+IYu1N/d6f39cutFddEwAmkqNf6dV0qRHB/u8odIXgjH
	C0u/tPaIq03dO20BBPRq6lMto30JUJknbTE/+PTCAbM5n0+IXqQ1eZN1u4sbI14uanr9RObJfvhOS
	t/FXBEsPK8TClGn29tZjs23jYrOgoKNXkJWFesp/uT5wwXQmWJjp17wwWRjwm+H7LfMG/XN4qCWeM
	N52slFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GJB-00000007rxq-2qIE;
	Tue, 22 Apr 2025 16:17:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DyT-00000007MdV-01ib;
	Tue, 22 Apr 2025 13:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329663;
	bh=r/2jQ92IbgEzNppnARIsVhMwo1Q4nrZsUcwAE/C6P9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T/j40MmimszjMC5SdsG/9amraFDtsO0jL7pw4tU4CEzqr3yFaUPSBlvzAnwYF5A8t
	 N7eXubSLtoif2uoNOqf74HjjMqsaPjBxox34EF3AqGW3Amip0AqVXaBusCC2bOP3ma
	 2hiE9XOIQNRSrjEO7Etg2wfanBNPNtUCqq0fu7wYSDhvNuB7iMkXuG1ptuqrIHR46B
	 d768fchLO93JZPWY4ug0gNvathrfDL+FEZW/TEfOu3wfcOn+hHPGKT2w04d3Jfagoc
	 Ex0yntyehehm0VhJdjcTjmvW8dhVvRKG2nHOrCAhMMzXrNHbtq7oXjbEXu5bF22JMO
	 ZUlKOlENt954A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A98DA17E078A;
	Tue, 22 Apr 2025 15:47:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
Subject: Re: (subset) [PATCH v2 0/5] Describe MT8188's SCP as dual-core
Message-Id: <174532966260.97079.6264214242905276667.b4-ty@collabora.com>
Date: Tue, 22 Apr 2025 15:47:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064745_190683_516A47E2 
X-CRM114-Status: UNSURE (   7.56  )
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

On Mon, 21 Apr 2025 16:49:03 -0400, Nícolas F. R. A. Prado wrote:
> This series updates the MT8188 SCP description to dual-core and prepares
> its usage. Patch 4 updates the MT8188 DT to describe the SCP as a dual
> core cluster and patch 5 adds the firmware-name property so the firmware
> can be loaded. Patches 1 through 3 are dt-binding fixes for the SCP.
> 
> 

Applied to v6.15-next/dts64, thanks!

[4/5] arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      commit: b1e157c61db5e6f8d9c35e8ebc714ab6ce02ee41
[5/5] arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0
      commit: 2f0066dae66f30386ecd6408410e27a4d6818c15

Cheers,
Angelo



