Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWtX0G9rA5gU31Xzh6zT4Wr9r0sxd40ARRXx7TIt5oU=; b=eemtK9YcpVE/Y/7dR624ZhMnxH
	P1NagrgboWUaTmNlmHb5ANAUFke0qkNM6nTLbyMsY2vQnjk0RePumwsydn+RuTLC/ABrHhD/AySSg
	7FCmdcJIOeai6vfnz2M49YWVPWLIhT6oqq/6pAjstv6Euwe6XHx8hdTJrnmkfhnR/MYJVvS0HeRF1
	0BLfPaxQbANazWDfhSUK42ytHJHUDAFJXIT08xn1qteh0qFkN/lRNhcN+bw58ve0na2GovC3hgvKU
	ZxDbAZWmvSCz8KvuA3tqwBrLEKKqB9WqFaa7exIJbWaFdIlb0zhlY3oNxA9pe3C1IiCiHkXR3//1Q
	wwEqFe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuHH-00000007TlV-3iaT;
	Sun, 12 Jul 2026 13:31:27 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuHF-00000007Tk7-2Jx2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 13:31:27 +0000
Message-ID: <367f53c5d06e85be5b858dabecc9dd308ae14e20.camel@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783863072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWtX0G9rA5gU31Xzh6zT4Wr9r0sxd40ARRXx7TIt5oU=;
	b=EFTUW65KHO70xVBUsXGkidjcZzIdXSzogJ5kePGpNMzQSh0MSWhd+Wgrh1unDZcJcR+QV3
	VJ4sv347lyxnXtEwoYFMSg/IU6KQsos2vEGhI8A2kE3LnOs7hlTCMbZWfUQhvUsnTdEtlO
	PAHIDewT0tmLHW0WdD/HoHqyQK3Z/E8=
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Siratul Islam <siratul.islam@linux.dev>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>,  Nuno =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>,
 linux-iio@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Sun, 12 Jul 2026 19:31:02 +0600
In-Reply-To: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
References: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_063126_126835_091B1D33 
X-CRM114-Status: UNSURE (   4.94  )
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

On Sun, 2026-07-12 at 09:26 +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Remove unused mod_devicetable.h header.
>=20
LGTM.

Reviewed-by: Siratul Islam <siratul.islam@linux.dev>

--
Best regards,
Sirat

