Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF4BCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyebWGkoDw0IMLgVd+AKwJCgIiDE52FQKr4Rqkznajk=; b=laoagKAV13/JXGffLwLQ5TsXzN
	Va7Jrcgvpss4jcIFq4qIf92l9Lha28JMlXr2OnHvFozQxcTOB8gTvgl8LTzb2v3dR/uZrmNhMJih2
	Nx1FuqnaDfNDAnE+kVLHFAJXzHesJLZtIVlrFrcXgIVBLV9JO07vdSeN4NhKIsZa21f+FpKT82p7k
	25qVty5l2/KP+pu9BQaUq4rYSk6a1YMXPY1OOgsjAAyfND8Bl7XeWuvSAcMT8Lr+qHq55OT1n3xML
	XzLKSWPYnXf4Cg7dFPv9VE0oICET6RzYNSDt72A0igUOIWWfjOlYT1Q08ZkLYZaIjtdqydHjG+yfn
	7ot8W/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGrl-0000000EwoQ-1j9A;
	Mon, 15 Jun 2026 23:37:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGrj-0000000EwoH-3WOB;
	Mon, 15 Jun 2026 23:37:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3C1F6008A;
	Mon, 15 Jun 2026 23:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137551F000E9;
	Mon, 15 Jun 2026 23:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566634;
	bh=QyebWGkoDw0IMLgVd+AKwJCgIiDE52FQKr4Rqkznajk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HNRBRDKOOEc3w6UWCswmMwcS08k8VXC8ghVYfQr2saEu6CmfXrbaT9eu02xZvY4Mb
	 05hO7jVky7Yo2Q37OGLDJ0EF2U6/4NNoojmfdqo9IXmeRurxeRiq2kjvFJ+ul5ZAss
	 djADX5tBYXJLHfXf0+RmRqEjHETK7O0LwU3b/hqST27Ct2HUfsBNY2a5OArOoBDhBW
	 N1TEPRI89ijWa5pzTFWqsh7aDSs5a84Jni73Iu1wxh6vtYhEtXHLfKpCH1Z7SGZrmp
	 OXYH5p8Qe+3M2Y709/Y7D8l+9GxkBOZ2OEcWOFVGmq9Q0oftp15s6RPc403q1dkuDP
	 7F5V8C3k2mxhg==
Date: Mon, 15 Jun 2026 16:37:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Madhur Agrawal
 <madhur.agrawal@airoha.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v5 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Message-ID: <20260615163713.665271a2@kernel.org>
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
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

On Thu, 11 Jun 2026 23:55:50 +0200 Lorenzo Bianconi wrote:
>       net: airoha: use int instead of atomic_t for qdma users counter
>       net: airoha: refactor QDMA start/stop into reusable helpers
>       net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload

only the first patch applies cleanly right now

