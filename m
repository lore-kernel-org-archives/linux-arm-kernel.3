Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7F8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sMn97VmM;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=JCyZO1Ff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lq51iNfoBTarnKa8QkowBkcUOmPokb/N+PZR8Ux1pks=; b=sMn97VmM3546tf
	+3yhceFkKVmFShq2+NBsdmajCu9LF3z3kUOO6feAFPJ9TL5g/rw4cGbFMKSZHoYy7T7S9nbF4kGfR
	lU7Ub6pq8bj1R/4cnSQ/3StEm/jzu6SvVZE7kmoHfufHYFWoyvZ6ttFPGrS9/VU+vvL6rCO6eDiEw
	GZIjeyZAJs/bVjbRAqll/hTgH6cjpZUsDpaq+NVAksAzfDCjoh4Le8QzKJvGecWSzMllbRQQFGkTV
	DdnxQH51admBfBz6zplI32ftph0sEd8/S3WlH6K7PoJMyzFz/vBJbxe2gGlL2cFkndfS1WP9LuWWJ
	uCOqJ1NctF1m9j1po6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1yK-00000000iZ9-3y5T;
	Tue, 03 Nov 2026 00:01:52 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1yJ-00000000iYP-0DHM;
	Tue, 03 Nov 2026 00:01:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793664107; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=hsUZCqhmQYEC0EqIJS73nyaYwq5sSez0kknqgGO6ZZdDFGtBYqyoLd7pwTsy3BUpCz63rbA+2CmOaWu6O6yzWYMqrTeelwhiNE7oXXBcpfe3TC1Tk3vYrxSvPPbIeYWvfakt63dTwL6xhSi5OjuTJ7buH/ZVs2M2NjJFAIjVQ4Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793664107; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lq51iNfoBTarnKa8QkowBkcUOmPokb/N+PZR8Ux1pks=; 
	b=ZjaQSGb/8+qmfizNu1c3fJF0gl7GRaIP2T/+PxULU8c+7bC+Qr57VEHRXH8GnMShrh2at2/yjXEGskqhGyDNQS5BVlL4TLYHnl1ouhZ2IU0VWYIuoZ4Z0vChTWRTZqDhENORNbqvjIiYcb7uHHinVkCnppubrf5Bx2Unw4y30bg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=JCyZO1FfBhLrMrUW6H8SajgJ3Gmwyl4EDm3XBw65RFuAp/B7TUukuL0OHlYvMt6mok0Kk6TiWtmE5DuD1OUIi6u0RPI+cLarS6Vbir4nNwBoEC3ruLGOFG2NQwZJrKdFxgagE5ve6D+w+mP+YYwzbURW+jcAm5YqS4e6stqUPpM=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Lq51iNfoBTarnKa8QkowBkcUOmPokb/N+PZR8Ux1pks=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793664106301154.01142487451705;
	Tue, 3 Nov 2026 01:01:46 +0100 (CET)
Date: Tue, 03 Nov 2026 02:01:45 +0200
From: Igor Velkov <iav@iav.lv>
To: Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rockchip: rga: Keep the clocks enabled without
 CONFIG_PM
In-Reply-To: <20261102-rga-runtime-pm-clocks-v1-1-1bad7807f037@iav.lv>
References: <20261102-rga-runtime-pm-clocks-v1-1-1bad7807f037@iav.lv>
Message-ID: <20261103-rga-pm-withdraw@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_160151_355433_88C2BAD3 
X-CRM114-Status: UNSURE (   4.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Withdrawing this: ARCH_ROCKCHIP selects PM on both arm and arm64, so PM=n
only comes from COMPILE_TEST builds, where nothing binds to this driver.
Discussed for rkisp1 [1].

[1] https://lore.kernel.org/r/20261102234238.GD3559911@killaraus.ideasonboard.com

