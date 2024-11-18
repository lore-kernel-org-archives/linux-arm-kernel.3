Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E82BD10F58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWjaldySSsYfQCb+Fv1nXh6FZAdhvSHeg1RBQdsBVf8=; b=QSnsFYI8pjx9oNf3i3409bRv5+
	kKUttqLP+2BIzQyWk5vIa3lS3QuqAlazLBSSKSuuPOBdKXlc/hNQviYUUqvQ7+ydALZdYslYmBhCs
	lb23oSlSgBUTlcju0ZmoO8LxPC9qqSPd7EQQhn9HVkc2izFv8rVD2myS6nfO7wB6bjsqwQqGcQiY8
	CkqBNR7OBc7CGRZd8l+Svn/LvegKa9V4T1EjP/6c+q9sOMpvwDEkaEJI+H8CnQMgieFpHa+GyuBQ/
	FZjzOzRGw1S9YvqxUQHydaUtFW9gcYfaR7tabm+7HWQ2BzdgJQPSp09lil6SW/NKPCqViL2h5AjZ7
	XwTIM6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD46X-00000009z3H-1wMw;
	Mon, 18 Nov 2024 15:55:57 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD45Z-00000009yoy-2C1G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:54:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CF4F20005;
	Mon, 18 Nov 2024 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731945293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWjaldySSsYfQCb+Fv1nXh6FZAdhvSHeg1RBQdsBVf8=;
	b=o2BM5QHwOM9jIig3NLGd5FDgFvDpNzcM36wQa5NARzekPb/pj7gB0mOSC9JaANGhYCcY9q
	qpM/6ojDZQaViCYcreN+FL/vQO4v8MTzQXp35MtLGOpKh5zGVCm6MMnhZ6FOH7/1ZyY/Mh
	zberEPyKb2XCgNUmA4SPa3Xd9Vj7+avL4asbVL2OdGT7rOTl/H2POaDseg6ktW5mG1w6C7
	PbpQKkKU44v1Ms8pA5luj0l1q4IxcJmYGQiQDpYpNFHR97HeM0x7qOO2ixZ2z+iwedaBcA
	lXKynAIpWHh1at+lCyTcWXnpIWC3ERtrHrDusEfmGaRnNdrQrMlO6eycPqTOLA==
Date: Mon, 18 Nov 2024 16:54:51 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
 <sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>,
 <horms@kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, <harini.katakam@amd.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: xlnx,axi-ethernet: Add
 bindings for AXI 2.5G MAC
Message-ID: <20241118165451.6a8b53ed@fedora.home>
In-Reply-To: <20241118081822.19383-2-suraj.gupta2@amd.com>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
	<20241118081822.19383-2-suraj.gupta2@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_075457_718386_5FE8E1C9 
X-CRM114-Status: GOOD (  10.12  )
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

Hello,

On Mon, 18 Nov 2024 13:48:21 +0530
Suraj Gupta <suraj.gupta2@amd.com> wrote:

> AXI 1G/2.5G Ethernet subsystem supports 1G and 2.5G speeds. "max-speed"
> property is used to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> max-speed is made a required property, and it breaks DT ABI but driver
> implementation ensures backward compatibility and assumes 1G when this
> property is absent.
> Modify existing bindings description for 2.5G MAC.

That may be a silly question, but as this is another version of the IP
that behaves differently than the 1G version, could you use instead a
dedicated compatible string for the 2.5G variant ?

As the current one is :

compatible = "xlnx,axi-ethernet-1.00.a";

it seems to already contain some version information.

But I might also be missing something :)

Best regards,

Maxime


