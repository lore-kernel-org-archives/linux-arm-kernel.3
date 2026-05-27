Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790AECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUaXtE7+Lpu6T9R6qedWabPBNZj9Omh3QoTrbc8F0Kc=; b=Mxpik4+BXblDWLoqzPwgsJpTrG
	lONbL+y1vZMAMufv/5NwVxLQmiG6/Y1VWZSXLzDxeEffcLEr9LcitVb3Fo8gNZs47Dyljsiytt227
	4x8Q5DGXJ7ya5FF9jRypa5NiSDU4UUjD79DJ3HywA94yETxZCDAWAY5+J698kIF3x/wYVPfrwtrlu
	q9AT1BFo946RTr37nQ5L85aRCJR+TnOiMYPaWdJZwVddw8xLxr1pvqdrLoWJrZNU0DphGcTbw3b69
	tyjvxbXLcJryolbXm5/Wuj6uAkVAIrI9/PZ4bsCbJvUju9nhYQkHA+DsePUT4syL2vSjZpR6soJUU
	6UCsN6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3fk-0000000396o-3Ur2;
	Wed, 27 May 2026 02:07:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3fh-0000000396D-3uAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 02:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779847611;
	bh=aUaXtE7+Lpu6T9R6qedWabPBNZj9Omh3QoTrbc8F0Kc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QudllnWKEx4Ncqd3j/B4pAxENZQG00b/raI64g1WXNXSkyJFxvhRo8OyqKXpXGeXV
	 l+1vU0zjGRn4lZX4s8ifV7kV43XLXGpUc6CyYaLCjzCp0Exs1mS26XNq49Lw8NJ7EO
	 Se4Zhsi3oX2QbbXFdyP78MuAnkwKp2yRLxlaDwhJJIcPKd7h9JvUE08KupTqQKQIiA
	 2S5+jyYwRXl0f1TW1oPd3ny7uEAI/Q2tSgPcgcJmTLV9y3culjJp7JHGBx8N8XBJ10
	 leeS+c87sfWWQEd0u7C6babUmMi4lQWmXCGyWwhQ59hpFyyA3Upz2hyxQqiUEFCV/4
	 FQsWPJbFsLS6A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C417607F4;
	Wed, 27 May 2026 10:06:47 +0800 (AWST)
Message-ID: <e059b59ecb9b0912ae8a044e3f745450b7095573.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Neil Cheng <neilcheng0417@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, joel@jms.id.au,
 geert+renesas@glider.be, 	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 27 May 2026 11:36:46 +0930
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
	 <cover.1779157117.git.neilcheng0417@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_190702_167266_23454106 
X-CRM114-Status: UNSURE (   7.82  )
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

Hi Neil,

On Tue, 2026-05-19 at 10:38 +0800, Neil Cheng wrote:
> Add initial device tree support for the Meta Rainiera6 platform.
>=20
> Changes in v2:
>=20
> - reorder adc0/adc1 properties
> - add Acked-by from Conor Dooley
>=20
> This series adds:
> - Meta Rainiera6 compatible entry
> - Rainiera6 BMC DTS

In the future can you please avoid threading v2 (and later) under your
prior submissions?

Thanks,

Andrew

