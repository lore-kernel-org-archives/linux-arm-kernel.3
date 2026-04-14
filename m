Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206B6F9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAIr67bkxC3XQwY18544tV2pAQWuxB1Ff+z7mxRuI9Y=; b=TpoB64p8mFWMgpCY8zGP/kgP3A
	xX8oj/BLl3k2DAcW///UcWX4rc2rU1Sd/yZqz7BgqjCwC6YCE8wCCUcByobiDueFgXCAQSs9HCE0R
	c1W8wOdxnBDBcgtNgYtHsATaSf0Ycgc9Wd1Ji10jtTj8AspCMS4Tck775BGt1/+t9hfs9eaoJL9Er
	OIIBTNxlxU191iONl+Q0nGF3E/bZ3p3N389d+LtSd4c72xKg4PNz+fn0zpwX9HNrzyFbkCHd5cuSO
	kRw2nuMOLlXr1XOcph9VN5uCQliNdU5AobbLDkIL928PRbAVewp41fAAInevo9CgAfFdqhGhvTAzp
	X4kGAR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdCC-0000000HKFu-2hw0;
	Tue, 14 Apr 2026 12:48:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdCA-0000000HKEC-2lRM;
	Tue, 14 Apr 2026 12:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8AD460126;
	Tue, 14 Apr 2026 12:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918AAC19425;
	Tue, 14 Apr 2026 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776170925;
	bh=ywvmaEFfcZLbgJZzgdExmYObQSQSsjeTYz/irjz5laA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvU2nXq6Q4wsp2dI5CJL0+WLnFsCXIt2Ghi87O1uv5Ik1R0cMsO/7z2ftR2IhjZMd
	 Mzo1Rp+Rr2xO/Swp5zJTlvT4nM79ak7W/fmYW39HUydPku0PR74Y26IwsW1WrNSIxM
	 zlBMo8UDgmvzRpLxa443rbekz6/dFMruYCeqhxMcite0KKx1NUGrKcPUrwpNMWl79U
	 hNuFa0U3WJRfbtQY6tbR4Is6V17nkJf7AaKeEIWTj5R6/2BC+nLf+kxo7P/7dU1Qag
	 ton6XG5S61YsoGgrq2xJZKbWJMJG9ayfT+uKKVwxtVlLFVgs8Yd7pcTWLOD16rFtXf
	 bQJc/c76L637w==
Date: Tue, 14 Apr 2026 13:48:41 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Add missing PPE configurations in
 airoha_ppe_hw_init()
Message-ID: <20260414124841.GF469338@kernel.org>
References: <20260412-airoha_ppe_hw_init-missing-bits-v1-1-06ac670819e3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-airoha_ppe_hw_init-missing-bits-v1-1-06ac670819e3@kernel.org>
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

On Sun, Apr 12, 2026 at 10:43:26AM +0200, Lorenzo Bianconi wrote:
> Add the following PPE configuration in airoha_ppe_hw_init routine:
> - 6RD hw offloading is currently not supported by Netfilter flowtable.
>   Disable explicitly PPE 6RD offloading in order to prevent PPE to learn
>   6RD flows and eventually interrupt the traffic.
> - Add missing PPE bind rate configuration for L3 and L2 traffic.
>   PPE bind rate configuration specifies the pps threshold to move a PPE
>   entry state from UNBIND to BIND. Without this configuration this value
>   is random.
> - Set ageing thresholds to the values used in the vendor SDK in order to
>   improve connection stability under load and avoid packet loss caused by
>   fast aging.
> 
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


