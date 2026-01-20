Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FE1D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKzZpz3gJuGNt509m4Sz6slc/wkFAWSQZz3MkbOiXbg=; b=azO29OQ1KyHpp2ptheFQY85+1Z
	7ys5+ouLmDmoJed7PSzXnxhAhjEqIK46V8R7teQQeY9eiFHnhL7ZX34yRBGGZtomcreyhwjFONFvo
	uxeNhmAOA/SnEJAHVKu0/8mHt1Ea0evL2/eVkXhT2YEk1G1PGES+QA2yjlMqJhWTrFvN+BtdrLFYo
	94Dj3zwH05szqcQgIuhaJ4hKjNpQdbfJh+XhMtHHmx76ZX5YID8zg2prMaDifoYolB4Hea3wvKwvw
	qNM1Sj4+POMlv1ndtZZ5WE3EtlHfQcdzmEETIhO12PkCtEJtYrwgxT7v3N43D3azDO+CSSXlTAsWG
	e+BFmNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCH8-00000003wik-1pUb;
	Tue, 20 Jan 2026 14:00:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCGw-00000003wgi-3Z7w;
	Tue, 20 Jan 2026 14:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RKzZpz3gJuGNt509m4Sz6slc/wkFAWSQZz3MkbOiXbg=; b=cI6Qo/eQJ0AWEzj5P2sKoQaw7j
	kKCGiuXxXcnC/DbH+W1/MyliyZ/G5/woej2OQnzWHaJaUSsb8if6ttM7futcIZJYzo3BYqdNc6Jlg
	6M3dOd8pxTrJl2u2OIeY6VslqfVOt6Om68vRPeDXELigFQPPn7PuE35jiyI6Q0XWv8sE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viCGp-003gXK-NP; Tue, 20 Jan 2026 14:59:47 +0100
Date: Tue, 20 Jan 2026 14:59:47 +0100
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
Subject: Re: [PATCH net-next v4 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <d5a7afce-5591-4106-950d-92a1a1015132@lunn.ch>
References: <20260120-airoha-npu-firmware-name-v4-0-88999628b4c1@kernel.org>
 <20260120-airoha-npu-firmware-name-v4-2-88999628b4c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-airoha-npu-firmware-name-v4-2-88999628b4c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_055957_090226_62A86231 
X-CRM114-Status: GOOD (  12.55  )
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

On Tue, Jan 20, 2026 at 11:17:18AM +0100, Lorenzo Bianconi wrote:
> Introduce the capability to read the firmware binary names from device-tree
> using the firmware-name property if available.
> This patch is needed because NPU firmware binaries are board specific since
> they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
> MT7992) and the WiFi chip version info is not available in the NPU driver.
> This is a preliminary patch to enable MT76 NPU offloading if the Airoha SoC
> is equipped with MT7996 (Eagle) WiFi chipset.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

