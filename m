Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B3BC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 01:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmVwpc0egoHaQe36uq5tr8rwYmpYq7GIAe9eeLMQKLc=; b=J9kTiyONGf2Oaxt3wwd6BXFlHn
	z/eACs1slIL3ZWo1c5q4GuVchFc9L+1oRSgJBw0ulNaI5SghvXJ/lRAHaPey7hsJl96WWxGPiY5nc
	VjcewFRMzmx5KelnSMxqNFIwU6oTNcwjPyAAG0vTRoJ6FZz3CFVcCy/LQDP9kxjgljJ4m86pxjYSL
	3ti0cKq6raCvrRkr06vzL6B9U3+WXatMIGgwTx9zHmgteWZdFSRyzljRuarK1L5BfdRilfYpK+iVc
	3r5QM+o3Bo2oPs3/qOzmiyop+l1kUPxv/sEAHTCMnO9yWzQ9HGiND8+VtY132JXQ+VDHyROzR11AM
	salUJprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVHo-0000000Czvn-2aag;
	Fri, 04 Jul 2025 01:32:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVAZ-0000000CzFL-2yjc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 01:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751592289;
	bh=dmVwpc0egoHaQe36uq5tr8rwYmpYq7GIAe9eeLMQKLc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=I6is1ersaoALURA73JjjX7SMm43rGbIhpvpBNzKZRZuDY4wEbdLiPSBxdCNamI5ZA
	 7Ft6POqmfNCzi6eF30kD+OdQWsJgKmnQ94fckvpDCQ+ByX5wv/JsoO9wNvvJaphd70
	 qOpP5m4yDOPF//pl+HAxxyRgeLy6/oGTS9uAiPCN0wf39X6FlQta0CgHNSaUQm10kk
	 BPVl67+Re4njKhtMqDPieMT8eObg6RdPJ20Mx9fynkLpknkRKjV491IW+om0BXlDY6
	 Y/QKwLyjVTtC80KCyFcodX3Hls0py3vnpM3Bfc/tfJvD4k5cmbuJ1FKdMPBtNqi2h9
	 kI/sXIGRrczDQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B5CD66443C;
	Fri,  4 Jul 2025 09:24:46 +0800 (AWST)
Message-ID: <444ea7dd85b7e664043e3fae4a22d515fd121433.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] mailbox: aspeed: add mailbox driver for AST27XX
 series SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 04 Jul 2025 10:54:45 +0930
In-Reply-To: <20250702011956.47479-3-jammy_huang@aspeedtech.com>
References: <20250702011956.47479-1-jammy_huang@aspeedtech.com>
	 <20250702011956.47479-3-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_182451_937864_53781C00 
X-CRM114-Status: UNSURE (   5.54  )
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

On Wed, 2025-07-02 at 09:19 +0800, Jammy Huang wrote:
> Add mailbox controller driver for AST27XX SoCs, which provides
> independent tx/rx mailbox between different processors. There are 4
> channels for each tx/rx mailbox and each channel has an 32-byte FIFO.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

