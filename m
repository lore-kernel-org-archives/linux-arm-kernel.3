Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937F7CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 04:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9I9iLfORj0tnccwQ6JBu3v4qfLj7ltvuhaVoT+aRCJY=; b=pvgHSaIZk+xQdQjc76vpsrDEtV
	CXBkSkI08vxcR63V8SF9BfI8srWbiyCC7yniRmYgRvuahMqqBVVOG2tufcEwdRzIEA752cclugXgt
	uPev2LZRljaqbPUuQHklQ3lNOBXKuQ4UortlY8/8jHZSOPh3jnOMFeBq+XB+cvm3q5FAcuLwQu3zm
	WJ0DNJGbRkdo/gU4o0x6H7jQA4b0voH6Dz7jh6DP/aBm7g4mHKwRo0tOZvuyZ7BWrbWg3BEWKQ2QJ
	aKn4gkuzWbrCr2ExTH4meDGqliTLZiULI/voEfW4ZmuC+MLTVODhgFP+cTZ0hNT3rYTfX7890kGUo
	HUAljuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOZk-0000000B5dq-0JJA;
	Mon, 24 Nov 2025 04:53:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOZh-0000000B5dX-3vsP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 04:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763959995;
	bh=9I9iLfORj0tnccwQ6JBu3v4qfLj7ltvuhaVoT+aRCJY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XPlfbWiqWeeK8tagGbtC5l+y33JIHb4VYe96JR3a2f1W8XzsROquq/UhdHch4VOx9
	 l5Em4ycrOn7lR30IydhrxAvOk5zkjhyeMjsYzVVTyaSKjKuvg5ouV6cUAXmFwKaMaW
	 m0SVoEqVo+oG/cVx2WbpspzcClZDx9WyB047HHqpNrEqKhXy8WdxKN1GA9sn+EgZ9W
	 XgtX8Mz2VvsaNRTS1gYNwIdwuX6JAnEoqmwhHEZ0abMMJKCNRkxutlVtqWfMZDtg5j
	 aguJYtHYJax89EtbDNd5mQ586yEunWEA+r7tlRcew09XLJjPPDFPbkcJ+S+PHZd2gY
	 UUgj93nr2tm9A==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4FECA64DF5;
	Mon, 24 Nov 2025 12:53:15 +0800 (AWST)
Message-ID: <c56ef6e76858c7df19ec43a3a18ccf79ff3cc489.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/4] Revise Meta Yosemite5 devicetree
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Date: Mon, 24 Nov 2025 15:23:14 +1030
In-Reply-To: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
References: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_205318_163319_AD4E2F40 
X-CRM114-Status: UNSURE (   8.10  )
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

Hi Kevin,

On Thu, 2025-11-20 at 13:25 +0800, Kevin Tung wrote:
> Summary:
> Revise linux device tree entry related to Meta (Facebook) Yosemite5.
>=20
> Changes in v2:
> - Add ipmb node for OCP debug card
> - Link to v1: https://lore.kernel.org/r/20251118-yv5_revise_dts-v1-0-fcd6=
b44b4497@gmail.com
>=20
> Changes in v1:
> - Increase i2c4/i2c12 bus speed to 400 kHz
> - Update sensor configuration
> - Rename sgpio P0_I3C_APML_ALERT_L

Sorry, I replied with comments on v1 before I saw v2.

Can you please resolve the discussions on v1 and send a follow-up
series if necessary?

Andrew

