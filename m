Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B08DEDF15E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuZ8d6UNJRIljYQwjjDPKo4ot0bGUNYrBDLKENJz4As=; b=Mw9gAgvEfHPyubBlgzdrOf4vcR
	9dR5bCoHWwJ8856IyLSs1y4oOl/xV4ZWTkCbZKD9UOBYHvBCva34vV1ouuMhnO9HGBEx6aFDI74uh
	6Z+SJ7QgNQJgJVi0Uqx+mgoO7B4c/dbqeYljdrPcZ8F9IJzNecE9+n+mUCChn4EtaCipYBDdISK8o
	+MMqkc6/zaoLGtJDjDGF00ExkBienVnR1rFpcujZIs3CVOP62Pb93A8D6wltH49FQKKk2TPnAal0c
	+pflEyVDuar5Fa12sW7fQsYEgc3oZTkBumTyEP54ArJ1ZkLixjJdciR9ItMng3qEXAzu/jdPOYVJp
	c0laKfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqt2d-00000003TSt-0noA;
	Fri, 13 Feb 2026 13:17:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqt2b-00000003TSY-0Ljk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 13:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B552A402C4;
	Fri, 13 Feb 2026 13:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F239C116C6;
	Fri, 13 Feb 2026 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770988619;
	bh=fAWQSackMQUnidJ8Lupx+2UA27XzP5St8/qRfXBVZvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sO4hRCIFiWVQAYB2SAEmk2S7tIGNwM2SZu7qMz0M0jfyB1Qq9Xp2DZ4SyHPNGL4Ym
	 MnF4RoYZBYeB7+lv4pu86K7WNJfvys9Asll2vKEyyRjsRgsEByMSYSuYgob7q5KdLd
	 UicWLrZmVbYWnvAab7eH0waN/ypooFuoN7tQguv8nJo0hFkYzF4xWeBcTm3qTOCme7
	 6S0zsl8uK3xPQEz7KUI22ImBiI9kr9av9jbSa5g61JrTlh0nrPjm+kSve1KkZnT314
	 JGe746l0FefPcWs2uwZnxFy+fRp0ntfADwm3h0B8HMIAVNGCf4etePGieAsD7shi5R
	 zjrOxXl5e408w==
Date: Fri, 13 Feb 2026 14:16:54 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	bhelgaas@google.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s-vadapalli@ti.com,
	danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 0/4] PCI: Add DOE support for endpoint
Message-ID: <aY8kRu5ZYp44872D@fedora>
References: <20260213123603.420941-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213123603.420941-1-a-garg7@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_051701_166366_B0F0F55A 
X-CRM114-Status: UNSURE (   7.87  )
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

Hello Aksh,

On Fri, Feb 13, 2026 at 06:05:59PM +0530, Aksh Garg wrote:

(snip)

>  create mode 100644 Documentation/PCI/pci-doe-ep.rst

I think it would make much more sense to create this file as:
Documentation/PCI/endpoint/pci-endpoint-doe.rst
(To match the existing naming scheme.)


>  create mode 100644 drivers/pci/doe-ep.c

I think it would make much more sense to create this file as:
drivers/pci/endpoint/pci-ep-doe.c
(To match the existing naming scheme.)


Kind regards,
Niklas

