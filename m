Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37210CF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUzCwNoxyOK5W/1DVbUaxvnuVOrsBE61uYJtgtffCx0=; b=Q+5o8PSxxMmaLGFQ83r+m6qZPv
	rJ5NUGjlwGCQjUMtDsvne5wOIfASySSpNH4EQh9kmLirP6RoGq0FYawxUj5+mfTwGgqkynuSDdtTQ
	wR+Dh0Hi7GnWHLZZMPU5MpgGbIqNOmJ28MXm3chqg1DpaTWEhxPSPGeGLIlNpkRTMTNwQlSN8FPOj
	/jCa1Pc6Yvx6eDsTLhmJjWWmpmCH7ocrjpn8jcNdrJlDhmyGiphv6YHl43As8f12Il+dDQuqY6u07
	hRr5cQEoCb02aVqAqFcNN6ezb4B+d+6yk1x9TJ3+wIusokKxKRnE9OWDcvpGPirfJOSpOzzQfmi2S
	fxxJNKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6mj-00000006w3N-1dmp;
	Thu, 20 Nov 2025 15:41:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6mf-00000006w1w-3C0T;
	Thu, 20 Nov 2025 15:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EF6D435E3;
	Thu, 20 Nov 2025 15:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33742C4CEF1;
	Thu, 20 Nov 2025 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763653280;
	bh=GyUij2MHubbkYt0KHWY6Tsa6lwXops1vSRgPKRjjAYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bl4LSnzmwQaEcExw/APJKAemxDFRXSAalBsMfvhLoBS9pA3Exsrbr94IgZljjpAUP
	 SJOnnxt+uF9tKPpADmGa5vPP9dbPQSnM7qYlTM14S6vzEhNloYBmJZzDQb8ZnnIlSF
	 FhojDyCCgOf8HNwfM0JZmk0v5VqpB2ZDCKzOQwYX1xb6B17po/KnNaFBsOpJibmYJI
	 R/MwWPXu9pIYxmzY7ioVvTD09aWH4MW5UWEA2s9XZcmRfVO0Jr4pZ8beCLkYb7jKcG
	 mbTzIc2jmHKQVQoOPIUl3G5eu9ULzxp1jHi7SWmSwuiEX2YgxzL/c9covxglDBTySG
	 oWyXuKPYY6P0g==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sjoerd Simons <sjoerd@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251115-openwrt-one-network-v4-1-48cbda2969ac@collabora.com>
References: <20251115-openwrt-one-network-v4-1-48cbda2969ac@collabora.com>
Subject: Re: (subset) [PATCH v4 01/11] dt-bindings: mfd: syscon: Add
 mt7981-topmisc
Message-Id: <176365327394.767266.14919759793033444113.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 15:41:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_074122_777871_022BFFD6 
X-CRM114-Status: UNSURE (   5.74  )
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

On Sat, 15 Nov 2025 21:58:04 +0100, Sjoerd Simons wrote:
> This hardware block amongst other things includes a multiplexer for a
> high-speed Combo-Phy. This binding allows exposing the multiplexer
> 
> 

Applied, thanks!

[01/11] dt-bindings: mfd: syscon: Add mt7981-topmisc
        commit: a95419ff9f21d246835a8c6ba6f89c8916f7f0d6

--
Lee Jones [李琼斯]


