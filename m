Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A9CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdr4uOOnB6Ld6MexssnR/sbhGEPg6ZLHZNx1sBzmouI=; b=Qjs20AFCD1aLmZAUkMO5uIxlmN
	CqntGBjlFomyDNefbtGLzcIGLavZQCG55e73HWa8g6DFjKQ1MGgPnDMa0L7z0kaMGOv71Pc5RBH4d
	LMLtB+pw46R8EXIhYNwX5C1pHNkTZlgPzyA/+i/aPuh1gW8G8mESntWXQlzv9unXpEYqH/4svp+Le
	qwF5Y1SoFSspgBkF/rYj8eVGUqdx2tosSCzICfy6BG4HEHdqraDEXDNWma6lyckpPqiINDwcyxVeR
	c9vvQBtgcJhGNBcSXRLnbQ1IsmuxlekoelyycvCDlLj/tJZk3Ge7okyZarZ/Dt23dGBH5k2nyTngC
	Al4A17Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG7q-00000000FVb-2biW;
	Thu, 18 Sep 2025 15:00:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG7o-00000000FV8-1jgu;
	Thu, 18 Sep 2025 15:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FE4743903;
	Thu, 18 Sep 2025 15:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7478C4CEE7;
	Thu, 18 Sep 2025 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207643;
	bh=UQJx9wcC3Y5/RVnetstb3CtyPqehRBaZAkfGjE1g9q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnoPnP/woT7o9942piukwLLP+g/cYYfsmmqlQvljTgFvEBJ2vX9RsDBKgRRTyBOww
	 5XCy7Lryd3KlSPKFYnhhT9s7aPrmBrYX5MM/F/MbIceaFUx8oi4ssesUgt9E02WzKq
	 5WWKXz9PK8PGMmqNfvKx50rthdgA9ETgeeOalqhdkMnzfAz7YettyFAcZm4sGIGbMQ
	 1L7YGT/6zCZEh7ypxAtEeHVnMgYAjAUfN/PEO2wRgEGMzg7DIh3ex0CfYs04HoJ5Z/
	 b5zbON5cfzZC4TsUr3IBuDbqXOEeRFFcPNhxTB9Ql8QYk4KDnA0uSxr1oBbDHNsQEX
	 uXtL1c5wX7tUA==
Date: Thu, 18 Sep 2025 16:00:39 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix PPE_IP_PROTO_CHK register
 definitions
Message-ID: <20250918150039.GW394836@horms.kernel.org>
References: <20250918-ppe_ip_proto_chk_ipv4_mask-fix-v1-1-df36da1b954c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-ppe_ip_proto_chk_ipv4_mask-fix-v1-1-df36da1b954c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080044_469942_27C6157D 
X-CRM114-Status: UNSURE (   8.87  )
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

On Thu, Sep 18, 2025 at 08:59:41AM +0200, Lorenzo Bianconi wrote:
> Fix typo in PPE_IP_PROTO_CHK_IPV4_MASK and PPE_IP_PROTO_CHK_IPV6_MASK
> register mask definitions. This is not a real problem since this
> register is not actually used in the current codebase.
> 
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


