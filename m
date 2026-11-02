Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zBRJ33bQ;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I926b+8a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F47TvpF4alCvrDwB/lWnRKJYMN0llS7GsPiSe1nXvh8=; b=zBRJ33bQHxn38dTbWj35EXIpL5
	cYFfQr3b+UWhDpYFN540RW4QV3mcsj2ax8KZ9eWHOpMpcyrxGT+86b8paKrpvMRQ3jnz0zV3gO8Sb
	dwz4m3p60j5sp600sKqiIr6a2Elv1P3sjyBwMovs14QsyCtMnWZpmPYuQOXc4Y+gN+iup+fFpfH7K
	AZn8uDAoGcaHW1q1Hu2JRqf2UbcvNOR5ulH0hhLlwqN7/A69nCEbEDqxoEVbgytblHnbBX3UBKzQ7
	19AHvnt4kokAf5jnkDHQnD775hg9Lf+t7wolnE/mPMPzkEj2cUSuoG05klT0HgxEjXMhVz3MvEBZq
	qbH+K/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiDU-0000000FPzo-17UL;
	Mon, 02 Nov 2026 02:56:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiDR-0000000FPzO-2j0q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 02:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793588158;
	bh=F47TvpF4alCvrDwB/lWnRKJYMN0llS7GsPiSe1nXvh8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I926b+8aUm++ApEmUumF6Wq1fFjZYN/De2AQVGpR7/LKQmgawmZ1MZBHmTXRtGXeA
	 WNy4K6xrj1IK8Yj0N+JU/18N0U93HBopE4zHN2PFpZ+lpP+0dOb2ajvqmaN1L1CrSR
	 1WfZFU31ZSVQCH/es2G7x5G6paJL+mlzMOOtDdEqALUG6dpww6GWIV+rAzs1SFqnAS
	 CmEauo5bUgRJucwgkMWNHk5cGLNHCexucabtj9R8T2DP+nE/2R4EgVyGDL+JdbIqXP
	 eje/0nxF65/YuIA3ZovO7hzFS/jhSx1JpK0/IScBRfsaFBOllaBj1SygxYX4Ad47rX
	 AMUoOzEtIHamg==
Received: from [192.168.72.161] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1D0C64A21;
	Mon,  2 Nov 2026 10:55:53 +0800 (AWST)
Message-ID: <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the
 Axiado AX3005 IRoT
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Akhila Kavi <akavi@axiado.com>, Sammai Chakravarthy	
 <schakravarthy@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet	 <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>, Matt Johnston	 <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Adam Young <admiyo@amperemail.onmicrosoft.com>
Date: Mon, 02 Nov 2026 10:55:53 +0800
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_185610_057590_D22C8A35 
X-CRM114-Status: GOOD (  11.74  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Akhila,

> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
> co-processor next to the application processor. Security protocols such
> as SPDM and PLDM run between the two over MCTP. This series adds a
> transport for that link, so the host side uses ordinary AF_MCTP
> sockets.

One overall thing: why not use the MCTP MMBI (DSP0284) transport spec
for this? Sounds like this would be an exact match for the MMBI
use-case.

[Also: CCing Adam who is working on PCC, which may have some overlap
with the mailbox protocol used here]

And finally: how confident are you that the peer will never be able to
reassemble? Even if the peer's own MCTP stack may not reassemble,
there's no chance of it bridging to other endpoints in future?

I have a few (minor) comments on the implementation, but would like to
sort out the overall protocol usage first.

Cheers,


Jeremy

