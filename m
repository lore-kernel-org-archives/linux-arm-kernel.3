Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E258BCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE0T/fmVHyiTTnqmMQr0pMsurg8GrSTzaCZsztr/3Cc=; b=UnwE9K6gNhiAU2FdDGUgrO8cYs
	NYP/UawkbqRtmBCfwBpg43pRYl5i89OCamSaN+G8FzEi6MAPq9kD7mywCqigv8WojWmCEj3QtVilz
	inQbqrZHNs0kNdRCjqsxzvSOrtG354DOHMc7Y94VqJrk59D8lM56Q39uWXPzRG2pjFIEuzq3tdQye
	DVOnUPbLBxsWsZAr77XAfJRkr1iKfvYFY/VAd1y9sKOLtu72WBPnEm6LUuPCVsS8O03fa4ma+cQ0/
	OehMQENVJuPTrmvSqE6LQTn2ArYLMC2TiK8Xgu5YZeVU6LiXh49amUTLd949PZWCtdJaXJK/N863v
	er8kWY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOU-000000014r8-1gwx;
	Mon, 08 Sep 2025 17:11:06 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbq0-0000000HLeW-3JIj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:23:17 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4ED5440506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1757337790; bh=jE0T/fmVHyiTTnqmMQr0pMsurg8GrSTzaCZsztr/3Cc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OcwfbR0rby34GzfIxaov168IheTrZ+ikAV3382xRCrGMWfTAjdqQXDm0IkI+U74cI
	 vk465Qd6Lu3MfdA8wLw9iIjKnB/5tMtlds2arjrrdEajdYy9raICA0VexG3g7GOELm
	 /ORjRT8Is7SBQNrMvVYte2jM2Q8AtUUnGKGtxf82MfuYtXvnwwxw9cuecSPwFsaAUK
	 yLr75Sfsx+wQ+QW7X2wAeup6ugtw6Acc7AQNvEwtpEGCusrkrBb2jVHXelS9K2dUfA
	 bi+uS/sTiKw7s4XJ2SZM+yG6L60yW9s7cR4D2f9DpSkLgvN6CaAoDsP/E5XpEFMhm/
	 a4nGwUYlIEMxQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4ED5440506;
	Mon,  8 Sep 2025 13:23:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: hariconscious@gmail.com
Cc: catalin.marinas@arm.com, hariconscious@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, will@kernel.org
Subject: Re:
In-Reply-To: <20250908095450.42929-1-hariconscious@gmail.com>
References: <871pp8a9ze.fsf@trenco.lwn.net>
 <20250908095450.42929-1-hariconscious@gmail.com>
Date: Mon, 08 Sep 2025 07:23:09 -0600
Message-ID: <875xdtyt6q.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_062316_826719_B7ECEC06 
X-CRM114-Status: UNSURE (   6.66  )
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

hariconscious@gmail.com writes:

> Thanks for the suggestion, will correct and send the patch again.
> And my real name is "HariKrishna" and see that it is mentioned in Signed-off-by tag.
> Do I need to add surname as well ? Please let me know.

Yes, signoffs should give your full name.

Thanks,

jon

