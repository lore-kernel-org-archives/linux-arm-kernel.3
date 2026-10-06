Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E397BCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UADx5siGKeK5KCATSLSOTyedeT0k/fdcCEK1ZVtIuQ=; b=KU+kodcsdByNuTBsUa6rvnHdEC
	6qgs9wgzLCSy5xlhTSjaiY7IUllpPIKXKcoR+WulbKNbvJWaJpgX1mGF42EAihcQ1xa/67NbEJJU7
	zKEq/GklnBuPxs4gATPayZJEm/pI3CHEzAgbWLrOt4TrswywPs6dau79fsERDL21V2ioJDm4sJ7Xe
	L/T7hL9JlEFtT+SH4TQkLGl8w01nRQzNWbCsj3ZKmwvCLfr5LXOMwxMbZYyepwJ9kyd/NnYmZviaJ
	RG4gX1jr95TtT2dlAtT0O6EYQ9HwkS+SErRtw5qNO7N9zh5/oXhTgoUIdbi25zOqzgGSNR/IeOREK
	9jiwiVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE05Y-00000000GER-0OMZ;
	Tue, 06 Oct 2026 07:59:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE05W-00000000GDd-1z6M
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 07:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9UADx5siGKeK5KCATSLSOTyedeT0k/fdcCEK1ZVtIuQ=; b=Z6tyzbiRjHk8/+As9r3lssgI5m
	jbpYTSFqyyCv5/yN0cg+DNQ9ZenCeRQkMBU2aETKk6+garwQt7GkriF08CL86yiCoZV9/cXHDPb3i
	N0JwB/FzIGp/XqX1PQ6pN8SwLXqDxmsKFG/Rx3MtAcvq2/9OzC1hj2PQUbaCrhEnBC+K7h8Fx14sQ
	OUkMhG3su03MoLxn2oPw8y9t192SwPtZsG02o6TjLEjURszl9PQmATaJ8K73GbnrNnUARQDhTBKxe
	kxN91xfCll6I1CHiel/R7g0d9+t/oWud2M7vQexQhDc55FFReNY6ebUTljmS9C2xo0qpHUkI/9J3Z
	9JKRTXPg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE05T-00000008YEa-0VnG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:59:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 218DD1A1154;
	Tue,  6 Oct 2026 07:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E50D260553;
	Tue,  6 Oct 2026 07:59:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AFC0103308A6;
	Tue,  6 Oct 2026 09:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791273576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9UADx5siGKeK5KCATSLSOTyedeT0k/fdcCEK1ZVtIuQ=;
	b=DaBqXNsqHxGDfFPoYUUv7E2wCtlmm4y/KS3i8vfonuSiH6cqiVL3+otxLy9VfNEpNh2pj5
	tL63Ornt/T7WteOWMPXk0iy5lBXfRqkXC3DAtR2Ana3t+EUP1dgRU4ygPo+aRAUum0NRto
	h/jXGFvvVyGPbfhxCIq3PX1jwRUZpuOg08E+Rd5s0SKLk0WfJD+9tfTJvf9VqK9EsoEAXg
	tDYjvV6lUEa86kWa3BtrqVIB9C1cS+j+wV4G+qnEeH2AIY5nrO7pATdGICiLMO2plcmRGP
	+NQFhhxKcf01ecK1yGS8CxKW80/++DTNsiwcOSTrxH3LdxZfCVqly4sQVAjvjg==
Message-ID: <d6e61c8b-cd3d-43fe-b4ac-19ff5d790b0f@bootlin.com>
Date: Tue, 6 Oct 2026 09:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: rss: Require indir table size or
 hash key size to support RSS
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 jitendra.vegiraju@broadcom.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com, joe@dama.to
References: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
 <179121059086.434549.5364767976780818051@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179121059086.434549.5364767976780818051@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085947_566404_5AAE81B6 
X-CRM114-Status: UNSURE (   8.19  )
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



On 10/5/26 16:29, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1



> [Severity: Medium]
> rss_get_data_alloc() is shared by RSS_GET, RSS_SET and RSS_CREATE. Does
> this drop flow-hash reporting for devices that have ->get_rxfh but report
> 0/0 sizes?

Yes it does, that's the intended behaviour here. RSS bits are all optional,
but does it make sense to report hashing params when the indirection table
is size 0 and key len is 0 ?

Maxime

