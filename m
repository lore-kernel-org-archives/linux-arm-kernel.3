Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DBAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S6bWwjFBo5Xa+HjUZ32P5iQHl6oakQlX84F8q/+L7A=; b=SJk1h7a1sowR+d58HjlV8Kf9oZ
	GUdmSWyCBcbVDAGKQhrxtivYqpdgeR5knz7E4Uc6eX/DSTtEePf/weIU+0JQ6xu7kSbpDEXzcTq86
	KSOiWhS6jLxZfZrFRtoXX9jMDeFOUNj+HPg2Vb4y3TmY9zvFM344Fx+yhb0QO+RfhTCaBUiQtU4Rw
	LorgPKfo5ejqs+TFxnxLt90EFhV7zZS38EIOqKczy7q+t1m91PqxZqxIuvnuXHiThhnOs/bvfOoZc
	96EmxR5E4E0BZ4YiYmagTEs0WC2m7FYbjgjYI57pMiJT85JEpTvGlVMDChpCcox/yjCBm40BY1GhN
	l9tpBuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYiv-0000000HBnM-28hC;
	Tue, 30 Jun 2026 13:42:01 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYis-0000000HBmA-1qN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:42:00 +0000
Received: by chaosmail.tech (Postfix) id 4A48A1CB983;
	Tue, 30 Jun 2026 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782826912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1S6bWwjFBo5Xa+HjUZ32P5iQHl6oakQlX84F8q/+L7A=;
	b=ftdTP7rUoUwCQTyNR4WfJCWeqW4KuYAEwjXvp7tFTaHoc/ZotEQ0kGlByzVec3EPs4091e
	NJHaVyqd2O70rIvJcKamQq+XAkh5F8cXI1BU4FUB16QRaSDTCHKAQLeRcHhNvlplbR+n6x
	Z8E+uh4Js6RtD/DHMcFQHD5kGn+1t+w=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] HID: apple: Add support for DockChannel HID
 keyboards
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-7-506d936a1707@gmail.com>
Date: Tue, 30 Jun 2026 15:41:40 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 iommu@lists.linux.dev,
 linux-input@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B22C8EFD-DEDE-49C1-AD8E-BAEB5C91B6A6@chaosmail.tech>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-7-506d936a1707@gmail.com>
To: michael.reeves077@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_064158_943080_0314D179 
X-CRM114-Status: GOOD (  12.37  )
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


> On Jun 30, 2026, at 14:54, Michael Reeves via B4 Relay =
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>=20
> @@ -659,6 +669,7 @@ static void apple_battery_timer_tick(struct =
timer_list *t)
> /*
>  * MacBook JIS keyboard has wrong logical maximum
>  * Magic Keyboard JIS has wrong logical maximum
> + * Internal DockChannel keyboards can advertise oversized report =
sizes
>  */
> static const __u8 *apple_report_fixup(struct hid_device *hdev, __u8 =
*rdesc,
> unsigned int *rsize)
> @@ -699,6 +710,27 @@ static const __u8 *apple_report_fixup(struct =
hid_device *hdev, __u8 *rdesc,
> rdesc[3] =3D 0x06;
> }
>=20
> + if (apple_is_dockchannel_keyboard(hdev) && *rsize >=3D 5) {
> + int i;
> +
> + for (i =3D 0; i <=3D *rsize - 5; i++) {
> + if (rdesc[i] =3D=3D 0x76 && rdesc[i + 1] =3D=3D 0x00 &&
> +    rdesc[i + 2] =3D=3D 0x40 && rdesc[i + 3] =3D=3D 0x95) {
> + u8 count =3D rdesc[i + 4];
> +
> + if (count > 0 && count < 32) {
> + hid_info(hdev,
> + "fixing up DockChannel report size\n");
> + rdesc[i] =3D 0x75;
> + rdesc[i + 1] =3D 0x08;
> + rdesc[i + 2] =3D 0x96;
> + rdesc[i + 3] =3D 0x00;
> + rdesc[i + 4] =3D count * 8;
> + }
> + }
> + }
> + }
> +
> return rdesc;
> }
>=20

It looks like this section is duplicated in the following commit (8).=20
Is that correct?



