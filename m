Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AA2CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyluTmVOjpA44Vi8KdA6vKtr2fcyRpaqShI7dHAkNZ0=; b=K8PQfriQfYhMrGygBNSwksNw/M
	cPjIfS10js9avr55vnJHCDOiE5APY8dNUhToBRROvxTxKq1m4B4fBlj3kbj9TC++AtOfc0paEJMNP
	/jXDNyJo9jv7LAcr6zVIZ1x2iWkwLytqR9Zc+T/Ib9C9ZUyZaY9fEFB9pcVXrPgAmZQLh2tuiTT5n
	ZzDbp48aSqtqtguMHq4INhdcTPBGYfKUzMVoRAK+z8RXan+LbdHJKwxvItyfR9+dTntf8XIsNNFcK
	N8l3/JHdcItxuSPQqJRRYOwf/V7hITQ5Qb9cxJuSvyqwEVdu1jVmPB3l3o4Dw1uAka+ytcLAtaZbV
	w4MMmHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90tF-00000001ael-41bk;
	Wed, 15 Oct 2025 12:46:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90tC-00000001aeL-1gaS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:46:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55AD1C09FBF;
	Wed, 15 Oct 2025 12:45:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ADC3606F9;
	Wed, 15 Oct 2025 12:45:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88507102F2252;
	Wed, 15 Oct 2025 14:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760532352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oyluTmVOjpA44Vi8KdA6vKtr2fcyRpaqShI7dHAkNZ0=;
	b=uf5OI0MGetOb0yLq/o0Hrj9if0UYaWuuRvl/XfHi7z1c/2zzDnOBk161QDUw362+f9uT3J
	8NmyDeF5b4hVyS0bEFjYgXbtki537VbDNz9tD8WqLTK8K7lpuI4AK7+4dCC7dWCoz+XV4R
	vi0/hrCBJsgUd3SnIEfqrFmcoh0UKLBHNxoxneuSHJCb/mNZmHeJUsKaIZ6boTu/93U6NQ
	zRQP1Dt6jYhRCY1jYZu26T3dAb34DNrYR1gfsTKuYarTxG9CaOqp2zYU9PU6BT9lSvsf4j
	6/kcn6hDYQ3BOd0xEDwlwYFGIjgv3SQenJi3iboJomEX65QA9lNjhfIJM7lSbA==
Date: Wed, 15 Oct 2025 14:45:26 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: ethtool: tsconfig: Re-configure
 hwtstamp upon provider change
Message-ID: <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
In-Reply-To: <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-4-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_054558_825506_52D84E9E 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, 15 Oct 2025 12:27:23 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> When a hwprov timestamping source is changed, but without updating the
> timestamping parameters, we may want to reconfigure the timestamping
> source to enable the new provider.
>=20
> This is especially important if the same HW unit implements 2 providers,
> a precise and an approx one. In this case, we need to make sure we call
> the hwtstamp_set operation for the newly selected provider.

This is a design choice.
Do we want to preserve the hwtstamp config if only the hwtstamp source is
changed from ethtool?
If we want to configure the new source to the old source config we will also
need to remove this condition:
https://elixir.bootlin.com/linux/v6.17.1/source/net/ethtool/tsconfig.c#L339=
=20

I do not really have a strong opinion on this, let's discuss which behavior=
 we
prefer.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

