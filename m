Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9E9D29C4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSuKFtKC7s877XSHGuWqoUFYp2mwqb5QifpnPHtPG7k=; b=WmQ3dsJeIYYGUMzgRwMeope+SS
	wltA/kss/UW24UyCijtv/CxJCNUVy3JJeLJXr6WYLZqAErDdZvtV5vjYXg1NUjINY6fkekY4mfvcc
	++eng1OwqLfbdbWKWibHx5A1PJaP5Nax6X+ZeBtGU2suolpcRkxZy19c8LPMCBDEq6MuBHmO/5tgU
	Bm/4RYyeW+mMAeZy3tLncV2xyaVdnziKsxjX6afwlbDF5YNwAq01tdeiDYFhrQHYpzDjMUkHKUbEr
	JNklwy/OyXfo80dRCkYdoCXlAeAKZtUB8iaD732nKzbiTuA+XqouXP0S4EwOU1LNhqi2LzfiZikSS
	yKSqrXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvo4-00000002pRO-1332;
	Mon, 19 Jan 2026 20:25:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvo2-00000002pQy-1uDO;
	Mon, 19 Jan 2026 20:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pSuKFtKC7s877XSHGuWqoUFYp2mwqb5QifpnPHtPG7k=; b=357irtbs3pVaYVLBLR2G2/geJR
	xYtOgg3pEf9t/wgDJUcJ0/aqqVfW/bHNBCTjYon1tSUE9DHBmzJINV9WWbjRUZ9Vc824vvNnNSPiW
	rtlTueQkF3+MqwVL+Y9snLQusadysyFu4NfJCFa+Dk3a0pWa/gpP8rcDSX5TA2LLIt+c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhvnq-003YtS-E8; Mon, 19 Jan 2026 21:24:46 +0100
Date: Mon, 19 Jan 2026 21:24:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: airoha: npu: Add
 firmware-name property
Message-ID: <a19efb66-e90d-4a11-ac26-923a1f3714ba@lunn.ch>
References: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
 <20260119-airoha-npu-firmware-name-v3-1-cba88eed96cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-airoha-npu-firmware-name-v3-1-cba88eed96cc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_122458_756395_0C81D0E6 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, Jan 19, 2026 at 04:32:40PM +0100, Lorenzo Bianconi wrote:
> Add firmware-name property in order to introduce the capability to
> specify the firmware names used for 'RiscV core' and 'Data section'
> binaries. This patch is needed because NPU firmware binaries are board
> specific since they depend on the MediaTek WiFi chip used on the board
> (e.g. MT7996 or MT7992) and the WiFi chip version info is not available
> in the NPU driver. This is a preliminary patch to enable MT76 NPU
> offloading if the Airoha SoC is equipped with MT7996 (Eagle) WiFi chipset.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

