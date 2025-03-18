Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu8WjOKvjc7xER6FBh5x1tsTM5cnZ9iM06KfKZsppec=; b=yUc/jV7jErfY9DexcBs3od8cE3
	e37LPLsUfdQsCh/4tvxkIbM38aBOcMkHpTEJl5/jSMfx1ZNPW11zmurJLD5X4W33MqY85tMMTiqh5
	ZMqAcBa4ih/A0bjoTgaRMEZpdxzsc0k+Nlp7HQgBlJUQp97aSHezBo9aVBsBBUVa6cgUwhsp1Mqw9
	9if2GscH2/HFuQ5epW0sSX6BPidqeuM+/ppz80ahMii0dThz9uPYywyWhgXQl8wzM/msX5o8jy64H
	VhluTRpiAlNVzr61Jqd1fI8YIwEbR66XODFkjcemuaPL87BDnMUttkS4cVfBbylXdpjut4cVf3MC0
	aEycrk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaNZ-00000006chj-257A;
	Tue, 18 Mar 2025 17:05:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaCp-00000006bDT-1g1A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cu8WjOKvjc7xER6FBh5x1tsTM5cnZ9iM06KfKZsppec=; b=yCNbrA8XKXcgrihH6JvsnO+10G
	Uvq5lfXLMOkRw64d+Wm+k7JhW55u2hRBpbkA/9kOBslNZtOqKVWXKSsgdj6R5Be1G9Y2VGCJ9SSrN
	ckwVAmG6G0JYvfrc9QF4tFzrsb9EvamSZ8gxh/wUAPdnsyh3eNY0bQEacQd+K1VK7lyc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuaCc-006Hsy-Mr; Tue, 18 Mar 2025 17:54:06 +0100
Date: Tue, 18 Mar 2025 17:54:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rajaganesh Rathinasabapathi <rrathina@amd.com>
Cc: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>,
	devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, robh+dt@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Supreeth Venkatesh <supreeth.venkatesh@amd.com>, jothayot@amd.com
Subject: Re: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Message-ID: <6ca63f35-05c4-472d-a412-74e5c7ffeefb@lunn.ch>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
 <fdd969cb-aa2d-4d55-949e-e2631757221e@lunn.ch>
 <ab74593d-a3be-4283-ad83-3525cb6d7dd1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab74593d-a3be-4283-ad83-3525cb6d7dd1@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_095419_439644_40A9F95D 
X-CRM114-Status: GOOD (  10.32  )
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

On Tue, Mar 18, 2025 at 10:18:46PM +0530, Rajaganesh Rathinasabapathi wrote:
> On 3/18/25 19:38, Andrew Lunn wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> >> +&mac3 {
> >> +     status = "okay";
> >> +     phy-mode = "rgmii";
> > 
> > Does the PCB have extra long clock lines to insert the 2ns RGMII
> > delay? Or are you another victim of aspeeds broken MAC/SCU driver?
> > 
> >        Andrew
> We're following Aspeed SDK and referred other dts based on ast2600.

Which are all broken.

At the moment, you are joining NVIDIA and IBM waiting for Aspeed to
sort out this mess. Maybe you can apply some pressure...

     Andrew

