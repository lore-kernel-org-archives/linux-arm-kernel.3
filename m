Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626D8E73141
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MDeGfya9pW8oGspZAw2DxTtP3YW5Oyd4vEtsqVOrMc=; b=QtKzWy2gpf5TaQ2Sv5T5dMgfg6
	H2mJaBqA76G7wR3MYYYPMTN2ASl3vI9NET62IUl4JCugj3T975PKIFFXBmJqhX/UWE1PMkCzPBpUk
	IjRm+3teOR3JKDa+D1TowK7QQlDFsyjXp34XmRCG4Z/QvAo8pDMhfS1GRInv86haNotQ3E7k/yWSk
	CNcp9tW+znv5vOpgoMkClyU1YTdspUBtQ4J+dv9cDiUk6zbaKeLFz1HEKvIGxiLhUJz1zYD2XJX/L
	POSkO4VMBfcz+HgJaL99Dzu7QAgme58NODIIv1SetG++pt/wB3LnRKIt0Nfn++zmn12uG19sAY21x
	XE7ylN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmp1e-00000004dEx-0ReS;
	Mon, 02 Feb 2026 08:11:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmp1Y-00000004dEb-3pBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:11:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmp1J-0005ow-Ij; Mon, 02 Feb 2026 09:10:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmp1J-003hXY-1Q;
	Mon, 02 Feb 2026 09:10:52 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vmp1I-000000003dD-2xXL;
	Mon, 02 Feb 2026 09:10:52 +0100
Message-ID: <87acb1716a13ebf03029ff7fe5a3eb94969b424b.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: clean up kernel-doc warnings
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, imx@lists.linux.dev,
 	linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Feb 2026 09:10:52 +0100
In-Reply-To: <20260202005559.369861-1-rdunlap@infradead.org>
References: <20260202005559.369861-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_001108_995479_55EBB93A 
X-CRM114-Status: UNSURE (   7.45  )
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

On So, 2026-02-01 at 16:55 -0800, Randy Dunlap wrote:
> Correct all kernel-doc warnings:
> - fix a typedef kernel-doc comment
> - mark a list_head as private
> - use Returns: for function return values
>=20
> Warning: include/video/imx-ipu-image-convert.h:31 struct member 'list' no=
t described in 'ipu_image_convert_run'
> Warning: include/video/imx-ipu-image-convert.h:40 function parameter 'ipu=
_image_convert_cb_t' not described in 'void'
> Warning: include/video/imx-ipu-image-convert.h:40 expecting prototype for=
 ipu_image_convert_cb_t(). Prototype was for void() instead
> Warning: include/video/imx-ipu-image-convert.h:66 No description found fo=
r return value of 'ipu_image_convert_verify'
> Warning: include/video/imx-ipu-image-convert.h:90 No description found fo=
r return value of 'ipu_image_convert_prepare'
> Warning: include/video/imx-ipu-image-convert.h:125 No description found f=
or return value of 'ipu_image_convert_queue'
> Warning: include/video/imx-ipu-image-convert.h:163 No description found f=
or return value of 'ipu_image_convert'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

