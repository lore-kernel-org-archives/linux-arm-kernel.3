Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19F5D30CF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmI6L29WAjCZ2TxVqq2qTB2q3gkzS0APUeR8cbfOJrA=; b=IS4gtqPELaex2ntJyaHcV3d4O3
	dc7A3mNWNiksTJ7CRzPcVZts38cEISbHFINCceQ4VvJP5uyQsD0O3liVQ8MbPuVNo7HO05T8RMe5p
	lS+hYWcZ/5v6KL6LUXsIGBn8EGyUfeRgwXwUdmWO7CMdtHzZtkUjwthYrzNYtM4T9n2KHOdLlzg8V
	rBXRxVuKc/ZN/k90jqLjZH/1byd1w5vP/sqUcUe2CBdyeVi4v7/ZlhWw0AwAzXAwJYxvE239cEgkN
	hgVdVSDvTv5L02W7QPZ2AdYAIGAxh7pEJ1Ky7iOlqcdAjlIQhLAcXzUFEG2735wEoEgw7smGTNABe
	KKnMvL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfooQ-00000007uOs-160R;
	Wed, 14 Jan 2026 00:32:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfooN-00000007uOX-40Or;
	Wed, 14 Jan 2026 00:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hmI6L29WAjCZ2TxVqq2qTB2q3gkzS0APUeR8cbfOJrA=; b=E7EXGDLaRjj1x163ec8sFl6Ity
	yraxAfXMZ5fz51Ef7cfJAJZhHkGyPzwJ11Fltk7d+dDc0x5kzc1YV+qwRTH0WbkhLK/BRzmKy5NGA
	D6c71qoyFM/2rKu0KJzslPmBEsCUArR/7HkRYSpM8VVr/tDqDypE9dbvaaCGsdpT9SoY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfooA-002iKC-2E; Wed, 14 Jan 2026 01:32:22 +0100
Date: Wed, 14 Jan 2026 01:32:22 +0100
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
Subject: Re: [PATCH net-next v2 2/2] net: airoha: npu: Add en7581-npu-7996
 compatible string
Message-ID: <75479a93-366d-4540-8f37-be2063594f17@lunn.ch>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-2-28cb3d230206@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-airoha-npu-firmware-name-v2-2-28cb3d230206@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_163235_991622_F94CDF24 
X-CRM114-Status: UNSURE (   9.41  )
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

On Tue, Jan 13, 2026 at 09:20:28AM +0100, Lorenzo Bianconi wrote:
> Introduce "airoha,en7581-npu-7996" compatible string in order to
> specify different firmware binaries if the EN7581 SoC is running MT7996
> (Eagle) chipset.
> This is a preliminary patch to enable MT76 NPU offloading for MT7996
> (Eagle) chipset since it requires different binaries with respect to
> the ones used for MT7992 on the EN7581 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

