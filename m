Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC86CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtXkXi5o13UjPW6UOARCjRJLe7zqlxFB0MGqVZLUWZ0=; b=A1Tfn/vk1DaKoTeh1QLxQXIz/U
	3zpdLKwnajSrrFdmvbScWX5gAgd8TBAay8Oa0IG6c7WgiYokJBEtultVGoK+7QAd2oTJ5x9REIQCy
	ae29V4VrumQthHti+kbs3yMk/ofK3PpYNCZxm80T34EJMXMXYDSCFeKc/Ncef7d6PjFhT8K5s4gho
	lAtqvALHV0vbky3fP0BarJuuQnsBCouEbHfysDt6j+7ZCZdxQvk5cuqPiBmZDbV15cdzRDpKvjPBU
	jdyT00miLbVqjhM3kzHD2qnXw8uY58wBNPNuPP/kYhlQzsHqhOO2T8jFGi2/LJzLMFZ6rPcorrn7a
	91tZBbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XVy-00000008ihq-03oA;
	Mon, 22 Sep 2025 03:46:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XVv-00000008ihA-2EFI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758512812;
	bh=EtXkXi5o13UjPW6UOARCjRJLe7zqlxFB0MGqVZLUWZ0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aOu6QaNwOL26odufxNXWWzUx+1ysq8xlrCO4dzH1tkRNHX79EvWd28MgI8Z/o+Y1e
	 /wwVGYpCbWMZYELCuYWNo00YsjW0i+2TUcePSx1jW7VLc3485Izzj7YjBFHaQqw3lD
	 3wYsdfjdBgu2mwyIZbOSUTvOBbVV2duFivCLLXG64abcq9KuVwfMQ5E03+W8U2sptR
	 m5q5crdGqQu9xYn0T5TnG28j55mhq6aROjFW6C6r1OdBwe0sMNmxWMjypaPtRPL1dj
	 SvymFSAFCaM5V1EB4a2ELmvdbnUKdxdMvh1v25UTbTROM3EHS7s6BihIlD9wpSklTI
	 Z8h4yrArcVPQA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D3FFD64755;
	Mon, 22 Sep 2025 11:46:49 +0800 (AWST)
Message-ID: <16281e86d3cf5c97fcb59e73472dc8edca50c484.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: add MCTP over I2C support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
	leo.jt.wang@fii-foxconn.com
Date: Mon, 22 Sep 2025 13:16:48 +0930
In-Reply-To: <20250918-leo-dts-transceiver-v1-1-3e2580325edc@gmail.com>
References: <20250918-leo-dts-transceiver-v1-1-3e2580325edc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_204655_759549_0C1A3C74 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Leo,

On Thu, 2025-09-18 at 17:43 +0800, Leo Wang wrote:
> Enable MCTP communication on the Meta Clemente BMC board:
>=20
> - Add an MCTP I2C controller node at address 0x10 on I2C0
> - Mark selected I2C mux channels as MCTP controllers
> - Remove unused "i2c-mux-idle-disconnect" properties

>=20
> This allows MCTP devices to be discovered and used for
> management communication on the Clemente platform.

This description covers details we can see in the patch itself. Can you
please rather describe the motivation and any related considerations,
e.g. answer:

 * What devices will you be managing via MCTP?
 * How do they affect the function of the platform?
    - Alternatively, how does _not_ having the MCTP capability to manage
      them impact the function of the platform?

The general advice provided here might be helpful:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

Andrew

