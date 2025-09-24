Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42530CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 02:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o86uR5LMiT+hV3SmPRKcbqfcrdavxLeiGsYGrCWjtn8=; b=oGb7fBvm8rX7vkpoU8POFueasW
	zT1Myfpxo7ZKWuibAECfXSaiAsKEosO1SxnCeU0P0pOYnBIYuycAXGL6CBc2V8h5ycBZUtdz7R86z
	TrJcoPokJW7I1ijw/t4apCMOBcHrymMQeauIgTs9Oe+UYrBiqJNoFZiB4P2wkiKlc7DHsa6ai7AqP
	u+d3aWTYkQyl9JRh/qFfApfJYCnP/X983OJRq50QF4LjHVMEdu6rOxYmEYmBt1pdJ0UnTk1B8LDWZ
	txyHCUuYEivBVCgcb+UgXOf5saPrNeBGmIO6jnnqS3F3G5gPhVtyFgdofjn4nTHFHs/OOH0BZwEi/
	Qu0iqw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1F45-0000000FLqs-3jKw;
	Wed, 24 Sep 2025 02:17:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1F42-0000000FLqS-35kq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 02:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758680220;
	bh=o86uR5LMiT+hV3SmPRKcbqfcrdavxLeiGsYGrCWjtn8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NVcwZUijQuewnTTWXH/HwuKOdQOniu3CnCeSgCJS6CEOQdhRR2PPy7tf9fRR67doi
	 XXQXHzDxe4GRVIpHwCHPDFv5DzG+iWdc7uq31HePz1HYcvL9cPNPLk23l9MaNOYCFN
	 wE2eNwdy8haEZg/qXh9A2ycJxMU3Cc6unjBtvcPWXj5GjxVKLRrcwEcVnlzsLghDst
	 UyS1EGdqx1uhBmy6U27hJojdDzDLyRZcSaqULHrcAQvUfbKkXXna81PnFCkKiSvn6p
	 NVopGc6QrmO5anbsh9s/AbKUI7U9Lm+vWtsy8E5nU58Vc5WWnGVOV4+vWU/vx22JxH
	 1if9cC6lDKt+g==
Received: from [IPv6:2405:6e00:243d:a853:dbe5:4849:b82e:5665] (unknown [120.20.205.123])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 15EAC647A7;
	Wed, 24 Sep 2025 10:16:56 +0800 (AWST)
Message-ID: <e970c1693af3a612d9eccac2932e2e0be3d37453.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: clemente: add MCTP over I2C support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
	leo.jt.wang@fii-foxconn.com
Date: Wed, 24 Sep 2025 11:46:55 +0930
In-Reply-To: <20250922-leo-dts-transceiver-v2-1-d2dc0e24a70b@fii-foxconn.com>
References: <20250922-leo-dts-transceiver-v2-1-d2dc0e24a70b@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_191702_973993_E6FBA9C8 
X-CRM114-Status: GOOD (  14.31  )
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

On Mon, 2025-09-22 at 15:02 +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
>=20
> Enable MCTP communication on the Meta Clemente BMC board:
>=20
> - Add an MCTP I2C controller node at address 0x10 on I2C0
> - Mark selected I2C mux channels as MCTP controllers
> - Remove unused "i2c-mux-idle-disconnect" properties
>=20
> This allows MCTP devices to be discovered and used for
> management communication on the Clemente platform.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
> Please consider the patch "[PATCH v1 1/1] ARM: dts: aspeed: clemente: add=
 MCTP over I2C support"
> withdrawn.
>=20
> After further review we determined that enabling MCTP in the Clemente dev=
ice-tree is not
> required; the affected devices are managed through other mechanisms and a=
dding MCTP nodes
> would be unnecessary. To avoid confusion and noise, please ignore the pre=
vious patch.
>=20
> Original patch message-id: <20250918-leo-dts-transceiver-v1-1-3e2580325ed=
c@gmail.com>
> ---
> Changes in v2:
> - Withdraw patch; no functional changes
> - Link to v1: https://lore.kernel.org/r/20250918-leo-dts-transceiver-v1-1=
-3e2580325edc@gmail.com
> ---

Please do not post a new revision of a series to announce withdrawal of
the series.

Rather, reply to the original series saying as much.

Thanks.

Andrew

