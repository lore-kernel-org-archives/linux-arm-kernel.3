Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45ABCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elZboa60W0l96YHBweGgGvjS5bMO7+rmrRZ0Og9GkKg=; b=A3zUInOoq67bupeIRsQvoaGl8b
	H6sADq7VgKzGbdET+QnWgT3xrv4a24v5tO4N4dZ0W8tP9hDF2MzRdJBrUqktKs2pfkzl+t0wt0ydS
	HJ04+E2Yy/MdJMUGo6RpkatEY1mLdWHnq69PT9oulhbfD79NOuE7Jff27wBt07NAK0lPA0becIC6e
	81bRVVODifOp5as1ueWBjjjRNOrav0RWEF/ZhhVGiTp/Y8N5qNnPsGJqXd5+JKnUzVbegsH4pM2cu
	DaFOF+a4NK0mYnZc76P8/urK9NjoXXqe1K84pXARpzP3UzkYR8Oqd5uBvs01Z2t8xeZTuCzVhiuHN
	rizBGNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx9X-0000000Fe5N-0o8P;
	Mon, 18 May 2026 12:32:59 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx9U-0000000Fe4H-16RV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779107574;
	bh=elZboa60W0l96YHBweGgGvjS5bMO7+rmrRZ0Og9GkKg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VVXe8bcdr8e3oLxsXRO+S/CqsgNrAYlHzNMC8MHgMfpiXPYRfIljG3Uj0CuGd9tEE
	 LYdjNoSTbJG/XzayYLR7ggKfb2RsYRlwumBGLzZA3AXZUxfXrMdL4J3VKZjkf+scU+
	 +D3GPymW0SVfw5MmkTXdW12gF2ZUlx5UctiERtufaufsK+Wkiyq2+PTJZqAnfI+4Iw
	 lsRlI+WaKxDQUTDaEhVTWDbzHR4v0la5YgAZKNvBoJmmr05Eh9cYQjPEZiRHY95TKU
	 KAl8taOkfCxK7Teumesgv5Hyb75fskpRBlyXEuRWERoXaNWrGS6NXokp8rQrRgnY52
	 GOpXiWy6cXkrQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C6D26024D;
	Mon, 18 May 2026 20:32:53 +0800 (AWST)
Message-ID: <64f6ad212446c55780601a6477478b5ace09d930.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: carl.lee@amd.com, Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 peter.shen@amd.com, colin.huang2@amd.com
Date: Mon, 18 May 2026 22:02:53 +0930
In-Reply-To: <20260331-arm-dts-aspeed-anacapa-add-eeprom-device-v3-1-2bb2226fbb4e@amd.com>
References: <20260331-arm-dts-aspeed-anacapa-add-eeprom-device-v3-1-2bb2226fbb4e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_053256_504301_6F85E17F 
X-CRM114-Status: UNSURE (   6.20  )
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

Hi Carl,

Sorry for the delay.

On Tue, 2026-03-31 at 16:02 +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
>=20
> Add eeprom device node for NFC adaptor board FRU.
>=20
> Signed-off-by: Carl Lee <carl.lee@amd.com>

Do you mind coordinating with Colin to integrate this change? He is in
the process of reorganising the Anacapa devicetrees.

Andrew

