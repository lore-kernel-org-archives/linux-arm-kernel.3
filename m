Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A18EF06E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dmrWQTudHpALwT3TawG97teYoHjG5M4aiLA9OioLZY=; b=X4dKMWlwp4tE7kFUsKJ4an/Pp0
	5jn7rP5m/K1SJKO5VCYS1incvoM2l/7EUfcuTi79pOQx0jgYEsv6iFzXT6hIMXcQXJk+3T/6jsQA4
	+xsbiLw4VpvWb7+0TLivwbs3bUQdPbCrYGdU6asD/ML0vpoc/V0jgx2cGWfycC6rEvyxNdqNXHUA0
	8rjeQDCpY6/cFJXHBvyQrGxUHja4ts7qdS0ZV5XbGJgBxi/moiV9mbAp7OPl0+ZXn/MNyLMtnwlDj
	OCukFxOx5uV6UEKYnBJqwHeoRS/1gms6iJhU8G0pHuDsEuqZCz8heeRItwPwfoLdPZ9mncH9iJy8v
	HaQ+1oQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJr0-0000000Eqsm-02Jk;
	Mon, 09 Feb 2026 05:30:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJqx-0000000EqsQ-2zgv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 05:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770615029;
	bh=6dmrWQTudHpALwT3TawG97teYoHjG5M4aiLA9OioLZY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l/x8sllcZtMauYNiP7i2hFsaDm6Cf4hkRrM8IULcrqfkuZJ20brwg7LMhTDgbjxFa
	 sY1GfpXZaGh0jzfG0fsDpyUS3Z2uRJKntB3NsBYrVKK9DUpNmz8b1FdeuttGWlxUrc
	 sY24n13ylRuropENaRqlC3PbmhWJ6CbrxRYQh5vJSVVWWK8YRh6UMKccWGOs8V6lFN
	 4ET+/+k5uai6rBDyZrBbTJ+6yWmrJvsttjaHo43dkiwGnhWCHOYETWMkQwK3+4sbjZ
	 gYNIR0pCO2Nf99pKcYfhMaJvnB2sxIoiFTdh0t4+icdkwmuVhnqxig6K9Ig2cge0vJ
	 QWpTv/ikTbJ0g==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFE816024E;
	Mon,  9 Feb 2026 13:30:27 +0800 (AWST)
Message-ID: <548c59f97704c934919e6d4f625579f17a350fac.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] Add device tree for Asrock Paul IPMI Card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zev Weiss
	 <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Date: Mon, 09 Feb 2026 16:00:27 +1030
In-Reply-To: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
References: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_213031_946903_18FB9D4D 
X-CRM114-Status: UNSURE (   7.69  )
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

On Sun, 2026-01-25 at 15:00 -0600, Anirudh Srinivasan wrote:
> Adds support for Asrock Paul IPMI Card [1], which is an AST2500 based
> PCIe card that provides BMC functionality. The supported functionality
> is similar to the Asus Kommando IPMI Card, support for which was sent
> previously [2].

Due to ordering wrt other patches on the list this ended up with some
minor conflicts in the binding and Makefile. I've fixed those up and
applied it.

Thanks,

Andrew

