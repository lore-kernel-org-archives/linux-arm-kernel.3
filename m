Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E28FCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 01:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvbdbV2AgHVvCAc1GklIFSf+MOqvAqvFHUbbz+ZjMko=; b=IPCDR7IMZO4hbiKJUn1CmZkGxc
	Ho9hmN4/7h4gZUUeQT93NZiPrecnrTrIawjdnRDFX9n+Nl0Rdk6iET+iIPvxZmwaM5dVkzg+Bmkss
	MZ1oP8mTI+fChbWDaLWm8JL85ijTyCeBM3UxVxVIcf/uWRu115TF5A9rGE+p+fJibufwDJn7xJVPX
	+FaiPgnSDOcyVn1R1Hg1gWSejXKQ5R09NwXutwimivi95rYuOXtN9i7ttq571f73A/Fg/A3caaofQ
	FfARSrm3FTBgsFvLSAjqX4LdVEZfyTcV/pxkwmSZ53aMQjc2JmaEvF3hcn7XZnQPo6Rn9NXrQGiP4
	Fyk3Bg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNe0-000000018qb-15Sn;
	Wed, 22 Oct 2025 01:28:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNdz-000000018qQ-1B71;
	Wed, 22 Oct 2025 01:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ED39623C1;
	Wed, 22 Oct 2025 01:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495BFC4CEF1;
	Wed, 22 Oct 2025 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761096481;
	bh=JkJxzunFFLK1PDhtMOu5+1FjV6q7aUqZM+HmmciG9aM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NcGbjYMetmbJQiq34aqtxvWSN2rGx+aX7rrvqRZqOw+Xvay1TCp7detb7iC6hR2+g
	 xmOY3+Od7PxuNI+6bP5EJ9I5fR9yuytG3CElSyoStLURi5nYBdiSYLsmCwe5dl4yvL
	 8oUcydhLyJOF4om8Z2ggO+cQ1U2XecW9o4MBJYBrKz93io/r1QTckG0EsLUpDWUeSy
	 KpPUIGOtshKxQHq+9wXldNHO97/E2EkgNoeQA6RQgKF8h+gzY/H3vR5O0wShZycci6
	 9Pj9kBTvAwZ8dOTHUWdSTeufq6zIlV/ogTCMkMF1zf2Bar+kxSUsEBN9tjUEP2YXfE
	 AhxLMDarMdmFw==
Date: Tue, 21 Oct 2025 18:28:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Remove code duplication in
 airoha_regs.h
Message-ID: <20251021182800.2c736d21@kernel.org>
In-Reply-To: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
References: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 18 Oct 2025 11:21:47 +0200 Lorenzo Bianconi wrote:
> This patch does not introduce any logical change, it just removes
> duplicated code in airoha_regs.h.
> Fix naming conventions in airoha_regs.h.

Appears not to apply
-- 
pw-bot: cr

