Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B15CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXkhtK9o0AaX4l76E13gOxjL/F9EGYtWCFU097U+jXg=; b=G7BnC4odF/kWHybkPm94S0v1Ct
	NclIx+cFwv/7dmaRn1Jy0kB5YnVHKfhQpUFAs1pdv1iz/f88omLRPc5idKH6WYth9GxF4C+6a33Ka
	LZdzr6BkY74BGlFWC8kR9lbgGdUIw5D/1ZNwS9JjuXsNvv5aFkKcjDVakDKv9CbxcO/Z5OXvjvwva
	88YhoPExUQ/C7wizQwgMHeEsCpQiENeYhqRWjt2VSvR0VAhW0JttJSq2z4o+77sSW0/K9IzXPu9SP
	eGZMXx4tsvkoGDvCETfwEGaLsQ1Ti2sjaVe1MbSd0jZb2pLwyC9zRFrNeJd9j1XoY24jBnz6OgurD
	OjK86IkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxeR-0000000FkUx-1x3o;
	Mon, 18 May 2026 13:04:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxeP-0000000FkUN-01tn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779109490;
	bh=nXkhtK9o0AaX4l76E13gOxjL/F9EGYtWCFU097U+jXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=az5fxu+WtwmRgdyYCSie3SYKy39NyWthj6rK5dElNf+5B0N8CGToFYyhG99At1O9e
	 TjvDbKAw4yoOsjqj4QrEFMaRpIN5/1s/OJSl7CYnWYn0GwgiWNf+hIIij3sdIzp6dM
	 O2IMaoiSRqRNTXdWHFeXesxk8npBhzPGRRPAEVTIWyJKFkPIHZPzq/vUtTSREj+N9p
	 SzL60lusfzJSqrGnyyq7EndvF5ff7bKmRoPZZyC7yRPW7YJ3tZ9DfvzRM99SiRFEfs
	 n6pABejzCPgJJUAITQSxaZRM4k2mTkU9XfBF3n3HjxW7nMXf/ZoKDrZfolJp1dMhPw
	 j3Swt9tUd916w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 74A306025D;
	Mon, 18 May 2026 21:04:50 +0800 (AWST)
Message-ID: <1d06a4ee2ca6cec68ca241812b2a90c1fd4e153d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: g6: Add missing uart nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:34:50 +0930
In-Reply-To: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
References: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_060453_234921_0DEE078C 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi Jammy,

Sorry for the delay.

On Fri, 2026-03-27 at 09:58 +0800, Jammy Huang wrote:
> Add nodes for uart10/11/12/13.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 ++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 56 insertions(+)

Do you mind rebasing this on bmc/linux.git aspeed/arm/dt to fix the
conflict and re-sending it?

Cheers,

Andrew

