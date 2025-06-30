Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1493C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 04:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQEiCA64jRoe+4Q4HAhc5uROjPs+W2LELE2uGvHuU0I=; b=vmkXVz/ARlFd+xL/EKjsTFDkLt
	PuYhaOKVFfbzs7NrlZblIuWX2GYaoFmckPKrFytxfWqGQPqObVlp3skc0P24JfZPKru6FS8ir3zLf
	JXaUaup4JF9/TDcSXGe9C1+5ozNbBp3X5Swke5AiF3hm2sDHE+hBzcFqBB/Wp14ckO3Mz4qSYrKHE
	ujEobymWW91piX1OZqvYm8ucBo7ZgNWl5f+j1ZXzXdjWXnlAzK/E1y6ZCHiMLb6RzU7X0dYEJEMuc
	yHjgtcdGf4Smkhea3aNmyvqfKY9wYPiCq9/Xit8UmPR8FQDACVzHcM7TgCjT8AuIMfVwspSQ8S/Kd
	znJMSukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6LM-00000001DK7-3gi8;
	Mon, 30 Jun 2025 04:42:12 +0000
Received: from dd54918.kasserver.com ([85.13.167.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6J2-00000001DFx-3Jeo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 04:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202503070814; t=1751258378;
	bh=MQEiCA64jRoe+4Q4HAhc5uROjPs+W2LELE2uGvHuU0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U+LnXVeo1J1pNgGk1RubYeAP/r0grfqxsUxdTPu4+n5feKZ48KCwQ11nnymPFNDii
	 cCPRAKBwFhqiKCHpBQsdPXX5vlzmu6x9sp1fyUSLiD4HgK39bjlvv8Z0hoKxeeMEwG
	 1icWV6et5DMSWtkEktkPdwUahsLhvroUdS7VT+i/JephS9g5d77bOQypugc2Tja4dz
	 IkK8CXZvE2W4db1vAqSK7JfL2eFfkdELJJTblFquIg5QT5EKDs093g/2RkJshx65mO
	 HJ6zIA9Jeb2+AdzOVUE7xqjqiEHfFVimvYQ+OGysiOhGpGpR80psvAwCM9DmGdxgWk
	 CfLB55C+tsAnA==
Received: from karo-electronics.de (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id F3EA7772144E;
	Mon, 30 Jun 2025 06:39:37 +0200 (CEST)
Date: Mon, 30 Jun 2025 06:39:37 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Bence =?UTF-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: DT: imx6: Replace license text comment with SPDX
 identifier
Message-ID: <20250630063937.589bc18d@karo-electronics.de>
In-Reply-To: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
References: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_213949_274400_84A91DDE 
X-CRM114-Status: GOOD (  11.76  )
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

Hi,

On Thu, 26 Jun 2025 11:19:56 +0200 Bence Cs=C3=B3k=C3=A1s wrote:
> Replace verbatim license text with a SPDX-License-Identifier:
>=20
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
>=20
> Cc: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> ---
>  arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts      | 44 +---------------=
------
>  arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi          | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dts | 38 +---------------=
---
>  .../boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dts      | 38 +---------------=
---
>  .../boot/dts/nxp/imx/imx6q-tx6q-1020-comtft.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1020.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1110.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         | 38 +---------------=
---
>  .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dts    | 38 +---------------=
---
>  .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0011.dts    | 38 +---------------=
---
>  .../boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        | 38 +---------------=
---
>  35 files changed, 35 insertions(+), 1301 deletions(-)
>=20
[...]
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250624-karo-dts-lic-2f7366e6feb4
>=20
Acked-By: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>


Lothar Wa=C3=9Fmann

