Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4XctlbDM;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Npe4O3xe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yNJx8chMtCeXWl3KaKPCoTjErBK6LBENXJ1CL8gOBQw=; b=4XctlbDMwYlsPU
	pfvbPRVhtJsES9ECX/un2lwfwqyytlp0h5SqkL37Yk9c//f1k/luiXG1yAqe0MGCoAJLiqCU+Yb+O
	6gSDmxkwP7YDEnjIU3qdud4DuR+i2Wa5GJmnUmLPzixYEBr+vI5+jKxUTuhzTm+P5Uv5uKKv7m3JG
	KSZBGjSYA5k2rG1bJPkxhUWRb9hY/dQgwGmxuh/gUmZUFA5psXYeIm/YJlLfcNzWfrjhlSH9aZgos
	nF0JpngVjK7z0+PWZ1eR7Zncl1Iy+u5CS5BxJFTqXwYpgILfKtt38khEFTybdkGn7Ui22v05XauKO
	dR+9llquqkirDtIfbTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5k8-00000000yQR-3lLs;
	Tue, 03 Nov 2026 04:03:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5k6-00000000yP8-2uvd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793678596;
	bh=yNJx8chMtCeXWl3KaKPCoTjErBK6LBENXJ1CL8gOBQw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Npe4O3xeYxRZuIM87r/9x5V4rBpQSVBCgGV6mk7gq3kbDkL/S0wT6UTQjZHBgXIGx
	 G0IGxrzyn7CLHJoAz6sJJ2oIG6ZYTwaflbL+XVun5dVD53WijDZrWzq/RnreHULCIE
	 e5PHon+J5EJ1VTWLHxNRyrzZ3cVRjXUXfyH5FsjcP2a4InCbnmraT/tWfHf6gSfgOq
	 4YDsAqhu38jXBvO7puJKxb350JpepTXxh6HhZK7mtWjEIaCMgEkcx9Y9ZKQva2hJzb
	 M3UsivRIBumoJtGZYOZ+hM/TEKnItuw84iH+9aaqhbBFlnuhRNCEGfYcoh36b9qHTN
	 5kREQmUaQnmJQ==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7114B648BE;
	Tue,  3 Nov 2026 12:03:13 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-ast2700-evb-reserved-memory-v1-1-ca1360d585d9@aspeedtech.com>
References: <20261029-ast2700-evb-reserved-memory-v1-1-ca1360d585d9@aspeedtech.com>
Subject: Re: [PATCH] arm64: dts: aspeed: ast2700-evb: Reserve coprocessor,
 IPC and VBIOS memory
Message-Id: <179367859374.59456.14319284457238248837.b4-ty@b4>
Date: Tue, 03 Nov 2026 14:33:13 +1030
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_200326_932432_9D0B7633 
X-CRM114-Status: GOOD (  11.26  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 15:51:54 +0800, Billy Tsai wrote:
> On the AST2700 EVB, the boot firmware places the SSP and TSP
> coprocessor firmware in 0x42c000000-0x42fffffff, the IPC shared memory
> in 0x431080000-0x431b2ffff and two VBIOS regions in
> 0x431bb0000-0x431bcffff, and locks these ranges so that accesses from
> the Cortex-A35 are blocked. U-Boot does not add reserved-memory nodes
> for these ranges to the DT it passes to Linux, and they are inside the
> memory node, so the kernel uses them as ordinary RAM and the EVB fails
> to boot once it touches them.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


