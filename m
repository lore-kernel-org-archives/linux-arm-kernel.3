Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F05C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2VGVficsKZdMB7jd4IO88jbeeY5cNqJJaO2Adkm9qA=; b=vQUoL3v+vWvvBsrxNDiqnaJN0X
	F1AGcxXI1ThH8De1N++mGkEDVEtz5S1pv86SvBYlYwpksYubJifg+l28i/+ZzcD2GFR9FlfB2N3Ug
	R2gxyep+OgKoYVsFahdEdNFMQjbR3EfhF9yr+Z0eHKemYo4vidOyqSLx0xM1Dx8j+VtkEUPoHKufH
	lXC1UvKEpmLqS73wXkNgDJ/U7Qd8ikzr/jOJDT67f52ORmXLsdih05d1uZfqTcDE0csRKhM+mB0iM
	Sd9MMfr9PoHu0o9pO+8s3AhGZwbaqv5h5bVWveHAM6ASN5PGZzHQS6NNglSU7gIq5Ifb4GUEu9joU
	voV0zJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi30-0000000Em0W-1a3A;
	Fri, 04 Jul 2025 15:09:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhph-0000000Ejcv-46XT;
	Fri, 04 Jul 2025 14:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 378EAA53C9A;
	Fri,  4 Jul 2025 14:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EB5C4CEE3;
	Fri,  4 Jul 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751640968;
	bh=wUe1tVAHYsVRseV1SJHF2HIemjtOqk7S/dvCijh60G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGJ3O1NCJMPg5dnuVN/zqoFOgMns+rl4jUZc+UNbXHrrz9npKf1O8QyxyVf5iloKG
	 c4JajbJuXqEsL+1p2cqfv4ConEiPImRiPQPLVG4xua62g+F7+bW3nOG2UaUQqTh9Xn
	 rkXnefrEoj2QFS34DqK9Rw97pP1tsP9z1/vhR5ZNK4SEDj584PeU3dKI0VxVGQjSLC
	 ughOBVG/UYns4sBDANtdSg4oqV0SuyrM/HOPY6ohrMr+LQT0AP2PxxCXmKjxXEdtKi
	 k3PQuwiOun2z/LwRrtcus0ZXYr9UCQgxjirtH5Y8M6khfITF0Xx+f4RNmmpPQfsFgc
	 Cu6g752/2s58w==
Date: Fri, 4 Jul 2025 15:56:04 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] net: airoha: npu: Read NPU interrupt lines
 from the DTS
Message-ID: <20250704145604.GD41770@horms.kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-4-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-4-803009700b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_075610_089333_0D583F9C 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, Jul 02, 2025 at 12:23:33AM +0200, Lorenzo Bianconi wrote:
> Read all NPU supported IRQ lines from NPU device-tree node.
> This is a preliminary patch to enable wlan flowtable offload for EN7581
> SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

I think a bit more information is needed on how you plan to use this.
Ideally in the form of a patch that does so.

